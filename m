Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9C46E5F3C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 12:59:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poj3K-0007FB-Hx; Tue, 18 Apr 2023 06:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1poj3F-0007C2-6u; Tue, 18 Apr 2023 06:59:10 -0400
Received: from m12.mail.163.com ([220.181.12.196])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1poj3A-0001tk-2Y; Tue, 18 Apr 2023 06:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
 Content-Type; bh=KLyPqk3MlVA6QQdWlIPy79zJvChwg7NEpTAbqMIu3G0=;
 b=JKJU+hLX7B0uU4k6CdCkfHs0Fq06IojBZLnVCO5j7YoBM0/k6Wi3Cg3pUUdFCS
 QMoSgEvy8xzxj1j2n7D5d9hzu+GbAhnB8mveqwItCGGrbUNGglevhX2JQblkKQDT
 Maw3tfqQBufNkSYzeiu3Lk00Nwxab4olybJ7WgkYZIky8=
Received: from [172.21.25.67] (unknown [218.201.129.19])
 by zwqz-smtp-mta-g2-1 (Coremail) with SMTP id _____wAXZCXbdz5kPO0TBw--.31805S2;
 Tue, 18 Apr 2023 18:58:36 +0800 (CST)
Message-ID: <3b00a614-9dea-d90d-d7de-ff6c90e9a561@163.com>
Date: Tue, 18 Apr 2023 18:58:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 07/12] hw: sd: allwinner-sdhost: Add sun50i-a64 SoC
 support
Content-Language: en-US
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230328054654.18620-1-qianfanguijin@163.com>
 <20230328054654.18620-8-qianfanguijin@163.com>
 <CAPan3Wpm6KqrXrdtrSqQPGAQGwJpiraUj0n3FKJOAoSrR1c71w@mail.gmail.com>
From: qianfan <qianfanguijin@163.com>
In-Reply-To: <CAPan3Wpm6KqrXrdtrSqQPGAQGwJpiraUj0n3FKJOAoSrR1c71w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXZCXbdz5kPO0TBw--.31805S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtrW3Zw4xWw4fGryrur17Wrg_yoW3WFWfpF
 ZYkw45GF45Ga1xJr47tFnrKF1rG34DCr4jkrn3CF97Ar1DJwn0qa1DKay5JFWDGrs8CF4U
 Aa1YqFy5uFs3taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U-db8UUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXB1V7VXl6SyOqwAAsp
Received-SPF: pass client-ip=220.181.12.196;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.284, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



在 2023/4/7 4:18, Niek Linnenbank 写道:
>
>
> On Tue, Mar 28, 2023 at 7:47 AM <qianfanguijin@163.com> wrote:
>
>     From: qianfan Zhao <qianfanguijin@163.com>
>
>     A64's sd register was similar to H3, and it introduced a new register
>     named SAMP_DL_REG location at 0x144. The dma descriptor buffer size of
>     mmc2 is only 8K and the other mmc controllers has 64K.
>
>     Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
>     ---
>      hw/sd/allwinner-sdhost.c         | 70
>     ++++++++++++++++++++++++++++++--
>      include/hw/sd/allwinner-sdhost.h |  9 ++++
>      2 files changed, 76 insertions(+), 3 deletions(-)
>
>     diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
>     index 51e5e90830..38e7844399 100644
>     --- a/hw/sd/allwinner-sdhost.c
>     +++ b/hw/sd/allwinner-sdhost.c
>     @@ -77,6 +77,7 @@ enum {
>          REG_SD_DATA1_CRC  = 0x12C, /* CRC Data 1 from card/eMMC */
>          REG_SD_DATA0_CRC  = 0x130, /* CRC Data 0 from card/eMMC */
>          REG_SD_CRC_STA    = 0x134, /* CRC status from card/eMMC
>     during write */
>     +    REG_SD_SAMP_DL    = 0x144, /* Sample Delay Control
>     (sun50i-a64) */
>          REG_SD_FIFO       = 0x200, /* Read/Write FIFO */
>      };
>
>     @@ -158,6 +159,7 @@ enum {
>          REG_SD_RES_CRC_RST      = 0x0,
>          REG_SD_DATA_CRC_RST     = 0x0,
>          REG_SD_CRC_STA_RST      = 0x0,
>     +    REG_SD_SAMPLE_DL_RST    = 0x00002000,
>          REG_SD_FIFO_RST         = 0x0,
>      };
>
>     @@ -438,6 +440,7 @@ static uint64_t allwinner_sdhost_read(void
>     *opaque, hwaddr offset,
>      {
>          AwSdHostState *s = AW_SDHOST(opaque);
>          AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
>     +    bool out_of_bounds = false;
>          uint32_t res = 0;
>
>          switch (offset) {
>     @@ -556,13 +559,24 @@ static uint64_t allwinner_sdhost_read(void
>     *opaque, hwaddr offset,
>          case REG_SD_FIFO:      /* Read/Write FIFO */
>              res = allwinner_sdhost_fifo_read(s);
>              break;
>     +    case REG_SD_SAMP_DL: /* Sample Delay */
>
> Sample Delay Control
>
>     +        if (sc->can_calibrate) {
>     +            res = s->sample_delay;
>     +        } else {
>     +            out_of_bounds = true;
>     +        }
>     +        break;
>          default:
>     -        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
>     -                      HWADDR_PRIx"\n", __func__, offset);
>     +        out_of_bounds = true;
>              res = 0;
>              break;
>          }
>
>     +    if (out_of_bounds) {
>     +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
>     +                      HWADDR_PRIx"\n", __func__, offset);
>     +    }
>     +
>          trace_allwinner_sdhost_read(offset, res, size);
>          return res;
>      }
>     @@ -581,6 +595,7 @@ static void allwinner_sdhost_write(void
>     *opaque, hwaddr offset,
>      {
>          AwSdHostState *s = AW_SDHOST(opaque);
>          AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
>     +    bool out_of_bounds = false;
>
>          trace_allwinner_sdhost_write(offset, value, size);
>
>     @@ -704,10 +719,21 @@ static void allwinner_sdhost_write(void
>     *opaque, hwaddr offset,
>          case REG_SD_DATA0_CRC: /* CRC Data 0 from card/eMMC */
>          case REG_SD_CRC_STA:   /* CRC status from card/eMMC in write
>     operation */
>              break;
>     +    case REG_SD_SAMP_DL: /* Sample delay control */
>     +        if (sc->can_calibrate) {
>     +            s->sample_delay = value;
>     +        } else {
>     +            out_of_bounds = true;
>     +        }
>     +        break;
>          default:
>     +        out_of_bounds = true;
>     +        break;
>     +    }
>     +
>     +    if (out_of_bounds) {
>              qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
>                            HWADDR_PRIx"\n", __func__, offset);
>     -        break;
>          }
>      }
>
>     @@ -756,6 +782,7 @@ static const VMStateDescription
>     vmstate_allwinner_sdhost = {
>              VMSTATE_UINT32(response_crc, AwSdHostState),
>              VMSTATE_UINT32_ARRAY(data_crc, AwSdHostState, 8),
>              VMSTATE_UINT32(status_crc, AwSdHostState),
>     +        VMSTATE_UINT32(sample_delay, AwSdHostState),
>              VMSTATE_END_OF_LIST()
>          }
>      };
>     @@ -794,6 +821,7 @@ static void
>     allwinner_sdhost_realize(DeviceState *dev, Error **errp)
>      static void allwinner_sdhost_reset(DeviceState *dev)
>      {
>          AwSdHostState *s = AW_SDHOST(dev);
>     +    AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
>
>          s->global_ctl = REG_SD_GCTL_RST;
>          s->clock_ctl = REG_SD_CKCR_RST;
>     @@ -834,6 +862,10 @@ static void
>     allwinner_sdhost_reset(DeviceState *dev)
>          }
>
>          s->status_crc = REG_SD_CRC_STA_RST;
>     +
>     +    if (sc->can_calibrate) {
>     +        s->sample_delay = REG_SD_SAMPLE_DL_RST;
>     +    }
>      }
>
>      static void allwinner_sdhost_bus_class_init(ObjectClass *klass,
>     void *data)
>     @@ -867,6 +899,24 @@ static void
>     allwinner_sdhost_sun5i_class_init(ObjectClass *klass, void *data)
>          sc->is_sun4i = false;
>      }
>
>     +static void allwinner_sdhost_sun50i_a64_class_init(ObjectClass
>     *klass,
>     +                                                   void *data)
>     +{
>     +    AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
>     +    sc->max_desc_size = 64 * KiB;
>     +    sc->is_sun4i = false;
>     +    sc->can_calibrate = true;
>
>
> perhaps in the other two existing _init() functions for sun4i/sun5i, 
> we should also explicitly set the new can_calibrate value to false,
> to avoid the risk of using uninitialized data in the other machines/socs.
>
>     +}
>     +
>     +static void
>     allwinner_sdhost_sun50i_a64_emmc_class_init(ObjectClass *klass,
>     + void *data)
>     +{
>     +    AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
>     +    sc->max_desc_size = 8 * KiB;
>     +    sc->is_sun4i = false;
>     +    sc->can_calibrate = true;
>     +}
>     +
>      static const TypeInfo allwinner_sdhost_info = {
>          .name          = TYPE_AW_SDHOST,
>          .parent        = TYPE_SYS_BUS_DEVICE,
>     @@ -889,6 +939,18 @@ static const TypeInfo
>     allwinner_sdhost_sun5i_info = {
>          .class_init    = allwinner_sdhost_sun5i_class_init,
>      };
>
>     +static const TypeInfo allwinner_sdhost_sun50i_a64_info = {
>     +    .name          = TYPE_AW_SDHOST_SUN50I_A64,
>     +    .parent        = TYPE_AW_SDHOST,
>     +    .class_init    = allwinner_sdhost_sun50i_a64_class_init,
>     +};
>     +
>     +static const TypeInfo allwinner_sdhost_sun50i_a64_emmc_info = {
>     +    .name          = TYPE_AW_SDHOST_SUN50I_A64_EMMC,
>     +    .parent        = TYPE_AW_SDHOST,
>     +    .class_init    = allwinner_sdhost_sun50i_a64_emmc_class_init,
>     +};
>     +
>      static const TypeInfo allwinner_sdhost_bus_info = {
>          .name = TYPE_AW_SDHOST_BUS,
>          .parent = TYPE_SD_BUS,
>     @@ -901,6 +963,8 @@ static void allwinner_sdhost_register_types(void)
>          type_register_static(&allwinner_sdhost_info);
>          type_register_static(&allwinner_sdhost_sun4i_info);
>          type_register_static(&allwinner_sdhost_sun5i_info);
>     + type_register_static(&allwinner_sdhost_sun50i_a64_info);
>     + type_register_static(&allwinner_sdhost_sun50i_a64_emmc_info);
>          type_register_static(&allwinner_sdhost_bus_info);
>      }
>
>     diff --git a/include/hw/sd/allwinner-sdhost.h
>     b/include/hw/sd/allwinner-sdhost.h
>     index 30c1e60404..1b951177dd 100644
>     --- a/include/hw/sd/allwinner-sdhost.h
>     +++ b/include/hw/sd/allwinner-sdhost.h
>     @@ -38,6 +38,12 @@
>      /** Allwinner sun5i family and newer (A13, H2+, H3, etc) */
>      #define TYPE_AW_SDHOST_SUN5I TYPE_AW_SDHOST "-sun5i"
>
>     +/** Allwinner sun50i-a64 */
>     +#define TYPE_AW_SDHOST_SUN50I_A64 TYPE_AW_SDHOST "-sun50i-a64"
>     +
>     +/** Allwinner sun50i-a64 emmc */
>     +#define TYPE_AW_SDHOST_SUN50I_A64_EMMC  TYPE_AW_SDHOST
>     "-sun50i-a64-emmc"
>     +
>      /** @} */
>
>      /**
>     @@ -110,6 +116,7 @@ struct AwSdHostState {
>          uint32_t startbit_detect;   /**< eMMC DDR Start Bit Detection
>     Control */
>          uint32_t response_crc;      /**< Response CRC */
>          uint32_t data_crc[8];       /**< Data CRC */
>     +    uint32_t sample_delay;      /**< Sample delay control */
>          uint32_t status_crc;        /**< Status CRC */
>
>          /** @} */
>     @@ -132,6 +139,8 @@ struct AwSdHostClass {
>          size_t max_desc_size;
>          bool   is_sun4i;
>
>     +    /** does the IP block support autocalibration? */
>     +    bool can_calibrate;
>      };
>
>      #endif /* HW_SD_ALLWINNER_SDHOST_H */
>     -- 
>     2.25.1
>
>
> In this patch, I don't see any update to the new allwinner-r40.c file.
> If you make the required changes to allwinner-r40.c in this patch, you 
> can also avoid having patch 08.
OK, I will squash patch-07 and patch-08
>
> Regards,
> Niek
>
> -- 
> Niek Linnenbank
>


