Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A46A192E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:54:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVUmK-0003Bi-JR; Fri, 24 Feb 2023 04:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVUmH-0003BP-Ak; Fri, 24 Feb 2023 04:54:09 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVUmE-0007jb-41; Fri, 24 Feb 2023 04:54:08 -0500
Received: by mail-ed1-x52e.google.com with SMTP id ee7so37500215edb.2;
 Fri, 24 Feb 2023 01:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3djmWwypAlEVZJNZ8zGMVNCDWRPmJ+SJo0LmWXhiGUU=;
 b=BRVA9BjOHBHT/0UQfHWLeEzFmDpjamqgDjlfwj6eYQZdySn1QaYEF4Kux6CyBciVAJ
 b1F1PAaTJvw8hbU8dXHoNvjj+yszwp0rgDDKb1fCO0hTXHwaDQcf/wpLBCmpCY1i4FWS
 lA9tRITEm99dGSLSFgsPkAFNWTaEPzLKhxuEUFbGnluF99fEg36Bd95SxWPQ+jmoFBqU
 1ptUACYN9xTbRx1vSY47Jn+96DwI7Fv4Hen/51DCB53mbHQluQNre75j4BYsILCNeRaT
 ZFTQmH+wcLUqXlb2xaJmqd0s/5MTpyPsHoS0MKblDwb5TY1ur50H6r9KZwSwEbLqfOUo
 +NfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3djmWwypAlEVZJNZ8zGMVNCDWRPmJ+SJo0LmWXhiGUU=;
 b=k3ZEb+a68ee4G49GxRvvZ3YLd6yip3rE/N6ik9x+49VPlHHdJxAbR5v+VMuh992Tec
 Wg5LUd/i9maLGA1OTpQnBtNV0eTZ5qSBtU97ww4kEDZ1lC/++HZLu/a7mTF4BTwDgLR9
 q9dyVqQPgyhImNAKr4NjM6/TsnSvx4FxvmFW8pPKwaFtb3Qe7YsaGDZTKPZIl98KbNGw
 IzdpF2s8+P0Ab/8ak26kKTwtmjFTChzplwcEPP2YyvdrwyGpblI4M0pVqPmwxICR1Kz5
 YlooTJs6X+TN5I9zxKAroVeocCJEZvittMCfea18NQWx0bV77z/9BjDb/BMN3Wph0/Xq
 URAg==
X-Gm-Message-State: AO0yUKUFQjDxixu7amPEUWtnTlRR8i5zO0MhujJPXHGfd/IW4GfgqyLj
 qGKjp4KvCXf9jeia5/aEZ2o=
X-Google-Smtp-Source: AK7set8D6lJXo5Wxm1XigCL916Zx1tjOwtLSMdiUamaNiWl2eQBJSoc5rwlWPdGv510LKNmvJcDfgg==
X-Received: by 2002:a17:906:86d4:b0:87b:3d29:2982 with SMTP id
 j20-20020a17090686d400b0087b3d292982mr22665255ejy.11.1677232443735; 
 Fri, 24 Feb 2023 01:54:03 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf06ee00e8d7373f8159d5bb.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:e8d7:373f:8159:d5bb])
 by smtp.gmail.com with ESMTPSA id
 um8-20020a170907cb0800b008cca31606a8sm6774627ejc.51.2023.02.24.01.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 01:54:03 -0800 (PST)
Date: Fri, 24 Feb 2023 09:53:57 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
CC: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@redhat.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_5/5=5D_hw/audio/via-ac97=3A_B?=
 =?US-ASCII?Q?asic_implementation_of_audio_playback?=
In-Reply-To: <89f85024-6057-f0a8-3d4a-20eeaeec8878@t-online.de>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <f84b42b8e811c6a0ddb23139fdfd654c8cc4f09c.1677004415.git.balaton@eik.bme.hu>
 <89f85024-6057-f0a8-3d4a-20eeaeec8878@t-online.de>
Message-ID: <DF35DA6B-ED6A-43E3-A28E-7936560B6452@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 23=2E Februar 2023 19:40:03 UTC schrieb "Volker R=C3=BCmelin" <vr_qemu@=
t-online=2Ede>:
>Am 21=2E02=2E23 um 19:44 schrieb BALATON Zoltan:
>> This adds basic implementation of the AC'97 sound part used in VIA
>> south bridge chips=2E Not all features of the device is emulated, only
>> one playback channel is supported but this is enough to get sound
>> output from some guests running on machines using this device such as
>> pegasos2=2E
>>=20
>> Signed-off-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>
>> ---
>>   hw/audio/trace-events     |   6 +
>>   hw/audio/via-ac97=2Ec       | 436 +++++++++++++++++++++++++++++++++++=
++-
>>   hw/isa/vt82c686=2Ec         |   3 +-
>>   include/hw/isa/vt82c686=2Eh |  26 +++
>>   4 files changed, 466 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/hw/audio/trace-events b/hw/audio/trace-events
>> index e0e71cd9b1=2E=2E6eccdaa4b5 100644
>> --- a/hw/audio/trace-events
>> +++ b/hw/audio/trace-events
>> @@ -11,3 +11,9 @@ hda_audio_running(const char *stream, int nr, bool ru=
nning) "st %s, nr %d, run %
>>   hda_audio_format(const char *stream, int chan, const char *fmt, int f=
req) "st %s, %d x %s @ %d Hz"
>>   hda_audio_adjust(const char *stream, int pos) "st %s, pos %d"
>>   hda_audio_overrun(const char *stream) "st %s"
>> +
>> +#via-ac97=2Ec
>> +via_ac97_codec_write(uint8_t addr, uint16_t val) "0x%x <- 0x%x"
>> +via_ac97_sgd_fetch(uint32_t addr, char stop, char eol, char flag, uint=
32_t len) "addr=3D0x%x %c%c%c len=3D%d"
>> +via_ac97_sgd_read(uint64_t addr, unsigned size, uint64_t val) "0x%"PRI=
x64" %d -> 0x%"PRIx64
>> +via_ac97_sgd_write(uint64_t addr, unsigned size, uint64_t val) "0x%"PR=
Ix64" %d <- 0x%"PRIx64
>> diff --git a/hw/audio/via-ac97=2Ec b/hw/audio/via-ac97=2Ec
>> index d1a856f63d=2E=2Ecdac5bc14b 100644
>> --- a/hw/audio/via-ac97=2Ec
>> +++ b/hw/audio/via-ac97=2Ec
>> @@ -1,39 +1,467 @@
>>   /*
>>    * VIA south bridges sound support
>>    *
>> + * Copyright (c) 2022-2023 BALATON Zoltan
>> + *
>>    * This work is licensed under the GNU GPL license version 2 or later=
=2E
>>    */
>>     /*
>> - * TODO: This is entirely boiler plate just registering empty PCI devi=
ces
>> - * with the right ID guests expect, functionality should be added here=
=2E
>> + * TODO: This is only a basic implementation of one audio playback cha=
nnel
>> + *       more functionality should be added here=2E
>>    */
>>     #include "qemu/osdep=2Eh"
>> +#include "qemu/log=2Eh"
>>   #include "hw/isa/vt82c686=2Eh"
>> -#include "hw/pci/pci_device=2Eh"
>> +#include "ac97=2Eh"
>> +#include "trace=2Eh"
>> +
>> +#define CLEN_IS_EOL(x)  ((x)->clen & BIT(31))
>> +#define CLEN_IS_FLAG(x) ((x)->clen & BIT(30))
>> +#define CLEN_IS_STOP(x) ((x)->clen & BIT(29))
>> +#define CLEN_LEN(x)     ((x)->clen & 0xfff)
>
>Hi,
>
>the CLEN_LEN mask is 0xffffff instead of 0xfff=2E The SGD Table Base Coun=
t has 24 bits=2E

This fixes sound for a x86 Linux guest on my pc-via branch=2E

Best regards,
Bernhard

>
>With best regards,
>Volker
>
>> +
>> +#define STAT_ACTIVE BIT(7)
>> +#define STAT_PAUSED BIT(6)
>> +#define STAT_TRIG   BIT(3)
>> +#define STAT_STOP   BIT(2)
>> +#define STAT_EOL    BIT(1)
>> +#define STAT_FLAG   BIT(0)
>> +
>> +#define CNTL_START  BIT(7)
>> +#define CNTL_TERM   BIT(6)
>> +#define CNTL_PAUSE  BIT(3)
>> +
>> +static void open_voice_out(ViaAC97State *s);
>> +
>> +static uint16_t codec_rates[] =3D { 8000, 11025, 16000, 22050, 32000, =
44100,
>> +                                  48000 };
>> +
>> +#define CODEC_REG(s, o)  ((s)->codec_regs[(o) / 2])
>> +#define CODEC_VOL(vol, mask)  ((255 * ((vol) & mask)) / mask)
>> +
>> +static void codec_volume_set_out(ViaAC97State *s)
>> +{
>> +    int lvol, rvol, mute;
>> +
>> +    lvol =3D 255 - CODEC_VOL(CODEC_REG(s, AC97_Master_Volume_Mute) >> =
8, 0x1f);
>> +    lvol *=3D 255 - CODEC_VOL(CODEC_REG(s, AC97_PCM_Out_Volume_Mute) >=
> 8, 0x1f);
>> +    lvol /=3D 255;
>> +    rvol =3D 255 - CODEC_VOL(CODEC_REG(s, AC97_Master_Volume_Mute), 0x=
1f);
>> +    rvol *=3D 255 - CODEC_VOL(CODEC_REG(s, AC97_PCM_Out_Volume_Mute), =
0x1f);
>> +    rvol /=3D 255;
>> +    mute =3D CODEC_REG(s, AC97_Master_Volume_Mute) >> MUTE_SHIFT;
>> +    mute |=3D CODEC_REG(s, AC97_PCM_Out_Volume_Mute) >> MUTE_SHIFT;
>> +    AUD_set_volume_out(s->vo, mute, lvol, rvol);
>> +}
>> +
>> +static void codec_reset(ViaAC97State *s)
>> +{
>> +    memset(s->codec_regs, 0, sizeof(s->codec_regs));
>> +    CODEC_REG(s, AC97_Reset) =3D 0x6a90;
>> +    CODEC_REG(s, AC97_Master_Volume_Mute) =3D 0x8000;
>> +    CODEC_REG(s, AC97_Headphone_Volume_Mute) =3D 0x8000;
>> +    CODEC_REG(s, AC97_Master_Volume_Mono_Mute) =3D 0x8000;
>> +    CODEC_REG(s, AC97_Phone_Volume_Mute) =3D 0x8008;
>> +    CODEC_REG(s, AC97_Mic_Volume_Mute) =3D 0x8008;
>> +    CODEC_REG(s, AC97_Line_In_Volume_Mute) =3D 0x8808;
>> +    CODEC_REG(s, AC97_CD_Volume_Mute) =3D 0x8808;
>> +    CODEC_REG(s, AC97_Video_Volume_Mute) =3D 0x8808;
>> +    CODEC_REG(s, AC97_Aux_Volume_Mute) =3D 0x8808;
>> +    CODEC_REG(s, AC97_PCM_Out_Volume_Mute) =3D 0x8808;
>> +    CODEC_REG(s, AC97_Record_Gain_Mute) =3D 0x8000;
>> +    CODEC_REG(s, AC97_Powerdown_Ctrl_Stat) =3D 0x000f;
>> +    CODEC_REG(s, AC97_Extended_Audio_ID) =3D 0x0a05;
>> +    CODEC_REG(s, AC97_Extended_Audio_Ctrl_Stat) =3D 0x0400;
>> +    CODEC_REG(s, AC97_PCM_Front_DAC_Rate) =3D 48000;
>> +    CODEC_REG(s, AC97_PCM_LR_ADC_Rate) =3D 48000;
>> +    /* Sigmatel 9766 (STAC9766) */
>> +    CODEC_REG(s, AC97_Vendor_ID1) =3D 0x8384;
>> +    CODEC_REG(s, AC97_Vendor_ID2) =3D 0x7666;
>> +}
>> +
>> +static uint16_t codec_read(ViaAC97State *s, uint8_t addr)
>> +{
>> +    return CODEC_REG(s, addr);
>> +}
>> +
>> +static void codec_write(ViaAC97State *s, uint8_t addr, uint16_t val)
>> +{
>> +    trace_via_ac97_codec_write(addr, val);
>> +    switch (addr) {
>> +    case AC97_Reset:
>> +        codec_reset(s);
>> +        return;
>> +    case AC97_Master_Volume_Mute:
>> +    case AC97_PCM_Out_Volume_Mute:
>> +        if (addr =3D=3D AC97_Master_Volume_Mute) {
>> +            if (val & BIT(13)) {
>> +                val |=3D 0x1f00;
>> +            }
>> +            if (val & BIT(5)) {
>> +                val |=3D 0x1f;
>> +            }
>> +        }
>> +        CODEC_REG(s, addr) =3D val & 0x9f1f;
>> +        codec_volume_set_out(s);
>> +        return;
>> +    case AC97_Extended_Audio_Ctrl_Stat:
>> +        CODEC_REG(s, addr) &=3D ~EACS_VRA;
>> +        CODEC_REG(s, addr) |=3D val & EACS_VRA;
>> +        if (!(val & EACS_VRA)) {
>> +            CODEC_REG(s, AC97_PCM_Front_DAC_Rate) =3D 48000;
>> +            CODEC_REG(s, AC97_PCM_LR_ADC_Rate) =3D 48000;
>> +            open_voice_out(s);
>> +        }
>> +        return;
>> +    case AC97_PCM_Front_DAC_Rate:
>> +    case AC97_PCM_LR_ADC_Rate:
>> +        if (CODEC_REG(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
>> +            int i;
>> +            uint16_t rate =3D val;
>> +
>> +            for (i =3D 0; i < ARRAY_SIZE(codec_rates) - 1; i++) {
>> +                if (rate < codec_rates[i] +
>> +                    (codec_rates[i + 1] - codec_rates[i]) / 2) {
>> +                    rate =3D codec_rates[i];
>> +                    break;
>> +                }
>> +            }
>> +            if (rate > 48000) {
>> +                rate =3D 48000;
>> +            }
>> +            CODEC_REG(s, addr) =3D rate;
>> +            open_voice_out(s);
>> +        }
>> +        return;
>> +    case AC97_Powerdown_Ctrl_Stat:
>> +        CODEC_REG(s, addr) =3D (val & 0xff00) | (CODEC_REG(s, addr) & =
0xff);
>> +        return;
>> +    case AC97_Extended_Audio_ID:
>> +    case AC97_Vendor_ID1:
>> +    case AC97_Vendor_ID2:
>> +        /* Read only registers */
>> +        return;
>> +    default:
>> +        qemu_log_mask(LOG_UNIMP,
>> +                      "via-ac97: Unimplemented codec register 0x%x\n",=
 addr);
>> +        CODEC_REG(s, addr) =3D val;
>> +    }
>> +}
>> +
>> +static void fetch_sgd(ViaAC97SGDChannel *c, PCIDevice *d)
>> +{
>> +    uint32_t b[2];
>> +
>> +    if (c->curr < c->base) {
>> +        c->curr =3D c->base;
>> +    }
>> +    pci_dma_read(d, c->curr, b, sizeof(b));
>> +    c->addr =3D le32_to_cpu(b[0]);
>> +    c->clen =3D le32_to_cpu(b[1]);
>> +    trace_via_ac97_sgd_fetch(c->addr, CLEN_IS_STOP(c) ? 'S' : '-',
>> +                             CLEN_IS_EOL(c) ? 'E' : '-',
>> +                             CLEN_IS_FLAG(c) ? 'F' : '-', CLEN_LEN(c))=
;
>> +}
>> +
>> +static void out_cb(void *opaque, int avail)
>> +{
>> +    ViaAC97State *s =3D opaque;
>> +    ViaAC97SGDChannel *c =3D &s->aur;
>> +    int temp, to_copy, copied;
>> +    bool stop =3D false;
>> +    uint8_t tmpbuf[4096];
>> +
>> +    if (c->stat & STAT_PAUSED) {
>> +        return;
>> +    }
>> +    c->stat |=3D STAT_ACTIVE;
>> +    while (avail && !stop) {
>> +        if (!c->clen) {
>> +            fetch_sgd(c, &s->dev);
>> +        }
>> +        temp =3D MIN(CLEN_LEN(c), avail);
>> +        while (temp) {
>> +            to_copy =3D MIN(temp, sizeof(tmpbuf));
>> +            pci_dma_read(&s->dev, c->addr, tmpbuf, to_copy);
>> +            copied =3D AUD_write(s->vo, tmpbuf, to_copy);
>> +            if (!copied) {
>> +                stop =3D true;
>> +                break;
>> +            }
>> +            temp -=3D copied;
>> +            avail -=3D copied;
>> +            c->addr +=3D copied;
>> +            c->clen -=3D copied;
>> +        }
>> +        if (CLEN_LEN(c) =3D=3D 0) {
>> +            c->curr +=3D 8;
>> +            if (CLEN_IS_EOL(c)) {
>> +                c->stat |=3D STAT_EOL;
>> +                if (c->type & CNTL_START) {
>> +                    c->curr =3D c->base;
>> +                    c->stat |=3D STAT_PAUSED;
>> +                } else {
>> +                    c->stat &=3D ~STAT_ACTIVE;
>> +                    AUD_set_active_out(s->vo, 0);
>> +                }
>> +                if (c->type & STAT_EOL) {
>> +                    via_isa_set_irq(&s->dev, VIA_IRQ_AC97, 1);
>> +                }
>> +            }
>> +            if (CLEN_IS_FLAG(c)) {
>> +                c->stat |=3D STAT_FLAG;
>> +                c->stat |=3D STAT_PAUSED;
>> +                if (c->type & STAT_FLAG) {
>> +                    via_isa_set_irq(&s->dev, VIA_IRQ_AC97, 1);
>> +                }
>> +            }
>> +            if (CLEN_IS_STOP(c)) {
>> +                c->stat |=3D STAT_STOP;
>> +                c->stat |=3D STAT_PAUSED;
>> +            }
>> +            c->clen =3D 0;
>> +            stop =3D true;
>> +        }
>> +    }
>> +}
>> +
>> +static void open_voice_out(ViaAC97State *s)
>> +{
>> +    struct audsettings as =3D {
>> +        =2Efreq =3D CODEC_REG(s, AC97_PCM_Front_DAC_Rate),
>> +        =2Enchannels =3D s->aur=2Etype & BIT(4) ? 2 : 1,
>> +        =2Efmt =3D s->aur=2Etype & BIT(5) ? AUDIO_FORMAT_S16 : AUDIO_F=
ORMAT_S8,
>> +        =2Eendianness =3D 0,
>> +    };
>> +    s->vo =3D AUD_open_out(&s->card, s->vo, "via-ac97=2Eout", s, out_c=
b, &as);
>> +}
>> +
>> +static uint64_t sgd_read(void *opaque, hwaddr addr, unsigned size)
>> +{
>> +    ViaAC97State *s =3D opaque;
>> +    uint64_t val =3D 0;
>> +
>> +    switch (addr) {
>> +    case 0:
>> +        val =3D s->aur=2Estat;
>> +        if (s->aur=2Etype & CNTL_START) {
>> +            val |=3D STAT_TRIG;
>> +        }
>> +        break;
>> +    case 1:
>> +        val =3D s->aur=2Estat & STAT_PAUSED ? BIT(3) : 0;
>> +        break;
>> +    case 2:
>> +        val =3D s->aur=2Etype;
>> +        break;
>> +    case 4:
>> +        val =3D s->aur=2Ecurr;
>> +        break;
>> +    case 0xc:
>> +        val =3D CLEN_LEN(&s->aur);
>> +        break;
>> +    case 0x80:
>> +        val =3D s->ac97_cmd;
>> +        break;
>> +    case 0x84:
>> +        val =3D s->aur=2Estat & STAT_FLAG;
>> +        if (s->aur=2Estat & STAT_EOL) {
>> +            val |=3D BIT(4);
>> +        }
>> +        if (s->aur=2Estat & STAT_STOP) {
>> +            val |=3D BIT(8);
>> +        }
>> +        if (s->aur=2Estat & STAT_ACTIVE) {
>> +            val |=3D BIT(12);
>> +        }
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_UNIMP, "via-ac97: Unimplemented register rea=
d %"
>> +                      HWADDR_PRIx"\n", addr);
>> +    }
>> +    trace_via_ac97_sgd_read(addr, size, val);
>> +    return val;
>> +}
>> +
>> +static void sgd_write(void *opaque, hwaddr addr, uint64_t val, unsigne=
d size)
>> +{
>> +    ViaAC97State *s =3D opaque;
>> +
>> +    trace_via_ac97_sgd_write(addr, size, val);
>> +    switch (addr) {
>> +    case 0:
>> +        if (val & STAT_STOP) {
>> +            s->aur=2Estat &=3D ~STAT_PAUSED;
>> +        }
>> +        if (val & STAT_EOL) {
>> +            s->aur=2Estat &=3D ~(STAT_EOL | STAT_PAUSED);
>> +            if (s->aur=2Etype & STAT_EOL) {
>> +                via_isa_set_irq(&s->dev, VIA_IRQ_AC97, 0);
>> +            }
>> +        }
>> +        if (val & STAT_FLAG) {
>> +            s->aur=2Estat &=3D ~(STAT_FLAG | STAT_PAUSED);
>> +            if (s->aur=2Etype & STAT_FLAG) {
>> +                via_isa_set_irq(&s->dev, VIA_IRQ_AC97, 0);
>> +            }
>> +        }
>> +        break;
>> +    case 1:
>> +        if (val & CNTL_START) {
>> +            AUD_set_active_out(s->vo, 1);
>> +            s->aur=2Estat =3D STAT_ACTIVE;
>> +        }
>> +        if (val & CNTL_TERM) {
>> +            AUD_set_active_out(s->vo, 0);
>> +            s->aur=2Estat &=3D ~(STAT_ACTIVE | STAT_PAUSED);
>> +            s->aur=2Eclen =3D 0;
>> +        }
>> +        if (val & CNTL_PAUSE) {
>> +            AUD_set_active_out(s->vo, 0);
>> +            s->aur=2Estat &=3D ~STAT_ACTIVE;
>> +            s->aur=2Estat |=3D STAT_PAUSED;
>> +        } else if (!(val & CNTL_PAUSE) && (s->aur=2Estat & STAT_PAUSED=
)) {
>> +            AUD_set_active_out(s->vo, 1);
>> +            s->aur=2Estat |=3D STAT_ACTIVE;
>> +            s->aur=2Estat &=3D ~STAT_PAUSED;
>> +        }
>> +        break;
>> +    case 2:
>> +    {
>> +        uint32_t oldval =3D s->aur=2Etype;
>> +        s->aur=2Etype =3D val;
>> +        if ((oldval & 0x30) !=3D (val & 0x30)) {
>> +            open_voice_out(s);
>> +        }
>> +        break;
>> +    }
>> +    case 4:
>> +        s->aur=2Ebase =3D val & ~1ULL;
>> +        break;
>> +    case 0x80:
>> +        if (val >> 30) {
>> +            /* we only have primary codec */
>> +            break;
>> +        }
>> +        if (val & BIT(23)) { /* read reg */
>> +            s->ac97_cmd =3D val & 0xc0ff0000ULL;
>> +            s->ac97_cmd |=3D codec_read(s, (val >> 16) & 0x7f);
>> +            s->ac97_cmd |=3D BIT(25); /* data valid */
>> +        } else {
>> +            s->ac97_cmd =3D val & 0xc0ffffffULL;
>> +            codec_write(s, (val >> 16) & 0x7f, val);
>> +        }
>> +        break;
>> +    case 0xc:
>> +    case 0x84:
>> +        /* Read only */
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_UNIMP, "via-ac97: Unimplemented register wri=
te %"
>> +                      HWADDR_PRIx"\n", addr);
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps sgd_ops =3D {
>> +    =2Eread =3D sgd_read,
>> +    =2Ewrite =3D sgd_write,
>> +    =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
>> +};
>> +
>> +static uint64_t fm_read(void *opaque, hwaddr addr, unsigned size)
>> +{
>> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%"HWADDR_PRIx" %d\n", __func__, ad=
dr, size);
>> +    return 0;
>> +}
>> +
>> +static void fm_write(void *opaque, hwaddr addr, uint64_t val, unsigned=
 size)
>> +{
>> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%"HWADDR_PRIx" %d <=3D 0x%"PRIX64"=
\n",
>> +                  __func__, addr, size, val);
>> +}
>> +
>> +static const MemoryRegionOps fm_ops =3D {
>> +    =2Eread =3D fm_read,
>> +    =2Ewrite =3D fm_write,
>> +    =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
>> +};
>> +
>> +static uint64_t midi_read(void *opaque, hwaddr addr, unsigned size)
>> +{
>> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%"HWADDR_PRIx" %d\n", __func__, ad=
dr, size);
>> +    return 0;
>> +}
>> +
>> +static void midi_write(void *opaque, hwaddr addr, uint64_t val, unsign=
ed size)
>> +{
>> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%"HWADDR_PRIx" %d <=3D 0x%"PRIX64"=
\n",
>> +                  __func__, addr, size, val);
>> +}
>> +
>> +static const MemoryRegionOps midi_ops =3D {
>> +    =2Eread =3D midi_read,
>> +    =2Ewrite =3D midi_write,
>> +    =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
>> +};
>> +
>> +static void via_ac97_reset(DeviceState *dev)
>> +{
>> +    ViaAC97State *s =3D VIA_AC97(dev);
>> +
>> +    codec_reset(s);
>> +}
>>     static void via_ac97_realize(PCIDevice *pci_dev, Error **errp)
>>   {
>> +    ViaAC97State *s =3D VIA_AC97(pci_dev);
>> +    Object *o =3D OBJECT(s);
>> +
>>       pci_set_word(pci_dev->config + PCI_COMMAND,
>>                    PCI_COMMAND_INVALIDATE | PCI_COMMAND_PARITY);
>>       pci_set_word(pci_dev->config + PCI_STATUS,
>>                    PCI_STATUS_CAP_LIST | PCI_STATUS_DEVSEL_MEDIUM);
>>       pci_set_long(pci_dev->config + PCI_INTERRUPT_PIN, 0x03);
>> +
>> +    memory_region_init_io(&s->sgd, o, &sgd_ops, s, "via-ac97=2Esgd", 2=
56);
>> +    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->sgd);
>> +    memory_region_init_io(&s->fm, o, &fm_ops, s, "via-ac97=2Efm", 4);
>> +    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->fm);
>> +    memory_region_init_io(&s->midi, o, &midi_ops, s, "via-ac97=2Emidi"=
, 4);
>> +    pci_register_bar(pci_dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &s->midi);
>> +
>> +    AUD_register_card ("via-ac97", &s->card);
>>   }
>>   +static void via_ac97_exit(PCIDevice *dev)
>> +{
>> +    ViaAC97State *s =3D VIA_AC97(dev);
>> +
>> +    AUD_close_out(&s->card, s->vo);
>> +    AUD_remove_card(&s->card);
>> +}
>> +
>> +static Property via_ac97_properties[] =3D {
>> +    DEFINE_AUDIO_PROPERTIES(ViaAC97State, card),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>>   static void via_ac97_class_init(ObjectClass *klass, void *data)
>>   {
>>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>>       PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>>         k->realize =3D via_ac97_realize;
>> +    k->exit =3D via_ac97_exit;
>>       k->vendor_id =3D PCI_VENDOR_ID_VIA;
>>       k->device_id =3D PCI_DEVICE_ID_VIA_AC97;
>>       k->revision =3D 0x50;
>>       k->class_id =3D PCI_CLASS_MULTIMEDIA_AUDIO;
>> +    device_class_set_props(dc, via_ac97_properties);
>>       set_bit(DEVICE_CATEGORY_SOUND, dc->categories);
>>       dc->desc =3D "VIA AC97";
>> +    dc->reset =3D via_ac97_reset;
>>       /* Reason: Part of a south bridge chip */
>>       dc->user_creatable =3D false;
>>   }
>> @@ -41,7 +469,7 @@ static void via_ac97_class_init(ObjectClass *klass, =
void *data)
>>   static const TypeInfo via_ac97_info =3D {
>>       =2Ename          =3D TYPE_VIA_AC97,
>>       =2Eparent        =3D TYPE_PCI_DEVICE,
>> -    =2Einstance_size =3D sizeof(PCIDevice),
>> +    =2Einstance_size =3D sizeof(ViaAC97State),
>>       =2Eclass_init    =3D via_ac97_class_init,
>>       =2Einterfaces =3D (InterfaceInfo[]) {
>>           { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>> index f31b2fa7ca=2E=2Eb16620daf8 100644
>> --- a/hw/isa/vt82c686=2Ec
>> +++ b/hw/isa/vt82c686=2Ec
>> @@ -555,7 +555,7 @@ struct ViaISAState {
>>       PCIIDEState ide;
>>       UHCIState uhci[2];
>>       ViaPMState pm;
>> -    PCIDevice ac97;
>> +    ViaAC97State ac97;
>>       PCIDevice mc97;
>>   };
>>   @@ -610,6 +610,7 @@ void via_isa_set_irq(PCIDevice *d, ViaISAIRQSourc=
eBit n, int level)
>>           break;
>>       case VIA_IRQ_USB0:
>>       case VIA_IRQ_USB1:
>> +    case VIA_IRQ_AC97:
>>           max_irq =3D 14;
>>           isa_irq =3D d->config[PCI_INTERRUPT_LINE];
>>           break;
>> diff --git a/include/hw/isa/vt82c686=2Eh b/include/hw/isa/vt82c686=2Eh
>> index e982c5fe26=2E=2Ef7258d01df 100644
>> --- a/include/hw/isa/vt82c686=2Eh
>> +++ b/include/hw/isa/vt82c686=2Eh
>> @@ -1,6 +1,8 @@
>>   #ifndef HW_VT82C686_H
>>   #define HW_VT82C686_H
>>   +#include "hw/pci/pci_device=2Eh"
>> +#include "audio/audio=2Eh"
>>     #define TYPE_VT82C686B_ISA "vt82c686b-isa"
>>   #define TYPE_VT82C686B_USB_UHCI "vt82c686b-usb-uhci"
>> @@ -9,6 +11,29 @@
>>   #define TYPE_VIA_IDE "via-ide"
>>   #define TYPE_VIA_MC97 "via-mc97"
>>   +typedef struct {
>> +    uint8_t stat;
>> +    uint8_t type;
>> +    uint32_t base;
>> +    uint32_t curr;
>> +    uint32_t addr;
>> +    uint32_t clen;
>> +} ViaAC97SGDChannel;
>> +
>> +OBJECT_DECLARE_SIMPLE_TYPE(ViaAC97State, VIA_AC97);
>> +
>> +struct ViaAC97State {
>> +    PCIDevice dev;
>> +    QEMUSoundCard card;
>> +    MemoryRegion sgd;
>> +    MemoryRegion fm;
>> +    MemoryRegion midi;
>> +    SWVoiceOut *vo;
>> +    ViaAC97SGDChannel aur;
>> +    uint16_t codec_regs[128];
>> +    uint32_t ac97_cmd;
>> +};
>> +
>>   typedef enum {
>>       VIA_IRQ_IDE0 =3D 0,
>>       VIA_IRQ_IDE1 =3D 1,
>> @@ -18,6 +43,7 @@ typedef enum {
>>       VIA_IRQ_PIRQB =3D 5,
>>       VIA_IRQ_PIRQC =3D 6,
>>       VIA_IRQ_PIRQD =3D 7,
>> +    VIA_IRQ_AC97 =3D 8,
>>   } ViaISAIRQSourceBit;
>>     void via_isa_set_irq(PCIDevice *d, ViaISAIRQSourceBit n, int level)=
;
>

