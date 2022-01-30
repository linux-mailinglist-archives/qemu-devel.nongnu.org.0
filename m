Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844434A35BE
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 11:36:17 +0100 (CET)
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nE7ZA-0001dz-2P
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 05:36:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nE7X2-0000wE-0X
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 05:34:04 -0500
Received: from [2a00:1450:4864:20::52d] (port=38716
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nE7X0-0004a3-BN
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 05:34:03 -0500
Received: by mail-ed1-x52d.google.com with SMTP id j23so20779927edp.5
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 02:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r7ZwWzEuKVhKuKwdiwc3+N9PZFFTqgtvqNo/fSoQl+g=;
 b=VOhUkTHxnaBr5ACXWEjp3BmltpEvoW6SWb5frrcZbXi3TwuvU51BWDF3iPy07AI2Vs
 /D22gD59+LRseHpu2D9ELdtF0ajWih9eXS+vs9ybp2sRATSd8vz60XjgofL0mdt7jxnn
 Y5HcSndTJGSVoJJZLNvsWrS5wXZjXWVDwZKNLZdDGSH8aQDTcWyzaUOPCvOHblfKwbo8
 RLvKZ01wr2lzuHU1UPRL4OLLLd/shXH4hoWdEdkemOR6x15od+78wcuUegk2Wo2otCKq
 w6kWM87nEBPv6RKI7q+fJbfKfsIOoDKgAx7f8DIL+MAXrUQW+0ab65YWdfIEU65oxBju
 yzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r7ZwWzEuKVhKuKwdiwc3+N9PZFFTqgtvqNo/fSoQl+g=;
 b=iZpPDVS7YID/FJu1dVqJSoUQ9eBZiVPaicigGSrjhikF1jLgJWkR3JgNFMitWRsfsZ
 G/J9wnzKnAxQ5nIyjxD0/dTRwsHUa25hWu1zzoOH+I4MTYybQYXfLK/2Z/75Ukq5Or+P
 63K4q/66EyPdHdcjccoPdfiKuNidVKPej0stU1glOmCgyCPdJoMVD3SOPLrfKo6vYReE
 8X02EtxnHiAHyKTXS55/znutO1lVSARKlG7Hc41THiai8d3G90qSMwjCE7NaVZXSPeKd
 FgfeNTFOQUx9HS9NRP9V+kk9rYZUMfYKARZghpDxFz0ow3RBM/gHANgIWaS8eTs293lO
 bW7g==
X-Gm-Message-State: AOAM532KBrpiOMvTpXFLwVb5O8DrcwqKtjHt7X41UKmdCV6gzAG5lu/B
 m/RhjPS+PqcFpri/lIe+Cvs9/Fy0hikVTrwit50=
X-Google-Smtp-Source: ABdhPJyFjdpj6aQXqHc9bYoSF/Yn+B1ShsKmMrbYgv1vhiU2iFwIEDOTb3LdCcAohzqF6HpNKJB0MHBtiJ3XN+JaXB0=
X-Received: by 2002:a05:6402:2688:: with SMTP id
 w8mr15778605edd.393.1643538840454; 
 Sun, 30 Jan 2022 02:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20181102171638.24069-1-peter.maydell@linaro.org>
 <20181102171638.24069-11-peter.maydell@linaro.org>
 <CAFEAcA-YALm-nA-nbCuBjZUyy-Q9+G6Hj_oS7FMq7Pdv_HfTug@mail.gmail.com>
In-Reply-To: <CAFEAcA-YALm-nA-nbCuBjZUyy-Q9+G6Hj_oS7FMq7Pdv_HfTug@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Sun, 30 Jan 2022 11:33:49 +0100
Message-ID: <CAJy5ezo9nrbifEnecpmqdD7nAxO3RcZ5+MTQZBk3OFrSU6nHEg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 10/10] hw/arm: versal: Add a virtual Xilinx
 Versal board
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c287b605d6ca34d2"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c287b605d6ca34d2
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 27, 2022 at 2:10 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 2 Nov 2018 at 17:24, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add a virtual Xilinx Versal board.
> >
> > This board is based on the Xilinx Versal SoC. The exact
> > details of what peripherals are attached to this board
> > will remain in control of QEMU. QEMU will generate an
> > FDT on the fly for Linux and other software to auto-discover
> > peripherals.
>
> Hi Edgar; I was just looking at the Versal board code for
> something else I was working on, and I noticed a bug that's been
> there since it was added in this patch:
>
> > +    s->binfo.ram_size = machine->ram_size;
> > +    s->binfo.kernel_filename = machine->kernel_filename;
> > +    s->binfo.kernel_cmdline = machine->kernel_cmdline;
> > +    s->binfo.initrd_filename = machine->initrd_filename;
> > +    s->binfo.loader_start = 0x0;
> > +    s->binfo.get_dtb = versal_virt_get_dtb;
> > +    s->binfo.modify_dtb = versal_virt_modify_dtb;
> > +    if (machine->kernel_filename) {
> > +        arm_load_kernel(s->soc.fpd.apu.cpu[0], &s->binfo);
> > +    } else {
> > +        AddressSpace *as = arm_boot_address_space(s->soc.fpd.apu.cpu[0],
> > +                                                  &s->binfo);
> > +        /* Some boot-loaders (e.g u-boot) don't like blobs at address 0
> (NULL).
> > +         * Offset things by 4K.  */
> > +        s->binfo.loader_start = 0x1000;
> > +        s->binfo.dtb_limit = 0x1000000;
> > +        if (arm_load_dtb(s->binfo.loader_start,
> > +                         &s->binfo, s->binfo.dtb_limit, as) < 0) {
> > +            exit(EXIT_FAILURE);
> > +        }
> > +    }
>
> The board init code only calls arm_load_kernel() if
> machine->kernel_filename
> is set. This is a bug, because calling arm_load_kernel() is mandatory
> for board code -- it is the place where we set up the reset handler
> that resets the CPUs, so if you don't call it the CPU objects don't
> get reset.
>
> thanks
> -- PMM
>

Thanks Peter,

I'll send a patch shortly.

Cheers,
Edgar

--000000000000c287b605d6ca34d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 2:10 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Fri, 2 Nov 2018 at 17:24, Peter Maydell &lt;<a href=3D"mailto:pete=
r.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; From: &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edgar.iglesi=
as@xilinx.com" target=3D"_blank">edgar.iglesias@xilinx.com</a>&gt;<br>
&gt;<br>
&gt; Add a virtual Xilinx Versal board.<br>
&gt;<br>
&gt; This board is based on the Xilinx Versal SoC. The exact<br>
&gt; details of what peripherals are attached to this board<br>
&gt; will remain in control of QEMU. QEMU will generate an<br>
&gt; FDT on the fly for Linux and other software to auto-discover<br>
&gt; peripherals.<br>
<br>
Hi Edgar; I was just looking at the Versal board code for<br>
something else I was working on, and I noticed a bug that&#39;s been<br>
there since it was added in this patch:<br>
<br>
&gt; +=C2=A0 =C2=A0 s-&gt;binfo.ram_size =3D machine-&gt;ram_size;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;binfo.kernel_filename =3D machine-&gt;kernel_file=
name;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;binfo.kernel_cmdline =3D machine-&gt;kernel_cmdli=
ne;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;binfo.initrd_filename =3D machine-&gt;initrd_file=
name;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;binfo.loader_start =3D 0x0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;binfo.get_dtb =3D versal_virt_get_dtb;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;binfo.modify_dtb =3D versal_virt_modify_dtb;<br>
&gt; +=C2=A0 =C2=A0 if (machine-&gt;kernel_filename) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_load_kernel(s-&gt;soc.fpd.apu.cpu[0],=
 &amp;s-&gt;binfo);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AddressSpace *as =3D arm_boot_address_spa=
ce(s-&gt;soc.fpd.apu.cpu[0],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;binfo);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Some boot-loaders (e.g u-boot) don&#39=
;t like blobs at address 0 (NULL).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Offset things by 4K.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;binfo.loader_start =3D 0x1000;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;binfo.dtb_limit =3D 0x1000000;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (arm_load_dtb(s-&gt;binfo.loader_start=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&amp;s-&gt;binfo, s-&gt;binfo.dtb_limit, as) &lt; 0) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
The board init code only calls arm_load_kernel() if machine-&gt;kernel_file=
name<br>
is set. This is a bug, because calling arm_load_kernel() is mandatory<br>
for board code -- it is the place where we set up the reset handler<br>
that resets the CPUs, so if you don&#39;t call it the CPU objects don&#39;t=
<br>
get reset.<br>
<br>
thanks<br>
-- PMM<br></blockquote><div><br></div><div>Thanks Peter,</div><div><br></di=
v><div>I&#39;ll send a patch shortly.</div><div><br></div><div>Cheers,</div=
><div>Edgar <br></div></div></div>

--000000000000c287b605d6ca34d2--

