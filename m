Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB2E449A03
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:38:22 +0100 (CET)
Received: from localhost ([::1]:56594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7f3-00042z-QH
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:38:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mk7ac-00013T-67
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:33:46 -0500
Received: from [2607:f8b0:4864:20::f35] (port=37508
 helo=mail-qv1-xf35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mk7aZ-0004gx-S6
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:33:45 -0500
Received: by mail-qv1-xf35.google.com with SMTP id u16so12257620qvk.4
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 08:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kv31/+W0QRST2iverr0v5zeNZ7U7wUR33WNUFd9o78Y=;
 b=Xj5ybLCw2PZT1GeMJTkpnBn29USzCpSrmQ57xmCe6rsb092i3JPe0YGWNoU2viI1lk
 6+n/A95wHkhLQrP7GRJOAdyf0zhNrhHELd+2yObmgHsqU4wrRqHm6XqV4yrYAvC/5EOE
 knOJROex/l9liEbX2QdhO/QyoEVwtCn1kfeoQQ2Wc/fVXVQPnMUtLx++nLvs6m+o2v90
 6IwRfgJhBtMXHcWiGbSJp0EbDvh/TyDmjPF3ADmaNyCF9H+W54wBwZBlnLef+hzuHvFm
 dqW4OZ3T2gR7FLcfyNLs3JrtRBjEAUNci5ExuTEK+56WCbDhTIpBOqwdtSitnPKYnRHB
 9ijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kv31/+W0QRST2iverr0v5zeNZ7U7wUR33WNUFd9o78Y=;
 b=kRxrX9hdAv9SLEBujWUJXp9CkY11om/cf4jUlFjTYt5IrWO19ZNoxb0qsp1VLfa02H
 +rVdNdbBO/bmxSqnW65IPjzAEz5mawCzC9TKZt/cxk1MZ6lMse3gQ3ZK7ukIZ2Jf+cR5
 fZ6U1Y6bnYgpewNGpYPQyqqQju5XsJu77G0XXfb/Uyo7Bmq3L+3GrM3kJOIeqkzZ1ob6
 p/qEmJUCYp8MKnEZW/G/GEC1zPreJMHYBzhm2j/5n+lYSGFf7Eipz0G0l368+964T5C3
 IcRiomqVfkf0EwqKNr1zBu/rgEi/yXlpLrwYC4tit9gXLNOe79K9Ksg02UH5owP0dHe7
 bgqw==
X-Gm-Message-State: AOAM531WC7kpENJ8SMQREQbEFvuTc2GQEhKn+gP4spFr91XoEQipk88W
 CzmeQ7rJt8RZuAyx481XvaAN7vb9vDjBGbbVtdLAkODHbDU=
X-Google-Smtp-Source: ABdhPJx2lViSdGOMUsQl5gPo8qQ+kuxE6Ia7O73qdjII50uJ9kuDJpaEA5HRfzqQYuApb7My4V2K7V2RMxeQVA3Db18=
X-Received: by 2002:a67:e050:: with SMTP id n16mr364909vsl.44.1636388757331;
 Mon, 08 Nov 2021 08:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20211106113916.544587-1-f4bug@amsat.org>
 <CANCZdfqjcUBMwdkh=RvNUHd57a_Ed6ui6ciq9y8=qsdMtZOntQ@mail.gmail.com>
 <39681686-e208-3c75-c0a5-ffda2482311f@amsat.org>
In-Reply-To: <39681686-e208-3c75-c0a5-ffda2482311f@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 8 Nov 2021 09:25:46 -0700
Message-ID: <CANCZdfrPyk_XO4soB1JURQTWZ5xMMW1kO6_TA4SuEK+jBsgbrA@mail.gmail.com>
Subject: Re: [PATCH v2] linux-user: Mark cpu_loop() with noreturn attribute
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000098754405d049727f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::f35;
 envelope-from=wlosh@bsdimp.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000098754405d049727f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 8, 2021 at 12:37 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 11/7/21 01:39, Warner Losh wrote:
> >
> >
> > On Sat, Nov 6, 2021, 5:39 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg
> > <mailto:f4bug@amsat.org>> wrote:
> >
> >     cpu_loop() never exits, so mark it with QEMU_NORETURN.
> >
> >     Reviewed-by: Richard Henderson <richard.henderson@linaro.org
> >     <mailto:richard.henderson@linaro.org>>
> >     Reviewed-By: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
> >     Reviewed-by: Bin Meng <bmeng.cn@gmail.com <mailto:bmeng.cn@gmail.co=
m
> >>
> >     Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org
> >     <mailto:f4bug@amsat.org>>
> >     ---
> >     v2:
> >     - rebased
> >     - restricted to linux-user
> >
> >     Supersedes: <20210905000429.1097336-1-f4bug@amsat.org
> >     <mailto:20210905000429.1097336-1-f4bug@amsat.org>>
> >
> >
> > Reviewed-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
> >
> > bsd-user likely needs similar treatment, no?
>
> IIUC this thread, not yet (I didn't want to get into your refactor):
>
> https://lore.kernel.org/qemu-devel/CAFEAcA-f=3Dn6XHp5Cj7=3DtH8NWO1GLA50i3=
4=3D5GyaHrZELyr0bjw@mail.gmail.com/


I'll add it to my TODO items. I hope to get a small collection of those in
this month before the release after I land the arm bits.

Warner

--00000000000098754405d049727f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 8, 2021 at 12:37 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 11/7/21 01:39, Warner Losh wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Sat, Nov 6, 2021, 5:39 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@=
amsat.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0cpu_loop() never exits, so mark it with QEMU_NORETU=
RN.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Richard Henderson &lt;<a href=3D"mailt=
o:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.=
org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-By: Warner Losh &lt;<a href=3D"mailto:imp@=
bsdimp.com" target=3D"_blank">imp@bsdimp.com</a> &lt;mailto:<a href=3D"mail=
to:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng.c=
n@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a> &lt;mailto:<a href=3D=
"mailto:bmeng.cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt;&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a h=
ref=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:f4bug@amsat.org" targe=
t=3D"_blank">f4bug@amsat.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- rebased<br>
&gt;=C2=A0 =C2=A0 =C2=A0- restricted to linux-user<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Supersedes: &lt;<a href=3D"mailto:20210905000429.10=
97336-1-f4bug@amsat.org" target=3D"_blank">20210905000429.1097336-1-f4bug@a=
msat.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:20210905000429.1097336=
-1-f4bug@amsat.org" target=3D"_blank">20210905000429.1097336-1-f4bug@amsat.=
org</a>&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a> &lt;mailto:<a href=3D"mailto:imp@bsdimp.com"=
 target=3D"_blank">imp@bsdimp.com</a>&gt;&gt;<br>
&gt; <br>
&gt; bsd-user likely needs similar treatment, no?<br>
<br>
IIUC this thread, not yet (I didn&#39;t want to get into your refactor):<br=
>
<a href=3D"https://lore.kernel.org/qemu-devel/CAFEAcA-f=3Dn6XHp5Cj7=3DtH8NW=
O1GLA50i34=3D5GyaHrZELyr0bjw@mail.gmail.com/" rel=3D"noreferrer" target=3D"=
_blank">https://lore.kernel.org/qemu-devel/CAFEAcA-f=3Dn6XHp5Cj7=3DtH8NWO1G=
LA50i34=3D5GyaHrZELyr0bjw@mail.gmail.com/</a></blockquote><div><br></div><d=
iv>I&#39;ll add it to my TODO items. I hope to get a small collection of th=
ose in this month before the release after I land the arm bits.</div><div><=
br></div><div>Warner</div></div></div>

--00000000000098754405d049727f--

