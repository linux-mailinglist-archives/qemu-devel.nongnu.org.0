Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9005A3A99CF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:00:37 +0200 (CEST)
Received: from localhost ([::1]:39090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltUDj-0007No-0n
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1ltUCP-0006hx-GU
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:59:14 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:44876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1ltUCL-0008OC-PH
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:59:13 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 q5-20020a9d66450000b02903f18d65089fso2174904otm.11
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RWwx/3wZkItehRlPhCi7yAPQqWDrTmWHAJ8kj+8//kI=;
 b=cKvnBkqMONEGOAVnL6v+VpmTyn6kV0d/tTxHCOMWeDm6l1j12UPlT8gC9oEMEvd1P4
 YUs2uLm48xZSEn2R0WCwG96tk61nndPc6J5H132TW2SedDq+SbpK+y9hYxdt9qhZ5S49
 /SvU6Ty/t4HP+30UFKCCZB3o90vuk5hOqUiuehDw8ILNEk+EBAHQDqqW+70lO+QGSwpP
 o7K3tl6FfcgklaBldB+/BdruetgwUAq1kfKt2ZlCGStj2nPe3IV1yTgREgOe6XFL7oub
 7VSrBPxUbEtEQwIXAEIiim07goxYU18es8T9uuE3hlWK+nlVc1yjWz5ck3SI+B0Dza02
 2e4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RWwx/3wZkItehRlPhCi7yAPQqWDrTmWHAJ8kj+8//kI=;
 b=ir0IJru4m7PQW+1CKXmYV3Loir2Q7OIKdHRbj5NNc4w2Flgd0U1N7vCuiUKUVa6m/j
 ev5aYfXDbrJZru24t5uD5gnbFqhFHAR1IY/H1A2rUlRttviHCn6hLsX3qNQU6lC3wbRv
 uBOvc0mZQLENoQejCeRbDnBZjyMBgsW3ZxfzESOv4kx+25n7IlWizvbb3ekZRo9+O158
 0Rv1C1DwHkHUjH9P3ZYslCiWZlhmYMGk0sBqkYuY8JbDOC5J7PIRVT81Md+UxpqrIk68
 RQjqT1Vce1LoWxI9Hrg2mxKfZo4RoQ3wQLflr7JueXSXfV8kwARhk7TOBw25fFJcjLq+
 yG8A==
X-Gm-Message-State: AOAM532KkSbSFXzwmhDk6QEWr+V7JWuiQ/lNVa8kPHPJPycBt3VAGeGZ
 0t9u5Z7H//vGdw4C2l0sWOQ7EFogHL2NXH0PIH4=
X-Google-Smtp-Source: ABdhPJxX5TbMtUTCgoDD1E9IByqDle/pryLKrRu2IPNUfu5gpCAnDqbM7oORjQLNxDX8FDoCnwDoSBIgtGsT+nMteqY=
X-Received: by 2002:a05:6830:1d1:: with SMTP id
 r17mr3930359ota.5.1623844748433; 
 Wed, 16 Jun 2021 04:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210616104349.2398060-1-f4bug@amsat.org>
In-Reply-To: <20210616104349.2398060-1-f4bug@amsat.org>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Wed, 16 Jun 2021 19:58:56 +0800
Message-ID: <CAAKa2j=au0tnqPg8iPB7e3SHNZVL+RO9xb7=u6aszUWRiSC0Ew@mail.gmail.com>
Subject: Re: [PATCH v2] hw/audio/sb16: Avoid assertion by restricting I/O
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thx. I learned a lot about contributing to QEMU from this discussion!

Best,
Qiang

On Wed, Jun 16, 2021 at 6:43 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> While the SB16 seems to work up to 48000 Hz, the "Sound Blaster Series
> Hardware Programming Guide" limit the sampling range from 4000 Hz to
> 44100 Hz (Section 3-9, 3-10: Digitized Sound I/O Programming, tables
> 3-2 and 3-3).
>
> Later, section 6-15 (DSP Commands) is more specific regarding the 41h /
> 42h registers (Set digitized sound output sampling rate):
>
>   Valid sampling rates range from 5000 to 45000 Hz inclusive.
>
> There is no comment regarding error handling if the register is filled
> with an out-of-range value.  (See also section 3-28 "8-bit or 16-bit
> Auto-initialize Transfer"). Assume limits are enforced in hardware.
>
> This fixes triggering an assertion in audio_calloc():
>
>   #1 abort
>   #2 audio_bug audio/audio.c:119:9
>   #3 audio_calloc audio/audio.c:154:9
>   #4 audio_pcm_sw_alloc_resources_out audio/audio_template.h:116:15
>   #5 audio_pcm_sw_init_out audio/audio_template.h:175:11
>   #6 audio_pcm_create_voice_pair_out audio/audio_template.h:410:9
>   #7 AUD_open_out audio/audio_template.h:503:14
>   #8 continue_dma8 hw/audio/sb16.c:216:20
>   #9 dma_cmd8 hw/audio/sb16.c:276:5
>   #10 command hw/audio/sb16.c:0
>   #11 dsp_write hw/audio/sb16.c:949:13
>   #12 portio_write softmmu/ioport.c:205:13
>   #13 memory_region_write_accessor softmmu/memory.c:491:5
>   #14 access_with_adjusted_size softmmu/memory.c:552:18
>   #15 memory_region_dispatch_write softmmu/memory.c:0:13
>   #16 flatview_write_continue softmmu/physmem.c:2759:23
>   #17 flatview_write softmmu/physmem.c:2799:14
>   #18 address_space_write softmmu/physmem.c:2891:18
>   #19 cpu_outw softmmu/ioport.c:70:5
>
> [*] http://www.baudline.com/solutions/full_duplex/sb16_pci/index.html
>
> Fixes: 85571bc7415 ("audio merge (malc)")
> Buglink: https://bugs.launchpad.net/bugs/1910603
> OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D=
29174
> Tested-by: Qiang Liu <cyruscyliu@gmail.com>
> Reviewed-by: Qiang Liu <cyruscyliu@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2: Added Qiang Liu's T-b/R-b tags =C2=AF\_(=E3=83=84)_/=C2=AF
> ---
>  hw/audio/sb16.c              | 14 ++++++++++
>  tests/qtest/fuzz-sb16-test.c | 52 ++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                  |  1 +
>  tests/qtest/meson.build      |  1 +
>  4 files changed, 68 insertions(+)
>  create mode 100644 tests/qtest/fuzz-sb16-test.c
>
> diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
> index 8b207004102..5cf121fe363 100644
> --- a/hw/audio/sb16.c
> +++ b/hw/audio/sb16.c
> @@ -115,6 +115,9 @@ struct SB16State {
>      PortioList portio_list;
>  };
>
> +#define SAMPLE_RATE_MIN 5000
> +#define SAMPLE_RATE_MAX 45000
> +
>  static void SB_audio_callback (void *opaque, int free);
>
>  static int magic_of_irq (int irq)
> @@ -241,6 +244,17 @@ static void dma_cmd8 (SB16State *s, int mask, int dm=
a_len)
>          int tmp =3D (256 - s->time_const);
>          s->freq =3D (1000000 + (tmp / 2)) / tmp;
>      }
> +    if (s->freq < SAMPLE_RATE_MIN) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "sampling range too low: %d, increasing to %u\n",
> +                      s->freq, SAMPLE_RATE_MIN);
> +        s->freq =3D SAMPLE_RATE_MIN;
> +    } else if (s->freq > SAMPLE_RATE_MAX) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "sampling range too high: %d, decreasing to %u\n",
> +                      s->freq, SAMPLE_RATE_MAX);
> +        s->freq =3D SAMPLE_RATE_MAX;
> +    }
>
>      if (dma_len !=3D -1) {
>          s->block_size =3D dma_len << s->fmt_stereo;
> diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-test.c
> new file mode 100644
> index 00000000000..51030cd7dc4
> --- /dev/null
> +++ b/tests/qtest/fuzz-sb16-test.c
> @@ -0,0 +1,52 @@
> +/*
> + * QTest fuzzer-generated testcase for sb16 audio device
> + *
> + * Copyright (c) 2021 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqos/libqtest.h"
> +
> +/*
> + * This used to trigger the assert in audio_calloc
> + * https://bugs.launchpad.net/qemu/+bug/1910603
> + */
> +static void test_fuzz_sb16_0x1c(void)
> +{
> +    QTestState *s =3D qtest_init("-M q35 -display none "
> +                               "-device sb16,audiodev=3Dsnd0 "
> +                               "-audiodev none,id=3Dsnd0");
> +    qtest_outw(s, 0x22c, 0x41);
> +    qtest_outb(s, 0x22c, 0x00);
> +    qtest_outw(s, 0x22c, 0x1004);
> +    qtest_outw(s, 0x22c, 0x001c);
> +    qtest_quit(s);
> +}
> +
> +static void test_fuzz_sb16_0x91(void)
> +{
> +    QTestState *s =3D qtest_init("-M pc -display none "
> +                               "-device sb16,audiodev=3Dnone "
> +                               "-audiodev id=3Dnone,driver=3Dnone");
> +    qtest_outw(s, 0x22c, 0xf141);
> +    qtest_outb(s, 0x22c, 0x00);
> +    qtest_outb(s, 0x22c, 0x24);
> +    qtest_outb(s, 0x22c, 0x91);
> +    qtest_quit(s);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    const char *arch =3D qtest_get_arch();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +   if (strcmp(arch, "i386") =3D=3D 0) {
> +        qtest_add_func("fuzz/test_fuzz_sb16/1c", test_fuzz_sb16_0x1c);
> +        qtest_add_func("fuzz/test_fuzz_sb16/91", test_fuzz_sb16_0x91);
> +   }
> +
> +   return g_test_run();
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7d9cd290426..d619ea8fcd1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2221,6 +2221,7 @@ F: qapi/audio.json
>  F: tests/qtest/ac97-test.c
>  F: tests/qtest/es1370-test.c
>  F: tests/qtest/intel-hda-test.c
> +F: tests/qtest/fuzz-sb16-test.c
>
>  Block layer core
>  M: Kevin Wolf <kwolf@redhat.com>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c3a223a83d6..b03e8541700 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -20,6 +20,7 @@
>  qtests_generic =3D \
>    (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasa=
s-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi=
-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) =
+ \
>    [
>    'cdrom-test',
>    'device-introspect-test',
> --
> 2.31.1
>

