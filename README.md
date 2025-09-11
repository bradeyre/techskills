# PR/TR Workshop Training (Firebase + Vercel)

Single-file web app with Google Sign-in and Firestore. Real-time editing of **Technicians**, **Task Catalog** (with SOP links), **Assessments**, **Skills Matrix**, and a coverage **Dashboard**.

## Quick Deploy (GitHub → Vercel)
1. Create a new **GitHub** repo and add these files.
2. In **Vercel** → New Project → Import from GitHub.
   - Framework: **Other**
    - Build command: *(leave blank)*
    - Output directory: **/** (root)
3. In **Firebase Console**:
   - Enable **Authentication → Google**.
   - Create **Firestore** database.
   - In **Firestore → Rules**, paste `firestore.rules` (edit allowed email domains) and **Publish**.
4. Open your Vercel URL → **Sign in with Google** → click **Seed 10 tasks**.

## Data Model
- `technicians`: { id, name, location, role, notes, createdAt, updatedAt }
- `tasks`: { id, category, subcategory, name, description, tier, targetMins, qcChecks, tools, risk, prerequisites, sopUrl, notes, createdAt, updatedAt }
- `assessments`: { techId, taskId, level, observed, supervised, unsupervisedPass90, rework90, avgTime, lastPerformed, assessedBy, assessmentDate, notes, createdAt, updatedAt }

**Effective Level** = Level − 1 if `lastPerformed` > 90 days.  
**Authorised** when Effective ≥ 3.  
**Coverage KPI** = % of tasks with ≥ 2 authorised techs.

## Import/Export
- **Export JSON** backs up all collections.
- **Import JSON** will upsert technicians/tasks and bulk-add assessments.
