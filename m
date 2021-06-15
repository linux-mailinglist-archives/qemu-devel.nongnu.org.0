Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8281B3A81CD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:05:44 +0200 (CEST)
Received: from localhost ([::1]:57518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9hH-0007t5-As
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lt9M6-0004XN-Lf
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:43:51 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:46056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lt9M4-0005Hp-86
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:43:50 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 6-20020a9d07860000b02903e83bf8f8fcso14275657oto.12
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nA8Xo6aG1+O5e/dFgDsGyPegGsbpYCmY/qGRePoYzVA=;
 b=WABrEa8qsYwOqUiedXVpvZQ54+TSeQgJSDGsblC3lz5XStjtewYQrqOgIxSOryNqhd
 F/grhxPMDAkerLxBw87q8ELmCcrIGpLWAe/kVN/1bDchiA2JOQnb4oSigifO0nAs1FOa
 SWjaSMFs3iyjXh59JuM2BPB6SzDHN251BB/7nnwskxwbePvNy8c3X10fFd47SYzT1RqK
 2p5jyFG49/xO5IKqI9BZXuGDT294lUwPdyfCR+st/6yRQzM6vxH9vDCFdzZsOYJONaEp
 Yb+dVlbAifavGxy/PDKZmmD0RDzqIEnD0xE9npNZ/PHX7btUrFMQzQNNySJoW9Z+4iEM
 0E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nA8Xo6aG1+O5e/dFgDsGyPegGsbpYCmY/qGRePoYzVA=;
 b=I//6SKTgQWVRWXfSNkEYCnlcp0blB08MX6/NidNmgukZ7S+FfydI4LO6KOqcn7WzTj
 UoDQY84sR6ktl1B65ZTOTt6cQr3JMClW16jFn0jmyiowTyj0eApEz9l2ufKoCvhlAHPw
 yfSJdvqeCtca9zyfsT8fDiNpDjRe5hj5kBILsb4598vLrtOvy9XN2MWiqj27BAZ2hQZM
 4Dunw/WGRI/I4FqOqJdwMcryLBxDizjKOWLlmur902VUWLd2gF2bqqC084D6AU14mdt9
 MbQsy2o0mryhtb//q/5AyRZHso36LWOZVC8CRsV4mCLteoPO1M84RZSsvO+E4L1HJJmg
 97sg==
X-Gm-Message-State: AOAM533dsw/7bywAhl6Mq2fBV34+Syu06CKVHQBOZQY+lcnuyDsWVfaU
 cA6CbqQWLMg6QjFP17NchfRMy0SlX2dE3XCle8M=
X-Google-Smtp-Source: ABdhPJx8eL6xjtnQ9lZAkJavCXVApUekA3vYF/FAeGkr5Nq6EYaCERQzxyp5SIiwzFA1OeLCVPqbyNVmjnXWlmINl8Q=
X-Received: by 2002:a9d:3e5:: with SMTP id f92mr17867893otf.181.1623764624647; 
 Tue, 15 Jun 2021 06:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210601151813.2059996-1-f4bug@amsat.org>
 <b755adfe-5fbe-affb-cc1b-5b4cb377b715@amsat.org>
 <CAAKa2jnvoSqQhpcbgpfXHhdPkERD+92DP4zjKAYCQih-cOrxTA@mail.gmail.com>
 <7c9dcdde-2919-c8ee-bccd-91ff110454f4@amsat.org>
In-Reply-To: <7c9dcdde-2919-c8ee-bccd-91ff110454f4@amsat.org>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Tue, 15 Jun 2021 21:43:31 +0800
Message-ID: <CAAKa2j=Uc=oDMLD6z+mPUcAQQ6Hbvox4AwuFGun_Ukj8EopXHA@mail.gmail.com>
Subject: Re: [PATCH] hw/audio/sb16: Avoid assertion by restricting I/O
 sampling rate range
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=cyruscyliu@gmail.com; helo=mail-ot1-x32c.google.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 14, 2021 at 11:06 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 6/14/21 2:11 PM, Qiang Liu wrote:
> > Hi Phil,
> >
> > Thanks for inviting me. I've applied your patch. It seems fine
> > because my sb16 fuzzer is running for another 24 hours and
> > it has no crash yet.
>
> Thanks for testing!
>
> Can we use your "Tested-by: Qiang Liu <cyruscyliu@gmail.com>" tag?
Yes. My sb16 fuzzer has no crash yet after 24h, so I think the patch is goo=
d.

> > I can also double-check the specification.
>
> If you do, please send a "Reviewed-by: Qiang Liu <cyruscyliu@gmail.com>"
> tag :)
Yes, I did. I agree to follow the specific frequency limit regarding
the 41h/42h registers.
> >>>   Valid sampling rates range from 5000 to 45000 Hz inclusive.

Should I send this patch with tag V2?

> > Best,
> > Qiang
> >
> > On Mon, Jun 14, 2021 at 7:13 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>
> >> ping?
> >>
> >> On 6/1/21 5:18 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> While the SB16 seems to work up to 48000 Hz, the "Sound Blaster Serie=
s
> >>> Hardware Programming Guide" limit the sampling range from 4000 Hz to
> >>> 44100 Hz (Section 3-9, 3-10: Digitized Sound I/O Programming, tables
> >>> 3-2 and 3-3).
> >>>
> >>> Later, section 6-15 (DSP Commands) is more specific regarding the 41h=
 /
> >>> 42h registers (Set digitized sound output sampling rate):
> >>>
> >>>   Valid sampling rates range from 5000 to 45000 Hz inclusive.
> >>>
> >>> There is no comment regarding error handling if the register is fille=
d
> >>> with an out-of-range value.  (See also section 3-28 "8-bit or 16-bit
> >>> Auto-initialize Transfer"). Assume limits are enforced in hardware.
> >>>
> >>> This fixes triggering an assertion in audio_calloc():
> >>>
> >>>   #1 abort
> >>>   #2 audio_bug audio/audio.c:119:9
> >>>   #3 audio_calloc audio/audio.c:154:9
> >>>   #4 audio_pcm_sw_alloc_resources_out audio/audio_template.h:116:15
> >>>   #5 audio_pcm_sw_init_out audio/audio_template.h:175:11
> >>>   #6 audio_pcm_create_voice_pair_out audio/audio_template.h:410:9
> >>>   #7 AUD_open_out audio/audio_template.h:503:14
> >>>   #8 continue_dma8 hw/audio/sb16.c:216:20
> >>>   #9 dma_cmd8 hw/audio/sb16.c:276:5
> >>>   #10 command hw/audio/sb16.c:0
> >>>   #11 dsp_write hw/audio/sb16.c:949:13
> >>>   #12 portio_write softmmu/ioport.c:205:13
> >>>   #13 memory_region_write_accessor softmmu/memory.c:491:5
> >>>   #14 access_with_adjusted_size softmmu/memory.c:552:18
> >>>   #15 memory_region_dispatch_write softmmu/memory.c:0:13
> >>>   #16 flatview_write_continue softmmu/physmem.c:2759:23
> >>>   #17 flatview_write softmmu/physmem.c:2799:14
> >>>   #18 address_space_write softmmu/physmem.c:2891:18
> >>>   #19 cpu_outw softmmu/ioport.c:70:5
> >>>
> >>> [*] http://www.baudline.com/solutions/full_duplex/sb16_pci/index.html
> >>>
> >>> Fixes: 85571bc7415 ("audio merge (malc)")
> >>> Buglink: https://bugs.launchpad.net/bugs/1910603
> >>> OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?i=
d=3D29174
> >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>> ---
> >>>  hw/audio/sb16.c              | 14 ++++++++++
> >>>  tests/qtest/fuzz-sb16-test.c | 52 ++++++++++++++++++++++++++++++++++=
++
> >>>  MAINTAINERS                  |  1 +
> >>>  tests/qtest/meson.build      |  1 +
> >>>  4 files changed, 68 insertions(+)
> >>>  create mode 100644 tests/qtest/fuzz-sb16-test.c
> >>>
> >>> diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
> >>> index 8b207004102..5cf121fe363 100644
> >>> --- a/hw/audio/sb16.c
> >>> +++ b/hw/audio/sb16.c
> >>> @@ -115,6 +115,9 @@ struct SB16State {
> >>>      PortioList portio_list;
> >>>  };
> >>>
> >>> +#define SAMPLE_RATE_MIN 5000
> >>> +#define SAMPLE_RATE_MAX 45000
> >>> +
> >>>  static void SB_audio_callback (void *opaque, int free);
> >>>
> >>>  static int magic_of_irq (int irq)
> >>> @@ -241,6 +244,17 @@ static void dma_cmd8 (SB16State *s, int mask, in=
t dma_len)
> >>>          int tmp =3D (256 - s->time_const);
> >>>          s->freq =3D (1000000 + (tmp / 2)) / tmp;
> >>>      }
> >>> +    if (s->freq < SAMPLE_RATE_MIN) {
> >>> +        qemu_log_mask(LOG_GUEST_ERROR,
> >>> +                      "sampling range too low: %d, increasing to %u\=
n",
> >>> +                      s->freq, SAMPLE_RATE_MIN);
> >>> +        s->freq =3D SAMPLE_RATE_MIN;
> >>> +    } else if (s->freq > SAMPLE_RATE_MAX) {
> >>> +        qemu_log_mask(LOG_GUEST_ERROR,
> >>> +                      "sampling range too high: %d, decreasing to %u=
\n",
> >>> +                      s->freq, SAMPLE_RATE_MAX);
> >>> +        s->freq =3D SAMPLE_RATE_MAX;
> >>> +    }
> >>>
> >>>      if (dma_len !=3D -1) {
> >>>          s->block_size =3D dma_len << s->fmt_stereo;
> >>> diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-tes=
t.c
> >>> new file mode 100644
> >>> index 00000000000..51030cd7dc4
> >>> --- /dev/null
> >>> +++ b/tests/qtest/fuzz-sb16-test.c
> >>> @@ -0,0 +1,52 @@
> >>> +/*
> >>> + * QTest fuzzer-generated testcase for sb16 audio device
> >>> + *
> >>> + * Copyright (c) 2021 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>> + *
> >>> + * SPDX-License-Identifier: GPL-2.0-or-later
> >>> + */
> >>> +
> >>> +#include "qemu/osdep.h"
> >>> +#include "libqos/libqtest.h"
> >>> +
> >>> +/*
> >>> + * This used to trigger the assert in audio_calloc
> >>> + * https://bugs.launchpad.net/qemu/+bug/1910603
> >>> + */
> >>> +static void test_fuzz_sb16_0x1c(void)
> >>> +{
> >>> +    QTestState *s =3D qtest_init("-M q35 -display none "
> >>> +                               "-device sb16,audiodev=3Dsnd0 "
> >>> +                               "-audiodev none,id=3Dsnd0");
> >>> +    qtest_outw(s, 0x22c, 0x41);
> >>> +    qtest_outb(s, 0x22c, 0x00);
> >>> +    qtest_outw(s, 0x22c, 0x1004);
> >>> +    qtest_outw(s, 0x22c, 0x001c);
> >>> +    qtest_quit(s);
> >>> +}
> >>> +
> >>> +static void test_fuzz_sb16_0x91(void)
> >>> +{
> >>> +    QTestState *s =3D qtest_init("-M pc -display none "
> >>> +                               "-device sb16,audiodev=3Dnone "
> >>> +                               "-audiodev id=3Dnone,driver=3Dnone");
> >>> +    qtest_outw(s, 0x22c, 0xf141);
> >>> +    qtest_outb(s, 0x22c, 0x00);
> >>> +    qtest_outb(s, 0x22c, 0x24);
> >>> +    qtest_outb(s, 0x22c, 0x91);
> >>> +    qtest_quit(s);
> >>> +}
> >>> +
> >>> +int main(int argc, char **argv)
> >>> +{
> >>> +    const char *arch =3D qtest_get_arch();
> >>> +
> >>> +    g_test_init(&argc, &argv, NULL);
> >>> +
> >>> +   if (strcmp(arch, "i386") =3D=3D 0) {
> >>> +        qtest_add_func("fuzz/test_fuzz_sb16/1c", test_fuzz_sb16_0x1c=
);
> >>> +        qtest_add_func("fuzz/test_fuzz_sb16/91", test_fuzz_sb16_0x91=
);
> >>> +   }
> >>> +
> >>> +   return g_test_run();
> >>> +}
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 5f55404f2fa..7edb26d2293 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -2213,6 +2213,7 @@ F: qapi/audio.json
> >>>  F: tests/qtest/ac97-test.c
> >>>  F: tests/qtest/es1370-test.c
> >>>  F: tests/qtest/intel-hda-test.c
> >>> +F: tests/qtest/fuzz-sb16-test.c
> >>>
> >>>  Block layer core
> >>>  M: Kevin Wolf <kwolf@redhat.com>
> >>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> >>> index c3a223a83d6..b03e8541700 100644
> >>> --- a/tests/qtest/meson.build
> >>> +++ b/tests/qtest/meson.build
> >>> @@ -20,6 +20,7 @@
> >>>  qtests_generic =3D \
> >>>    (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-me=
gasas-test'] : []) + \
> >>>    (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-=
scsi-test'] : []) + \
> >>> +  (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : =
[]) + \
> >>>    [
> >>>    'cdrom-test',
> >>>    'device-introspect-test',
> >>>
> >

