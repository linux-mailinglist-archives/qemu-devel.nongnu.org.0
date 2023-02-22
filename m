Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F35E69F843
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:44:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUrHP-0001aq-TM; Wed, 22 Feb 2023 10:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUrHO-0001W2-7Q; Wed, 22 Feb 2023 10:43:38 -0500
Received: from mail-vs1-f47.google.com ([209.85.217.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUrHM-0003Ju-CG; Wed, 22 Feb 2023 10:43:37 -0500
Received: by mail-vs1-f47.google.com with SMTP id f13so5497804vsg.6;
 Wed, 22 Feb 2023 07:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677080311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4DyR5z6xKolqWFEmgbRX1dsCUGkOjrzbqEFE2QKVQW8=;
 b=REkyWpVzL0kpBna5miUN0wYTQMcKSt2/dPiUMQbInRqJO9JC4La1j9MFzXY3cg1v98
 34StslemHHdpIxLCW1j1zz29g6zuuuOeRHhdW4+pFOOPXGskJ50JfrkcwZ4GS1Fs+0Fh
 eD2va5C6LH+eATKiVWCrSC1oG1ZMW+ZwegLfw5fO7h8dzr5qfA7bQCGggjxVdVRsxjpi
 2hTeFEPtn+xn2a1bfmvwDyskk4MC4BWVpMxwfYF9M49mZXNqT+fZLp2oRXOGjj1DKqlw
 Zvbu2UfO8ktGH+EWp7o3ZKk9Kj8K4gNeyQJuaLRVs8u2uaNu9nApGFYWOD3liCMJa5VK
 43pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677080311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4DyR5z6xKolqWFEmgbRX1dsCUGkOjrzbqEFE2QKVQW8=;
 b=elrsaMhzyNJKhQQcuv5iwh4OU1P2n/C1pCBRtfaQhsE8WlCqxLHvnAMLSV43eFnxay
 OIkyTW4XaDj8As6ASyfeRquSbESf4x6KOuBhdlJ+2074BI1+PH5HwS2yCCSrV81lfOho
 vstBeMOVyvaxL3We9nAU2PVqlis5VnvcmdIPP7ESkibnFewQ5GwW9HLLjnwx9nFBQDdm
 vGBvaR0h53LcDJ2GYUlcGcNkuIT7rkm3XahRdRNu0TA3/L+H0Dwq7BJ1sCik/sdMAogF
 95CX/1r4D1a7AsH53Z7BIZ4kxYumbP7y+aCFXx+2lmoJ+PRE+jearUtQ2AnNRhJmRSIH
 aT7g==
X-Gm-Message-State: AO0yUKV+xUB5PIVvw/dR/GS9BMMVHYYSkENfjWoifxuPGPqp5i5UIcVX
 0c6BsWBUXYr4VAQFXCjWuRwgkPAI71e4TmQ2B5w=
X-Google-Smtp-Source: AK7set+bbA2OMx94X+SnKLRvcYsA72pPKHibrlJnrhbKPdu/B8f/jV6vbXRFhS1ZUvllJ3wsDt7kdsNu7pDY6OH1Qto=
X-Received: by 2002:a1f:9bc8:0:b0:3d5:911f:daed with SMTP id
 d191-20020a1f9bc8000000b003d5911fdaedmr1771271vke.39.1677080306745; Wed, 22
 Feb 2023 07:38:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677004414.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1677004414.git.balaton@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Wed, 22 Feb 2023 16:38:12 +0100
Message-ID: <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@redhat.com
Content-Type: multipart/alternative; boundary="000000000000f1851005f54baf5a"
Received-SPF: pass client-ip=209.85.217.47; envelope-from=shentey@gmail.com;
 helo=mail-vs1-f47.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000f1851005f54baf5a
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 21, 2023 at 7:44 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> This series fixes PCI interrupts on the ppc/pegasos2 machine and adds
> partial implementation of the via-ac97 sound part enough to get audio
> output. I'd like this to be merged for QEMU 8.0.
>
> Regards,
> BALATON Zoltan
>
> BALATON Zoltan (5):
>   hw/isa/vt82c686: Implement interrupt routing in via_isa_set_irq
>   hw/isa/vt82c686: Implement PIRQ pins
>   hw/ppc/pegasos2: Fix PCI interrupt routing
>   hw/audio/ac97: Split off some definitions to a header
>   hw/audio/via-ac97: Basic implementation of audio playback
>
>  hw/audio/ac97.c            |  43 +---
>  hw/audio/ac97.h            |  65 ++++++
>  hw/audio/trace-events      |   6 +
>  hw/audio/via-ac97.c        | 436 ++++++++++++++++++++++++++++++++++++-
>  hw/ide/via.c               |   2 +-
>  hw/isa/vt82c686.c          |  61 +++++-
>  hw/pci-host/mv64361.c      |   4 -
>  hw/ppc/pegasos2.c          |  26 ++-
>  hw/usb/vt82c686-uhci-pci.c |   5 +-
>  include/hw/isa/vt82c686.h  |  39 +++-
>  10 files changed, 626 insertions(+), 61 deletions(-)
>  create mode 100644 hw/audio/ac97.h
>
> --
> 2.30.7
>
>
Wow, the MorphOS people paid attention to sound design. Thanks for
presenting it to us, Zoltan!

I've had a closer look at your series and I think it can be simplified:
Patch 2 can be implemented quite straight-forward like I proposed in a
private mail: https://github.com/shentok/qemu/commit/via-priq-routing.
Then, in order to make patch 3 "hw/ppc/pegasos2: Fix PCI interrupt routing"
working, one can expose the PCI interrupts with a single line like you do
in patch 2. With this, patch 1 "hw/isa/vt82c686: Implement interrupt
routing in via_isa_set_irq" isn't needed any longer and can be omitted.

In via-ac97, rather than using via_isa_set_irq(), pci_set_irq() can be used
instead. pci_set_irq() internally takes care of all the ISA interrupt level
tracking patch 1 attempted to address.

I might have further comments but I think it's enough for now.

Thanks again for making via-ac97 work!

Best regards,
Bernhard

--000000000000f1851005f54baf5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 21, 2023 at 7:44 PM BALAT=
ON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This =
series fixes PCI interrupts on the ppc/pegasos2 machine and adds<br>
partial implementation of the via-ac97 sound part enough to get audio<br>
output. I&#39;d like this to be merged for QEMU 8.0.<br>
<br>
Regards,<br>
BALATON Zoltan<br>
<br>
BALATON Zoltan (5):<br>
=C2=A0 hw/isa/vt82c686: Implement interrupt routing in via_isa_set_irq<br>
=C2=A0 hw/isa/vt82c686: Implement PIRQ pins<br>
=C2=A0 hw/ppc/pegasos2: Fix PCI interrupt routing<br>
=C2=A0 hw/audio/ac97: Split off some definitions to a header<br>
=C2=A0 hw/audio/via-ac97: Basic implementation of audio playback<br>
<br>
=C2=A0hw/audio/ac97.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 43 +=
---<br>
=C2=A0hw/audio/ac97.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 65 +=
+++++<br>
=C2=A0hw/audio/trace-events=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0hw/audio/via-ac97.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 436 ++++++++++++++++=
++++++++++++++++++++-<br>
=C2=A0hw/ide/via.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0hw/isa/vt82c686.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 61 +++++-=
<br>
=C2=A0hw/pci-host/mv64361.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 -<br>
=C2=A0hw/ppc/pegasos2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 26 ++-<br=
>
=C2=A0hw/usb/vt82c686-uhci-pci.c |=C2=A0 =C2=A05 +-<br>
=C2=A0include/hw/isa/vt82c686.h=C2=A0 |=C2=A0 39 +++-<br>
=C2=A010 files changed, 626 insertions(+), 61 deletions(-)<br>
=C2=A0create mode 100644 hw/audio/ac97.h<br>
<br>
-- <br>
2.30.7<br>
<br></blockquote><div><br></div><div>Wow, the MorphOS people paid attention=
 to sound design. Thanks for presenting it to us, Zoltan!</div><div><br></d=
iv><div>I&#39;ve had a closer look at your series and I think it can be sim=
plified: Patch 2 can be implemented quite straight-forward like I proposed =
in a private mail: <a href=3D"https://github.com/shentok/qemu/commit/via-pr=
iq-routing">https://github.com/shentok/qemu/commit/via-priq-routing</a>. Th=
en, in order to make patch 3 &quot;hw/ppc/pegasos2: Fix PCI interrupt routi=
ng&quot; working, one can expose the PCI interrupts with a single line like=
 you do in patch 2. With this, patch 1 &quot;hw/isa/vt82c686: Implement int=
errupt routing in via_isa_set_irq&quot; isn&#39;t needed any longer and can=
 be omitted.</div></div><div class=3D"gmail_quote"><div><br></div><div>In v=
ia-ac97, rather than  using via_isa_set_irq(), pci_set_irq() can be used in=
stead. pci_set_irq() internally takes care of all the ISA interrupt level t=
racking patch 1 attempted to address.</div><div><br></div><div>I might have=
 further comments but I think it&#39;s enough for now.</div><div><br></div>=
<div>Thanks again for making via-ac97 work!</div><div><br></div><div>Best r=
egards,</div><div>Bernhard<br></div></div></div>

--000000000000f1851005f54baf5a--

