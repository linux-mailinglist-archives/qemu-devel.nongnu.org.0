Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C822AFD94
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 04:53:20 +0100 (CET)
Received: from localhost ([::1]:42442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd3fi-0007i7-Iv
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 22:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kd3eZ-0007Gx-66
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 22:52:07 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kd3eU-0002Pg-HA
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 22:52:06 -0500
Received: by mail-wr1-x42c.google.com with SMTP id b6so4535836wrt.4
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 19:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bs+1Gr5awMQRzmLtm4QHxGZxbhAUbtB2ncFOMwdv6bA=;
 b=FGHuffGpdVctLWBqnmT+ra8qRN40x2l6XvpHaWkwnTZsC78lVi8NWwLk520U1h4y71
 4CbSDin/XuxdhdI4AzC9ktSnwRyY3CMtnxPg8kbn8x9tQwG/yZX2DkAErpbwFNmkWDn3
 Lanj0igxY7L4Uc19ipd+Yx4ZPVAFg67wTI7lE518L0E3vN6xz9m40oOCt2QYUMZTcnjP
 VX/wPDQoaPi3rAYFSQOOrNYsZO79J2v81izQ7VY8jIplDP972pAb9/T3SvUoQBEDgMla
 /qCFXif/E+LWlPUmBkB6n+SLGqZ20UauPSjqQZfimIejB8fc/rUYjhLSku8BNladSGNr
 0bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bs+1Gr5awMQRzmLtm4QHxGZxbhAUbtB2ncFOMwdv6bA=;
 b=U3WuR5Bcoit5fEphB+Cnm5mb21NXFlVN3eXbJoPdixf32QdTjoppunqOky2Ua9Wsvs
 5uOK+/amcwutySADJI8CLbQ1UmHg5LS4H+MwYoMgqQa8D3Kc+S7YQNWz3Rmho2+SVWnC
 pw82wz9RVEQp86eASPIhi0A803YeitW3lQp8THDpKfQH364PIPH/p0k22Gg4GKnN7oJb
 MXjGsyAEFRLnqZlKW4yn9Y+PH1q2iCuEYlVJ1lXUS0hRAg4uQp3tLaQi7WspK9hgRy2W
 GaxiFO16uuXnD0/8DYaOrVTNycbqYTxQPH0PYferfPUJGGKYVG1PmN39hpAj+hGsQC7w
 Zd/Q==
X-Gm-Message-State: AOAM531+HJEJb6EndG0rh1AsmF1caivi5IaqJhskBrGeivVqY+qgNjwU
 qqBZV9pbP313TgQAUdwrQdExjt86MBm+uTZYZs2Uzw==
X-Google-Smtp-Source: ABdhPJwwJ9GCzorei3zKR9lw3xn/1B2dREHHRMo1UJIG9Fqow3uC9w6p2f6elHJZjqnjIhYko0kHO/N0AcdKWoTAm88=
X-Received: by 2002:adf:ead0:: with SMTP id o16mr35131254wrn.292.1605153119278; 
 Wed, 11 Nov 2020 19:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20201107194045.438027-1-philmd@redhat.com>
 <CAARzgwxCXmCZsVWKFX6Fp=SBBj0BvY5=ntLwLZva2NZywD48Lw@mail.gmail.com>
 <752f4cfa-9213-299d-474c-fbccf312009d@redhat.com>
In-Reply-To: <752f4cfa-9213-299d-474c-fbccf312009d@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 12 Nov 2020 09:21:47 +0530
Message-ID: <CAARzgwzz0qUwj3Wcx+ioXXi35kbefD5i+Ow=oLvC2a0DzDS_sA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 v2] hw/i386/acpi-build: Fix maybe-uninitialized
 error when ACPI hotplug off
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007c2d4405b3e0d5ea"
Received-SPF: none client-ip=2a00:1450:4864:20::42c;
 envelope-from=ani@anisinha.ca; helo=mail-wr1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007c2d4405b3e0d5ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2020 at 22:40 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
>
wrote:

> On 11/8/20 4:58 AM, Ani Sinha wrote:
> > On Sun, Nov 8, 2020 at 1:10 AM Philippe Mathieu-Daud=C3=A9 <philmd@redh=
at.com>
> wrote:
> >>
> >> GCC 9.3.0 thinks that 'method' can be left uninitialized. This code
> >> is already in the "if (bsel || pcihp_bridge_en)" block statement,
> >> but it isn't smart enough to figure it out.
> >>
> >> Restrict the code to be used only in the "if (bsel || pcihp_bridge_en)=
"
> >> block statement to fix (on Ubuntu):
> >>
> >>   ../hw/i386/acpi-build.c: In function 'build_append_pci_bus_devices':
> >>   ../hw/i386/acpi-build.c:496:9: error: 'method' may be used
> uninitialized
> >>   in this function [-Werror=3Dmaybe-uninitialized]
> >>     496 |         aml_append(parent_scope, method);
> >>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>   cc1: all warnings being treated as errors
> >
> > OK I looked at the patch closely and it makes sense. Can you please
> > run a "make check" to make sure we have not broken anything?
>
> Yes I did...


Has this been queued Michael?


>
>

--0000000000007c2d4405b3e0d5ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Nov 8, 2020 at 22:40 Philippe Mathieu-Daud=C3=A9 &l=
t;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On 11/8/20 4:58 AM, Ani Sinha wrote:<b=
r>
&gt; On Sun, Nov 8, 2020 at 1:10 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; GCC 9.3.0 thinks that &#39;method&#39; can be left uninitialized. =
This code<br>
&gt;&gt; is already in the &quot;if (bsel || pcihp_bridge_en)&quot; block s=
tatement,<br>
&gt;&gt; but it isn&#39;t smart enough to figure it out.<br>
&gt;&gt;<br>
&gt;&gt; Restrict the code to be used only in the &quot;if (bsel || pcihp_b=
ridge_en)&quot;<br>
&gt;&gt; block statement to fix (on Ubuntu):<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0../hw/i386/acpi-build.c: In function &#39;build_append=
_pci_bus_devices&#39;:<br>
&gt;&gt;=C2=A0 =C2=A0../hw/i386/acpi-build.c:496:9: error: &#39;method&#39;=
 may be used uninitialized<br>
&gt;&gt;=C2=A0 =C2=A0in this function [-Werror=3Dmaybe-uninitialized]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0496 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_appe=
nd(parent_scope, method);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt;&gt;=C2=A0 =C2=A0cc1: all warnings being treated as errors<br>
&gt; <br>
&gt; OK I looked at the patch closely and it makes sense. Can you please<br=
>
&gt; run a &quot;make check&quot; to make sure we have not broken anything?=
<br>
<br>
Yes I did...</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Has =
this been queued Michael?</div><div dir=3D"auto"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex" dir=3D"auto"><br>
<br>
</blockquote></div></div>

--0000000000007c2d4405b3e0d5ea--

