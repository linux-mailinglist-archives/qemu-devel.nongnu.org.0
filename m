Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE25144CD17
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 23:48:15 +0100 (CET)
Received: from localhost ([::1]:50280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkwO6-0001VS-KI
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 17:48:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkwN5-0000r7-OS
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 17:47:12 -0500
Received: from [2607:f8b0:4864:20::92c] (port=38858
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkwN3-0005gx-Fv
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 17:47:11 -0500
Received: by mail-ua1-x92c.google.com with SMTP id o26so8138759uab.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 14:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=prwMTKyR06Kx3UIdz+cTcr7Iow7fhDqnvrNRb4Hd1jI=;
 b=kNCXxjEVZKeaEREKXJrN3uWGsTpvBHqpn/XReealALbYMx2pdOkZP2l3xQbVAac5kU
 CwTTE85PflBVmKbl36VhjkeDV+j9Jzc801GhJn6n0kNegaBTyQcrW4lprnduOuWtHYtS
 tXJf1OZP25R/4WBck8ctw3ixYy41QKStehNydYtJkSsuzqSZd4ohWmsASUz3xz0PNMit
 SqZXN0VHkAb2Y0yxOjnFPR5eptvezylNSVRpfwoGXIXZT6NC7XP16L/b3ieTfBy9ZARY
 rsb93R+x5AVCyVjg07omixz31X+5QouSbsrakvHDG2OXBt/K+QY4ml1b/UxnQorhv9KP
 PqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=prwMTKyR06Kx3UIdz+cTcr7Iow7fhDqnvrNRb4Hd1jI=;
 b=r6xaJUnBQ+gYozil9EcJbekkftaPEnDR1SgnnwMiLfVX0DlWXval6X26dKuNmthWCC
 HGbKy2oIce+xAJeXHcE/AIDt4pvhUmbE/ZvoVa5IFdJCb+UqkE5RW83G9/0Xa3nz7iC3
 PcrHSE6L22iA6THRKpqKTktidmHfHh+zefeAa9Z0Vu2LwhKVrS/8m3sp9q322Hsuswrq
 ZzC8VKO8WzRTFIa0DTV3wOvBX14OBRkBVqyoRemACWaY9Q6F/RJyIV+fUZazWkTDAUAh
 BX9zQ+O2lAq6L05DHrKo39+19VDqFRyCYFJ0Qnzfv7ixHagONUjX0AbAarxt3KDrFel+
 uKnA==
X-Gm-Message-State: AOAM532PNN9Yb2PXjhk0EIlfAxuLePUQ7eyKVmV7QCRdrMYF2Lp76kog
 nvJIuajIVmo+H1/NVfUXTnqmXRgmkGM1G1W0EnR2ww==
X-Google-Smtp-Source: ABdhPJyis0Bpw622BDih2fao/HqP5kM8dl3Uke+Vu6Hop2iX6n5C43zMxL+0VpIgZ6zj8HUBfTfTPyZljFaVdYZx/Ds=
X-Received: by 2002:a05:6102:d94:: with SMTP id
 d20mr4113838vst.12.1636584427519; 
 Wed, 10 Nov 2021 14:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20211110163133.76357-1-imp@bsdimp.com>
 <20211110163133.76357-2-imp@bsdimp.com>
 <32bfbe52-fd12-5997-5697-0267a16415a0@linaro.org>
In-Reply-To: <32bfbe52-fd12-5997-5697-0267a16415a0@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 10 Nov 2021 15:46:56 -0700
Message-ID: <CANCZdfqhA7h_eTsJKNB5DTaAOQrkkQigq7OC4SbeSo7tYtDmEQ@mail.gmail.com>
Subject: Re: [RFC v2 1/6] linux-user: Add host_signal_set_pc to set pc in
 mcontext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007293a305d0770131"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92c.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007293a305d0770131
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 10, 2021 at 9:42 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/10/21 5:31 PM, Warner Losh wrote:
> > +static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
> > +{
> > +#ifdef __arch64__
> > +    uc->uc_mcontext.mc_gregs[MC_PC] = pc;
> > +#else
> > +    &uc->uc_mcontext.gregs[REG_PC] = pc;
>
> Stray & here.  Not that I have a sparc32 host on which to compile this...
>

Will fix... Same.  It's left over from the pointer versions and resend.

Warner

--0000000000007293a305d0770131
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 10, 2021 at 9:42 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 11/10/21 5:31 PM, Warner Losh wrote:<br>
&gt; +static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)<b=
r>
&gt; +{<br>
&gt; +#ifdef __arch64__<br>
&gt; +=C2=A0 =C2=A0 uc-&gt;uc_mcontext.mc_gregs[MC_PC] =3D pc;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 &amp;uc-&gt;uc_mcontext.gregs[REG_PC] =3D pc;<br>
<br>
Stray &amp; here.=C2=A0 Not that I have a sparc32 host on which to compile =
this...<br></blockquote><div><br></div><div>Will fix... Same.=C2=A0 It&#39;=
s left over from the pointer versions and resend.</div><div><br></div><div>=
Warner=C2=A0</div></div></div>

--0000000000007293a305d0770131--

