Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685703340FB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:01:04 +0100 (CET)
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK0Kd-0005fi-9x
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:01:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lK0Iy-0004NS-Jo; Wed, 10 Mar 2021 09:59:21 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:43489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <famforupstream@gmail.com>)
 id 1lK0Is-0000Nl-PR; Wed, 10 Mar 2021 09:59:18 -0500
Received: by mail-lf1-x134.google.com with SMTP id d3so33904470lfg.10;
 Wed, 10 Mar 2021 06:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sXAFcMELB67T0uqfz4Xc7e82yM8sCTK7pvJQu9oUl8k=;
 b=RfzWUyRzMTAvqFLIk/ZAbb6GLuwu6GmHmeQGCvU/EbBP1W/bX229u4fSDyNWNEjBrS
 uze2Dt5qys+l8nTFlRyWrpqTj7c8klMHViQQ4jud0HjzSuhBs5jBuEbzTQ21rFDsQ7VL
 np9BxONMk1HSNZqaUDaNHwm5hXSF/5SmjyQ6gqzaUHOXQDnOfCPaY4VbE5WGTyF1z9t2
 aheYayoxxwLRHieP355ck5O+2yHiBjUok/kzSO9xsVDFI7layWdfiOjGUBBwk33eQsOz
 i81ibLVXgBH29CDBiIrcysDv1j0pbIMDcM6JfepzR+Epugjl2rJOl8KCQDOznIagn8Wa
 /AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sXAFcMELB67T0uqfz4Xc7e82yM8sCTK7pvJQu9oUl8k=;
 b=gxgsNTwGqoejgcK+hzpv20HtRB53MFFuGCtYdWtSDTi7pptvoIT5fSRCFgMtlxS13/
 V3H70hBSBmnqq8fPgsZFm4vapnRf6TN0a4Kd3BheoIRllJlYNOZdE9cVQTDV5eOK3cmV
 Dmhp5r4w4y5SdZX7KksBKdfTRDtuvmmD8+l0NmKNJvUu0GJ7DiYqNwpjsvfAYZ2xJlSG
 P4sB2MR7it7UFXCp2AvZZAjTtHTQY+civpG01gZgNTlIYTst0mRTKSX2PMr71jZDuPLU
 42+edJkTu/xLzh9OrnpOnrlPHJ47MIPLcJUVQTrC3aICS1SXM+kw9TfVeSMlLFKYCjMK
 +bsA==
X-Gm-Message-State: AOAM533tdYvbaFGEW9Q3/r/IBv5wo35K8t76zVDGh+Ys4m3XxxGW6xD1
 tQ62nK0eSaeddBRmKjfVhjAd+i4M4dvbg2M7Y7M=
X-Google-Smtp-Source: ABdhPJwWu2Yn9pkRki9hNp/92mGQ398Lo6z/nApeh1fD1QzdfU7V41ryO5q2wTkd7EKtyITFUKuLEhnrCvF0iqrA08I=
X-Received: by 2002:a05:6512:405:: with SMTP id
 u5mr2179587lfk.574.1615388351141; 
 Wed, 10 Mar 2021 06:59:11 -0800 (PST)
MIME-Version: 1.0
References: <20210310141752.5113-1-fam@euphon.net>
 <d16dce2d-f844-5e58-6ae1-bbf366e74b60@redhat.com>
 <CAGNx5+34xWD33-YQmS_Tw-bV3nFMJSpB72c6paGpN4pdmmPkAg@mail.gmail.com>
 <557f59ec-ccbe-64a5-a21f-ab24dc818f2b@redhat.com>
In-Reply-To: <557f59ec-ccbe-64a5-a21f-ab24dc818f2b@redhat.com>
From: Fam Zheng <famforupstream@gmail.com>
Date: Wed, 10 Mar 2021 14:59:00 +0000
Message-ID: <CAGNx5+23ehs_CMYZUgRKcjRs2C5RMRjn3grCaG35MduDXJY2iA@mail.gmail.com>
Subject: Re: [PATCH] block: Introduce zero-co:// and zero-aio://
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d819db05bd2fe860"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=famforupstream@gmail.com; helo=mail-lf1-x134.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d819db05bd2fe860
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Mar 2021 at 14:51, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> On 3/10/21 3:28 PM, Fam Zheng wrote:
> > On Wed, 10 Mar 2021 at 14:24, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com
> > <mailto:philmd@redhat.com>> wrote:
> >
> >     On 3/10/21 3:17 PM, fam@euphon.net <mailto:fam@euphon.net> wrote:
> >     > From: Fam Zheng <famzheng@amazon.com <mailto:famzheng@amazon.com>=
>
> >     >
> >     > null-co:// has a read-zeroes=3Doff default, when used to in secur=
ity
> >     > analysis, this can cause false positives because the driver doesn=
't
> >     > write to the read buffer.
> >     >
> >     > null-co:// has the highest possible performance as a block driver=
,
> so
> >     > let's keep it that way. This patch introduces zero-co:// and
> >     > zero-aio://, largely similar with null-*://, but have
> >     read-zeroes=3Don by
> >     > default, so it's more suitable in cases than null-co://.
> >
> >     Thanks!
> >
> >     >
> >     > Signed-off-by: Fam Zheng <fam@euphon.net <mailto:fam@euphon.net>>
> >     > ---
> >     >  block/null.c | 91
> >     ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >     >  1 file changed, 91 insertions(+)
> >
> >     > +static int zero_file_open(BlockDriverState *bs, QDict *options,
> >     int flags,
> >     > +                          Error **errp)
> >     > +{
> >     > +    QemuOpts *opts;
> >     > +    BDRVNullState *s =3D bs->opaque;
> >     > +    int ret =3D 0;
> >     > +
> >     > +    opts =3D qemu_opts_create(&runtime_opts, NULL, 0, &error_abo=
rt);
> >     > +    qemu_opts_absorb_qdict(opts, options, &error_abort);
> >     > +    s->length =3D
> >     > +        qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 1 << 30);
> >
> >     Please do not use this magic default value, let's always explicit t=
he
> >     size.
> >
> >         s->length =3D qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 0);
> >         if (s->length < 0) {
> >             error_setg(errp, "%s is invalid", BLOCK_OPT_SIZE);
> >             ret =3D -EINVAL;
> >         }
> >
> >
> > Doesn't that result in a bare
> >
> >   -blockdev zero-co://
> >
> > would have 0 byte in size?
>
> Yes, this will display an error.
>
> Maybe better something like:
>
>     if (s->length =3D=3D 0) {
>         error_append_hint(errp, "Usage: zero-co://,size=3DNUM");
>         error_setg(errp, "size must be specified");
>         ret =3D -EINVAL;
>     } else if (s->length < 0) {
>         error_setg(errp, "%s is invalid", BLOCK_OPT_SIZE);
>         ret =3D -EINVAL;
>     }
>
> >
> > I'm copying what null-co:// does today, and it's convenient for tests.
> > Why is a default size bad?
>
> We learned default are almost always bad because you can not get
> rid of them. Also because we have reports of errors when using
> floppy and another one (can't remember) with null-co because of
> invalid size and we have to explain "the default is 1GB, you have
> to explicit your size".
>

Yeah I think that makes sense. I'll revise.

Thanks,
Fam

--000000000000d819db05bd2fe860
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 10 Mar 2021 at 14:51, Philipp=
e Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 3/10/21 3:28 PM, Fam Zheng wrote:<br>
&gt; On Wed, 10 Mar 2021 at 14:24, Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">phil=
md@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 3/10/21 3:17 PM, <a href=3D"mailto:fam@euphon.ne=
t" target=3D"_blank">fam@euphon.net</a> &lt;mailto:<a href=3D"mailto:fam@eu=
phon.net" target=3D"_blank">fam@euphon.net</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; From: Fam Zheng &lt;<a href=3D"mailto:famzheng=
@amazon.com" target=3D"_blank">famzheng@amazon.com</a> &lt;mailto:<a href=
=3D"mailto:famzheng@amazon.com" target=3D"_blank">famzheng@amazon.com</a>&g=
t;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; null-co:// has a read-zeroes=3Doff default, wh=
en used to in security<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; analysis, this can cause false positives becau=
se the driver doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; write to the read buffer.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; null-co:// has the highest possible performanc=
e as a block driver, so<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; let&#39;s keep it that way. This patch introdu=
ces zero-co:// and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; zero-aio://, largely similar with null-*://, b=
ut have<br>
&gt;=C2=A0 =C2=A0 =C2=A0read-zeroes=3Don by<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; default, so it&#39;s more suitable in cases th=
an null-co://.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Fam Zheng &lt;<a href=3D"mailto=
:fam@euphon.net" target=3D"_blank">fam@euphon.net</a> &lt;mailto:<a href=3D=
"mailto:fam@euphon.net" target=3D"_blank">fam@euphon.net</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 block/null.c | 91<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++++++++++++++++++++++++++++++++++=
+<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 1 file changed, 91 insertions(+)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +static int zero_file_open(BlockDriverState *b=
s, QDict *options,<br>
&gt;=C2=A0 =C2=A0 =C2=A0int flags,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 QemuOpts *opts;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 BDRVNullState *s =3D bs-&gt;opa=
que;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 int ret =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 opts =3D qemu_opts_create(&amp;=
runtime_opts, NULL, 0, &amp;error_abort);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 qemu_opts_absorb_qdict(opts, op=
tions, &amp;error_abort);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 s-&gt;length =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_opt_get_size=
(opts, BLOCK_OPT_SIZE, 1 &lt;&lt; 30);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Please do not use this magic default value, let&#39=
;s always explicit the<br>
&gt;=C2=A0 =C2=A0 =C2=A0size.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 s-&gt;length =3D qemu_opt_get_size(op=
ts, BLOCK_OPT_SIZE, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 if (s-&gt;length &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;=
%s is invalid&quot;, BLOCK_OPT_SIZE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 }<br>
&gt; <br>
&gt; <br>
&gt; Doesn&#39;t that result in a bare<br>
&gt; <br>
&gt; =C2=A0 -blockdev zero-co://<br>
&gt; <br>
&gt; would have 0 byte in size?<br>
<br>
Yes, this will display an error.<br>
<br>
Maybe better something like:<br>
<br>
=C2=A0 =C2=A0 if (s-&gt;length =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_append_hint(errp, &quot;Usage: zero-co://=
,size=3DNUM&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;size must be specified&q=
uot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;<br>
=C2=A0 =C2=A0 } else if (s-&gt;length &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s is invalid&quot;, BLO=
CK_OPT_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;<br>
=C2=A0 =C2=A0 }<br>
<br>
&gt; <br>
&gt; I&#39;m copying what null-co:// does today, and it&#39;s convenient fo=
r tests.<br>
&gt; Why is a default size bad?<br>
<br>
We learned default are almost always bad because you can not get<br>
rid of them. Also because we have reports of errors when using<br>
floppy and another one (can&#39;t remember) with null-co because of<br>
invalid size and we have to explain &quot;the default is 1GB, you have<br>
to explicit your size&quot;.<br></blockquote><div>=C2=A0</div><div>Yeah I t=
hink that makes sense. I&#39;ll revise.</div><div><br>Thanks,</div><div>Fam=
</div></div></div>

--000000000000d819db05bd2fe860--

