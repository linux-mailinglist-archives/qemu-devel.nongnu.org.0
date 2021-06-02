Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D12039805A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 06:31:26 +0200 (CEST)
Received: from localhost ([::1]:48680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loIXM-0006rk-R1
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 00:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loIWE-00066g-Rj
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 00:30:14 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:40572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loIWA-0004Mh-MQ
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 00:30:14 -0400
Received: by mail-il1-x132.google.com with SMTP id b14so619615ilq.7
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 21:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PKpclIwQlSKoZ9/37F9WtQNQX/bRBrSQ1Jlhi/0jpU0=;
 b=sqzCHUETa3THT/8ylVDQH1OLKscsKIjgaooq9sJkDIxk2E3WErhlHjvLld2wc6BqWV
 IlZFQR7VZSltg2ApYraToQkY82PpG1X4t9femPCXAr+xXdc52KeNIIpw2qziqCvC+gnF
 o4NbaAlO3lWbG83VEob2APo722NDA3GuJv1K8Xl/Zsm1fBwEdffqkhTC+A603n3v3TAM
 CJ+VbUgVuManXmI/krcCAZ7bAzSkMxKDVttTO6y97XiZAgw/SpIeOfS40k5q+ThkV5zw
 hX+b1VzpiOXPTFFFJRSTuz2K7Yz/FcEbM9P7l/j4qdIhnivIIZC/bKn0tNJwOb8H8Cew
 GqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PKpclIwQlSKoZ9/37F9WtQNQX/bRBrSQ1Jlhi/0jpU0=;
 b=JDpGom3y6sUdqUIFaqtbzdq6D6iRdtDm/RYGcK0Wnieff7l241riE7jCd++Oc3TTwm
 jyZDfDnjGRdP0+bahYpTXpPay5PH1TVyMmY2ujLYKI4MJHgjSpjZ0Z2dDWirkfUIPpED
 ekfVjRJ0fH32VPpLJexsNqGX/juwv6qppfCEEBk4Z69tNy8ES+92Yq8dhVjjwrIHtkGn
 G6MkmYhRSqNxL3pRFG9rwyClRZ+ZbRci3plX0h2OaT8DPpJQ1avfUxJpeGXR8pswpm2D
 uflO26OLN+1mNcelTTlL8+oGXn96pqpkoMzXlhjo0Eqs60dwX8ehFER6eBuAnz7MUlYb
 VtYQ==
X-Gm-Message-State: AOAM5313TqLzuUWZiBuEtDgnpE9rjdbpFcCVvRSHrCBXCF3tnOXVI4LR
 a5N9QD6Qv3/altzruTmpcx5YulFZ75yCC5s/FFM=
X-Google-Smtp-Source: ABdhPJzpwHdtnBcdZb7rBBXVjEj8PzTdWrvIPBQEFaUhTLFV8bP+JfdsPwgHwAHlSJiWdExs6TiU6uguZOavZNmP8cc=
X-Received: by 2002:a05:6e02:12c3:: with SMTP id
 i3mr7173375ilm.234.1622608209314; 
 Tue, 01 Jun 2021 21:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210530063712.6832-1-ma.mandourr@gmail.com>
 <20210530063712.6832-3-ma.mandourr@gmail.com>
 <877djdddri.fsf@linaro.org>
In-Reply-To: <877djdddri.fsf@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 2 Jun 2021 06:29:58 +0200
Message-ID: <CAD-LL6jeSwMstiErtwiwVD9TC-tOShqfu7yxJvTZVucg4+6Z0w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] plugins: cache: Enabled parameterization and
 added trace printing
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ed075805c3c0e908"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x132.google.com
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
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ed075805c3c0e908
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 1, 2021 at 1:29 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> (Stefan CC'ed for tracing discussion)
>
> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>
> > Made both icache and dcache configurable through plugin arguments
> > and added memory trace printing in a separate file.
>
> Please keep the commits discreet and single topic. The memory trace is
> an extra feature so should be in it's own commit.
>
> >
> > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > ---
> >  contrib/plugins/cache.c | 68 +++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 66 insertions(+), 2 deletions(-)
> >
> > diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> > index 8c9d1dd538..fa0bf1dd40 100644
> > --- a/contrib/plugins/cache.c
> > +++ b/contrib/plugins/cache.c
> > @@ -22,7 +22,7 @@ static GRand *rng;
> >  static GHashTable *dmiss_ht;
> >  static GHashTable *imiss_ht;
> >
> > -static GMutex dmtx, imtx;
> > +static GMutex dmtx, imtx, fmtx;
> >
> >  static int limit;
> >  static bool sys;
> > @@ -33,6 +33,8 @@ static uint64_t dmisses;
> >  static uint64_t imem_accesses;
> >  static uint64_t imisses;
> >
> > +FILE *tracefile;
> > +
> >  static enum qemu_plugin_mem_rw rw =3D QEMU_PLUGIN_MEM_RW;
> >
> >  enum AccessResult {
> > @@ -205,6 +207,16 @@ static void vcpu_mem_access(unsigned int cpu_index=
,
> qemu_plugin_meminfo_t info,
> >      insn_addr =3D ((struct InsnData *) userdata)->addr;
> >      effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) :
> vaddr;
> >
> > +    if (tracefile) {
> > +        g_mutex_lock(&fmtx);
> > +        g_autoptr(GString) rep =3D g_string_new("");
> > +        bool is_store =3D qemu_plugin_mem_is_store(info);
> > +        g_string_append_printf(rep, "%c: 0x%" PRIx64,
> > +                is_store ? 'S' : 'L', effective_addr);
> > +        fprintf(tracefile, "%s\n", rep->str);
> > +        g_mutex_unlock(&fmtx);
> > +    }
>
> I can see this would be useful for debugging but I'm wary of adding
> ad-hoc tracing formats when QEMU already has support for a wide range of
> tracing formats. We discussed this a bit in:
>
>   Subject: trace_FOO_tcg bit-rotted?
>   Date: Tue, 06 Apr 2021 17:00:20 +0100
>   Message-ID: <87eefnwd0l.fsf@linaro.org>
>
> However I don't know how easy it would be to leverage the existing
> tracing infrastructure from inside a plugin. As I understand it QEMU
> currently builds a static list of trace points during the build so maybe
> we would need additional infrastructure for a plugin to register a trace
> point and for the final output to be use-able. For example the binary
> trace output I think still needs to reference the source trace-events
> file?
>
> So that's not a NACK but maybe we could spend a little time working out
> if we can come up with a cleaner solution?

Alright then, I will have it removed for now and maybe add it if there's a
better
solution for it.

>


> Stefan, any thoughts?
>
> >      if (access_cache(dcache, effective_addr) =3D=3D MISS) {
> >          struct InsnData *insn =3D get_or_create(dmiss_ht, userdata,
> insn_addr);
> >          insn->misses++;
> > @@ -221,11 +233,20 @@ static void vcpu_insn_exec(unsigned int
> vcpu_index, void *userdata)
> >      g_mutex_lock(&imtx);
> >      addr =3D ((struct InsnData *) userdata)->addr;
> >
> > +    if (tracefile) {
> > +        g_mutex_lock(&fmtx);
> > +        g_autoptr(GString) rep =3D g_string_new("");
> > +        g_string_append_printf(rep, "I: 0x%" PRIx64, addr);
> > +        fprintf(tracefile, "%s\n", rep->str);
> > +        g_mutex_unlock(&fmtx);
> > +    }
> > +
> >      if (access_cache(icache, addr) =3D=3D MISS) {
> >          struct InsnData *insn =3D get_or_create(imiss_ht, userdata, ad=
dr);
> >          insn->misses++;
> >          imisses++;
> >      }
> > +
> >      imem_accesses++;
> >      g_mutex_unlock(&imtx);
> >  }
> > @@ -352,6 +373,15 @@ static void plugin_exit()
> >
> >      g_mutex_unlock(&dmtx);
> >      g_mutex_unlock(&imtx);
> > +
> > +    if (tracefile) {
> > +        fclose(tracefile);
> > +    }
> > +}
> > +
> > +static bool bad_cache_params(int blksize, int assoc, int cachesize)
> > +{
> > +    return (cachesize % blksize) !=3D 0 || (cachesize % (blksize * ass=
oc)
> !=3D 0);
> >  }
> >
> >  QEMU_PLUGIN_EXPORT
> > @@ -377,14 +407,48 @@ int qemu_plugin_install(qemu_plugin_id_t id, cons=
t
> qemu_info_t *info,
> >
> >      for (i =3D 0; i < argc; i++) {
> >          char *opt =3D argv[i];
> > -        if (g_str_has_prefix(opt, "limit=3D")) {
> > +        if (g_str_has_prefix(opt, "I=3D")) {
> > +            gchar **toks =3D g_strsplit(opt + 2, " ", -1);
> > +            if (g_strv_length(toks) !=3D 3) {
> > +                fprintf(stderr, "option parsing failed: %s\n", opt);
> > +                return -1;
> > +            }
> > +            icachesize =3D g_ascii_strtoull(toks[0], NULL, 10);
> > +            iassoc =3D g_ascii_strtoull(toks[1], NULL, 10);
> > +            iblksize =3D g_ascii_strtoull(toks[2], NULL, 10);
> > +        } else if (g_str_has_prefix(opt, "D=3D")) {
> > +            gchar **toks =3D g_strsplit(opt + 2, " ", -1);
> > +            if (g_strv_length(toks) !=3D 3) {
> > +                fprintf(stderr, "option parsing failed: %s\n", opt);
> > +                return -1;
> > +            }
> > +            dcachesize =3D g_ascii_strtoull(toks[0], NULL, 10);
> > +            dassoc =3D g_ascii_strtoull(toks[1], NULL, 10);
> > +            dblksize =3D g_ascii_strtoull(toks[2], NULL, 10);
> > +        } else if (g_str_has_prefix(opt, "limit=3D")) {
> >              limit =3D g_ascii_strtoull(opt + 6, NULL, 10);
> > +        } else if (g_str_has_prefix(opt, "tracefile=3D")) {
> > +            char *file_name =3D opt + 10;
> > +            tracefile =3D fopen(file_name, "w");
> > +            if (!tracefile) {
> > +                fprintf(stderr, "could not open: %s for writing\n",
> file_name);
> > +            }
> >          } else {
> >              fprintf(stderr, "option parsing failed: %s\n", opt);
> >              return -1;
> >          }
> >      }
> >
> > +    if (bad_cache_params(iblksize, iassoc, icachesize)) {
> > +        fprintf(stderr, "icache cannot be constructed from given
> parameters\n");
> > +        return -1;
> > +    }
> > +
> > +    if (bad_cache_params(dblksize, dassoc, dcachesize)) {
> > +        fprintf(stderr, "dcache cannot be constructed from given
> parameters\n");
> > +        return -1;
> > +    }
> > +
>
> Perhaps roll bad_cache_params into cache_init and return NULL if it
> fails, so:
>
>   dcache =3D cache_init(dblksize, dassoc, dcachesize);
>   if (!dcache) {
>     fprintf(stderr, "dcache cannot be constructed from given
> parameters\n");
>     return -1;
>   }

Applied, thanks

>
> >      dcache =3D cache_init(dblksize, dassoc, dcachesize);
> >      icache =3D cache_init(iblksize, iassoc, icachesize);
>
>
> --
> Alex Benn=C3=A9e
>

--000000000000ed075805c3c0e908
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 1, 2021 at 1:29 PM Alex B=
enn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
(Stefan CC&#39;ed for tracing discussion)<br>
<br>
Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com" target=3D"_bla=
nk">ma.mandourr@gmail.com</a>&gt; writes:<br>
<br>
&gt; Made both icache and dcache configurable through plugin arguments<br>
&gt; and added memory trace printing in a separate file.<br>
<br>
Please keep the commits discreet and single topic. The memory trace is<br>
an extra feature so should be in it&#39;s own commit.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail=
.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 contrib/plugins/cache.c | 68 +++++++++++++++++++++++++++++++++++=
++++--<br>
&gt;=C2=A0 1 file changed, 66 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c<br>
&gt; index 8c9d1dd538..fa0bf1dd40 100644<br>
&gt; --- a/contrib/plugins/cache.c<br>
&gt; +++ b/contrib/plugins/cache.c<br>
&gt; @@ -22,7 +22,7 @@ static GRand *rng;<br>
&gt;=C2=A0 static GHashTable *dmiss_ht;<br>
&gt;=C2=A0 static GHashTable *imiss_ht;<br>
&gt;=C2=A0 <br>
&gt; -static GMutex dmtx, imtx;<br>
&gt; +static GMutex dmtx, imtx, fmtx;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static int limit;<br>
&gt;=C2=A0 static bool sys;<br>
&gt; @@ -33,6 +33,8 @@ static uint64_t dmisses;<br>
&gt;=C2=A0 static uint64_t imem_accesses;<br>
&gt;=C2=A0 static uint64_t imisses;<br>
&gt;=C2=A0 <br>
&gt; +FILE *tracefile;<br>
&gt; +<br>
&gt;=C2=A0 static enum qemu_plugin_mem_rw rw =3D QEMU_PLUGIN_MEM_RW;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 enum AccessResult {<br>
&gt; @@ -205,6 +207,16 @@ static void vcpu_mem_access(unsigned int cpu_inde=
x, qemu_plugin_meminfo_t info,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 insn_addr =3D ((struct InsnData *) userdata)-&gt;a=
ddr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phy=
s_addr(hwaddr) : vaddr;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 if (tracefile) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_lock(&amp;fmtx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autoptr(GString) rep =3D g_string_new(&=
quot;&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_store =3D qemu_plugin_mem_is_stor=
e(info);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(rep, &quot;%c: 0x%=
&quot; PRIx64,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_store ? &#=
39;S&#39; : &#39;L&#39;, effective_addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(tracefile, &quot;%s\n&quot;, rep-=
&gt;str);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&amp;fmtx);<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
I can see this would be useful for debugging but I&#39;m wary of adding<br>
ad-hoc tracing formats when QEMU already has support for a wide range of<br=
>
tracing formats. We discussed this a bit in:<br>
<br>
=C2=A0 Subject: trace_FOO_tcg bit-rotted?<br>
=C2=A0 Date: Tue, 06 Apr 2021 17:00:20 +0100<br>
=C2=A0 Message-ID: &lt;<a href=3D"mailto:87eefnwd0l.fsf@linaro.org" target=
=3D"_blank">87eefnwd0l.fsf@linaro.org</a>&gt;<br>
<br>
However I don&#39;t know how easy it would be to leverage the existing<br>
tracing infrastructure from inside a plugin. As I understand it QEMU<br>
currently builds a static list of trace points during the build so maybe<br=
>
we would need additional infrastructure for a plugin to register a trace<br=
>
point and for the final output to be use-able. For example the binary<br>
trace output I think still needs to reference the source trace-events<br>
file?<br>
<br>
So that&#39;s not a NACK but maybe we could spend a little time working out=
<br>
if we can come up with a cleaner solution?</blockquote><div>Alright then, I=
 will have it removed for now and maybe add it if there&#39;s a better</div=
><div>solution for it.</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Stefan, any thoughts?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (access_cache(dcache, effective_addr) =3D=3D MI=
SS) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct InsnData *insn =3D get_or_cre=
ate(dmiss_ht, userdata, insn_addr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn-&gt;misses++;<br>
&gt; @@ -221,11 +233,20 @@ static void vcpu_insn_exec(unsigned int vcpu_ind=
ex, void *userdata)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_mutex_lock(&amp;imtx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 addr =3D ((struct InsnData *) userdata)-&gt;addr;<=
br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 if (tracefile) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_lock(&amp;fmtx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autoptr(GString) rep =3D g_string_new(&=
quot;&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(rep, &quot;I: 0x%&=
quot; PRIx64, addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(tracefile, &quot;%s\n&quot;, rep-=
&gt;str);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&amp;fmtx);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (access_cache(icache, addr) =3D=3D MISS) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct InsnData *insn =3D get_or_cre=
ate(imiss_ht, userdata, addr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn-&gt;misses++;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imisses++;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 imem_accesses++;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&amp;imtx);<br>
&gt;=C2=A0 }<br>
&gt; @@ -352,6 +373,15 @@ static void plugin_exit()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&amp;dmtx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&amp;imtx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (tracefile) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(tracefile);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool bad_cache_params(int blksize, int assoc, int cachesize)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return (cachesize % blksize) !=3D 0 || (cachesize % (bl=
ksize * assoc) !=3D 0);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 QEMU_PLUGIN_EXPORT<br>
&gt; @@ -377,14 +407,48 @@ int qemu_plugin_install(qemu_plugin_id_t id, con=
st qemu_info_t *info,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; argc; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *opt =3D argv[i];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_str_has_prefix(opt, &quot;limit=3D&=
quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_str_has_prefix(opt, &quot;I=3D&quot=
;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gchar **toks =3D g_strsplit=
(opt + 2, &quot; &quot;, -1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_strv_length(toks) !=
=3D 3) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stder=
r, &quot;option parsing failed: %s\n&quot;, opt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 icachesize =3D g_ascii_strt=
oull(toks[0], NULL, 10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iassoc =3D g_ascii_strtoull=
(toks[1], NULL, 10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iblksize =3D g_ascii_strtou=
ll(toks[2], NULL, 10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (g_str_has_prefix(opt, &quot;D=
=3D&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gchar **toks =3D g_strsplit=
(opt + 2, &quot; &quot;, -1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_strv_length(toks) !=
=3D 3) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stder=
r, &quot;option parsing failed: %s\n&quot;, opt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dcachesize =3D g_ascii_strt=
oull(toks[0], NULL, 10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dassoc =3D g_ascii_strtoull=
(toks[1], NULL, 10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dblksize =3D g_ascii_strtou=
ll(toks[2], NULL, 10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (g_str_has_prefix(opt, &quot;li=
mit=3D&quot;)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 limit =3D g_ascii_strt=
oull(opt + 6, NULL, 10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (g_str_has_prefix(opt, &quot;tr=
acefile=3D&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *file_name =3D opt + 1=
0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tracefile =3D fopen(file_na=
me, &quot;w&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tracefile) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stder=
r, &quot;could not open: %s for writing\n&quot;, file_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=
option parsing failed: %s\n&quot;, opt);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 if (bad_cache_params(iblksize, iassoc, icachesize)) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;icache cannot be co=
nstructed from given parameters\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (bad_cache_params(dblksize, dassoc, dcachesize)) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;dcache cannot be co=
nstructed from given parameters\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
<br>
Perhaps roll bad_cache_params into cache_init and return NULL if it<br>
fails, so:<br>
<br>
=C2=A0 dcache =3D cache_init(dblksize, dassoc, dcachesize);<br>
=C2=A0 if (!dcache) {<br>
=C2=A0 =C2=A0 fprintf(stderr, &quot;dcache cannot be constructed from given=
 parameters\n&quot;);<br>
=C2=A0 =C2=A0 return -1;<br>
=C2=A0 }</blockquote><div>Applied, thanks=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dcache =3D cache_init(dblksize, dassoc, dcachesize=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 icache =3D cache_init(iblksize, iassoc, icachesize=
);<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--000000000000ed075805c3c0e908--

