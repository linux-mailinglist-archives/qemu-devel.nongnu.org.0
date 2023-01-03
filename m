Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9D965C0FA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 14:39:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pChVb-0000rp-LG; Tue, 03 Jan 2023 08:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pChVL-0000oV-ON
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:39:07 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pChVI-00070V-LC
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:38:59 -0500
Received: by mail-vs1-xe32.google.com with SMTP id m129so25919537vsc.11
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 05:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/LsA1hPZM5dA9H27C/BbcFIU066UnS0soamgpDeqDB8=;
 b=ZaZolHmVwQMCjQ/Vy+OT863+IagRBZtKYtxqP3l9IxNNTOJsCBPgAs1G92xOvTOSUZ
 y8iZSDODB5uwW1ulxWbMpK4ol3HPNUWJu8JS5Q6gt+AEKz9RB74lqsTvlTK+SA59hIeB
 oMpRhIHM83rJdrzSVIzUYnmcg+9X/X1KTm2k7qKSpuqQro1aQ7KaqnFwXvPKX8p1XCrn
 nxWmuWxbx1zhsNMZMCgSnyvc1gx8kMpaTKB8NiGcGA6OyymHpd6Tv/l1kr8kjWL/Ptpg
 fFd7fsYZdSwP3yGVIzNbt/aAYEMBqr3dy/eYewuHRZX0yFVVwJtWPpjPxu20HW1P8lXT
 GYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/LsA1hPZM5dA9H27C/BbcFIU066UnS0soamgpDeqDB8=;
 b=J+OSaAQQcpzM7ivN9DF+27vVuY+lCKmLM3CMEFOydb07fbOQNkCsdE9MEjoPfr4vfB
 JJIDQ1yqzLssaqTAC1Le77Mn1Oa7hBCavzjMexl43dMYbUVvyIGnz+bVB2dBfv/ecIwy
 CN3mwKAj/GJnu1vnrdP1rc+VkpX+U18DVda43hxlG1PIyQKON0XLmqyrux8gxCYlMeTv
 Djedd0PvOO8YOEOKDeZyxpRiW+4v7uF8xg1btt9pEFyOdmHm3y7oRWaH8WL5rYQU/hvU
 eTmT3ggppqFq4QZmcOvHUK4rZF4Cz17rlzSqLZ8k+7IToPAWennRzJUpFErdH3umjBo3
 yBcA==
X-Gm-Message-State: AFqh2kqGbSaRLByOxLii3h6J0WWxpGav6/UoMOaE/S2sF8ApWp47aMwi
 rxIfw4zPFFpuYrzZafelsAEnsjR4CmSqeuM0Nxw=
X-Google-Smtp-Source: AMrXdXsKnsuze9zgtzTt/vE0gzVOeHDaiKZOvCtvg2WBe8lWBDodUYclv5LABCoqB6l+X/uAVhfC0lKwpOH5KleJtnI=
X-Received: by 2002:a67:f9d8:0:b0:3ce:82f7:5f41 with SMTP id
 c24-20020a67f9d8000000b003ce82f75f41mr1139409vsq.2.1672753134937; Tue, 03 Jan
 2023 05:38:54 -0800 (PST)
MIME-Version: 1.0
References: <20230102213504.14646-1-shentey@gmail.com>
 <bd4daee7-09df-4bfa-3b96-713690be9f4e@aol.com>
 <0de699a7-98b8-e320-da4d-678d0f594213@linaro.org>
In-Reply-To: <0de699a7-98b8-e320-da4d-678d0f594213@linaro.org>
From: Bernhard Beschow <shentey@gmail.com>
Date: Tue, 3 Jan 2023 14:38:40 +0100
Message-ID: <CAG4p6K7hcJ-47GvsEvmuBmdwP2LsEC4WLkw_t6ZfwhqakYUEyQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org,
 Paul Durrant <paul@xen.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, 
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000067a9ab05f15c3005"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000067a9ab05f15c3005
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 3, 2023 at 2:17 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg>
wrote:

> Hi Chuck,
>
> On 3/1/23 04:15, Chuck Zmudzinski wrote:
> > On 1/2/23 4:34=E2=80=AFPM, Bernhard Beschow wrote:
> >> This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally
> removes
> >> it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen
> in the PC
> >> machine agnostic to the precise southbridge being used. 2/ will become
> >> particularily interesting once PIIX4 becomes usable in the PC machine,
> avoiding
> >> the "Frankenstein" use of PIIX4_ACPI in PIIX3.
> >>
> >> Testing done:
> >> None, because I don't know how to conduct this properly :(
> >>
> >> Based-on: <20221221170003.2929-1-shentey@gmail.com>
> >>            "[PATCH v4 00/30] Consolidate PIIX south bridges"
>
> This series is based on a previous series:
> https://lore.kernel.org/qemu-devel/20221221170003.2929-1-shentey@gmail.co=
m/
> (which itself also is).
>
> >> Bernhard Beschow (6):
> >>    include/hw/xen/xen: Make xen_piix3_set_irq() generic and rename it
> >>    hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()
> >>    hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3
> >>    hw/isa/piix: Avoid Xen-specific variant of piix_write_config()
> >>    hw/isa/piix: Resolve redundant k->config_write assignments
> >>    hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
> >>
> >>   hw/i386/pc_piix.c             | 34 ++++++++++++++++--
> >>   hw/i386/xen/xen-hvm.c         |  9 +++--
> >>   hw/isa/piix.c                 | 66 +--------------------------------=
--
> >
> > This file does not exist on the Qemu master branch.
> > But hw/isa/piix3.c and hw/isa/piix4.c do exist.
> >
> > I tried renaming it from piix.c to piix3.c in the patch, but
> > the patch set still does not apply cleanly on my tree.
> >
> > Is this patch set re-based against something other than
> > the current master Qemu branch?
> >
> > I have a system that is suitable for testing this patch set, but
> > I need guidance on how to apply it to the Qemu source tree.
>
> You can ask Bernhard to publish a branch with the full work,
>

Hi Chuck,

... or just visit
https://patchew.org/QEMU/20230102213504.14646-1-shentey@gmail.com/ . There
you'll find a git tag with a complete history and all instructions!

Thanks for giving my series a test ride!

Best regards,
Bernhard

or apply each series locally. I use the b4 tool for that:
> https://b4.docs.kernel.org/en/latest/installing.html
>
> i.e.:
>
> $ git checkout -b shentey_work
> $ b4 am 20221120150550.63059-1-shentey@gmail.com
> $ git am
> ./v2_20221120_shentey_decouple_intx_to_lnkx_routing_from_south_bridges.mb=
x
> $ b4 am 20221221170003.2929-1-shentey@gmail.com
> $ git am
>
> ./v4_20221221_shentey_this_series_consolidates_the_implementations_of_the=
_piix3_and_piix4_south.mbx
> $ b4 am 20230102213504.14646-1-shentey@gmail.com
> $ git am ./20230102_shentey_resolve_type_piix3_xen_device.mbx
>
> Now the branch 'shentey_work' contains all the patches and you can test.
>
> Regards,
>
> Phil.
>

--00000000000067a9ab05f15c3005
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 3, 2023 at 2:17 PM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi Chuck,<br>
<br>
On 3/1/23 04:15, Chuck Zmudzinski wrote:<br>
&gt; On 1/2/23 4:34=E2=80=AFPM, Bernhard Beschow wrote:<br>
&gt;&gt; This series first renders TYPE_PIIX3_XEN_DEVICE redundant and fina=
lly removes<br>
&gt;&gt; it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make =
Xen in the PC<br>
&gt;&gt; machine agnostic to the precise southbridge being used. 2/ will be=
come<br>
&gt;&gt; particularily interesting once PIIX4 becomes usable in the PC mach=
ine, avoiding<br>
&gt;&gt; the &quot;Frankenstein&quot; use of PIIX4_ACPI in PIIX3.<br>
&gt;&gt;<br>
&gt;&gt; Testing done:<br>
&gt;&gt; None, because I don&#39;t know how to conduct this properly :(<br>
&gt;&gt;<br>
&gt;&gt; Based-on: &lt;<a href=3D"mailto:20221221170003.2929-1-shentey@gmai=
l.com" target=3D"_blank">20221221170003.2929-1-shentey@gmail.com</a>&gt;<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;[PATCH v4 00/30] Co=
nsolidate PIIX south bridges&quot;<br>
<br>
This series is based on a previous series:<br>
<a href=3D"https://lore.kernel.org/qemu-devel/20221221170003.2929-1-shentey=
@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/q=
emu-devel/20221221170003.2929-1-shentey@gmail.com/</a><br>
(which itself also is).<br>
<br>
&gt;&gt; Bernhard Beschow (6):<br>
&gt;&gt;=C2=A0 =C2=A0 include/hw/xen/xen: Make xen_piix3_set_irq() generic =
and rename it<br>
&gt;&gt;=C2=A0 =C2=A0 hw/isa/piix: Reuse piix3_realize() in piix3_xen_reali=
ze()<br>
&gt;&gt;=C2=A0 =C2=A0 hw/isa/piix: Wire up Xen PCI IRQ handling outside of =
PIIX3<br>
&gt;&gt;=C2=A0 =C2=A0 hw/isa/piix: Avoid Xen-specific variant of piix_write=
_config()<br>
&gt;&gt;=C2=A0 =C2=A0 hw/isa/piix: Resolve redundant k-&gt;config_write ass=
ignments<br>
&gt;&gt;=C2=A0 =C2=A0 hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE<=
br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 34 ++++++++++++++++--<br>
&gt;&gt;=C2=A0 =C2=A0hw/i386/xen/xen-hvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 9 +++--<br>
&gt;&gt;=C2=A0 =C2=A0hw/isa/piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 66 +----------------------------------<br>
&gt; <br>
&gt; This file does not exist on the Qemu master branch.<br>
&gt; But hw/isa/piix3.c and hw/isa/piix4.c do exist.<br>
&gt; <br>
&gt; I tried renaming it from piix.c to piix3.c in the patch, but<br>
&gt; the patch set still does not apply cleanly on my tree.<br>
&gt; <br>
&gt; Is this patch set re-based against something other than<br>
&gt; the current master Qemu branch?<br>
&gt; <br>
&gt; I have a system that is suitable for testing this patch set, but<br>
&gt; I need guidance on how to apply it to the Qemu source tree.<br>
<br>
You can ask Bernhard to publish a branch with the full work,<br></blockquot=
e><div><br></div><div>Hi Chuck,</div><div><br></div><div>... or just visit =
<a href=3D"https://patchew.org/QEMU/20230102213504.14646-1-shentey@gmail.co=
m/">https://patchew.org/QEMU/20230102213504.14646-1-shentey@gmail.com/</a> =
. There you&#39;ll find a git tag with a complete history and all instructi=
ons!</div><div><br></div><div>Thanks for giving my series a test ride!</div=
><div><br></div><div>Best regards,</div><div>Bernhard</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
or apply each series locally. I use the b4 tool for that:<br>
<a href=3D"https://b4.docs.kernel.org/en/latest/installing.html" rel=3D"nor=
eferrer" target=3D"_blank">https://b4.docs.kernel.org/en/latest/installing.=
html</a><br>
<br>
i.e.:<br>
<br>
$ git checkout -b shentey_work<br>
$ b4 am <a href=3D"mailto:20221120150550.63059-1-shentey@gmail.com" target=
=3D"_blank">20221120150550.63059-1-shentey@gmail.com</a><br>
$ git am <br>
./v2_20221120_shentey_decouple_intx_to_lnkx_routing_from_south_bridges.mbx<=
br>
$ b4 am <a href=3D"mailto:20221221170003.2929-1-shentey@gmail.com" target=
=3D"_blank">20221221170003.2929-1-shentey@gmail.com</a><br>
$ git am <br>
./v4_20221221_shentey_this_series_consolidates_the_implementations_of_the_p=
iix3_and_piix4_south.mbx<br>
$ b4 am <a href=3D"mailto:20230102213504.14646-1-shentey@gmail.com" target=
=3D"_blank">20230102213504.14646-1-shentey@gmail.com</a><br>
$ git am ./20230102_shentey_resolve_type_piix3_xen_device.mbx<br>
<br>
Now the branch &#39;shentey_work&#39; contains all the patches and you can =
test.<br>
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div></div>

--00000000000067a9ab05f15c3005--

