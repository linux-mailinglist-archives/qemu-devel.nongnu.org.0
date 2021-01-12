Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCDB2F2831
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 07:05:55 +0100 (CET)
Received: from localhost ([::1]:34560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzCoT-0006gh-Kg
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 01:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jkjh1jkjh1@gmail.com>)
 id 1kzBvk-0000tv-BP
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 00:09:20 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:46411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jkjh1jkjh1@gmail.com>)
 id 1kzBvf-0007nq-Kd
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 00:09:20 -0500
Received: by mail-io1-xd35.google.com with SMTP id 81so1464209ioc.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 21:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=hZvGw8+SK8Eg5VtMCKAJI7bdqdHom8U8ljdR9vtnkEc=;
 b=rV0SAC0pWeNvauvQq4c6fkm/nFSSXAx6rf0Z+kFB+bdmOAnXNfFfgsXV2YYJZ4EW87
 +GkqKf7oycXOXN8pjsMjkkqDohbdSGGKHYG07ZwnnenZ81AtW0905f/ERRCfEzChck4v
 uIMg7tDUjrmT9a8ErmvkgH6391ec1f3D4iMtHfh9WdxPCWG3740JUUytgV30GYtkD8YV
 RNkVo0asqXOiBcNSvX2wLq8SKKG7H3QnAJkUMF8VaIWeJOgyPIRyXsF2P0tU+D437iD3
 D8gGgHZm71NrVrewDTSgwEidpPSEa6TxIrgapB3CRJU3SJB3OT7lNj244o87XhXg5Pzi
 +EnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=hZvGw8+SK8Eg5VtMCKAJI7bdqdHom8U8ljdR9vtnkEc=;
 b=fuZMcd1St+BQUkgCnXqRJ6tCXBca6b2U5FyAqzUMlCDCZb0z+uQIlxA92llM/uC1vn
 7z1zc1kz420NjZhtn4vKYt13xzEjuZXJ+XwzzguCdob/ynXE5zJqCQKI5mEqqYmvLyGG
 cWT2whsZ+1wc1ju0AeA7Va7oZeaW524dY6aEqNZ6rM3qlxIJL8zjchIynvLVtcL3a4Hl
 GpRzUD+lkxnpW07D92+0KUOz0VcSfqMZPXOWXuXDQpfigbT0hwZUOn1L+WQPVl/SjzmP
 5JENkmLxtNFlCT+T8cwDkEALH6MT/b7gntTnSqC1KDu3IfXs2q1u9X8bXs5UGuh3bu0M
 Q3cw==
X-Gm-Message-State: AOAM531MIRxUz20J/frWhsiQiTWyKs6ezjc5/AxHJxUJX8IG1bmmBCBY
 7HRZDn+LDdUVzTlR0HwCctTue90vQeHF4tqumhZRIgYBSbo=
X-Google-Smtp-Source: ABdhPJx0DZKxEfmwpO9uy36+6BUELF3p9G96dMJ+0Rv30mhh17GB6RSK0RxUtAXptQUKRv6qEm90Cs/CIRqzPi1VtEQ=
X-Received: by 2002:a92:cec3:: with SMTP id z3mr2318260ilq.256.1610428153951; 
 Mon, 11 Jan 2021 21:09:13 -0800 (PST)
MIME-Version: 1.0
From: Kyle Zeng <jkjh1jkjh1@gmail.com>
Date: Mon, 11 Jan 2021 22:09:03 -0700
Message-ID: <CADCLYBRh81DuwLd3WB2QyLRFwwL6WaML2pKV6Tw6zS1wbCf+pA@mail.gmail.com>
Subject: [PATCH] Dump NT_FILE note when generate coredump
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000d784505b8ad0697"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=jkjh1jkjh1@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 Jan 2021 01:02:18 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000d784505b8ad0697
Content-Type: text/plain; charset="UTF-8"

This patch adds support for adding NT_FILE note in the ELF coredump.
It follows what's defined in readelf.
Let me know if there is any issue with the patch.
The patch is attached in plaintext below

Thanks,
Kyle
---------

From 3c42074f9e99e6b5ca840b9ee9e965fb69122ef1 Mon Sep 17 00:00:00 2001
From: Kyle ZENG <jkjh1jkjh1@gmail.com>
Date: Mon, 11 Jan 2021 21:54:09 -0700
Subject: [PATCH] add NT_FILE note for ELF core dump

Signed-off-by: Kyle ZENG <jkjh1jkjh1@gmail.com>
---
 include/elf.h        |  1 +
 linux-user/elfload.c | 92 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 90 insertions(+), 3 deletions(-)

diff --git a/include/elf.h b/include/elf.h
index 7a418ee..f701fd9 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1645,6 +1645,7 @@ typedef struct elf64_shdr {
 #define NT_TASKSTRUCT 4
 #define NT_AUXV 6
 #define NT_PRXFPREG     0x46e62b7f      /* copied from
gdb5.1/include/elf/common.h */
+#define NT_FILE     0x46494c45          /* copied from
gdb/include/elf/common.h */
 #define NT_S390_GS_CB   0x30b           /* s390 guarded storage registers
*/
 #define NT_S390_VXRS_HIGH 0x30a         /* s390 vector registers 16-31 */
 #define NT_S390_VXRS_LOW  0x309         /* s390 vector registers 0-15
(lower half) */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index a640507..c095c0c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3317,6 +3317,13 @@ struct target_elf_prpsinfo {
     char    pr_psargs[ELF_PRARGSZ]; /* initial part of arg list */
 };

+struct target_ntfile_entry {
+    abi_ulong   vm_start;
+    abi_ulong   vm_end;
+    abi_ulong   page_offset;
+    char        *path;
+};
+
 /* Here is the structure in which status of each thread is captured. */
 struct elf_thread_status {
     QTAILQ_ENTRY(elf_thread_status)  ets_link;
@@ -3677,6 +3684,84 @@ static void fill_auxv_note(struct memelfnote *note,
const TaskState *ts)
     }
 }

+static void fill_ntfile_note(struct memelfnote *note, TaskState *ts)
+{
+    GSList *map_info = read_self_maps();
+    GSList *s;
+    int count = 0;
+    int data_size = sizeof(abi_long)*2; // reserve space for num_map_entry
and page_size
+    struct target_ntfile_entry *entries = NULL;
+
+    // grab memory mapping first
+    for (s = map_info; s; s = g_slist_next(s)) {
+        MapInfo *e = (MapInfo *) s->data;
+
+        if (h2g_valid(e->start)) {
+            unsigned long min = e->start;
+            unsigned long max = e->end;
+            int flags = page_get_flags(h2g(min));
+            const char *path;
+
+            max = h2g_valid(max - 1) ?
+                max : (uintptr_t) g2h(GUEST_ADDR_MAX) + 1;
+
+            if (page_check_range(h2g(min), max - min, flags) == -1) {
+                continue;
+            }
+
+            if (h2g(min) == ts->info->stack_limit) {
+                path = "[stack]";
+            } else {
+                path = e->path;
+            }
+
+            count++;
+            entries = realloc(entries, sizeof(struct
target_ntfile_entry)*count);
+            struct target_ntfile_entry *entry = &entries[count-1];
+            memset(entry, 0, sizeof(*entry));
+
+            data_size += sizeof(abi_long)*3 + strlen(path) + 1;
+            entry->vm_start = h2g(min);
+            entry->vm_end = h2g(max - 1) + 1;
+            entry->page_offset = e->offset;
+            entry->path = strdup(path);
+        }
+    }
+
+    // prepare the memory mapping in NT_FILE format
+    char *ptr;
+    int idx = 0;
+    ptr = (char *)g_malloc0(data_size);
+    abi_long *long_ptr = (abi_long *)ptr;
+
+    // memory mappings
+    long_ptr[idx++] = count;    // number of map entries
+    long_ptr[idx++] = TARGET_PAGE_SIZE;   // target page size
+    for(int i=0; i<count; i++) {
+        struct target_ntfile_entry *entry = &entries[i];
+        long_ptr[idx++] = entry->vm_start;
+        long_ptr[idx++] = entry->vm_end;
+        long_ptr[idx++] = entry->page_offset;
+    }
+
+    // path names
+    idx *= sizeof(abi_long);
+    for(int i=0; i<count; i++) {
+        struct target_ntfile_entry *entry = &entries[i];
+        int path_size = strlen(entry->path);
+        strcpy(&ptr[idx], entry->path);
+        idx += path_size + 1;
+        free(entry->path);
+    }
+
+    // write it out
+    fill_note(note, "CORE", NT_FILE, data_size, ptr);
+
+    // cleanup
+    free(entries);
+    free_self_maps(map_info);
+}
+
 /*
  * Constructs name of coredump file.  We have following convention
  * for the name:
@@ -3807,7 +3892,7 @@ static void init_note_info(struct elf_note_info *info)
 static int fill_note_info(struct elf_note_info *info,
                           long signr, const CPUArchState *env)
 {
-#define NUMNOTES 3
+#define NUMNOTES 4
     CPUState *cpu = env_cpu((CPUArchState *)env);
     TaskState *ts = (TaskState *)cpu->opaque;
     int i;
@@ -3824,7 +3909,7 @@ static int fill_note_info(struct elf_note_info *info,

     /*
      * First fill in status (and registers) of current thread
-     * including process info & aux vector.
+     * including process info, aux vector & memory mapping.
      */
     fill_prstatus(info->prstatus, ts, signr);
     elf_core_copy_regs(&info->prstatus->pr_reg, env);
@@ -3834,7 +3919,8 @@ static int fill_note_info(struct elf_note_info *info,
     fill_note(&info->notes[1], "CORE", NT_PRPSINFO,
               sizeof (*info->psinfo), info->psinfo);
     fill_auxv_note(&info->notes[2], ts);
-    info->numnote = 3;
+    fill_ntfile_note(&info->notes[3], ts);
+    info->numnote = NUMNOTES;

     info->notes_size = 0;
     for (i = 0; i < info->numnote; i++)
-- 
2.17.1

--0000000000000d784505b8ad0697
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch adds support for adding NT_FILE note in the ELF=
 coredump.<div>It follows what&#39;s defined in readelf.</div><div>Let me k=
now if there is any issue with the patch.</div><div>The patch is attached i=
n plaintext below</div><div><br></div><div>Thanks,</div><div>Kyle</div><div=
>---------</div><div><br></div><div>From 3c42074f9e99e6b5ca840b9ee9e965fb69=
122ef1 Mon Sep 17 00:00:00 2001<br>From: Kyle ZENG &lt;<a href=3D"mailto:jk=
jh1jkjh1@gmail.com">jkjh1jkjh1@gmail.com</a>&gt;<br>Date: Mon, 11 Jan 2021 =
21:54:09 -0700<br>Subject: [PATCH] add NT_FILE note for ELF core dump<br><b=
r>Signed-off-by: Kyle ZENG &lt;<a href=3D"mailto:jkjh1jkjh1@gmail.com">jkjh=
1jkjh1@gmail.com</a>&gt;<br>---<br>=C2=A0include/elf.h =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| =C2=A01 +<br>=C2=A0linux-user/elfload.c | 92 +++++++++++++++++++++=
+++++++++++++++++++++--<br>=C2=A02 files changed, 90 insertions(+), 3 delet=
ions(-)<br><br>diff --git a/include/elf.h b/include/elf.h<br>index 7a418ee.=
.f701fd9 100644<br>--- a/include/elf.h<br>+++ b/include/elf.h<br>@@ -1645,6=
 +1645,7 @@ typedef struct elf64_shdr {<br>=C2=A0#define NT_TASKSTRUCT	4<br=
>=C2=A0#define NT_AUXV		6<br>=C2=A0#define NT_PRXFPREG =C2=A0 =C2=A0 0x46e6=
2b7f =C2=A0 =C2=A0 =C2=A0/* copied from gdb5.1/include/elf/common.h */<br>+=
#define NT_FILE =C2=A0 =C2=A0 0x46494c45 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* copied from gdb/include/elf/common.h */<br>=C2=A0#define NT_S390_GS_CB =
=C2=A0 0x30b =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* s390 guarded storage reg=
isters */<br>=C2=A0#define NT_S390_VXRS_HIGH 0x30a =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* s390 vector registers 16-31 */<br>=C2=A0#define NT_S390_VXRS_LOW =C2=
=A00x309 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* s390 vector registers 0-15 (lower h=
alf) */<br>diff --git a/linux-user/elfload.c b/linux-user/elfload.c<br>inde=
x a640507..c095c0c 100644<br>--- a/linux-user/elfload.c<br>+++ b/linux-user=
/elfload.c<br>@@ -3317,6 +3317,13 @@ struct target_elf_prpsinfo {<br>=C2=A0=
 =C2=A0 =C2=A0char =C2=A0 =C2=A0pr_psargs[ELF_PRARGSZ]; /* initial part of =
arg list */<br>=C2=A0};<br>=C2=A0<br>+struct target_ntfile_entry {<br>+ =C2=
=A0 =C2=A0abi_ulong =C2=A0 vm_start;<br>+ =C2=A0 =C2=A0abi_ulong =C2=A0 vm_=
end;<br>+ =C2=A0 =C2=A0abi_ulong =C2=A0 page_offset;<br>+ =C2=A0 =C2=A0char=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0*path;<br>+};<br>+<br>=C2=A0/* Here is the stru=
cture in which status of each thread is captured. */<br>=C2=A0struct elf_th=
read_status {<br>=C2=A0 =C2=A0 =C2=A0QTAILQ_ENTRY(elf_thread_status) =C2=A0=
ets_link;<br>@@ -3677,6 +3684,84 @@ static void fill_auxv_note(struct memel=
fnote *note, const TaskState *ts)<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0}<br>=
=C2=A0<br>+static void fill_ntfile_note(struct memelfnote *note, TaskState =
*ts)<br>+{<br>+ =C2=A0 =C2=A0GSList *map_info =3D read_self_maps();<br>+ =
=C2=A0 =C2=A0GSList *s;<br>+ =C2=A0 =C2=A0int count =3D 0;<br>+ =C2=A0 =C2=
=A0int data_size =3D sizeof(abi_long)*2; // reserve space for num_map_entry=
 and page_size<br>+ =C2=A0 =C2=A0struct target_ntfile_entry *entries =3D NU=
LL;<br>+<br>+ =C2=A0 =C2=A0// grab memory mapping first<br>+ =C2=A0 =C2=A0f=
or (s =3D map_info; s; s =3D g_slist_next(s)) {<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0MapInfo *e =3D (MapInfo *) s-&gt;data;<br>+<br>+ =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (h2g_valid(e-&gt;start)) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long min =3D e-&gt;start;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0unsigned long max =3D e-&gt;end;<br>+ =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0int flags =3D page_get_flags(h2g(min));<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *path;<br>+<br>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0max =3D h2g_valid(max - 1) ?<br>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max : (uintptr_t) g2h(GUEST_ADDR_=
MAX) + 1;<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (page_check=
_range(h2g(min), max - min, flags) =3D=3D -1) {<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (h=
2g(min) =3D=3D ts-&gt;info-&gt;stack_limit) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D &quot;[stack]&quot;;<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D e-&gt;path;<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0}<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
unt++;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entries =3D realloc(en=
tries, sizeof(struct target_ntfile_entry)*count);<br>+ =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0struct target_ntfile_entry *entry =3D &amp;entries[cou=
nt-1];<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(entry, 0, sizeo=
f(*entry));<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data_size +=
=3D sizeof(abi_long)*3 + strlen(path) + 1;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0entry-&gt;vm_start =3D h2g(min);<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0entry-&gt;vm_end =3D h2g(max - 1) + 1;<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;page_offset =3D e-&gt;offset;<br>+=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;path =3D strdup(path);<=
br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0}<br>+<br>+ =C2=A0 =C2=
=A0// prepare the memory mapping in NT_FILE format<br>+ =C2=A0 =C2=A0char *=
ptr;<br>+ =C2=A0 =C2=A0int idx =3D 0;<br>+ =C2=A0 =C2=A0ptr =3D (char *)g_m=
alloc0(data_size);<br>+ =C2=A0 =C2=A0abi_long *long_ptr =3D (abi_long *)ptr=
;<br>+<br>+ =C2=A0 =C2=A0// memory mappings<br>+ =C2=A0 =C2=A0long_ptr[idx+=
+] =3D count; =C2=A0 =C2=A0// number of map entries<br>+ =C2=A0 =C2=A0long_=
ptr[idx++] =3D TARGET_PAGE_SIZE; =C2=A0 // target page size<br>+ =C2=A0 =C2=
=A0for(int i=3D0; i&lt;count; i++) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0struct=
 target_ntfile_entry *entry =3D &amp;entries[i];<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0long_ptr[idx++] =3D entry-&gt;vm_start;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0long_ptr[idx++] =3D entry-&gt;vm_end;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0lo=
ng_ptr[idx++] =3D entry-&gt;page_offset;<br>+ =C2=A0 =C2=A0}<br>+<br>+ =C2=
=A0 =C2=A0// path names<br>+ =C2=A0 =C2=A0idx *=3D sizeof(abi_long);<br>+ =
=C2=A0 =C2=A0for(int i=3D0; i&lt;count; i++) {<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct target_ntfile_entry *entry =3D &amp;entries[i];<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0int path_size =3D strlen(entry-&gt;path);<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0strcpy(&amp;ptr[idx], entry-&gt;path);<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0idx +=3D path_size + 1;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fr=
ee(entry-&gt;path);<br>+ =C2=A0 =C2=A0}<br>+<br>+ =C2=A0 =C2=A0// write it =
out<br>+ =C2=A0 =C2=A0fill_note(note, &quot;CORE&quot;, NT_FILE, data_size,=
 ptr);<br>+<br>+ =C2=A0 =C2=A0// cleanup<br>+ =C2=A0 =C2=A0free(entries);<b=
r>+ =C2=A0 =C2=A0free_self_maps(map_info);<br>+}<br>+<br>=C2=A0/*<br>=C2=A0=
 * Constructs name of coredump file.=C2=A0 We have following convention<br>=
=C2=A0 * for the name:<br>@@ -3807,7 +3892,7 @@ static void init_note_info(=
struct elf_note_info *info)<br>=C2=A0static int fill_note_info(struct elf_n=
ote_info *info,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long signr, const CPUArchState *en=
v)<br>=C2=A0{<br>-#define NUMNOTES 3<br>+#define NUMNOTES 4<br>=C2=A0 =C2=
=A0 =C2=A0CPUState *cpu =3D env_cpu((CPUArchState *)env);<br>=C2=A0 =C2=A0 =
=C2=A0TaskState *ts =3D (TaskState *)cpu-&gt;opaque;<br>=C2=A0 =C2=A0 =C2=
=A0int i;<br>@@ -3824,7 +3909,7 @@ static int fill_note_info(struct elf_not=
e_info *info,<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0/*<br>=C2=A0 =C2=A0 =C2=A0 *=
 First fill in status (and registers) of current thread<br>- =C2=A0 =C2=A0 =
* including process info &amp; aux vector.<br>+ =C2=A0 =C2=A0 * including p=
rocess info, aux vector &amp; memory mapping.<br>=C2=A0 =C2=A0 =C2=A0 */<br=
>=C2=A0 =C2=A0 =C2=A0fill_prstatus(info-&gt;prstatus, ts, signr);<br>=C2=A0=
 =C2=A0 =C2=A0elf_core_copy_regs(&amp;info-&gt;prstatus-&gt;pr_reg, env);<b=
r>@@ -3834,7 +3919,8 @@ static int fill_note_info(struct elf_note_info *inf=
o,<br>=C2=A0 =C2=A0 =C2=A0fill_note(&amp;info-&gt;notes[1], &quot;CORE&quot=
;, NT_PRPSINFO,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
izeof (*info-&gt;psinfo), info-&gt;psinfo);<br>=C2=A0 =C2=A0 =C2=A0fill_aux=
v_note(&amp;info-&gt;notes[2], ts);<br>- =C2=A0 =C2=A0info-&gt;numnote =3D =
3;<br>+ =C2=A0 =C2=A0fill_ntfile_note(&amp;info-&gt;notes[3], ts);<br>+ =C2=
=A0 =C2=A0info-&gt;numnote =3D NUMNOTES;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0i=
nfo-&gt;notes_size =3D 0;<br>=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; info-=
&gt;numnote; i++)<br>-- <br>2.17.1<br><br></div></div>

--0000000000000d784505b8ad0697--

