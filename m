Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CA560EFA9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 07:50:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onveW-0004sZ-PO; Thu, 27 Oct 2022 01:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1onveT-0004aI-4D; Thu, 27 Oct 2022 01:42:01 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1onveQ-0002s1-Mx; Thu, 27 Oct 2022 01:42:00 -0400
Received: by mail-io1-xd31.google.com with SMTP id p184so535722iof.11;
 Wed, 26 Oct 2022 22:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ju/3VOXDA6YKnqnsmvc6k9jCOsVQJkPKmWri8wdstUM=;
 b=f7E/5Ie5280mTzw3wwU5izzT3ZtnhaTUosWxMUsRQaMHOqUosDWIb0Y5bQudXcoVeE
 JqLvWFfhKBEYdSGWWOylQ5M1iDKshxgN29UMVr9oJ+niBz42LEXzKzIl1ANRUuSxjIRT
 LfoJiDQtR0rtZf5dNK2MLNrYmUMzsk/QB3xf3zO9RSHqBnS+E7mZ6wQKbpIE4YY3laFX
 speHDwMymAmeVBnA6fZBws693g0Cb3GcvCIdh1iVxplHSnVXB+JSfXr6IRZicsrMEa+L
 cXhiemHk2yzD4Q4K2fK/V5ZEopVvbiANlIeWVMfLp4/Y8rsXSCrXkwiLziasYlZEJZfS
 KrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ju/3VOXDA6YKnqnsmvc6k9jCOsVQJkPKmWri8wdstUM=;
 b=rvJrloVg5NDuxFL1rTgYcccxxgPh2AWcZU5D4JbM4P7kENeOtL5wHa73qfnJ0CZukG
 MCAGhzXXNDlw0LHvROYllxc2/2yY1EWWAAJMGeVEmRoGwtgbeRCFj0CY36WAcRiizmIZ
 d4uGpG7NUvKvWW0HyVBz1PGay2gloOe0ltFmf+gtIcy/tVOoh1OjivLSXCcKvTPUUur4
 mnW5YgdTshVqQUhEq+y+4b4PAKbNBMR2HU/ZAvixpFC1BoPcJX9Rsnia7hkRuDwMu6lk
 KQKFpMxqGojLBDwicXyLcsD6dTEpQhPzTUDQiFzX69kzJxIOCBbP5RkoZ+a5UW4pL8p5
 XD4A==
X-Gm-Message-State: ACrzQf2EH6H5zddisfH6iWAlDHOIZvw/vspGRKi5uGhK2ji2bBP88zAU
 PBcywnKgVDmlFfmwmVV8+lgAuaWQhoN/mo3A0v9Br8Xw
X-Google-Smtp-Source: AMsMyM68rtwt4niTxR2Yw/Cf6UBqkc4a23s2JynVjyq4HOJpmK0dsdk0/amiQLC0jq4zFMNkluX6hckjbC+qxZcwJkw=
X-Received: by 2002:a05:6638:468e:b0:375:1ae9:ba13 with SMTP id
 bq14-20020a056638468e00b003751ae9ba13mr3404511jab.253.1666849316654; Wed, 26
 Oct 2022 22:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1666715145.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666715145.git.balaton@eik.bme.hu>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Thu, 27 Oct 2022 07:41:44 +0200
Message-ID: <CABLmASFGAS-ck2XN2FOTKqTB346UB_+j+BhpumhFj0eomAjp4A@mail.gmail.com>
Subject: Re: [PATCH v4 00/19] Misc ppc/mac machines clean up
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: multipart/alternative; boundary="00000000000069d40005ebfd99ad"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=hsp.cat7@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000069d40005ebfd99ad
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 25, 2022 at 6:49 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> Since only one week is left until freeze starts I've included some
> more patches in this version that I've intended to submit after the
> clean ups but we're running out of time now. The last 3 patches could
> be squashed together, I've just split these up because I expect
> resistence from Mark to any changes so maybe it's easier to digest
> piece by piece and can cherry pick parts easier this way but ideally
> these should be in one patch.
>
> I'd appreciate very much if this series would get in before the
> freeze, it is very discouraging to spend time with something that gets
> ignored and then postponed for the rest of the year just to start
> again the same in January. This might be a reason why not many people
> contribute to this part of QEMU besides that maybe only a few people
> are still interested so those who are interested should be served
> better to not scare them off even more.
>
> Regards,
> BALATON Zoltan
>
> v4: Add some more patches that I've found since v3 or was intended in
> separate series
> v3: Some more patch spliting and changes I've noticed and address more
> review comments
> v2: Split some patches and add a few more I've noticed now and address
> review comments
>
> BALATON Zoltan (19):
>   mac_newworld: Drop some variables
>   mac_oldworld: Drop some more variables
>   mac_{old|new}world: Set tbfreq at declaration
>   mac_{old|new}world: Avoid else branch by setting default value
>   mac_{old|new}world: Simplify cmdline_base calculation
>   mac_newworld: Clean up creation of Uninorth devices
>   mac_{old|new}world: Reduce number of QOM casts
>   hw/ppc/mac.h: Move newworld specific parts out from shared header
>   hw/ppc/mac.h: Move macio specific parts out from shared header
>   hw/ppc/mac.h: Move grackle-pcihost type declaration out to a header
>   hw/ppc/mac.h: Move PROM and KERNEL defines to board code
>   hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h
>   mac_nvram: Use NVRAM_SIZE constant
>   mac_{old|new}world: Code style fix adding missing braces to if-s
>   mac_newworld: Turn CORE99_VIA_CONFIG defines into an enum
>   mac_newworld: Add machine types for different mac99 configs
>   mac_newworld: Deprecate mac99 with G5 CPU
>   mac_newworld: Deprecate mac99 "via" option
>   mac_newworld: Document deprecation
>
>  MAINTAINERS                   |   2 +
>  docs/about/deprecated.rst     |   7 +
>  docs/system/ppc/powermac.rst  |  12 +-
>  hw/ide/macio.c                |   1 -
>  hw/intc/heathrow_pic.c        |   1 -
>  hw/intc/openpic.c             |   1 -
>  hw/misc/macio/cuda.c          |   1 -
>  hw/misc/macio/gpio.c          |   1 -
>  hw/misc/macio/macio.c         |   8 +-
>  hw/misc/macio/pmu.c           |   1 -
>  hw/nvram/mac_nvram.c          |   2 +-
>  hw/pci-host/grackle.c         |  15 +-
>  hw/pci-host/uninorth.c        |   1 -
>  hw/ppc/mac.h                  | 105 -----------
>  hw/ppc/mac_newworld.c         | 341 ++++++++++++++++++++++------------
>  hw/ppc/mac_oldworld.c         | 120 ++++++------
>  include/hw/misc/macio/macio.h |  23 ++-
>  include/hw/nvram/mac_nvram.h  |  51 +++++
>  include/hw/pci-host/grackle.h |  44 +++++
>  19 files changed, 415 insertions(+), 322 deletions(-)
>  delete mode 100644 hw/ppc/mac.h
>  create mode 100644 include/hw/nvram/mac_nvram.h
>  create mode 100644 include/hw/pci-host/grackle.h
>
> --
> 2.30.4
>
>
>
Hi all,

I applied these patches and they seem to work as expected. I like the way
this makes it clearer which machine is actually emulated, even though it is
still not easy to understand which default hardware the emulated machine
actually presents.
I also like the more consistent way a new rom file for a VGA device can be
added. The deprecation warnings are clear.

Qemu-system-ppc defaults to the g3beige machine, which does not reflect the
(in my opinion) main use case of running Mac OS/X with the powermac3_1
machine and will not boot the main versions of ppc Mac OS/X anyway.

So for qemu-system-ppc:

Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>

Best,
Howard

--00000000000069d40005ebfd99ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 25, 2022 at 6:49 PM BALAT=
ON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu" target=3D"_blank">balat=
on@eik.bme.hu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Since only one week is left until freeze starts I&#39;ve inclu=
ded some<br>
more patches in this version that I&#39;ve intended to submit after the<br>
clean ups but we&#39;re running out of time now. The last 3 patches could<b=
r>
be squashed together, I&#39;ve just split these up because I expect<br>
resistence from Mark to any changes so maybe it&#39;s easier to digest<br>
piece by piece and can cherry pick parts easier this way but ideally<br>
these should be in one patch.<br>
<br>
I&#39;d appreciate very much if this series would get in before the<br>
freeze, it is very discouraging to spend time with something that gets<br>
ignored and then postponed for the rest of the year just to start<br>
again the same in January. This might be a reason why not many people<br>
contribute to this part of QEMU besides that maybe only a few people<br>
are still interested so those who are interested should be served<br>
better to not scare them off even more.<br>
<br>
Regards,<br>
BALATON Zoltan<br>
<br>
v4: Add some more patches that I&#39;ve found since v3 or was intended in<b=
r>
separate series<br>
v3: Some more patch spliting and changes I&#39;ve noticed and address more<=
br>
review comments<br>
v2: Split some patches and add a few more I&#39;ve noticed now and address<=
br>
review comments<br>
<br>
BALATON Zoltan (19):<br>
=C2=A0 mac_newworld: Drop some variables<br>
=C2=A0 mac_oldworld: Drop some more variables<br>
=C2=A0 mac_{old|new}world: Set tbfreq at declaration<br>
=C2=A0 mac_{old|new}world: Avoid else branch by setting default value<br>
=C2=A0 mac_{old|new}world: Simplify cmdline_base calculation<br>
=C2=A0 mac_newworld: Clean up creation of Uninorth devices<br>
=C2=A0 mac_{old|new}world: Reduce number of QOM casts<br>
=C2=A0 hw/ppc/mac.h: Move newworld specific parts out from shared header<br=
>
=C2=A0 hw/ppc/mac.h: Move macio specific parts out from shared header<br>
=C2=A0 hw/ppc/mac.h: Move grackle-pcihost type declaration out to a header<=
br>
=C2=A0 hw/ppc/mac.h: Move PROM and KERNEL defines to board code<br>
=C2=A0 hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h<br>
=C2=A0 mac_nvram: Use NVRAM_SIZE constant<br>
=C2=A0 mac_{old|new}world: Code style fix adding missing braces to if-s<br>
=C2=A0 mac_newworld: Turn CORE99_VIA_CONFIG defines into an enum<br>
=C2=A0 mac_newworld: Add machine types for different mac99 configs<br>
=C2=A0 mac_newworld: Deprecate mac99 with G5 CPU<br>
=C2=A0 mac_newworld: Deprecate mac99 &quot;via&quot; option<br>
=C2=A0 mac_newworld: Document deprecation<br>
<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0docs/about/deprecated.rst=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
=C2=A0docs/system/ppc/powermac.rst=C2=A0 |=C2=A0 12 +-<br>
=C2=A0hw/ide/macio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 -<br>
=C2=A0hw/intc/heathrow_pic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<b=
r>
=C2=A0hw/intc/openpic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 -<br>
=C2=A0hw/misc/macio/cuda.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
1 -<br>
=C2=A0hw/misc/macio/gpio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
1 -<br>
=C2=A0hw/misc/macio/macio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
8 +-<br>
=C2=A0hw/misc/macio/pmu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 -<br>
=C2=A0hw/nvram/mac_nvram.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
2 +-<br>
=C2=A0hw/pci-host/grackle.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 +-<=
br>
=C2=A0hw/pci-host/uninorth.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<b=
r>
=C2=A0hw/ppc/mac.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 105 -----------<br>
=C2=A0hw/ppc/mac_newworld.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 341 ++++++++=
++++++++++++++------------<br>
=C2=A0hw/ppc/mac_oldworld.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 120 ++++++--=
----<br>
=C2=A0include/hw/misc/macio/macio.h |=C2=A0 23 ++-<br>
=C2=A0include/hw/nvram/mac_nvram.h=C2=A0 |=C2=A0 51 +++++<br>
=C2=A0include/hw/pci-host/grackle.h |=C2=A0 44 +++++<br>
=C2=A019 files changed, 415 insertions(+), 322 deletions(-)<br>
=C2=A0delete mode 100644 hw/ppc/mac.h<br>
=C2=A0create mode 100644 include/hw/nvram/mac_nvram.h<br>
=C2=A0create mode 100644 include/hw/pci-host/grackle.h<br>
<br>
-- <br>
2.30.4<br>
<br>
<br></blockquote><div>=C2=A0</div><div>Hi all,<br></div><div><br></div><div=
>I applied these patches and they seem to work as expected. I like the way =
this makes it clearer which machine is actually emulated, even though it is=
 still not easy to understand which default hardware the emulated machine a=
ctually presents. <br></div><div>I also like the more consistent way a new =
rom file for a VGA device can be added. The deprecation warnings are clear.=
<br></div><div><br></div><div>Qemu-system-ppc defaults to the g3beige machi=
ne, which does not reflect the (in my opinion) main use case of running Mac=
 OS/X with the powermac3_1 machine and will not boot the main versions of p=
pc Mac OS/X anyway.<br></div><div><br></div><div>So for qemu-system-ppc:</d=
iv><div><br></div><div>
<span class=3D"gmail-il">Tested</span>-<span class=3D"gmail-il">by</span>: =
Howard Spoelstra &lt;<a href=3D"mailto:hsp.cat7@gmail.com" target=3D"_blank=
">hsp.cat7@gmail.com</a>&gt; <br></div><div><br></div><div>Best,</div><div>=
Howard<br></div><div><br></div><div>=C2=A0<br></div></div></div>

--00000000000069d40005ebfd99ad--

