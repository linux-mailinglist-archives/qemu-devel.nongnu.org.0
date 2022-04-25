Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05A750E16A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:18:44 +0200 (CEST)
Received: from localhost ([::1]:50644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niybz-00004q-TV
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niyaB-0006aw-GH
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:16:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niya7-0001FD-IA
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650892606;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=F1tM7OpgTCopGljwZ5a+4Hi7kjXbtAAvyYuuf5bj+u8=;
 b=gmesDG6/gxJ1RPS0KwNTtCu6S8NN3SunSAxLosqgMuUx3dwlWsYs7F3z3FxCqvwulZdN2T
 3wXH1+8EKy2abbG4HNYJZ4OMU7xGOYo675Qc8ClMAlgue+x91RrpstHoPQGO1cdcN4tzE1
 /pPSYyS9eN61PX1ijVVUvJYN656oowE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-ODHJmqiZMeOLO_WM4393Qg-1; Mon, 25 Apr 2022 09:16:43 -0400
X-MC-Unique: ODHJmqiZMeOLO_WM4393Qg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 533D729AA3AF;
 Mon, 25 Apr 2022 13:16:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 493A640CF8F5;
 Mon, 25 Apr 2022 13:16:38 +0000 (UTC)
Date: Mon, 25 Apr 2022 14:16:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 01/18] hw/audio: Remove -soundhw support
Message-ID: <YmafM9xkSZfqQMbB@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <aaa9e17ef9f35cb34acae2538240c11b911d9f6c.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaa9e17ef9f35cb34acae2538240c11b911d9f6c.1650874791.git.mkletzan@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Darren Kenny <darren.kenny@oracle.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 10:21:44AM +0200, Martin Kletzander wrote:
> One thing I am not sure about is whether to keep the aliases of ac97 and
> es1370 in the qdev_alias_table.

I'm not sure we have any prior art in this respect. I feel it is a bit
odd-ball that AC97 and ES1370 are uppercase in qdev, so in that respect
the ac97/es1370 aliases are nice.

Libvirt uses uppercase form, so wouldn't be impacted if we removed the
aliases.

I don't have a strong preference either way.

I'd suggest splitting the removal of the aliases into a separate patch
since it isn't strictly neeeding to be done at the same time.

If you split off, then I'm happy for both bits to be

> 
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  docs/about/deprecated.rst                     |   9 -
>  docs/about/removed-features.rst               |  10 +
>  docs/qdev-device-use.txt                      |  21 +--
>  docs/replay.txt                               |   2 +-
>  hw/audio/ac97.c                               |   3 -
>  hw/audio/adlib.c                              |   2 -
>  hw/audio/cs4231a.c                            |   2 -
>  hw/audio/es1370.c                             |   3 -
>  hw/audio/gus.c                                |   2 -
>  hw/audio/intel-hda.c                          |  21 ---
>  hw/audio/meson.build                          |   1 -
>  hw/audio/pcspk.c                              |  11 --
>  hw/audio/sb16.c                               |   3 -
>  hw/audio/soundhw.c                            | 177 ------------------
>  include/hw/audio/soundhw.h                    |  15 --
>  qemu-options.hx                               |  27 ---
>  .../codeconverter/test_regexps.py             |   1 -
>  softmmu/qdev-monitor.c                        |   2 -
>  softmmu/vl.c                                  |   6 -
>  19 files changed, 19 insertions(+), 299 deletions(-)
>  delete mode 100644 hw/audio/soundhw.c
>  delete mode 100644 include/hw/audio/soundhw.h
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index cf02ef6821e4..7ba71ebd3435 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -39,15 +39,6 @@ should specify an ``audiodev=`` property.  Additionally, when using
>  vnc, you should specify an ``audiodev=`` property if you plan to
>  transmit audio through the VNC protocol.
>  
> -Creating sound card devices using ``-soundhw`` (since 5.1)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -Sound card devices should be created using ``-device`` instead.  The
> -names are the same for most devices.  The exceptions are ``hda`` which
> -needs two devices (``-device intel-hda -device hda-duplex``) and
> -``pcspk`` which can be activated using ``-machine
> -pcspk-audiodev=<name>``.
> -
>  ``-chardev`` backend aliases ``tty`` and ``parport`` (since 6.0)
>  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>  
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index 4b831ea29176..086ba3edb042 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -336,6 +336,16 @@ for the RISC-V ``virt`` machine and ``sifive_u`` machine.
>  The ``-no-quit`` was a synonym for ``-display ...,window-close=off`` which
>  should be used instead.
>  
> +Creating sound card devices using ``-soundhw`` (removed in 7.1)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Sound card devices should be created using ``-device`` instead.  The
> +names are the same for most devices.  The exceptions are ``hda`` which
> +needs two devices (``-device intel-hda -device hda-duplex``) and
> +``pcspk`` which can be activated using ``-machine
> +pcspk-audiodev=<name>``.  And ``AC97`` and ``ES1370`` now have to be
> +specified in uppercase.
> +
>  
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
> diff --git a/docs/qdev-device-use.txt b/docs/qdev-device-use.txt
> index 240888933482..30e7eaa3e66d 100644
> --- a/docs/qdev-device-use.txt
> +++ b/docs/qdev-device-use.txt
> @@ -311,21 +311,16 @@ constraints.
>  
>  Host and guest part of audio devices have always been separate.
>  
> -The old way to define guest audio devices is -soundhw C1,...
> +Host side (backend) is defined using -audiodev with a specific driver:
>  
> -The new way is to define each guest audio device separately with
> --device.
> +    spice
> +    pa
> +    none
>  
> -Map from -soundhw sound card name to -device:
> -
> -    ac97        -device AC97
> -    cs4231a     -device cs4231a,iobase=IOADDR,irq=IRQ,dma=DMA
> -    es1370      -device ES1370
> -    gus         -device gus,iobase=IOADDR,irq=IRQ,dma=DMA,freq=F
> -    hda         -device intel-hda,msi=MSI -device hda-duplex
> -    sb16        -device sb16,iobase=IOADDR,irq=IRQ,dma=DMA,dma16=DMA16,version=V
> -    adlib       not yet available with -device
> -    pcspk       not yet available with -device
> +And each guest audio device is then defined with -device with
> +audiodev=AUDIODEV_ID that refers to the audio backend above.  Exceptions are
> +pcspk and adlib which are note yet available with -device and are part of a
> +machine type.
>  
>  For PCI devices, you can add bus=PCI-BUS,addr=DEVFN to control the PCI
>  device address, as usual.
> diff --git a/docs/replay.txt b/docs/replay.txt
> index 5b008ca4911f..c329767c148a 100644
> --- a/docs/replay.txt
> +++ b/docs/replay.txt
> @@ -294,7 +294,7 @@ Audio devices
>  
>  Audio data is recorded and replay automatically. The command line for recording
>  and replaying must contain identical specifications of audio hardware, e.g.:
> - -soundhw ac97
> + -audiodev driver=pa -device ac97,audiodev=audio0
>  
>  Serial ports
>  ------------
> diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
> index 3cb81310607f..fd0b3b97d5b5 100644
> --- a/hw/audio/ac97.c
> +++ b/hw/audio/ac97.c
> @@ -18,7 +18,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "hw/audio/soundhw.h"
>  #include "audio/audio.h"
>  #include "hw/pci/pci.h"
>  #include "hw/qdev-properties.h"
> @@ -1430,8 +1429,6 @@ static const TypeInfo ac97_info = {
>  static void ac97_register_types (void)
>  {
>      type_register_static (&ac97_info);
> -    deprecated_register_soundhw("ac97", "Intel 82801AA AC97 Audio",
> -                                0, TYPE_AC97);
>  }
>  
>  type_init (ac97_register_types)
> diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
> index 5f979b1487d1..ba1be6c8378d 100644
> --- a/hw/audio/adlib.c
> +++ b/hw/audio/adlib.c
> @@ -25,7 +25,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> -#include "hw/audio/soundhw.h"
>  #include "audio/audio.h"
>  #include "hw/isa/isa.h"
>  #include "hw/qdev-properties.h"
> @@ -322,7 +321,6 @@ static const TypeInfo adlib_info = {
>  static void adlib_register_types (void)
>  {
>      type_register_static (&adlib_info);
> -    deprecated_register_soundhw("adlib", ADLIB_DESC, 1, TYPE_ADLIB);
>  }
>  
>  type_init (adlib_register_types)
> diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
> index 0723e3943044..f510b862efbe 100644
> --- a/hw/audio/cs4231a.c
> +++ b/hw/audio/cs4231a.c
> @@ -23,7 +23,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "hw/audio/soundhw.h"
>  #include "audio/audio.h"
>  #include "hw/irq.h"
>  #include "hw/isa/isa.h"
> @@ -717,7 +716,6 @@ static const TypeInfo cs4231a_info = {
>  static void cs4231a_register_types (void)
>  {
>      type_register_static (&cs4231a_info);
> -    deprecated_register_soundhw("cs4231a", "CS4231A", 1, TYPE_CS4231A);
>  }
>  
>  type_init (cs4231a_register_types)
> diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
> index 690458981471..62359b84f279 100644
> --- a/hw/audio/es1370.c
> +++ b/hw/audio/es1370.c
> @@ -27,7 +27,6 @@
>  #define SILENT_ES1370
>  
>  #include "qemu/osdep.h"
> -#include "hw/audio/soundhw.h"
>  #include "audio/audio.h"
>  #include "hw/pci/pci.h"
>  #include "migration/vmstate.h"
> @@ -923,8 +922,6 @@ static const TypeInfo es1370_info = {
>  static void es1370_register_types (void)
>  {
>      type_register_static (&es1370_info);
> -    deprecated_register_soundhw("es1370", "ENSONIQ AudioPCI ES1370",
> -                                0, TYPE_ES1370);
>  }
>  
>  type_init (es1370_register_types)
> diff --git a/hw/audio/gus.c b/hw/audio/gus.c
> index 42f010b67193..c7710a684b88 100644
> --- a/hw/audio/gus.c
> +++ b/hw/audio/gus.c
> @@ -25,7 +25,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> -#include "hw/audio/soundhw.h"
>  #include "audio/audio.h"
>  #include "hw/irq.h"
>  #include "hw/isa/isa.h"
> @@ -317,7 +316,6 @@ static const TypeInfo gus_info = {
>  static void gus_register_types (void)
>  {
>      type_register_static (&gus_info);
> -    deprecated_register_soundhw("gus", "Gravis Ultrasound GF1", 1, TYPE_GUS);
>  }
>  
>  type_init (gus_register_types)
> diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> index bc77e3d8c9dc..e77552363a4c 100644
> --- a/hw/audio/intel-hda.c
> +++ b/hw/audio/intel-hda.c
> @@ -26,7 +26,6 @@
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "qemu/error-report.h"
> -#include "hw/audio/soundhw.h"
>  #include "intel-hda.h"
>  #include "migration/vmstate.h"
>  #include "intel-hda-defs.h"
> @@ -1307,25 +1306,6 @@ static const TypeInfo hda_codec_device_type_info = {
>      .class_init = hda_codec_device_class_init,
>  };
>  
> -/*
> - * create intel hda controller with codec attached to it,
> - * so '-soundhw hda' works.
> - */
> -static int intel_hda_and_codec_init(PCIBus *bus)
> -{
> -    DeviceState *controller;
> -    BusState *hdabus;
> -    DeviceState *codec;
> -
> -    warn_report("'-soundhw hda' is deprecated, "
> -                "please use '-device intel-hda -device hda-duplex' instead");
> -    controller = DEVICE(pci_create_simple(bus, -1, "intel-hda"));
> -    hdabus = QLIST_FIRST(&controller->child_bus);
> -    codec = qdev_new("hda-duplex");
> -    qdev_realize_and_unref(codec, hdabus, &error_fatal);
> -    return 0;
> -}
> -
>  static void intel_hda_register_types(void)
>  {
>      type_register_static(&hda_codec_bus_info);
> @@ -1333,7 +1313,6 @@ static void intel_hda_register_types(void)
>      type_register_static(&intel_hda_info_ich6);
>      type_register_static(&intel_hda_info_ich9);
>      type_register_static(&hda_codec_device_type_info);
> -    pci_register_soundhw("hda", "Intel HD Audio", intel_hda_and_codec_init);
>  }
>  
>  type_init(intel_hda_register_types)
> diff --git a/hw/audio/meson.build b/hw/audio/meson.build
> index e48a9fc73d57..746b5b98d198 100644
> --- a/hw/audio/meson.build
> +++ b/hw/audio/meson.build
> @@ -1,4 +1,3 @@
> -softmmu_ss.add(files('soundhw.c'))
>  softmmu_ss.add(when: 'CONFIG_AC97', if_true: files('ac97.c'))
>  softmmu_ss.add(when: 'CONFIG_ADLIB', if_true: files('fmopl.c', 'adlib.c'))
>  softmmu_ss.add(when: 'CONFIG_CS4231', if_true: files('cs4231.c'))
> diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
> index dfc7ebca4e17..72bea5fb202a 100644
> --- a/hw/audio/pcspk.c
> +++ b/hw/audio/pcspk.c
> @@ -24,7 +24,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/isa/isa.h"
> -#include "hw/audio/soundhw.h"
>  #include "audio/audio.h"
>  #include "qemu/module.h"
>  #include "qemu/timer.h"
> @@ -245,18 +244,8 @@ static const TypeInfo pcspk_info = {
>      .class_init     = pcspk_class_initfn,
>  };
>  
> -static int pcspk_audio_init_soundhw(ISABus *bus)
> -{
> -    PCSpkState *s = pcspk_state;
> -
> -    warn_report("'-soundhw pcspk' is deprecated, "
> -                "please set a backend using '-machine pcspk-audiodev=<name>' instead");
> -    return pcspk_audio_init(s);
> -}
> -
>  static void pcspk_register(void)
>  {
>      type_register_static(&pcspk_info);
> -    isa_register_soundhw("pcspk", "PC speaker", pcspk_audio_init_soundhw);
>  }
>  type_init(pcspk_register)
> diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
> index 2215386ddb2e..593da2478c14 100644
> --- a/hw/audio/sb16.c
> +++ b/hw/audio/sb16.c
> @@ -23,7 +23,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "hw/audio/soundhw.h"
>  #include "audio/audio.h"
>  #include "hw/irq.h"
>  #include "hw/isa/isa.h"
> @@ -1469,8 +1468,6 @@ static const TypeInfo sb16_info = {
>  static void sb16_register_types (void)
>  {
>      type_register_static (&sb16_info);
> -    deprecated_register_soundhw("sb16", "Creative Sound Blaster 16",
> -                                1, TYPE_SB16);
>  }
>  
>  type_init (sb16_register_types)
> diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
> deleted file mode 100644
> index 173b674ff53a..000000000000
> --- a/hw/audio/soundhw.c
> +++ /dev/null
> @@ -1,177 +0,0 @@
> -/*
> - * QEMU System Emulator
> - *
> - * Copyright (c) 2003-2008 Fabrice Bellard
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a copy
> - * of this software and associated documentation files (the "Software"), to deal
> - * in the Software without restriction, including without limitation the rights
> - * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> - * copies of the Software, and to permit persons to whom the Software is
> - * furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be included in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> - * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> - * THE SOFTWARE.
> - */
> -#include "qemu/osdep.h"
> -#include "qemu/option.h"
> -#include "qemu/help_option.h"
> -#include "qemu/error-report.h"
> -#include "qom/object.h"
> -#include "hw/isa/isa.h"
> -#include "hw/pci/pci.h"
> -#include "hw/audio/soundhw.h"
> -
> -struct soundhw {
> -    const char *name;
> -    const char *descr;
> -    const char *typename;
> -    int enabled;
> -    int isa;
> -    union {
> -        int (*init_isa) (ISABus *bus);
> -        int (*init_pci) (PCIBus *bus);
> -    } init;
> -};
> -
> -static struct soundhw soundhw[9];
> -static int soundhw_count;
> -
> -void isa_register_soundhw(const char *name, const char *descr,
> -                          int (*init_isa)(ISABus *bus))
> -{
> -    assert(soundhw_count < ARRAY_SIZE(soundhw) - 1);
> -    soundhw[soundhw_count].name = name;
> -    soundhw[soundhw_count].descr = descr;
> -    soundhw[soundhw_count].isa = 1;
> -    soundhw[soundhw_count].init.init_isa = init_isa;
> -    soundhw_count++;
> -}
> -
> -void pci_register_soundhw(const char *name, const char *descr,
> -                          int (*init_pci)(PCIBus *bus))
> -{
> -    assert(soundhw_count < ARRAY_SIZE(soundhw) - 1);
> -    soundhw[soundhw_count].name = name;
> -    soundhw[soundhw_count].descr = descr;
> -    soundhw[soundhw_count].isa = 0;
> -    soundhw[soundhw_count].init.init_pci = init_pci;
> -    soundhw_count++;
> -}
> -
> -void deprecated_register_soundhw(const char *name, const char *descr,
> -                                 int isa, const char *typename)
> -{
> -    assert(soundhw_count < ARRAY_SIZE(soundhw) - 1);
> -    soundhw[soundhw_count].name = name;
> -    soundhw[soundhw_count].descr = descr;
> -    soundhw[soundhw_count].isa = isa;
> -    soundhw[soundhw_count].typename = typename;
> -    soundhw_count++;
> -}
> -
> -void select_soundhw(const char *optarg)
> -{
> -    struct soundhw *c;
> -
> -    if (is_help_option(optarg)) {
> -    show_valid_cards:
> -
> -        if (soundhw_count) {
> -             printf("Valid sound card names (comma separated):\n");
> -             for (c = soundhw; c->name; ++c) {
> -                 printf ("%-11s %s\n", c->name, c->descr);
> -             }
> -             printf("\n-soundhw all will enable all of the above\n");
> -        } else {
> -             printf("Machine has no user-selectable audio hardware "
> -                    "(it may or may not have always-present audio hardware).\n");
> -        }
> -        exit(!is_help_option(optarg));
> -    }
> -    else {
> -        size_t l;
> -        const char *p;
> -        char *e;
> -        int bad_card = 0;
> -
> -        if (!strcmp(optarg, "all")) {
> -            for (c = soundhw; c->name; ++c) {
> -                c->enabled = 1;
> -            }
> -            return;
> -        }
> -
> -        p = optarg;
> -        while (*p) {
> -            e = strchr(p, ',');
> -            l = !e ? strlen(p) : (size_t) (e - p);
> -
> -            for (c = soundhw; c->name; ++c) {
> -                if (!strncmp(c->name, p, l) && !c->name[l]) {
> -                    c->enabled = 1;
> -                    break;
> -                }
> -            }
> -
> -            if (!c->name) {
> -                if (l > 80) {
> -                    error_report("Unknown sound card name (too big to show)");
> -                }
> -                else {
> -                    error_report("Unknown sound card name `%.*s'",
> -                                 (int) l, p);
> -                }
> -                bad_card = 1;
> -            }
> -            p += l + (e != NULL);
> -        }
> -
> -        if (bad_card) {
> -            goto show_valid_cards;
> -        }
> -    }
> -}
> -
> -void soundhw_init(void)
> -{
> -    struct soundhw *c;
> -    ISABus *isa_bus = (ISABus *) object_resolve_path_type("", TYPE_ISA_BUS, NULL);
> -    PCIBus *pci_bus = (PCIBus *) object_resolve_path_type("", TYPE_PCI_BUS, NULL);
> -
> -    for (c = soundhw; c->name; ++c) {
> -        if (c->enabled) {
> -            if (c->typename) {
> -                warn_report("'-soundhw %s' is deprecated, "
> -                            "please use '-device %s' instead",
> -                            c->name, c->typename);
> -                if (c->isa) {
> -                    isa_create_simple(isa_bus, c->typename);
> -                } else {
> -                    pci_create_simple(pci_bus, -1, c->typename);
> -                }
> -            } else if (c->isa) {
> -                if (!isa_bus) {
> -                    error_report("ISA bus not available for %s", c->name);
> -                    exit(1);
> -                }
> -                c->init.init_isa(isa_bus);
> -            } else {
> -                if (!pci_bus) {
> -                    error_report("PCI bus not available for %s", c->name);
> -                    exit(1);
> -                }
> -                c->init.init_pci(pci_bus);
> -            }
> -        }
> -    }
> -}
> -
> diff --git a/include/hw/audio/soundhw.h b/include/hw/audio/soundhw.h
> deleted file mode 100644
> index f09a297854af..000000000000
> --- a/include/hw/audio/soundhw.h
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -#ifndef HW_SOUNDHW_H
> -#define HW_SOUNDHW_H
> -
> -void isa_register_soundhw(const char *name, const char *descr,
> -                          int (*init_isa)(ISABus *bus));
> -
> -void pci_register_soundhw(const char *name, const char *descr,
> -                          int (*init_pci)(PCIBus *bus));
> -void deprecated_register_soundhw(const char *name, const char *descr,
> -                                 int isa, const char *typename);
> -
> -void soundhw_init(void);
> -void select_soundhw(const char *optarg);
> -
> -#endif
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 34e9b32a5c00..47bbd86a4533 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -892,33 +892,6 @@ SRST
>          ``qemu.wav``.
>  ERST
>  
> -DEF("soundhw", HAS_ARG, QEMU_OPTION_soundhw,
> -    "-soundhw c1,... enable audio support\n"
> -    "                and only specified sound cards (comma separated list)\n"
> -    "                use '-soundhw help' to get the list of supported cards\n"
> -    "                use '-soundhw all' to enable all of them\n", QEMU_ARCH_ALL)
> -SRST
> -``-soundhw card1[,card2,...] or -soundhw all``
> -    Enable audio and selected sound hardware. Use 'help' to print all
> -    available sound hardware. For example:
> -
> -    .. parsed-literal::
> -
> -        |qemu_system_x86| -soundhw sb16,adlib disk.img
> -        |qemu_system_x86| -soundhw es1370 disk.img
> -        |qemu_system_x86| -soundhw ac97 disk.img
> -        |qemu_system_x86| -soundhw hda disk.img
> -        |qemu_system_x86| -soundhw all disk.img
> -        |qemu_system_x86| -soundhw help
> -
> -    Note that Linux's i810\_audio OSS kernel (for AC97) module might
> -    require manually specifying clocking.
> -
> -    ::
> -
> -        modprobe i810_audio clocking=48000
> -ERST
> -
>  DEF("device", HAS_ARG, QEMU_OPTION_device,
>      "-device driver[,prop[=value][,...]]\n"
>      "                add device (based on driver)\n"
> diff --git a/scripts/codeconverter/codeconverter/test_regexps.py b/scripts/codeconverter/codeconverter/test_regexps.py
> index a445634d88ac..0161cadffee6 100644
> --- a/scripts/codeconverter/codeconverter/test_regexps.py
> +++ b/scripts/codeconverter/codeconverter/test_regexps.py
> @@ -264,7 +264,6 @@ def test_initial_includes():
>  #define SILENT_ES1370
>  
>  #include "qemu/osdep.h"
> -#include "hw/audio/soundhw.h"
>  #include "audio/audio.h"
>  #include "hw/pci/pci.h"
>  #include "migration/vmstate.h"
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 12fe60c4670d..5c80d135ebf0 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -66,9 +66,7 @@ typedef struct QDevAlias
>  
>  /* Please keep this table sorted by typename. */
>  static const QDevAlias qdev_alias_table[] = {
> -    { "AC97", "ac97" }, /* -soundhw name */
>      { "e1000", "e1000-82540em" },
> -    { "ES1370", "es1370" }, /* -soundhw name */
>      { "ich9-ahci", "ahci" },
>      { "lsi53c895a", "lsi" },
>      { "virtio-9p-device", "virtio-9p", QEMU_ARCH_VIRTIO_MMIO },
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 06a0e342fe9e..2f7158574e4f 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -80,7 +80,6 @@
>  #include "migration/snapshot.h"
>  #include "sysemu/tpm.h"
>  #include "sysemu/dma.h"
> -#include "hw/audio/soundhw.h"
>  #include "audio/audio.h"
>  #include "sysemu/cpus.h"
>  #include "sysemu/cpu-timers.h"
> @@ -2669,8 +2668,6 @@ static void qemu_create_cli_devices(void)
>  {
>      DeviceOption *opt;
>  
> -    soundhw_init();
> -
>      qemu_opts_foreach(qemu_find_opts("fw_cfg"),
>                        parse_fw_cfg, fw_cfg_find(), &error_fatal);
>  
> @@ -3018,9 +3015,6 @@ void qemu_init(int argc, char **argv, char **envp)
>              case QEMU_OPTION_audiodev:
>                  audio_parse_option(optarg);
>                  break;
> -            case QEMU_OPTION_soundhw:
> -                select_soundhw (optarg);
> -                break;
>              case QEMU_OPTION_h:
>                  help(0);
>                  break;
> -- 
> 2.35.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


