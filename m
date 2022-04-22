Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC2D50C0B7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 22:39:06 +0200 (CEST)
Received: from localhost ([::1]:39946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ni03V-0008Jq-Sm
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 16:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ni025-00077p-0x
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 16:37:37 -0400
Received: from [187.72.171.209] (port=27073 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>) id 1ni022-0006WY-SF
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 16:37:36 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 22 Apr 2022 17:37:28 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 0B34B80031F;
 Fri, 22 Apr 2022 17:37:28 -0300 (-03)
Message-ID: <980b3c7a-7ad5-c9b9-580d-d39699ada7f1@eldorado.org.br>
Date: Fri, 22 Apr 2022 17:37:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/3] hw/audio/ac97: Coding style fixes to avoid
 checkpatch errors
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1650640480.git.balaton@eik.bme.hu>
 <b9bd112c673eaecaf9ec42bc8240efbb0bc1ac4b.1650640480.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <b9bd112c673eaecaf9ec42bc8240efbb0bc1ac4b.1650640480.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2022 20:37:28.0270 (UTC)
 FILETIME=[C84166E0:01D85688]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: victor.colombo@eldorado.org.br, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/04/2022 12:14, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/audio/ac97.c | 727 ++++++++++++++++++++++++------------------------
>   1 file changed, 357 insertions(+), 370 deletions(-)
> 
> diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
> index 3cb8131060..0b1d8ce9c6 100644
> --- a/hw/audio/ac97.c
> +++ b/hw/audio/ac97.c
> @@ -87,39 +87,39 @@ enum {
>   #define GC_CR    2              /* rw */
>   #define GC_VALID_MASK ((1 << 6) - 1)
>   
> -#define GS_MD3   (1<<17)        /* rw */
> -#define GS_AD3   (1<<16)        /* rw */
> -#define GS_RCS   (1<<15)        /* rwc */
> -#define GS_B3S12 (1<<14)        /* ro */
> -#define GS_B2S12 (1<<13)        /* ro */
> -#define GS_B1S12 (1<<12)        /* ro */
> -#define GS_S1R1  (1<<11)        /* rwc */
> -#define GS_S0R1  (1<<10)        /* rwc */
> -#define GS_S1CR  (1<<9)         /* ro */
> -#define GS_S0CR  (1<<8)         /* ro */
> -#define GS_MINT  (1<<7)         /* ro */
> -#define GS_POINT (1<<6)         /* ro */
> -#define GS_PIINT (1<<5)         /* ro */
> -#define GS_RSRVD ((1<<4)|(1<<3))
> -#define GS_MOINT (1<<2)         /* ro */
> -#define GS_MIINT (1<<1)         /* ro */
> +#define GS_MD3   (1 << 17)        /* rw */
> +#define GS_AD3   (1 << 16)        /* rw */
> +#define GS_RCS   (1 << 15)        /* rwc */
> +#define GS_B3S12 (1 << 14)        /* ro */
> +#define GS_B2S12 (1 << 13)        /* ro */
> +#define GS_B1S12 (1 << 12)        /* ro */
> +#define GS_S1R1  (1 << 11)        /* rwc */
> +#define GS_S0R1  (1 << 10)        /* rwc */
> +#define GS_S1CR  (1 << 9)         /* ro */
> +#define GS_S0CR  (1 << 8)         /* ro */
> +#define GS_MINT  (1 << 7)         /* ro */
> +#define GS_POINT (1 << 6)         /* ro */
> +#define GS_PIINT (1 << 5)         /* ro */
> +#define GS_RSRVD ((1 << 4) | (1 << 3))
> +#define GS_MOINT (1 << 2)         /* ro */
> +#define GS_MIINT (1 << 1)         /* ro */
>   #define GS_GSCI  1              /* rwc */

What do you think about aligning the `/*` in the lines above?
It was aligned before.

...

> -    mixer_store (s, AC97_Reset                   , 0x0000); /* 6940 */
> -    mixer_store (s, AC97_Headphone_Volume_Mute   , 0x0000);
> -    mixer_store (s, AC97_Master_Volume_Mono_Mute , 0x0000);
> -    mixer_store (s, AC97_Master_Tone_RL,           0x0000);
> -    mixer_store (s, AC97_PC_BEEP_Volume_Mute     , 0x0000);
> -    mixer_store (s, AC97_Phone_Volume_Mute       , 0x0000);
> -    mixer_store (s, AC97_Mic_Volume_Mute         , 0x0000);
> -    mixer_store (s, AC97_Line_In_Volume_Mute     , 0x0000);
> -    mixer_store (s, AC97_CD_Volume_Mute          , 0x0000);
> -    mixer_store (s, AC97_Video_Volume_Mute       , 0x0000);
> -    mixer_store (s, AC97_Aux_Volume_Mute         , 0x0000);
> -    mixer_store (s, AC97_Record_Gain_Mic_Mute    , 0x0000);
> -    mixer_store (s, AC97_General_Purpose         , 0x0000);
> -    mixer_store (s, AC97_3D_Control              , 0x0000);
> -    mixer_store (s, AC97_Powerdown_Ctrl_Stat     , 0x000f);
> +    dolog("mixer_reset\n");
> +    memset(s->mixer_data, 0, sizeof(s->mixer_data));
> +    memset(active, 0, sizeof(active));
> +    mixer_store(s, AC97_Reset                   , 0x0000); /* 6940 */
> +    mixer_store(s, AC97_Headphone_Volume_Mute   , 0x0000);
> +    mixer_store(s, AC97_Master_Volume_Mono_Mute , 0x0000);
> +    mixer_store(s, AC97_Master_Tone_RL,           0x0000);

It was already like this before, but I think this might be a good
oportunity to fix this spaces before comma inconsistency here.

Personally I think the best approach would be to make all of them
like `AC97_Master_Tone_RL,` instead of something like
`AC97_Master_Tone_RL   <multiple spaces>  ,`

> +    mixer_store(s, AC97_PC_BEEP_Volume_Mute     , 0x0000);
> +    mixer_store(s, AC97_Phone_Volume_Mute       , 0x0000);
> +    mixer_store(s, AC97_Mic_Volume_Mute         , 0x0000);
> +    mixer_store(s, AC97_Line_In_Volume_Mute     , 0x0000);
> +    mixer_store(s, AC97_CD_Volume_Mute          , 0x0000);
> +    mixer_store(s, AC97_Video_Volume_Mute       , 0x0000);
> +    mixer_store(s, AC97_Aux_Volume_Mute         , 0x0000);
> +    mixer_store(s, AC97_Record_Gain_Mic_Mute    , 0x0000);
> +    mixer_store(s, AC97_General_Purpose         , 0x0000);
> +    mixer_store(s, AC97_3D_Control              , 0x0000);
> +    mixer_store(s, AC97_Powerdown_Ctrl_Stat     , 0x000f);
>   
>       /*
>        * Sigmatel 9700 (STAC9700)
>        */
> -    mixer_store (s, AC97_Vendor_ID1              , 0x8384);
> -    mixer_store (s, AC97_Vendor_ID2              , 0x7600); /* 7608 */
> -
> -    mixer_store (s, AC97_Extended_Audio_ID       , 0x0809);
> -    mixer_store (s, AC97_Extended_Audio_Ctrl_Stat, 0x0009);
> -    mixer_store (s, AC97_PCM_Front_DAC_Rate      , 0xbb80);
> -    mixer_store (s, AC97_PCM_Surround_DAC_Rate   , 0xbb80);
> -    mixer_store (s, AC97_PCM_LFE_DAC_Rate        , 0xbb80);
> -    mixer_store (s, AC97_PCM_LR_ADC_Rate         , 0xbb80);
> -    mixer_store (s, AC97_MIC_ADC_Rate            , 0xbb80);
> -
> -    record_select (s, 0);
> -    set_volume (s, AC97_Master_Volume_Mute, 0x8000);
> -    set_volume (s, AC97_PCM_Out_Volume_Mute, 0x8808);
> -    set_volume (s, AC97_Record_Gain_Mute, 0x8808);
> -
> -    reset_voices (s, active);
> +    mixer_store(s, AC97_Vendor_ID1              , 0x8384);
> +    mixer_store(s, AC97_Vendor_ID2              , 0x7600); /* 7608 */
> +
> +    mixer_store(s, AC97_Extended_Audio_ID       , 0x0809);
> +    mixer_store(s, AC97_Extended_Audio_Ctrl_Stat, 0x0009);
> +    mixer_store(s, AC97_PCM_Front_DAC_Rate      , 0xbb80);
> +    mixer_store(s, AC97_PCM_Surround_DAC_Rate   , 0xbb80);
> +    mixer_store(s, AC97_PCM_LFE_DAC_Rate        , 0xbb80);
> +    mixer_store(s, AC97_PCM_LR_ADC_Rate         , 0xbb80);
> +    mixer_store(s, AC97_MIC_ADC_Rate            , 0xbb80);

So I would change all these lines above to remove all this spacing
before the comma. But that's just my opinion.

...

> @@ -1216,15 +1203,15 @@ static const VMStateDescription vmstate_ac97 = {
>       .minimum_version_id = 2,
>       .post_load = ac97_post_load,
>       .fields = (VMStateField[]) {
> -        VMSTATE_PCI_DEVICE (dev, AC97LinkState),
> -        VMSTATE_UINT32 (glob_cnt, AC97LinkState),
> -        VMSTATE_UINT32 (glob_sta, AC97LinkState),
> -        VMSTATE_UINT32 (cas, AC97LinkState),
> -        VMSTATE_STRUCT_ARRAY (bm_regs, AC97LinkState, 3, 1,
> +        VMSTATE_PCI_DEVICE(dev, AC97LinkState),
> +        VMSTATE_UINT32(glob_cnt, AC97LinkState),
> +        VMSTATE_UINT32(glob_sta, AC97LinkState),
> +        VMSTATE_UINT32(cas, AC97LinkState),
> +        VMSTATE_STRUCT_ARRAY(bm_regs, AC97LinkState, 3, 1,
>                                 vmstate_ac97_bm_regs, AC97BusMasterRegs),

With the change above, this line is not correctly aligned with the
previous one anymore.

...

> @@ -1373,13 +1360,13 @@ static void ac97_realize(PCIDevice *dev, Error **errp)
>       c[PCI_INTERRUPT_LINE] = 0x00;      /* intr_ln interrupt line rw */
>       c[PCI_INTERRUPT_PIN] = 0x01;      /* intr_pn interrupt pin ro */
>   
> -    memory_region_init_io (&s->io_nam, OBJECT(s), &ac97_io_nam_ops, s,
> +    memory_region_init_io(&s->io_nam, OBJECT(s), &ac97_io_nam_ops, s,
>                              "ac97-nam", 1024);
Same thing here...
> -    memory_region_init_io (&s->io_nabm, OBJECT(s), &ac97_io_nabm_ops, s,
> +    memory_region_init_io(&s->io_nabm, OBJECT(s), &ac97_io_nabm_ops, s,
>                              "ac97-nabm", 256);
...And here
> -    pci_register_bar (&s->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nam);
> -    pci_register_bar (&s->dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nabm);
> -    AUD_register_card ("ac97", &s->card);
> +    pci_register_bar(&s->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nam);
> +    pci_register_bar(&s->dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nabm);
> +    AUD_register_card("ac97", &s->card);
>       ac97_on_reset(DEVICE(s));
>   }
>
...

Besides that, I confirmed that the checkpatch was giving errors before 
and is not complaining anymore with this patch applied.

-- Víctor

