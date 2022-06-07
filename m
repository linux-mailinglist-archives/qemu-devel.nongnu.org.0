Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985AE541F55
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:10:16 +0200 (CEST)
Received: from localhost ([::1]:58708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyiL1-0005UH-DQ
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nygns-0001X9-UJ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:31:57 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30]:43827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nygnq-0008Je-Qh
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:31:56 -0400
Received: by mail-vk1-xa30.google.com with SMTP id s135so8165145vks.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 14:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jkGzT4pH7GODEpnwPPmAZq2HtlcyxIoy7xJ6KOan2qo=;
 b=BjjhiFU/1w4p3e31HG5h8TLWZ+ifTcGKTFLtO7rcqeERZLFFyHnPSo3VsLBfMBx9Zy
 qd0iMN34xH/oP5NpyIk8A1bhHGFA61IzpAE4P/8+VnEBH5zy4oATZPKmoizXemB6qZwD
 pYX0efU62bgaATPPmUFiIAbLsyuCp0wsw/xcixxAlOHrajEzfAL11OBwSk6wqog53i3y
 JhF2z5mp+3XIXUi++kfOLENxVdz3Oqs0NPTpbk6yRuPvEGp3E8ed54N9nuuaknCn03NL
 TMXqGX4UdF8Me9jOk4n3Bmj1IWojJzaRXNUlcS7HCf7Y4U1+wUqA4zVXHv8lNzliY5OV
 qhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jkGzT4pH7GODEpnwPPmAZq2HtlcyxIoy7xJ6KOan2qo=;
 b=GQ4iEvin/6qit7wyeL/vp5r5wBOju1VSCYpx/c+Fv0BO0VUTDn0eQ5U9Bon6tW8m3T
 mc1Tk/1tDxNOntvirog1WvA6QSh/mVZ891FxcwZqYfDRwcLWZ2d/4JBrpqeoygcouUwY
 TWlbnD0zVMimDQA7d4+Y+7irzKDss4MWe+IQtjaXehIPwb/+LmLZNxXhJxVpO8LzTVLP
 UKeDNn+7gGv5V1WXoK+qED4Ced9kaDIEIhvGddWmM4rzg9993z3RT5sQZbhwE3zTahRZ
 rG7F6iaIF/pRC/9xxxmClt2p9JdTW96V4npwMTWPt4LLOU9oRNfl2y2jfFcWPqyLbWKO
 tfDQ==
X-Gm-Message-State: AOAM533bOCsgUSn4cfVDabsy/Y1Vi6ORgb73CjnVrBzUBXFKpiqaUB16
 fWM7wu6pBJeUhN9b3HNdCqURCnhaowdyb+CJqCDwlizLslE=
X-Google-Smtp-Source: ABdhPJzsgO3AbheGvq1SBuWd82Mc4Z8naUtdEnz59a7WYt66Y0a5lWylhVGHZEzxz6G0cmHrOFqJ67JOOv+X1cMLHs8=
X-Received: by 2002:a05:6122:d1e:b0:35e:5746:3434 with SMTP id
 az30-20020a0561220d1e00b0035e57463434mr3766858vkb.18.1654637513215; Tue, 07
 Jun 2022 14:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220607201440.41464-1-imp@bsdimp.com>
 <20220607201440.41464-2-imp@bsdimp.com>
 <90234281-b315-f6b6-270c-19cdcbf4c8ee@linaro.org>
In-Reply-To: <90234281-b315-f6b6-270c-19cdcbf4c8ee@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 7 Jun 2022 14:31:42 -0700
Message-ID: <CANCZdfr26_-ns2CQSuqjWmaw9OjjHq5zVjVM-DbqzbuAVV6XSg@mail.gmail.com>
Subject: Re: [PATCH 1/6] bsd-user/freebsd/os-syscall.c: lock_iovec
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gleb Popov <arrowd@freebsd.org>, 
 Konrad Witaszczyk <def@freebsd.org>, Jessica Clarke <jrtc27@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000352a4a05e0e2516b"
Received-SPF: none client-ip=2607:f8b0:4864:20::a30;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000352a4a05e0e2516b
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 2:01 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 6/7/22 13:14, Warner Losh wrote:
> > +static void helper_unlock_iovec(struct target_iovec *target_vec,
> > +                                abi_ulong target_addr, struct iovec
> *vec,
> > +                                int count, int copy)
> > +{
> > +    for (int i = 0; i < count; i++) {
> > +        abi_ulong base = tswapal(target_vec[i].iov_base);
> > +        abi_long len = tswapal(target_vec[i].iov_len);
> > +        if (len < 0) {
> > +            /*
> > +             * Can't really happen: we'll fail to lock if any elements
> have a
> > +             * length < 0. Better to fail-safe though.
> > +             */
> > +            break;
> > +        }
>
> I think this is over-complicated, could be fixed by...
>
> > +    vec = g_try_new(struct iovec, count);
>
> ... using g_try_new0.
>

I agree. Once I fixed the 'bad_address' issue, I can make this code simpler.
linux-user/syscall.c likely can be simplified as well since this code is a
fairly
straight forward copy of that code way back when, it seems...


> > +    /*
> > +     * ??? If host page size > target page size, this will result in a
> value
> > +     * larger than what we can actually support.
> > +     * ??? Should we just assert something for new 16k page size on
> aarch64?
> > +     */
> > +    max_len = 0x7fffffff & TARGET_PAGE_MASK;
>
> Use minimum value, I think.
>

OK. Will update this, and the other suggestions and use the fact that once
we
hit an error, we basically don't do anything to the zero'd frame, which
makes it
even simpler (and still, I think) correct. I'll send V2 kinda quickly as a
result after
my smoke test...

Warner

--000000000000352a4a05e0e2516b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 7, 2022 at 2:01 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 6/7/22 13:14, Warner Losh wrote:<br>
&gt; +static void helper_unlock_iovec(struct target_iovec *target_vec,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_ulong target_addr, struct io=
vec *vec,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int count, int copy)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 for (int i =3D 0; i &lt; count; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_ulong base =3D tswapal(target_vec[i].=
iov_base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_long len =3D tswapal(target_vec[i].io=
v_len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Can&#39;t really ha=
ppen: we&#39;ll fail to lock if any elements have a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* length &lt; 0. Bett=
er to fail-safe though.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
I think this is over-complicated, could be fixed by...<br>
<br>
&gt; +=C2=A0 =C2=A0 vec =3D g_try_new(struct iovec, count);<br>
<br>
... using g_try_new0.<br></blockquote><div><br></div><div>I agree. Once I f=
ixed the &#39;bad_address&#39; issue, I can make this code simpler.</div><d=
iv>linux-user/syscall.c likely can be simplified as well since this code is=
 a fairly</div><div>straight forward copy of that code way back when, it se=
ems...</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* ??? If host page size &gt; target page size, th=
is will result in a value<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* larger than what we can actually support.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* ??? Should we just assert something for new 16k=
 page size on aarch64?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 max_len =3D 0x7fffffff &amp; TARGET_PAGE_MASK;<br>
<br>
Use minimum value, I think.<br></blockquote><div><br></div><div>OK. Will up=
date this, and the other suggestions and use the fact that once we</div><di=
v>hit an error, we basically don&#39;t do anything to the zero&#39;d frame,=
 which makes it</div><div>even simpler (and still, I think) correct. I&#39;=
ll send V2 kinda quickly as a result after</div><div>my smoke test...</div>=
<div><br></div><div>Warner</div></div></div>

--000000000000352a4a05e0e2516b--

