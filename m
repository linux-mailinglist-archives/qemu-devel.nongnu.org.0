Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B743361A14
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 08:55:36 +0200 (CEST)
Received: from localhost ([::1]:45236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXIO7-0001w3-E2
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 02:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lXIN8-0001SZ-Ue
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 02:54:34 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:46842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lXIN5-0002dJ-9S
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 02:54:34 -0400
Received: by mail-il1-x12e.google.com with SMTP id l19so18405480ilk.13
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 23:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OIXSLuaDfCZ9nblYedIjPAZNQU4G0dq/KsWieZm0rrs=;
 b=GNCNsigax+tyhYEzWSxfbghxqJSabJwuNMB/IQPAJRCA8dbjnI38LJPmfAyuNHKFan
 P3ree8tAjfrSZ5ppGmu4GQmmO/8ovDsEZChoMnQfSafBUykCsh5mHbBHiooCPXyPbJV1
 2ep84KsU+tJFeSJAMbmZeXIrXd643O1pT5hhpVIX/M6wan2LDqX/p+VqjV1bLjO3yrm9
 AXX9XE2qNb/RloF9wxPHOoe/XN1Q1+Ws3KL1/UrOplGXjw5deEl2txWCeQk12jTch5pK
 jCkw00HuiXwpN6/HYW+R/3wZ0f/muuxD9HOWdt4Us8jbq6e+GKCORoVwn6YwIACxQlCR
 ekdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OIXSLuaDfCZ9nblYedIjPAZNQU4G0dq/KsWieZm0rrs=;
 b=my6LM7kMA0K8jguEmSe5AkDDPTPIwAekwb9kFVDdRnBBaYlinx9RWvhkwIvO6w321G
 1fYKYYiu4j5BHKGDJ+RJuxAAIscZa5OvDJkdU5WZwIwJ1GsOPgPqVZE1CTJOgfiLZbdz
 NCJF/JZ0upKA6tkro4XgMUiglkvw2iCts9x6mUmtYr8QdqEw9zb3NAYVnml6tyFBDU5d
 KnbbsTFJoza/dD/hA0xNrGLSbgSDuvfWcJovEEbrTEa677Z+KD93+21GIpA7pGOR2BkM
 bvDxhcYlXsZOyi5CCbUVlKlvV8j+gwm0lvz0iEGqADDno016gVugplEV2bQjX1Yofpkk
 gtpg==
X-Gm-Message-State: AOAM533BaoHOy3UrGom/QlalAtZOG26WA/FU9pYDtHBkrVF6h+6wAYhQ
 HXXiFf/cDIsRnUlzK4/KBNqjnF1lZgvzzdVad1vtClUKY0w=
X-Google-Smtp-Source: ABdhPJxVzMLD/TsmFRIXFWMdm53BdPvRwp3AFHdr71HW4Um89XD39c+K7xPmQiusat3n08ZEMmbhygLLRGfl0t1h0CA=
X-Received: by 2002:a05:6e02:de6:: with SMTP id
 m6mr5943429ilj.81.1618556069931; 
 Thu, 15 Apr 2021 23:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210415151849.26740-1-ma.mandourr@gmail.com>
In-Reply-To: <20210415151849.26740-1-ma.mandourr@gmail.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Fri, 16 Apr 2021 08:54:18 +0200
Message-ID: <CAD-LL6h1Q5QuccmPoR9jTesM8axLFRN2Hy+Hm85fcXYRPR0KTw@mail.gmail.com>
Subject: Re: [PATCH] plugins/syscall: Added a table-like summary output
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000098ef9605c01173a7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000098ef9605c01173a7
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 15, 2021 at 5:20 PM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

> Added a table-like output which contains the total number of calls
> for each used syscall along with the number of errors that occurred.
>
> Per-call tracing is still available through supplying the argument
> ``print`` to the plugin.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  tests/plugin/syscall.c | 94 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 88 insertions(+), 6 deletions(-)
>
> diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
> index 53ee2ab6c4..b92340c636 100644
> --- a/tests/plugin/syscall.c
> +++ b/tests/plugin/syscall.c
> @@ -16,32 +16,114 @@
>
>  QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
>
> +typedef struct {
> +    int64_t calls;
> +    int64_t errors;
> +} SyscallStats;
> +
> +static GHashTable *syscalls_statistics;
> +
> +static bool percall_print;
> +
>  static void vcpu_syscall(qemu_plugin_id_t id, unsigned int vcpu_index,
>                           int64_t num, uint64_t a1, uint64_t a2,
>                           uint64_t a3, uint64_t a4, uint64_t a5,
>                           uint64_t a6, uint64_t a7, uint64_t a8)
>  {
> -    g_autofree gchar *out = g_strdup_printf("syscall #%" PRIi64 "\n",
> num);
> -    qemu_plugin_outs(out);
> +    if (!percall_print) {
> +        SyscallStats *syscall_entry;
> +
> +        syscall_entry =
> +            (SyscallStats *) g_hash_table_lookup(syscalls_statistics,
> +                                                  GINT_TO_POINTER(num));
> +
> +        if (!syscall_entry) {
> +            syscall_entry = g_new(SyscallStats, 1);
> +            syscall_entry->calls = 1;
> +            syscall_entry->errors = 0;
> +
> +            g_hash_table_insert(syscalls_statistics, GINT_TO_POINTER(num),
> +                                (gpointer) syscall_entry);
> +        } else {
> +            syscall_entry->calls++;
> +        }
> +    } else {
> +        g_autofree gchar *out = g_strdup_printf("syscall #%" PRIi64 "\n",
> num);
> +        qemu_plugin_outs(out);
> +    }
>  }
>
>  static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
>                               int64_t num, int64_t ret)
> +{
> +    if (!percall_print) {
> +        SyscallStats *syscall_entry;
> +
> +        syscall_entry =
> +            (SyscallStats *) g_hash_table_lookup(syscalls_statistics,
> +                                                  GINT_TO_POINTER(num));
> +        if (!syscall_entry) {
> +            qemu_plugin_outs(g_strdup_printf("%" PRIi64 "\n", num));
> +        }
> +        if (ret < 0) {
> +            syscall_entry->errors++;
> +        }
> +    } else {
> +        g_autofree gchar *out;
> +        out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64
> "\n",
> +                num, ret);
> +        qemu_plugin_outs(out);
> +    }
> +}
> +
> +/*
> ************************************************************************* */
> +
> +void print_entry(gpointer key, gpointer val, gpointer user_data)
>  {
>      g_autofree gchar *out;
> -    out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64
> "\n",
> -            num, ret);
> +    int64_t syscall_num = (int64_t) key;
> +    SyscallStats *syscall_entry = (SyscallStats *) val;
> +    out = g_strdup_printf(
> +        "%-13" PRIi64 "%-6" PRIi64 " %" PRIi64 "\n",
> +        syscall_num, syscall_entry->calls, syscall_entry->errors);
>      qemu_plugin_outs(out);
>  }
>
> -/*
> ************************************************************************* */
> +static void plugin_exit(qemu_plugin_id_t id, void *p)
> +{
> +    if (!percall_print) {
> +        qemu_plugin_outs("syscall no.  calls  errors\n");
> +        g_hash_table_foreach(syscalls_statistics, &print_entry, NULL);
> +    }
> +}
>
> -static void plugin_exit(qemu_plugin_id_t id, void *p) {}
> +void free_entry(gpointer entry)
> +{
> +    g_free(entry);
> +}
>
>  QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>                                             const qemu_info_t *info,
>                                             int argc, char **argv)
>  {
> +    int i;
> +
> +    for (i = 0; i < argc; i++) {
> +        char *opt = argv[i];
> +        if (g_strcmp0(opt, "print") == 0) {
> +            percall_print = true;
> +        } else {
> +            fprintf(stderr, "unsupported argument: %s\n", opt);
> +            return -1;
> +        }
> +    }
> +
> +    if (!percall_print) {
> +        syscalls_statistics =
> +            g_hash_table_new_full(g_direct_hash, g_direct_equal,
> +                    NULL, &free_entry);
> +    }
> +
>      qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);
>      qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_syscall_ret);
>      qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
> --
> 2.25.1
>
>
Hello. I just realized that this hunk:

static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
>                               int64_t num, int64_t ret)
> +{
> +        // ......
> +        if (!syscall_entry) {
> +            qemu_plugin_outs(g_strdup_printf("%" PRIi64 "\n", num));
> +        }
>

Is completely superfluous. I think I had it for debugging purposes.
Should I resend without it or can you omit it from the patch?

Yours,
Mahmoud

--00000000000098ef9605c01173a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Apr 15, 2021 at 5:20 PM Mahmoud Mand=
our &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma.mandourr@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Added=
 a table-like output which contains the total number of calls<br>
for each used syscall along with the number of errors that occurred.<br>
<br>
Per-call tracing is still available through supplying the argument<br>
``print`` to the plugin.<br>
<br>
Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com"=
 target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
---<br>
=C2=A0tests/plugin/syscall.c | 94 +++++++++++++++++++++++++++++++++++++++--=
-<br>
=C2=A01 file changed, 88 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c<br>
index 53ee2ab6c4..b92340c636 100644<br>
--- a/tests/plugin/syscall.c<br>
+++ b/tests/plugin/syscall.c<br>
@@ -16,32 +16,114 @@<br>
<br>
=C2=A0QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;<b=
r>
<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 int64_t calls;<br>
+=C2=A0 =C2=A0 int64_t errors;<br>
+} SyscallStats;<br>
+<br>
+static GHashTable *syscalls_statistics;<br>
+<br>
+static bool percall_print;<br>
+<br>
=C2=A0static void vcpu_syscall(qemu_plugin_id_t id, unsigned int vcpu_index=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 int64_t num, uint64_t a1, uint64_t a2,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint64_t a3, uint64_t a4, uint64_t a5,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint64_t a6, uint64_t a7, uint64_t a8)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 g_autofree gchar *out =3D g_strdup_printf(&quot;syscall #%&q=
uot; PRIi64 &quot;\n&quot;, num);<br>
-=C2=A0 =C2=A0 qemu_plugin_outs(out);<br>
+=C2=A0 =C2=A0 if (!percall_print) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SyscallStats *syscall_entry;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_entry =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (SyscallStats *) g_hash_table_lo=
okup(syscalls_statistics,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GINT_TO_POINTER(num));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!syscall_entry) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_entry =3D g_new(SyscallS=
tats, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_entry-&gt;calls =3D 1;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_entry-&gt;errors =3D 0;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_insert(syscalls_sta=
tistics, GINT_TO_POINTER(num),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (gpointer) syscall_entry);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_entry-&gt;calls++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree gchar *out =3D g_strdup_printf(&quo=
t;syscall #%&quot; PRIi64 &quot;\n&quot;, num);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_outs(out);<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_i=
dx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t num, int64_t ret)<br>
+{<br>
+=C2=A0 =C2=A0 if (!percall_print) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SyscallStats *syscall_entry;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_entry =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (SyscallStats *) g_hash_table_lo=
okup(syscalls_statistics,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GINT_TO_POINTER(num));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!syscall_entry) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_outs(g_strdup_printf=
(&quot;%&quot; PRIi64 &quot;\n&quot;, num));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_entry-&gt;errors++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree gchar *out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D g_strdup_printf(&quot;syscall #%&quot;=
 PRIi64 &quot; returned -&gt; %&quot; PRIi64 &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_outs(out);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+/* ***********************************************************************=
** */<br>
+<br>
+void print_entry(gpointer key, gpointer val, gpointer user_data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_autofree gchar *out;<br>
-=C2=A0 =C2=A0 out =3D g_strdup_printf(&quot;syscall #%&quot; PRIi64 &quot;=
 returned -&gt; %&quot; PRIi64 &quot;\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num, ret);<br>
+=C2=A0 =C2=A0 int64_t syscall_num =3D (int64_t) key;<br>
+=C2=A0 =C2=A0 SyscallStats *syscall_entry =3D (SyscallStats *) val;<br>
+=C2=A0 =C2=A0 out =3D g_strdup_printf(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%-13&quot; PRIi64 &quot;%-6&quot; PRIi64=
 &quot; %&quot; PRIi64 &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_num, syscall_entry-&gt;calls, syscall_=
entry-&gt;errors);<br>
=C2=A0 =C2=A0 =C2=A0qemu_plugin_outs(out);<br>
=C2=A0}<br>
<br>
-/* ***********************************************************************=
** */<br>
+static void plugin_exit(qemu_plugin_id_t id, void *p)<br>
+{<br>
+=C2=A0 =C2=A0 if (!percall_print) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_outs(&quot;syscall no.=C2=A0 calls=
=C2=A0 errors\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_foreach(syscalls_statistics, &amp=
;print_entry, NULL);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
<br>
-static void plugin_exit(qemu_plugin_id_t id, void *p) {}<br>
+void free_entry(gpointer entry)<br>
+{<br>
+=C2=A0 =C2=A0 g_free(entry);<br>
+}<br>
<br>
=C2=A0QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const qemu_info_t *info,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int argc, char **argv)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; argc; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *opt =3D argv[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_strcmp0(opt, &quot;print&quot;) =3D=3D 0=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 percall_print =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;unsupporte=
d argument: %s\n&quot;, opt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!percall_print) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 syscalls_statistics =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_new_full(g_direct_h=
ash, g_direct_equal,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL=
, &amp;free_entry);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);=
<br>
=C2=A0 =C2=A0 =C2=A0qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_sysca=
ll_ret);<br>
=C2=A0 =C2=A0 =C2=A0qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);<=
br>
-- <br>
2.25.1<br>
<br></blockquote><div><br></div><div>Hello. I just realized that this hunk:=
=C2=A0</div><div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_=
idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t num, int64_t ret)<br>
+{<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 // ......<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!syscall_entry) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_outs(g_strdup_printf=
(&quot;%&quot; PRIi64 &quot;\n&quot;, num));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Is compl=
etely superfluous. I think I had it for debugging purposes.</div></div><div=
>Should I resend without it or can you omit it from the patch?</div><div><b=
r></div><div>Yours,</div><div>Mahmoud</div></div></div></div></div></div></=
div>

--00000000000098ef9605c01173a7--

