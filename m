Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3621397F60
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:17:23 +0200 (CEST)
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHNi-0003od-Qv
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loHM1-000312-BJ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:15:37 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:36438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loHLz-0004y9-7l
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:15:37 -0400
Received: by mail-il1-x134.google.com with SMTP id e7so816595ils.3
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 20:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=TPkpwluhJAROvlOc0h48vOErBeWjsOfdGXGlqCa+xxE=;
 b=X8Yb5d1eA5I1u9lXBAa+8xlFJi308EUxEwQAU6sZUxK6rmWphoO6KvdTRF5HaFNi3g
 SdhWf9emslIWwvGPmFZUcHnFrNYbS0DvU5GT8Urbf5nXRBy0Am3TaDh4DIng6GFnE4NE
 MAeSqxleMjSEE8m6mxxZNFpU5id8cXoI/QciI+rwZ6uCajySemvsC19KcMBnTQIvb9I1
 h+ovw1GxvX4dGynd7w4cIj1777vNPJel2xn0P4WGvj4aOv01ZjwshFAoOSpjEbhVUwoR
 AIHoYAyZz4UnDlto04zQoqFyoK4NYUk6850hMy6jfFbW/swxPhcWvX3Gcuk82+aQMMn0
 0ZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=TPkpwluhJAROvlOc0h48vOErBeWjsOfdGXGlqCa+xxE=;
 b=eL6YjXLSRgJWfH1EGXwIaAIOKDn9e29SwkOEG5i87lJyd8aqFfx2E3T1N9sHXwsf7r
 7SaNdC7c7TQcWmQFG/ySeTHuZDtXnzN6duVKlcKulmZMrU7hmvkuSGMpFvOX3a1wymZt
 7wKTfTNh5t8E4DHjAnAMxvg0M1sibXi+LKi30nsBnShQ2+F8rw/nsCOA2OLtWGyxAptY
 o5DhjlPwVEQEIEvDjiv3oHDkGdXo9DielO9zEMf3iQ1HyevSGLrl6x4po9viYcXl4C/f
 mTzOVYBkkUF2es7o2Mnj11SBM0zYAlsdvnMlQjXAiU3gzpSRiyqlKGDAPJA/J1LIVEth
 KgiQ==
X-Gm-Message-State: AOAM530+IzFO7U0uL/K9QLHUIOZ1EixLhYBmMTnpP9v7+r2As/uMFVpW
 giqeJwntzmRmGhg3Z2rS1vppzgsCmwpABe4PaWPwnvZBaR0=
X-Google-Smtp-Source: ABdhPJzu8NvQTkfZ6gbzkoW6GLnTzlfMtGfp9vC6BfL8jADb9GQ1rnLIaMFjaFcGK0J80zCbtAuzRUNQcAMHELTlex4=
X-Received: by 2002:a05:6e02:1e0d:: with SMTP id
 g13mr14331263ila.178.1622603734051; 
 Tue, 01 Jun 2021 20:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210530063712.6832-1-ma.mandourr@gmail.com>
 <20210530063712.6832-3-ma.mandourr@gmail.com>
In-Reply-To: <20210530063712.6832-3-ma.mandourr@gmail.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 2 Jun 2021 05:15:23 +0200
Message-ID: <CAD-LL6hgFzRKn7Y=gYG-2Zshx5Lkx4naBEO6jfSmUVmsW9wKvg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] plugins: cache: Enabled parameterization and
 added trace printing
To: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002ded8305c3bfdfdd"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x134.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002ded8305c3bfdfdd
Content-Type: text/plain; charset="UTF-8"

CC'ing Emilio

On Sun, May 30, 2021 at 8:37 AM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

> Made both icache and dcache configurable through plugin arguments
> and added memory trace printing in a separate file.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  contrib/plugins/cache.c | 68 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 66 insertions(+), 2 deletions(-)
>
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index 8c9d1dd538..fa0bf1dd40 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -22,7 +22,7 @@ static GRand *rng;
>  static GHashTable *dmiss_ht;
>  static GHashTable *imiss_ht;
>
> -static GMutex dmtx, imtx;
> +static GMutex dmtx, imtx, fmtx;
>
>  static int limit;
>  static bool sys;
> @@ -33,6 +33,8 @@ static uint64_t dmisses;
>  static uint64_t imem_accesses;
>  static uint64_t imisses;
>
> +FILE *tracefile;
> +
>  static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
>
>  enum AccessResult {
> @@ -205,6 +207,16 @@ static void vcpu_mem_access(unsigned int cpu_index,
> qemu_plugin_meminfo_t info,
>      insn_addr = ((struct InsnData *) userdata)->addr;
>      effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) :
> vaddr;
>
> +    if (tracefile) {
> +        g_mutex_lock(&fmtx);
> +        g_autoptr(GString) rep = g_string_new("");
> +        bool is_store = qemu_plugin_mem_is_store(info);
> +        g_string_append_printf(rep, "%c: 0x%" PRIx64,
> +                is_store ? 'S' : 'L', effective_addr);
> +        fprintf(tracefile, "%s\n", rep->str);
> +        g_mutex_unlock(&fmtx);
> +    }
> +
>      if (access_cache(dcache, effective_addr) == MISS) {
>          struct InsnData *insn = get_or_create(dmiss_ht, userdata,
> insn_addr);
>          insn->misses++;
> @@ -221,11 +233,20 @@ static void vcpu_insn_exec(unsigned int vcpu_index,
> void *userdata)
>      g_mutex_lock(&imtx);
>      addr = ((struct InsnData *) userdata)->addr;
>
> +    if (tracefile) {
> +        g_mutex_lock(&fmtx);
> +        g_autoptr(GString) rep = g_string_new("");
> +        g_string_append_printf(rep, "I: 0x%" PRIx64, addr);
> +        fprintf(tracefile, "%s\n", rep->str);
> +        g_mutex_unlock(&fmtx);
> +    }
> +
>      if (access_cache(icache, addr) == MISS) {
>          struct InsnData *insn = get_or_create(imiss_ht, userdata, addr);
>          insn->misses++;
>          imisses++;
>      }
> +
>      imem_accesses++;
>      g_mutex_unlock(&imtx);
>  }
> @@ -352,6 +373,15 @@ static void plugin_exit()
>
>      g_mutex_unlock(&dmtx);
>      g_mutex_unlock(&imtx);
> +
> +    if (tracefile) {
> +        fclose(tracefile);
> +    }
> +}
> +
> +static bool bad_cache_params(int blksize, int assoc, int cachesize)
> +{
> +    return (cachesize % blksize) != 0 || (cachesize % (blksize * assoc)
> != 0);
>  }
>
>  QEMU_PLUGIN_EXPORT
> @@ -377,14 +407,48 @@ int qemu_plugin_install(qemu_plugin_id_t id, const
> qemu_info_t *info,
>
>      for (i = 0; i < argc; i++) {
>          char *opt = argv[i];
> -        if (g_str_has_prefix(opt, "limit=")) {
> +        if (g_str_has_prefix(opt, "I=")) {
> +            gchar **toks = g_strsplit(opt + 2, " ", -1);
> +            if (g_strv_length(toks) != 3) {
> +                fprintf(stderr, "option parsing failed: %s\n", opt);
> +                return -1;
> +            }
> +            icachesize = g_ascii_strtoull(toks[0], NULL, 10);
> +            iassoc = g_ascii_strtoull(toks[1], NULL, 10);
> +            iblksize = g_ascii_strtoull(toks[2], NULL, 10);
> +        } else if (g_str_has_prefix(opt, "D=")) {
> +            gchar **toks = g_strsplit(opt + 2, " ", -1);
> +            if (g_strv_length(toks) != 3) {
> +                fprintf(stderr, "option parsing failed: %s\n", opt);
> +                return -1;
> +            }
> +            dcachesize = g_ascii_strtoull(toks[0], NULL, 10);
> +            dassoc = g_ascii_strtoull(toks[1], NULL, 10);
> +            dblksize = g_ascii_strtoull(toks[2], NULL, 10);
> +        } else if (g_str_has_prefix(opt, "limit=")) {
>              limit = g_ascii_strtoull(opt + 6, NULL, 10);
> +        } else if (g_str_has_prefix(opt, "tracefile=")) {
> +            char *file_name = opt + 10;
> +            tracefile = fopen(file_name, "w");
> +            if (!tracefile) {
> +                fprintf(stderr, "could not open: %s for writing\n",
> file_name);
> +            }
>          } else {
>              fprintf(stderr, "option parsing failed: %s\n", opt);
>              return -1;
>          }
>      }
>
> +    if (bad_cache_params(iblksize, iassoc, icachesize)) {
> +        fprintf(stderr, "icache cannot be constructed from given
> parameters\n");
> +        return -1;
> +    }
> +
> +    if (bad_cache_params(dblksize, dassoc, dcachesize)) {
> +        fprintf(stderr, "dcache cannot be constructed from given
> parameters\n");
> +        return -1;
> +    }
> +
>      dcache = cache_init(dblksize, dassoc, dcachesize);
>      icache = cache_init(iblksize, iassoc, icachesize);
>
> --
> 2.25.1
>
>

--0000000000002ded8305c3bfdfdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">CC&#39;ing Emilio</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sun, May 30, 2021 at 8:37 AM Mahmoud M=
andour &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma.mandourr@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ma=
de both icache and dcache configurable through plugin arguments<br>
and added memory trace printing in a separate file.<br>
<br>
Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com"=
 target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
---<br>
=C2=A0contrib/plugins/cache.c | 68 +++++++++++++++++++++++++++++++++++++++-=
-<br>
=C2=A01 file changed, 66 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c<br>
index 8c9d1dd538..fa0bf1dd40 100644<br>
--- a/contrib/plugins/cache.c<br>
+++ b/contrib/plugins/cache.c<br>
@@ -22,7 +22,7 @@ static GRand *rng;<br>
=C2=A0static GHashTable *dmiss_ht;<br>
=C2=A0static GHashTable *imiss_ht;<br>
<br>
-static GMutex dmtx, imtx;<br>
+static GMutex dmtx, imtx, fmtx;<br>
<br>
=C2=A0static int limit;<br>
=C2=A0static bool sys;<br>
@@ -33,6 +33,8 @@ static uint64_t dmisses;<br>
=C2=A0static uint64_t imem_accesses;<br>
=C2=A0static uint64_t imisses;<br>
<br>
+FILE *tracefile;<br>
+<br>
=C2=A0static enum qemu_plugin_mem_rw rw =3D QEMU_PLUGIN_MEM_RW;<br>
<br>
=C2=A0enum AccessResult {<br>
@@ -205,6 +207,16 @@ static void vcpu_mem_access(unsigned int cpu_index, qe=
mu_plugin_meminfo_t info,<br>
=C2=A0 =C2=A0 =C2=A0insn_addr =3D ((struct InsnData *) userdata)-&gt;addr;<=
br>
=C2=A0 =C2=A0 =C2=A0effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_add=
r(hwaddr) : vaddr;<br>
<br>
+=C2=A0 =C2=A0 if (tracefile) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_lock(&amp;fmtx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autoptr(GString) rep =3D g_string_new(&quot;=
&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_store =3D qemu_plugin_mem_is_store(inf=
o);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(rep, &quot;%c: 0x%&quot=
; PRIx64,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_store ? &#39;S&=
#39; : &#39;L&#39;, effective_addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(tracefile, &quot;%s\n&quot;, rep-&gt;s=
tr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&amp;fmtx);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (access_cache(dcache, effective_addr) =3D=3D MISS) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct InsnData *insn =3D get_or_create(d=
miss_ht, userdata, insn_addr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insn-&gt;misses++;<br>
@@ -221,11 +233,20 @@ static void vcpu_insn_exec(unsigned int vcpu_index, v=
oid *userdata)<br>
=C2=A0 =C2=A0 =C2=A0g_mutex_lock(&amp;imtx);<br>
=C2=A0 =C2=A0 =C2=A0addr =3D ((struct InsnData *) userdata)-&gt;addr;<br>
<br>
+=C2=A0 =C2=A0 if (tracefile) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_lock(&amp;fmtx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autoptr(GString) rep =3D g_string_new(&quot;=
&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(rep, &quot;I: 0x%&quot;=
 PRIx64, addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(tracefile, &quot;%s\n&quot;, rep-&gt;s=
tr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&amp;fmtx);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (access_cache(icache, addr) =3D=3D MISS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct InsnData *insn =3D get_or_create(i=
miss_ht, userdata, addr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insn-&gt;misses++;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imisses++;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0imem_accesses++;<br>
=C2=A0 =C2=A0 =C2=A0g_mutex_unlock(&amp;imtx);<br>
=C2=A0}<br>
@@ -352,6 +373,15 @@ static void plugin_exit()<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_mutex_unlock(&amp;dmtx);<br>
=C2=A0 =C2=A0 =C2=A0g_mutex_unlock(&amp;imtx);<br>
+<br>
+=C2=A0 =C2=A0 if (tracefile) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(tracefile);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static bool bad_cache_params(int blksize, int assoc, int cachesize)<br>
+{<br>
+=C2=A0 =C2=A0 return (cachesize % blksize) !=3D 0 || (cachesize % (blksize=
 * assoc) !=3D 0);<br>
=C2=A0}<br>
<br>
=C2=A0QEMU_PLUGIN_EXPORT<br>
@@ -377,14 +407,48 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qe=
mu_info_t *info,<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; argc; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *opt =3D argv[i];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_str_has_prefix(opt, &quot;limit=3D&quot;=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_str_has_prefix(opt, &quot;I=3D&quot;)) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gchar **toks =3D g_strsplit(opt =
+ 2, &quot; &quot;, -1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_strv_length(toks) !=3D 3) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &q=
uot;option parsing failed: %s\n&quot;, opt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 icachesize =3D g_ascii_strtoull(=
toks[0], NULL, 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iassoc =3D g_ascii_strtoull(toks=
[1], NULL, 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iblksize =3D g_ascii_strtoull(to=
ks[2], NULL, 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (g_str_has_prefix(opt, &quot;D=3D&qu=
ot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gchar **toks =3D g_strsplit(opt =
+ 2, &quot; &quot;, -1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_strv_length(toks) !=3D 3) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &q=
uot;option parsing failed: %s\n&quot;, opt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dcachesize =3D g_ascii_strtoull(=
toks[0], NULL, 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dassoc =3D g_ascii_strtoull(toks=
[1], NULL, 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dblksize =3D g_ascii_strtoull(to=
ks[2], NULL, 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (g_str_has_prefix(opt, &quot;limit=
=3D&quot;)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0limit =3D g_ascii_strtoull(=
opt + 6, NULL, 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (g_str_has_prefix(opt, &quot;tracefi=
le=3D&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *file_name =3D opt + 10;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tracefile =3D fopen(file_name, &=
quot;w&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tracefile) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &q=
uot;could not open: %s for writing\n&quot;, file_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;optio=
n parsing failed: %s\n&quot;, opt);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (bad_cache_params(iblksize, iassoc, icachesize)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;icache cannot be constru=
cted from given parameters\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (bad_cache_params(dblksize, dassoc, dcachesize)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;dcache cannot be constru=
cted from given parameters\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0dcache =3D cache_init(dblksize, dassoc, dcachesize);<br=
>
=C2=A0 =C2=A0 =C2=A0icache =3D cache_init(iblksize, iassoc, icachesize);<br=
>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000002ded8305c3bfdfdd--

