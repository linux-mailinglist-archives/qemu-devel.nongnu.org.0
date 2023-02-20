Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A4369C95A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:13:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU477-00075T-Eu; Mon, 20 Feb 2023 06:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pU473-0006y8-PQ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:13:43 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pU470-0006ZF-FT
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:13:41 -0500
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
 by mta-01.yadro.com (Proxmox) with ESMTP id B9270341D0B;
 Mon, 20 Feb 2023 14:13:33 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
 :cc:content-type:content-type:date:from:from:message-id
 :mime-version:reply-to:subject:subject:to:to; s=mta-01; bh=qOtY7
 0Fv5qwcFnq0rOBRTwPRsOrtZJ7g90Nrr2otxA0=; b=aHPSQjkC0b/ZD5JLCFUbP
 8Bbt7oSLd+iG39fGG81mNbGGVcoeAK/dQpue9znpFlNOfrnOUCBpK7ytSYINDAI7
 SWZ7xlofrTJsLfTqXYPaO0fsJ9RRvPTaoeNf2eBnz72k2zLVFCfeFy8Nd/RV5z6S
 F2qkgRT+Ksqg73kg7IpRRU=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Proxmox) with ESMTPS id ABCA1341BC0;
 Mon, 20 Feb 2023 14:13:33 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Mon, 20 Feb 2023 14:13:33 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Mon,
 20 Feb 2023 14:13:33 +0300
From: Mikhail Tyutin <m.tyutin@yadro.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, "erdnaxe@crans.org" <erdnaxe@crans.org>,
 "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
Subject: [PATCH v2] TCG plugin API extension to read guest memory content by
 an address
Thread-Topic: [PATCH v2] TCG plugin API extension to read guest memory content
 by an address
Thread-Index: AdlFGzFjtCgLNbPNTzSXOtdOOq1PfA==
Date: Mon, 20 Feb 2023 11:13:33 +0000
Message-ID: <5c50db42136d4a908b261c66b132b043@yadro.com>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.178.120.230]
Content-Type: multipart/alternative;
 boundary="_000_5c50db42136d4a908b261c66b132b043yadrocom_"
MIME-Version: 1.0
Received-SPF: pass client-ip=89.207.88.252; envelope-from=m.tyutin@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_5c50db42136d4a908b261c66b132b043yadrocom_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

TCG plugin API extension to read guest memory content. qemu_plugin_vcpu_rea=
d_phys_mem()
function can be used by TCG plugin inside of qemu_plugin_vcpu_mem_cb_t call=
back to adjust
received address according to internal memory mappings and read content of =
guest memory.
Works for both user-level and system-level emulation modes.

What's new in v2:
* Increment QEMU_PLUGIN_VERSION instead of custom define
* Example of qemu_plugin_vcpu_read_phys_mem() usage in memtrace.c
* Use cpu_memory_rw_debug() to get memory content in both user-level and
  system-level emulation modes

Signed-off-by: Mikhail Tyutin <m.tyutin@yadro.com>
Signed-off-by: Aleksey Titov <a.titov@yadro.com>
---
contrib/plugins/Makefile     |  1 +
contrib/plugins/memtrace.c   | 76 ++++++++++++++++++++++++++++++++++++
include/qemu/qemu-plugin.h   | 18 ++++++++-
plugins/api.c                | 16 ++++++++
plugins/qemu-plugins.symbols |  1 +
5 files changed, 111 insertions(+), 1 deletion(-)
create mode 100644 contrib/plugins/memtrace.c

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 23e0396687..cf27554616 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -21,6 +21,7 @@ NAMES +=3D lockstep
NAMES +=3D hwprofile
NAMES +=3D cache
NAMES +=3D drcov
+NAMES +=3D memtrace
 SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))
diff --git a/contrib/plugins/memtrace.c b/contrib/plugins/memtrace.c
new file mode 100644
index 0000000000..16c1553f47
--- /dev/null
+++ b/contrib/plugins/memtrace.c
@@ -0,0 +1,76 @@
+/*
+ * Copyright (C) 2023, Mikhail Tyutin <m.tyutin@yadro.com>
+ *
+ * Log all memory accesses including content of the access.
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+
+#include <glib.h>
+
+#include <qemu-plugin.h>
+
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
+
+
+static void vcpu_mem_access(uint32_t vcpuIndex, qemu_plugin_meminfo_t memI=
nfo,
+                            uint64_t vaddr, void *userdata)
+{
+    unsigned size =3D 1 << qemu_plugin_mem_size_shift(memInfo);
+    char* memContent =3D g_malloc(size);
+    unsigned i;
+    GString* logLine =3D g_string_new(NULL);
+
+    qemu_plugin_vcpu_read_phys_mem(vcpuIndex, vaddr, memContent, size);
+
+    if(qemu_plugin_mem_is_store(memInfo)) {
+        g_string_append(logLine, "mem store");
+    }
+    else {
+        g_string_append(logLine, "mem load");
+    }
+
+    g_string_append_printf(logLine, " at 0x%08"PRIx64, vaddr);
+
+    g_string_append_printf(logLine, " size=3D%u content=3D{",size);
+    for (i =3D 0; i < size; i++) {
+        if (i !=3D 0) {
+            g_string_append(logLine, " ");
+        }
+        g_string_append_printf(logLine, "%02hhx", memContent[i]);
+    }
+    g_string_append(logLine, "}\n");
+
+    qemu_plugin_outs(logLine->str);
+
+    g_string_free(logLine, TRUE);
+    g_free(memContent);
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    size_t n_insns;
+    size_t i;
+
+    n_insns =3D qemu_plugin_tb_n_insns(tb);
+    for (i =3D 0; i < n_insns; i++) {
+        struct qemu_plugin_insn *insn =3D qemu_plugin_tb_get_insn(tb, i);
+
+        qemu_plugin_register_vcpu_mem_cb(insn,
+                                     vcpu_mem_access,
+                                     QEMU_PLUGIN_CB_NO_REGS,
+                                     QEMU_PLUGIN_MEM_RW,
+                                     0);
+    }
+}
+
+QEMU_PLUGIN_EXPORT
+int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
+                        int argc, char **argv)
+{
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+
+    return 0;
+}
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index d0e9d03adf..866282cf7d 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -51,7 +51,7 @@ typedef uint64_t qemu_plugin_id_t;
 extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
-#define QEMU_PLUGIN_VERSION 1
+#define QEMU_PLUGIN_VERSION 2
 /**
  * struct qemu_info_t - system information for plugins
@@ -625,4 +625,20 @@ uint64_t qemu_plugin_end_code(void);
  */
uint64_t qemu_plugin_entry_code(void);
+/**
+ * qemu_plugin_vcpu_read_phys_mem() - reads guest's memory content
+ *
+ * @vcpu_index: vcpu index
+ * @addr: guest's virtual address
+ * @buf: destination buffer to read data to
+ * @len: number of bytes to read
+ *
+ * Adjusts address according to internal memory mapping and reads
+ * content of guest memory.
+ */
+void qemu_plugin_vcpu_read_phys_mem(unsigned int vcpu_index,
+                                    uint64_t addr,
+                                    void *buf,
+                                    uint64_t len);
+
#endif /* QEMU_QEMU_PLUGIN_H */
diff --git a/plugins/api.c b/plugins/api.c
index 2078b16edb..af4f177229 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -442,3 +442,19 @@ uint64_t qemu_plugin_entry_code(void)
#endif
     return entry;
}
+
+void qemu_plugin_vcpu_read_phys_mem(unsigned int vcpu_index,
+                                    uint64_t addr,
+                                    void *buf,
+                                    uint64_t len) {
+    CPUClass *cc;
+    CPUState *cpu;
+
+    cpu =3D qemu_get_cpu(vcpu_index);
+    cc =3D CPU_GET_CLASS(cpu);
+    if (cc->memory_rw_debug) {
+        cc->memory_rw_debug(cpu, addr, buf, len, false);
+    } else {
+        cpu_memory_rw_debug(cpu, addr, buf, len, false);
+    }
+}
\ No newline at end of file
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 71f6c90549..f0ce8c730f 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -42,4 +42,5 @@
   qemu_plugin_tb_vaddr;
   qemu_plugin_uninstall;
   qemu_plugin_vcpu_for_each;
+  qemu_plugin_vcpu_read_phys_mem;
};
--
2.34.1


--_000_5c50db42136d4a908b261c66b132b043yadrocom_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:2.0cm 42.5pt 2.0cm 3.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"RU" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">TCG plugin API extension to rea=
d guest memory content. qemu_plugin_vcpu_read_phys_mem()<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">function can be used by TCG plu=
gin inside of qemu_plugin_vcpu_mem_cb_t callback to adjust<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">received address according to i=
nternal memory mappings and read content of guest memory.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Works for both user-level and s=
ystem-level emulation modes.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">What's new in v2:<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">* Increment QEMU_PLUGIN_VERSION=
 instead of custom define<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">* Example of qemu_plugin_vcpu_r=
ead_phys_mem() usage in memtrace.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">* Use cpu_memory_rw_debug() to =
get memory content in both user-level and<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; system-level emulation m=
odes<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Signed-off-by: Mikhail Tyutin &=
lt;m.tyutin@yadro.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Signed-off-by: Aleksey Titov &l=
t;a.titov@yadro.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">---<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">contrib/plugins/Makefile&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp; 1 &#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">contrib/plugins/memtrace.c&nbsp=
;&nbsp; | 76 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">include/qemu/qemu-plugin.h&nbsp=
;&nbsp; | 18 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">plugins/api.c&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">plugins/qemu-plugins.symbols |&=
nbsp; 1 &#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">5 files changed, 111 insertions=
(&#43;), 1 deletion(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">create mode 100644 contrib/plug=
ins/memtrace.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/contrib/plugins/Ma=
kefile b/contrib/plugins/Makefile<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index 23e0396687..cf27554616 10=
0644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/contrib/plugins/Makefile<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&#43;&#43; b/contrib/plugi=
ns/Makefile<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -21,6 &#43;21,7 @@ NAMES &#4=
3;=3D lockstep<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">NAMES &#43;=3D hwprofile<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">NAMES &#43;=3D cache<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">NAMES &#43;=3D drcov<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;NAMES &#43;=3D memtrace<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;SONAMES :=3D $(addsuffix =
.so,$(addprefix lib,$(NAMES)))<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/contrib/plugins/me=
mtrace.c b/contrib/plugins/memtrace.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">new file mode 100644<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index 0000000000..16c1553f47<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- /dev/null<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&#43;&#43; b/contrib/plugi=
ns/memtrace.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -0,0 &#43;1,76 @@<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;/*<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; * Copyright (C) 2023, Mik=
hail Tyutin &lt;m.tyutin@yadro.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; *<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; * Log all memory accesses=
 including content of the access.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; * <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; * License: GNU GPL, versi=
on 2 or later.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; *&nbsp;&nbsp; See the COP=
YING file in the top-level directory.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;#include &lt;glib.h&gt;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;#include &lt;qemu-plugin.h=
&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;QEMU_PLUGIN_EXPORT int qem=
u_plugin_version =3D QEMU_PLUGIN_VERSION;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;static void vcpu_mem_acces=
s(uint32_t vcpuIndex, qemu_plugin_meminfo_t memInfo,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t vadd=
r, void *userdata)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; unsigne=
d size =3D 1 &lt;&lt; qemu_plugin_mem_size_shift(memInfo);<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; char* m=
emContent =3D g_malloc(size);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; unsigne=
d i;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; GString=
* logLine =3D g_string_new(NULL);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; qemu_pl=
ugin_vcpu_read_phys_mem(vcpuIndex, vaddr, memContent, size);<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; if(qemu=
_plugin_mem_is_store(memInfo)) {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; g_string_append(logLine, &quot;mem store&quot;);<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; }<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; else {<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; g_string_append(logLine, &quot;mem load&quot;);<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; }<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; g_strin=
g_append_printf(logLine, &quot; at 0x%08&quot;PRIx64, vaddr);<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; g_strin=
g_append_printf(logLine, &quot; size=3D%u content=3D{&quot;,size);<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; for (i =
=3D 0; i &lt; size; i&#43;&#43;) {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (i !=3D 0) {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_string_append(logLine, &quot; &q=
uot;);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; g_string_append_printf(logLine, &quot;%02hhx&quot;, memCon=
tent[i]);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; }<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; g_strin=
g_append(logLine, &quot;}\n&quot;);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; qemu_pl=
ugin_outs(logLine-&gt;str);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; g_strin=
g_free(logLine, TRUE);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; g_free(=
memContent);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;static void vcpu_tb_trans(=
qemu_plugin_id_t id, struct qemu_plugin_tb *tb)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; size_t =
n_insns;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; size_t =
i;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; n_insns=
 =3D qemu_plugin_tb_n_insns(tb);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; for (i =
=3D 0; i &lt; n_insns; i&#43;&#43;) {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; struct qemu_plugin_insn *insn =3D qemu_plugin_tb_get_insn(=
tb, i);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; qemu_plugin_register_vcpu_mem_cb(insn,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vcpu_mem_access,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; QEMU_PLUGIN_CB_NO_REGS,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; QEMU_PLUGIN_MEM_RW,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; }<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;QEMU_PLUGIN_EXPORT<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;int qemu_plugin_install(qe=
mu_plugin_id_t id, const qemu_info_t *info,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int argc, char **argv)<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; qemu_pl=
ugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; return =
0;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/include/qemu/qemu-=
plugin.h b/include/qemu/qemu-plugin.h<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index d0e9d03adf..866282cf7d 10=
0644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/include/qemu/qemu-plugin.=
h<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&#43;&#43; b/include/qemu/=
qemu-plugin.h<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -51,7 &#43;51,7 @@ typedef u=
int64_t qemu_plugin_id_t;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;extern QEMU_PLUGIN_EXPORT=
 int qemu_plugin_version;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-#define QEMU_PLUGIN_VERSION 1<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;#define QEMU_PLUGIN_VERSIO=
N 2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;/**<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; * struct qemu_info_t - s=
ystem information for plugins<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -625,4 &#43;625,20 @@ uint64=
_t qemu_plugin_end_code(void);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">uint64_t qemu_plugin_entry_code=
(void);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;/**<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; * qemu_plugin_vcpu_read_p=
hys_mem() - reads guest's memory content<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; * <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; * @vcpu_index: vcpu index=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; * @addr: guest's virtual =
address<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; * @buf: destination buffe=
r to read data to<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; * @len: number of bytes t=
o read<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; * <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; * Adjusts address accordi=
ng to internal memory mapping and reads<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; * content of guest memory=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43; */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;void qemu_plugin_vcpu_read=
_phys_mem(unsigned int vcpu_index,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t addr,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *buf,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint64_t len);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">#endif /* QEMU_QEMU_PLUGIN_H */=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/plugins/api.c b/pl=
ugins/api.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index 2078b16edb..af4f177229 10=
0644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/plugins/api.c<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&#43;&#43; b/plugins/api.c=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -442,3 &#43;442,19 @@ uint64=
_t qemu_plugin_entry_code(void)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">#endif<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; return=
 entry;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;void qemu_plugin_vcpu_read=
_phys_mem(unsigned int vcpu_index,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t addr,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *buf,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t len) {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; CPUClas=
s *cc;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; CPUStat=
e *cpu;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; cpu =3D=
 qemu_get_cpu(vcpu_index);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; cc =3D =
CPU_GET_CLASS(cpu);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; if (cc-=
&gt;memory_rw_debug) {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cc-&gt;memory_rw_debug(cpu, addr, buf, len, false);<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; } else =
{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; cpu_memory_rw_debug(cpu, addr, buf, len, false);<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; }<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">\ No newline at end of file<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/plugins/qemu-plugi=
ns.symbols b/plugins/qemu-plugins.symbols<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index 71f6c90549..f0ce8c730f 10=
0644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/plugins/qemu-plugins.symb=
ols<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&#43;&#43; b/plugins/qemu-=
plugins.symbols<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -42,4 &#43;42,5 @@<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; qemu_plugin_tb_vad=
dr;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; qemu_plugin_uninst=
all;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; qemu_plugin_vcpu_f=
or_each;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp; qemu_plugin_vcpu_re=
ad_phys_mem;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"></span>};<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.34.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_5c50db42136d4a908b261c66b132b043yadrocom_--


