Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DFD4A4F91
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 20:40:00 +0100 (CET)
Received: from localhost ([::1]:47138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEcWt-0004GZ-OG
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 14:39:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1nEcEr-0000LK-JD
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:21:21 -0500
Received: from [2607:f8b0:4864:20::62e] (port=44912
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1nEcEm-0003zN-7x
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:21:20 -0500
Received: by mail-pl1-x62e.google.com with SMTP id c9so13309902plg.11
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TprZ8cyZxK2uheXo5D1Qtgyvat56YrPd8PErunskW0s=;
 b=IEYxko6NQx9qVQ0LIo/zYKeFN3ErUuvwFYNPcDoPHRfxGCrn66zfcLvQwdOOuOKeoV
 M6mRTYiPhioFSDc17vpNySm5E+CdRfTPnHYsqUhaLj3lXSiYyI80tXmgiXeMNwoUNwnU
 /wiW4+d3R4YwAXuCiYhuCWuEekzq+jjJOby4ZJKvmgPnZ3Jc80DgjQaR9H4SLVqSaggn
 kh/iOT6tAC1vnSx3Kzvpt3ChXJo9iAPQXTb52QonahYCJNZMZXNBpZP6gV/fuFmkC9Wv
 o+7pcblBnC8xuYcTMMpeEPDw1Ma/Gwp/5r9PqhAvVs79Hgdl17xgapLNyDdqYmRAQBbS
 vohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TprZ8cyZxK2uheXo5D1Qtgyvat56YrPd8PErunskW0s=;
 b=0Ic9iw3xsZpMBvl5g+SXfRb4oVVGvKZ6wk68zPk+KPgI8cnkLD8TCXxhtKg+kSE+a6
 LWoPn49XFO8dp6b/PETSdrgiRt8iK0W4CG02zV6ZHhl0BH3WcRk7q9w1FOjojH4eYnyX
 iSk/4HmHAqz5t4y1abGOm0PPKrM5pa+pwrWB86gCBWzwIFz+Ut7Sx9iMXtSEMGq1lX2S
 F7ljNFSF61ydYaThDgx8B9RhOkfVJuOZmNkWlKU0FwzeFTQZDEMjDg/k6QxxW2FpjSqh
 E+rqeaH2xu3kyq+z8UI0R0HTZQBEVtSCXBBjeErJaoEaBtiGfgRlRFZeNM/wGiCP5Usx
 m1EQ==
X-Gm-Message-State: AOAM532NUnaUoMQ0+oMVpnbzMi11F6C4yCqGwRawXHd02mBCN3h/WU3e
 cF29H9awe3aSh4HrfUFGqKz91AJ6oNNWLjupbU0=
X-Google-Smtp-Source: ABdhPJzigW4QixXmDDqUiyAiXCC9cZ2l3P8ywp3kHoINrp0WEODVCPYt0aHR71SI47uTLNI3XwTN5p48xUj1Ap2CPvY=
X-Received: by 2002:a17:90b:1881:: with SMTP id
 mn1mr35583987pjb.236.1643656870063; 
 Mon, 31 Jan 2022 11:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20211102164317.45658-1-david@redhat.com>
 <20211102164317.45658-3-david@redhat.com>
 <CAPan3Wpgm94iHRCz3uGvUZYV37W=e4_d7UMqc81hY1cxB-zs1w@mail.gmail.com>
 <0039f019-2bf4-577c-2ab4-f0a2f6f5ef1b@amsat.org>
In-Reply-To: <0039f019-2bf4-577c-2ab4-f0a2f6f5ef1b@amsat.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 31 Jan 2022 20:20:58 +0100
Message-ID: <CAPan3Wpg3TOvOCFauru9YPH4U4JW+9yyxHmy=sptmv5zpMifwg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] memory: Make memory_region_is_mapped() succeed
 when mapped via an alias
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000df71fc05d6e5afce"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-pl1-x62e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000df71fc05d6e5afce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Mon, Jan 31, 2022 at 12:29 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Niek!
>
> (+Mark FYI)
>
> On 30/1/22 23:50, Niek Linnenbank wrote:
> > Hi David,
> >
> > While I realize my response is quite late, I wanted to report this erro=
r
> > I found when running the acceptance
> > tests for the orangepi-pc machine using avocado:
>
> Unfortunately I only run the full SD/MMC tests when I send a SD/MMC pull
> request, so missed that here.
>

I understand. These tests are behind the AVOCADO_ALLOW_LARGE_STORAGE flag
in avocado, so I guess they
don't run on gitlab as well, but I'm not sure about that.


>
> > Basically the two tests freeze during the part where the U-Boot
> > bootloader needs to detect the amount of memory. We model this in the
> > hw/misc/allwinner-h3-dramc.c file.
> > And when running the machine manually it shows an assert on
> > 'alias->mapped_via_alias >=3D 0'. When running manually via gdb, I was
> > able to collect this backtrace:
> >
> > $ gdb ./build/qemu-system-arm
> > ...
> > gdb) run -M orangepi-pc -nographic
> > ./Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img
> > ...
> > U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)
> > DRAM:
> > qemu-system-arm: ../softmmu/memory.c:2588: memory_region_del_subregion:
> > Assertion `alias->mapped_via_alias >=3D 0' failed.
> ...
>
> > So it seems that the hw/misc/allwinner-h3-dramc.c file is using the cal=
l
> > memory_region_set_address, where internally we are calling
> > memory_region_del_subregion.
> > The allwinner-h3-dramc.c file does use
> > memory_region_add_subregion_overlap once in the realize function, but
> > might use the memory_region_set_address multiple times.
> > It looks to me this is the path where the assert comes in. If I revert
> > this patch on current master, the machine boots without the assertion.
> >
> > Would you be able to help out how we can best resolve this? Ofcourse, i=
f
> > there is anything needed to be changed on the allwinner-h3-dramc.c file=
,
> > I would be happy to prepare a patch for that.
>
> David's patch LGTM and I think your model might be somehow abusing the
> memory API, but I'd like to read on the DRAMCOM Control Register to
> understand the allwinner_h3_dramc_map_rows() logic. I couldn't find a
> reference looking at Allwinner_H3_Datasheet_V1.2.pdf.
> I wonder if we could ignore implementing it.
>

Yes David's fix using memory_region_add_subregion_common inside
memory_region_readd_subregion resolves the issue indeed.
Well the allwinner-h3-dramc.c module works OK for now, but it can certainly
use improvements indeed.
And you're right, unfortunately the DRAMCOM device isn't documented in the
datasheet as far as I know.


>
> Your use case is typically what I tried to solve with this model:
>
> https://lore.kernel.org/qemu-devel/20210419094329.1402767-2-f4bug@amsat.o=
rg/
>
> In your case, @span_size is your amount of DRAM, and @region_size is the
> area u-boot is scanning (and @offset is zero).
> Could that work, or is DRAMCOM doing much more?
>

The current model in allwinner-h3-dramc.c is roughly based on the code that
is present in U-Boot in the file arm/arm/mach-sunxi/dram_sunxi_dw.c.
It implements the low-level initialization of the memory controller, and
when running using Qemu the most important thing it needs to do is
detect the amount of memory. If it cannot accomplish this task, the U-Boot
SPL won't boot properly or crash later. So what we have in
the allwinner-h3-dramc.c implementation comes from the information and code
in the dram_sunxi_dw.c file in U-Boot, not the datasheet.

The proposal you send with span_size/region_size looks interesting indeed.
It would be great if this could help
simplify the code in allwinner-h3-dramc.c. But it would require some effort
to figure out if it can indeed replace the current
behavior.

Kind regards,
Niek


>
> Thanks,
>
> Phil.
>
> P.D. reference to documentation welcome :)
>


--=20
Niek Linnenbank

--000000000000df71fc05d6e5afce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philippe,<br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 31, 2022 at 12:29 AM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hi Niek!<br>
<br>
(+Mark FYI)<br>
<br>
On 30/1/22 23:50, Niek Linnenbank wrote:<br>
&gt; Hi David,<br>
&gt; <br>
&gt; While I realize my response is quite late, I wanted to report this err=
or <br>
&gt; I found when running the acceptance<br>
&gt; tests for the orangepi-pc machine using avocado:<br>
<br>
Unfortunately I only run the full SD/MMC tests when I send a SD/MMC pull<br=
>
request, so missed that here.<br></blockquote><div><br></div><div>I underst=
and. These tests are behind the AVOCADO_ALLOW_LARGE_STORAGE flag in avocado=
, so I guess they</div><div>don&#39;t run on gitlab as well, but I&#39;m no=
t sure about that.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
&gt; Basically the two tests freeze during the part where the U-Boot <br>
&gt; bootloader needs to detect the amount of memory. We model this in the =
<br>
&gt; hw/misc/allwinner-h3-dramc.c file.<br>
&gt; And when running the machine manually it shows an assert on <br>
&gt; &#39;alias-&gt;mapped_via_alias &gt;=3D 0&#39;. When running manually =
via gdb, I was <br>
&gt; able to collect this backtrace:<br>
&gt; <br>
&gt; $ gdb ./build/qemu-system-arm<br>
&gt; ...<br>
&gt; gdb) run -M orangepi-pc -nographic <br>
&gt; ./Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img<br>
&gt; ...<br>
&gt; U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)<br>
&gt; DRAM:<br>
&gt; qemu-system-arm: ../softmmu/memory.c:2588: memory_region_del_subregion=
: <br>
&gt; Assertion `alias-&gt;mapped_via_alias &gt;=3D 0&#39; failed.<br>
...<br>
<br>
&gt; So it seems that the hw/misc/allwinner-h3-dramc.c file is using the ca=
ll <br>
&gt; memory_region_set_address, where internally we are calling <br>
&gt; memory_region_del_subregion.<br>
&gt; The allwinner-h3-dramc.c file does use <br>
&gt; memory_region_add_subregion_overlap once in the realize function, but =
<br>
&gt; might use the memory_region_set_address multiple times.<br>
&gt; It looks to me this is the path where the assert comes in. If I revert=
 <br>
&gt; this patch on current master, the machine boots without the assertion.=
<br>
&gt; <br>
&gt; Would you be able to help out how we can best resolve this? Ofcourse, =
if <br>
&gt; there is anything needed to be changed on the allwinner-h3-dramc.c fil=
e, <br>
&gt; I would be happy to prepare a patch for that.<br>
<br>
David&#39;s patch LGTM and I think your model might be somehow abusing the<=
br>
memory API, but I&#39;d like to read on the DRAMCOM Control Register to<br>
understand the allwinner_h3_dramc_map_rows() logic. I couldn&#39;t find a<b=
r>
reference looking at Allwinner_H3_Datasheet_V1.2.pdf.<br>
I wonder if we could ignore implementing it.<br></blockquote><div><br></div=
><div>Yes David&#39;s fix using memory_region_add_subregion_common inside m=
emory_region_readd_subregion resolves the issue indeed.</div><div>Well the =
allwinner-h3-dramc.c module works OK for now, but it can certainly use impr=
ovements indeed.</div><div>And you&#39;re right, unfortunately the DRAMCOM =
device isn&#39;t documented in the datasheet as far as I know.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Your use case is typically what I tried to solve with this model:<br>
<a rel=3D"noreferrer">https://lore.kernel.org/qemu-devel/20210419094329.140=
2767-2-f4bug@amsat.org/</a><br>
<br>
In your case, @span_size is your amount of DRAM, and @region_size is the<br=
>
area u-boot is scanning (and @offset is zero).<br>
Could that work, or is DRAMCOM doing much more?<br></blockquote><div><br></=
div><div><div>The current model in allwinner-h3-dramc.c is roughly based on=
 the code that is=20
present in U-Boot in the file arm/arm/mach-sunxi/dram_sunxi_dw.c.</div><div=
>It
 implements the low-level initialization of the memory controller, and=20
when running using Qemu the most important thing it needs to do is</div><di=
v>detect the amount of memory. If it cannot accomplish this task, the U-Boo=
t SPL won&#39;t boot properly or crash later. So what we have in</div><div>=
the
 allwinner-h3-dramc.c implementation comes from the information and code
 in the dram_sunxi_dw.c file in U-Boot, not the datasheet.</div><div><br></=
div><div>The proposal you send with span_size/region_size looks interesting=
 indeed. It would be great if this could help</div><div>simplify the code i=
n allwinner-h3-dramc.c. But it would require some effort to figure out if i=
t can indeed replace the current</div><div>behavior.</div><div><br></div><d=
iv>Kind regards,</div><div>Niek<br></div></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
<br>
Phil.<br>
<br>
P.D. reference to documentation welcome :)<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000df71fc05d6e5afce--

