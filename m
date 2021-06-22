Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD893AFFAB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:55:57 +0200 (CEST)
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvcCK-0004rj-Ny
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lvcB2-0002oO-9I
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:54:36 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:39826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lvcAz-0001yJ-3v
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:54:36 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 t4-20020a9d66c40000b029045e885b18deso354140otm.6
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 01:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZCeGL/VkpXjC+tGYeXq1MBJNvXguomEIXV91VmD5dhs=;
 b=k15bcRTRQWO9940zexjiCvKSP6UEq4rWLti+F3ZHiSfk9JPxZe62552GV7qKt0/YOJ
 sELnF1Penq1QLCcLN/aiDl5VlN2TM8QMW/E4GdbFMEuFttEpYvt7lcJmK/AFc7fXWh4E
 wXQFL/kDRfs0bX8fi++O0oXWbeaQGf/kEoaZi5z3FGaTcefF/Vw57X26HStSNSJqDE9P
 4otj4ICdOj+VXb3+IZJnIO/cxw9QtqHDODT0v7MNpLHKg0yo2ZpW70ASc+eATSFXrTcs
 tR811eIw+9TO0pEkMQEpDNDUaWtnPWvEJo+xZpBbmSmc3rKcIHgwNVeEW1/S+3oFsvRS
 7QSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZCeGL/VkpXjC+tGYeXq1MBJNvXguomEIXV91VmD5dhs=;
 b=KmSX9IdxV645c/OXvnJO3CWtV8dZFsZJyzhDy2LIAYvAk1+BAp0rtyzVFyrLFPI2BC
 VwlY5fx8nAIBa15ejXQTw/U/gnltc9wFG2gC/TLoosl1eANXoxiSNY7wY7EDGsdRMbxb
 hHEKV4DEjwWS9+S7Q5mUAFO2PAjj7gbdyPK/yTYCE2rJzpmGbzbS9bMsXapTDwGZMxnu
 H48rSg/w9Q5MBLlq08dG+TYqQ+VCDxmkAJqoPI6B2TjbAPQ6ekeEAvQSthBPANbcGM2q
 e5qTQrGmc6mhOYronuHXEWE+jFH98e/0oNssq9KxYehXubMImcsRhLf9L3n+fdEz9ECd
 OiHg==
X-Gm-Message-State: AOAM530HZkyu3atCVdarbRZXIDapp9Fm+2jiJrcau/ZK3jHSR5hnXky5
 2HeEwO51HHZJ2/hTKjDeeCnNceGe2GAb3sotHCs=
X-Google-Smtp-Source: ABdhPJyAfmYD5keebxx1x9KsltXD5VO5H58O/8/3hmSGBDW75oxpHCuPlZ/lboZXMjTe9jpV84rZW0sfR9AQ5TFF77g=
X-Received: by 2002:a05:6830:1f0a:: with SMTP id
 u10mr2227971otg.181.1624352071148; 
 Tue, 22 Jun 2021 01:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210616104349.2398060-1-f4bug@amsat.org>
 <20210617095614.jh5vkrzc65d5xrui@sirius.home.kraxel.org>
In-Reply-To: <20210617095614.jh5vkrzc65d5xrui@sirius.home.kraxel.org>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Tue, 22 Jun 2021 16:54:19 +0800
Message-ID: <CAAKa2jk6gfWbMsfB3uZ4HqgS5Z_BqxhUN-dYK51OC2NwYad49Q@mail.gmail.com>
Subject: Re: [PATCH v2] hw/audio/sb16: Avoid assertion by restricting I/O
 sampling rate range
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=cyruscyliu@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi folks,

With this patch, having tested more, I find another way to trigger the
assertion.
I found it just now such that I did a quick investigation and reported
it to you. I
hope this would prevent merging this patch.

Brief analysis:
This existing patch limits s->freq in dma_cmd8 before continue_dma8 followe=
d
by AUD_open_out. It's good to prevent the flow by this path. However, we ca=
n
directly call continue_dma8 via command 0xd4 but there is no limit check th=
ere.

To trigger this assertion, we can manipulate s->freq in the following way.
1. dsp_write, offset=3D0xc, val=3D0x41
Because s->needed_bytes =3D 0, command() is called.
```
case 0x41:
    s->freq =3D -1;
    s->time_const =3D -1;
    s->needed_bytes =3D 2; // look at here
...
s->cmd =3D cmd; // 0x41, and here
```

2. dsp_write, offset=3D0xc, val=3D0x14
Because s->needed_bytes =3D 2, complete() is called.
```
s->in2_data[s->in_index++] =3D 0x14; // remembere this
s->needed_bytes =3D 0
```
Because s->cmd =3D 0x41, s->freq will be reset.
```
case 0x41:
case 0x42:
    s->freq =3D dsp_get_hilo (s);
                    // return s->in2_data[--s->in_index]
                    // s->freq will be 0x14, there is no check ...
```

3. dsp_write, offset=3D0xc, val=3D0xd4
Call continue_dma8 directly then we can trigger this assertion because
s->freq is too small.

Maybe we can fix this flaw by adding s->freq check after s->freq =3D
dsp_get_hilo (s) in the second step?

Best,
Qiang

On Thu, Jun 17, 2021 at 5:56 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Jun 16, 2021 at 12:43:49PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > While the SB16 seems to work up to 48000 Hz, the "Sound Blaster Series
> > Hardware Programming Guide" limit the sampling range from 4000 Hz to
> > 44100 Hz (Section 3-9, 3-10: Digitized Sound I/O Programming, tables
> > 3-2 and 3-3).
> >
> > Later, section 6-15 (DSP Commands) is more specific regarding the 41h /
> > 42h registers (Set digitized sound output sampling rate):
> >
> >   Valid sampling rates range from 5000 to 45000 Hz inclusive.
> >
> > There is no comment regarding error handling if the register is filled
> > with an out-of-range value.  (See also section 3-28 "8-bit or 16-bit
> > Auto-initialize Transfer"). Assume limits are enforced in hardware.
> >
> > This fixes triggering an assertion in audio_calloc():
> >
> >   #1 abort
> >   #2 audio_bug audio/audio.c:119:9
> >   #3 audio_calloc audio/audio.c:154:9
> >   #4 audio_pcm_sw_alloc_resources_out audio/audio_template.h:116:15
> >   #5 audio_pcm_sw_init_out audio/audio_template.h:175:11
> >   #6 audio_pcm_create_voice_pair_out audio/audio_template.h:410:9
> >   #7 AUD_open_out audio/audio_template.h:503:14
> >   #8 continue_dma8 hw/audio/sb16.c:216:20
> >   #9 dma_cmd8 hw/audio/sb16.c:276:5
> >   #10 command hw/audio/sb16.c:0
> >   #11 dsp_write hw/audio/sb16.c:949:13
> >   #12 portio_write softmmu/ioport.c:205:13
> >   #13 memory_region_write_accessor softmmu/memory.c:491:5
> >   #14 access_with_adjusted_size softmmu/memory.c:552:18
> >   #15 memory_region_dispatch_write softmmu/memory.c:0:13
> >   #16 flatview_write_continue softmmu/physmem.c:2759:23
> >   #17 flatview_write softmmu/physmem.c:2799:14
> >   #18 address_space_write softmmu/physmem.c:2891:18
> >   #19 cpu_outw softmmu/ioport.c:70:5
> >
> > [*] http://www.baudline.com/solutions/full_duplex/sb16_pci/index.html
> >
> > Fixes: 85571bc7415 ("audio merge (malc)")
> > Buglink: https://bugs.launchpad.net/bugs/1910603
> > OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=
=3D29174
> > Tested-by: Qiang Liu <cyruscyliu@gmail.com>
> > Reviewed-by: Qiang Liu <cyruscyliu@gmail.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Added to audio queue.
>
> thanks,
>   Gerd
>

