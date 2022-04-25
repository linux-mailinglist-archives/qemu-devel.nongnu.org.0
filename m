Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3626A50E689
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 19:08:12 +0200 (CEST)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj2C1-0007FY-1q
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 13:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nj2Ag-0005vD-1H; Mon, 25 Apr 2022 13:06:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nj2Ad-0006ni-39; Mon, 25 Apr 2022 13:06:45 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nj294-0005l1-Ed; Mon, 25 Apr 2022 18:05:10 +0100
Message-ID: <3437c265-0ed1-0f62-3115-6b681eac9784@ilande.co.uk>
Date: Mon, 25 Apr 2022 18:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Martin Kletzander <mkletzan@redhat.com>, qemu-devel@nongnu.org
References: <cover.1650874791.git.mkletzan@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/18] RFC: Remove deprecated audio features
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/04/2022 09:21, Martin Kletzander wrote:

> I wanted to deal with https://bugzilla.redhat.com/2043498 and I got a
> suggesstion that removing deprecated features could actually make it
> easier to propagate the error.  In the end (last patch) it turns out the
> error is still just reported with error_fatal, so it probably is not
> really needed, but I really wanted to dig into QEMU more and learn some
> of the internals for quite some time now.  So I used the opportunity.
> The one-liner ended up being an 18 patch series which was, for someone
> who has just one commit in QEMU codebase, a pretty challenging task.
> Although I tried my best to do things properly, I am not sure whether I
> handled everything correctly, hence the RFC.
> 
> Any comments are very much appreciated.  Thanks and have a nice day ;)
> 
> Martin Kletzander (18):
>    hw/audio: Remove -soundhw support
>    hw/input/tsc210x: Extract common init code into new function
>    hw/audio: Simplify hda audio init
>    hw/audio/lm4549: Add errp error reporting to init function
>    tests/qtest: Specify audiodev= and -audiodev
>    ui/vnc: Require audiodev=
>    Introduce machine's default-audiodev property
>    audio: Add easy dummy audio initialiser
>    hw/display/xlnx_dp.c: Add audiodev property
>    hw/input/tsc210x.c: Support machine-default audiodev with fallback
>    hw/arm: Support machine-default audiodev with fallback
>    hw/ppc: Support machine-default audiodev with fallback
>    audio: Make AUD_register_card fallible and require audiodev=
>    audio: Require AudioState in AUD_add_capture
>    audio: Be more strict during audio backend initialisation
>    audio: Remove legacy audio environment variables and options
>    audio: Remove unused can_be_default
>    audio/spiceaudio: Fail initialisation when not using spice
> 
>   audio/alsaaudio.c                             |   1 -
>   audio/audio.c                                 | 204 +++----
>   audio/audio.h                                 |   5 +-
>   audio/audio_int.h                             |   1 -
>   audio/audio_legacy.c                          | 555 ------------------
>   audio/coreaudio.m                             |   1 -
>   audio/dbusaudio.c                             |   1 -
>   audio/dsoundaudio.c                           |   1 -
>   audio/jackaudio.c                             |   1 -
>   audio/meson.build                             |   1 -
>   audio/noaudio.c                               |   1 -
>   audio/ossaudio.c                              |   1 -
>   audio/paaudio.c                               |   1 -
>   audio/sdlaudio.c                              |   1 -
>   audio/spiceaudio.c                            |   3 +-
>   audio/wavaudio.c                              |   1 -
>   docs/about/deprecated.rst                     |  24 -
>   docs/about/removed-features.rst               |  27 +
>   docs/qdev-device-use.txt                      |  21 +-
>   docs/replay.txt                               |   2 +-
>   hw/arm/integratorcp.c                         |   8 +-
>   hw/arm/musicpal.c                             |   8 +-
>   hw/arm/omap2.c                                |  11 +-
>   hw/arm/realview.c                             |   3 +
>   hw/arm/spitz.c                                |  10 +-
>   hw/arm/versatilepb.c                          |   3 +
>   hw/arm/vexpress.c                             |   3 +
>   hw/arm/xlnx-zcu102.c                          |   4 +
>   hw/arm/z2.c                                   |  12 +-
>   hw/audio/ac97.c                               |   9 +-
>   hw/audio/adlib.c                              |   9 +-
>   hw/audio/cs4231a.c                            |   8 +-
>   hw/audio/es1370.c                             |   8 +-
>   hw/audio/gus.c                                |   6 +-
>   hw/audio/hda-codec.c                          |  37 +-
>   hw/audio/intel-hda.c                          |  25 +-
>   hw/audio/intel-hda.h                          |   2 +-
>   hw/audio/lm4549.c                             |   7 +-
>   hw/audio/lm4549.h                             |   3 +-
>   hw/audio/meson.build                          |   1 -
>   hw/audio/pcspk.c                              |  15 +-
>   hw/audio/pl041.c                              |   2 +-
>   hw/audio/sb16.c                               |   9 +-
>   hw/audio/soundhw.c                            | 177 ------
>   hw/audio/wm8750.c                             |   5 +-
>   hw/core/machine.c                             |  23 +
>   hw/display/xlnx_dp.c                          |  12 +-
>   hw/input/tsc210x.c                            |  79 ++-
>   hw/ppc/prep.c                                 |   4 +
>   hw/usb/dev-audio.c                            |   5 +-
>   include/hw/audio/soundhw.h                    |  15 -
>   include/hw/boards.h                           |   1 +
>   qemu-options.hx                               |  37 --
>   .../codeconverter/test_regexps.py             |   1 -
>   softmmu/qdev-monitor.c                        |   2 -
>   softmmu/vl.c                                  |  10 -
>   tests/qtest/ac97-test.c                       |   3 +-
>   tests/qtest/es1370-test.c                     |   3 +-
>   tests/qtest/fuzz/generic_fuzz_configs.h       |   6 +-
>   tests/qtest/intel-hda-test.c                  |  15 +-
>   ui/vnc.c                                      |  15 +-
>   61 files changed, 329 insertions(+), 1140 deletions(-)
>   delete mode 100644 audio/audio_legacy.c
>   delete mode 100644 hw/audio/soundhw.c
>   delete mode 100644 include/hw/audio/soundhw.h

Thanks for the tidy-up! I'm not too familiar with the audio code, however one thing I 
noticed is that in patch 11 you are using qdev_prop_set_string() to set the audiodev 
for the machines.

For CharDevs there already exists a qdev_prop_set_chr() function which is used to 
assign the chardev backend to the device, so I'm wondering if it makes sense to add a 
similar qdev_prop_set_audiodev() function in the same way? Then if the method of 
referencing the audiodev from the device ever changes from being a string containing 
the name, it won't require updating all of the callers.

Finally a quick glance at the tsc210x and lm4549 devices indicates that they are 
using global device _init() functions which shouldn't really be used in modern 
implementations. If you are interested in QOMify-ing these devices as part of this 
work, then I can certainly help provide some pointers for getting started.


ATB,

Mark.

