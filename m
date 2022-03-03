Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A564CC2EB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:35:50 +0100 (CET)
Received: from localhost ([::1]:46830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoQf-00080f-D1
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:35:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nPo8d-0004RM-0k
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:17:11 -0500
Received: from [2a00:1450:4864:20::32d] (port=46049
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nPo8a-0001N0-Rk
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:17:10 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so3541093wms.4
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 08:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=napR+VQ5smrSu2Y7Rv1yYRitUPdtaK933+uIPYBWELM=;
 b=Pwyo7w4Tv2ZNN7+izMEkCf5O0tOCPqbtXTIymG3b1VzoRi7UTCvCFdUbzJP/3pNNtu
 2VK6l0qCcwwZhyH3F86c9DjVygz7oayRw9szf18rvUMa1aMCbnA1Z0+Wyt1M6Vogbz8t
 BKi2HOt2H/E9v6hd8GpTqcXQU+tXwuRj/dt6B+dO0vAs2c1mxjtSD3hYbwovox9eElMQ
 xkMQsQHUH8J6cJ1byWPC/eDPN8Upm9l97ybqaHtgvBlpsf1pzc7WxGiPuDZhlHVbeeSQ
 8LW5OP+xCWBixiUt+/s9k6dN47ogY149S0bxM3Cp+gDXXXedvEIrqGCGmEPwIvGuW4d+
 +eMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=napR+VQ5smrSu2Y7Rv1yYRitUPdtaK933+uIPYBWELM=;
 b=Zoy1YHBsIqAkxhxHoEhxcSle0wsOpNn92NDr9202ndl0huirC3tU8sTf6Xc8lmlzgR
 lm2xLsuMp9zjCi8//qUafp+Xsas/rVg8QuPWcHK80il4AOptC41LASXclcf84971wnay
 xY10ZOxySYxVqkZAigxCOpsYmKCZaYCxZAcAyriZTd1wiGtWha0Z1gQnq+BTpX3e82jL
 gfw0RoH+XacsabbqyEn/aAehXiNKx/mel+r2vg39LdwiPrg15Hi8alTet+GhXF42fNUf
 dZOoFAfSgy8bD51h9QfcQBA7/MrBcDxG9v8xduxiuwsh1ZtTspGNmM7fsoMO5MxvgseB
 8ATw==
X-Gm-Message-State: AOAM532ohMJ403ivm8fRvnnLmu6URqqSkK1+p350et9cXQGHJ4BtJKaq
 UaDO0Si59XrJnwVOw53lHg3QKs/cAPK0z1eO6UM=
X-Google-Smtp-Source: ABdhPJx0UUpfcFyxZiSwcN5dIEGJTaWmmBCUcvsm0Ap4+OoE0cfHlN1sa2zrDgI/Ol2CbDrmCvdbfsSFj3qr2KOCY0M=
X-Received: by 2002:a05:600c:240b:b0:380:f424:f2be with SMTP id
 11-20020a05600c240b00b00380f424f2bemr4265012wmp.16.1646324226580; Thu, 03 Mar
 2022 08:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com>
 <310e3bd1-0ca8-ddc6-4500-dd1bea589fad@linux.ibm.com>
 <b39a5fd1-15a5-7461-0849-4b4478f1aef5@redhat.com>
 <b475d44e-3e25-7db2-7cde-6f6061f1610d@redhat.com>
In-Reply-To: <b475d44e-3e25-7db2-7cde-6f6061f1610d@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 3 Mar 2022 20:16:53 +0400
Message-ID: <CAJ+F1C+_u53t-n2MLfxxgdr8tbmVxNYNjGTN00-TLsM1Juy9GQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: Eric Auger <eauger@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b5e45d05d952baf8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Cornelia Huck <cohuck@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Juan Quintela <quintela@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b5e45d05d952baf8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Mar 3, 2022 at 6:41 PM Eric Auger <eauger@redhat.com> wrote:

> Hi Stefan,
>
> On 2/8/22 6:58 PM, Eric Auger wrote:
> > Hi Stefan,
> >
> > On 2/8/22 6:16 PM, Stefan Berger wrote:
> >>
> >> On 2/8/22 08:38, Eric Auger wrote:
> >>> Representing the CRB cmd/response buffer as a standard
> >>> RAM region causes some trouble when the device is used
> >>> with VFIO. Indeed VFIO attempts to DMA_MAP this region
> >>> as usual RAM but this latter does not have a valid page
> >>> size alignment causing such an error report:
> >>> "vfio_listener_region_add received unaligned region".
> >>> To allow VFIO to detect that failing dma mapping
> >>> this region is not an issue, let's use a ram_device
> >>> memory region type instead.
> >>>
> >>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
> >>> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
> >>> [PMD: Keep tpm_crb.c in meson's softmmu_ss]
> >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>
> >>
> >> v4 doesn't build for me:
> >>
> >> ../hw/tpm/tpm_crb.c: In function ?tpm_crb_realize?:
> >> ../hw/tpm/tpm_crb.c:297:33: error: implicit declaration of function
> >> ?HOST_PAGE_ALIGN? [-Werror=3Dimplicit-function-declaration]
> >>   297 | HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
> >>       |                                 ^~~~~~~~~~~~~~~
> >> ../hw/tpm/tpm_crb.c:297:33: error: nested extern declaration of
> >> ?HOST_PAGE_ALIGN? [-Werror=3Dnested-externs]
> >> cc1: all warnings being treated as errors
> >
> > Do you have
> > b269a70810a  exec/cpu: Make host pages variables / macros 'target
> > agnostic' in your tree?
> I may have missed your reply. Did you have that dependency? Were you
> able to compile eventually?
>
> Besides, do you have any opinion overall about the relevance of
> transforming the CRB ctrl cmd region into a RAM device wrt the TPM spec?
>
> Again spec says:
>
> "
> Including the control structure, the three memory areas comprise the
> entirety of the CRB. There are no constraints on how those three memory
> areas are provided. They can all be in system RAM, or all be in device
> memory, or any combination.
> "
> (
> https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Respo=
nse-Buffer-Interface-v2-r12-Specification_FINAL2.pdf
> )
>
> What was the rationale behind using RAM device for the PPI region?
>

Is this the rationale you are looking for?
https://gitlab.com/qemu-project/qemu/-/commit/3b97c01e9ccdfbd517a0fd631838d=
6252dbfa692

    Note: bios_linker cannot be used to allocate the PPI memory region,
    since the reserved memory should stay stable across reboots, and might
    be needed before the ACPI tables are installed.


>
> There are some spurious warnings when using CRB with VFIO and that would
> be nice to remove them one way or the other.
>
> Thanks
>
> Eric
> >
> > Thanks
> >
> > Eric
> >>
> >>
> >>
> >
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b5e45d05d952baf8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 3, 2022 at 6:41 PM Eric=
 Auger &lt;<a href=3D"mailto:eauger@redhat.com">eauger@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Stefan,=
<br>
<br>
On 2/8/22 6:58 PM, Eric Auger wrote:<br>
&gt; Hi Stefan,<br>
&gt; <br>
&gt; On 2/8/22 6:16 PM, Stefan Berger wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 2/8/22 08:38, Eric Auger wrote:<br>
&gt;&gt;&gt; Representing the CRB cmd/response buffer as a standard<br>
&gt;&gt;&gt; RAM region causes some trouble when the device is used<br>
&gt;&gt;&gt; with VFIO. Indeed VFIO attempts to DMA_MAP this region<br>
&gt;&gt;&gt; as usual RAM but this latter does not have a valid page<br>
&gt;&gt;&gt; size alignment causing such an error report:<br>
&gt;&gt;&gt; &quot;vfio_listener_region_add received unaligned region&quot;=
.<br>
&gt;&gt;&gt; To allow VFIO to detect that failing dma mapping<br>
&gt;&gt;&gt; this region is not an issue, let&#39;s use a ram_device<br>
&gt;&gt;&gt; memory region type instead.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Eric Auger &lt;<a href=3D"mailto:eric.auger@red=
hat.com" target=3D"_blank">eric.auger@redhat.com</a>&gt;<br>
&gt;&gt;&gt; Tested-by: Stefan Berger &lt;<a href=3D"mailto:stefanb@linux.i=
bm.com" target=3D"_blank">stefanb@linux.ibm.com</a>&gt;<br>
&gt;&gt;&gt; Acked-by: Stefan Berger &lt;<a href=3D"mailto:stefanb@linux.ib=
m.com" target=3D"_blank">stefanb@linux.ibm.com</a>&gt;<br>
&gt;&gt;&gt; [PMD: Keep tpm_crb.c in meson&#39;s softmmu_ss]<br>
&gt;&gt;&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mail=
to:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; v4 doesn&#39;t build for me:<br>
&gt;&gt;<br>
&gt;&gt; ../hw/tpm/tpm_crb.c: In function ?tpm_crb_realize?:<br>
&gt;&gt; ../hw/tpm/tpm_crb.c:297:33: error: implicit declaration of functio=
n<br>
&gt;&gt; ?HOST_PAGE_ALIGN? [-Werror=3Dimplicit-function-declaration]<br>
&gt;&gt; =C2=A0 297 | HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^~~~~~~~~~~~~~~<br>
&gt;&gt; ../hw/tpm/tpm_crb.c:297:33: error: nested extern declaration of<br=
>
&gt;&gt; ?HOST_PAGE_ALIGN? [-Werror=3Dnested-externs]<br>
&gt;&gt; cc1: all warnings being treated as errors<br>
&gt; <br>
&gt; Do you have<br>
&gt; b269a70810a=C2=A0 exec/cpu: Make host pages variables / macros &#39;ta=
rget<br>
&gt; agnostic&#39; in your tree?<br>
I may have missed your reply. Did you have that dependency? Were you<br>
able to compile eventually?<br>
<br>
Besides, do you have any opinion overall about the relevance of<br>
transforming the CRB ctrl cmd region into a RAM device wrt the TPM spec?<br=
>
<br>
Again spec says:<br>
<br>
&quot;<br>
Including the control structure, the three memory areas comprise the<br>
entirety of the CRB. There are no constraints on how those three memory<br>
areas are provided. They can all be in system RAM, or all be in device<br>
memory, or any combination.<br>
&quot;<br>
(<a href=3D"https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Com=
mand-Response-Buffer-Interface-v2-r12-Specification_FINAL2.pdf" rel=3D"nore=
ferrer" target=3D"_blank">https://trustedcomputinggroup.org/wp-content/uplo=
ads/Mobile-Command-Response-Buffer-Interface-v2-r12-Specification_FINAL2.pd=
f</a>)<br>
<br>
What was the rationale behind using RAM device for the PPI region?<br></blo=
ckquote><div><br></div><div>Is this the rationale you are looking for?<br><=
/div><div><a href=3D"https://gitlab.com/qemu-project/qemu/-/commit/3b97c01e=
9ccdfbd517a0fd631838d6252dbfa692">https://gitlab.com/qemu-project/qemu/-/co=
mmit/3b97c01e9ccdfbd517a0fd631838d6252dbfa692</a></div><div><br></div><div>=
=C2=A0 =C2=A0 Note: bios_linker cannot be used to allocate the PPI memory r=
egion,<br>=C2=A0 =C2=A0 since the reserved memory should stay stable across=
 reboots, and might<br>=C2=A0 =C2=A0 be needed before the ACPI tables are i=
nstalled.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
There are some spurious warnings when using CRB with VFIO and that would<br=
>
be nice to remove them one way or the other.<br>
<br>
Thanks<br>
<br>
Eric<br>
&gt; <br>
&gt; Thanks<br>
&gt; <br>
&gt; Eric<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b5e45d05d952baf8--

