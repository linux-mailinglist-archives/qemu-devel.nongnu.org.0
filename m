Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9968332137B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 10:55:49 +0100 (CET)
Received: from localhost ([::1]:47636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE7wS-0007Ye-NC
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 04:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lE7uy-0006uv-7D; Mon, 22 Feb 2021 04:54:16 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:42885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lE7uu-0003vk-Kw; Mon, 22 Feb 2021 04:54:16 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.102])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id EA0BE8FD5F3A;
 Mon, 22 Feb 2021 10:54:07 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 22 Feb
 2021 10:54:06 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0021b4ab4d5-1c3e-466e-96a5-751a8c1a5f88,
 22411CCD660FC3FC09311B18737C076FF65DC705) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 16/22] sd: emmc: Add Extended CSD register definitions
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Markus Armbruster
 <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 Eric Blake <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>, Vincent
 Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Alistair
 Francis <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, Paolo
 Bonzini <pbonzini@redhat.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613982039-13861-17-git-send-email-sai.pavan.boddu@xilinx.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <dd431d13-1145-4554-c85d-1ce8d670aedb@kaod.org>
Date: Mon, 22 Feb 2021 10:54:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1613982039-13861-17-git-send-email-sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e4be4ba5-f448-4bb8-bb97-20890519ac95
X-Ovh-Tracer-Id: 9169047366788877069
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehsrghirdhprghvrghnrdgsohguughuseigihhlihhngidrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 9:20 AM, Sai Pavan Boddu wrote:
> From: Cédric Le Goater <clg@kaod.org>
> 
> Add user friendly macros for EXT_CSD register.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> [spb: Rebased over versal emmc series,
>       updated commit message]
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>


You can merge this patch in patch 05 "sd: emmc: Add support for 
EXT_CSD & CSD for eMMC" if you wish.

C.

> ---
>  hw/sd/sdmmc-internal.h | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/sd/sd.c             | 54 +++++++++++++++-------------
>  2 files changed, 126 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/sd/sdmmc-internal.h b/hw/sd/sdmmc-internal.h
> index d8bf17d..7ab7b4d 100644
> --- a/hw/sd/sdmmc-internal.h
> +++ b/hw/sd/sdmmc-internal.h
> @@ -37,4 +37,101 @@ const char *sd_cmd_name(uint8_t cmd);
>   */
>  const char *sd_acmd_name(uint8_t cmd);
>  
> +/*
> + * EXT_CSD fields
> + */
> +
> +#define EXT_CSD_CMDQ_MODE_EN    15  /* R/W */
> +#define EXT_CSD_FLUSH_CACHE   32      /* W */
> +#define EXT_CSD_CACHE_CTRL    33      /* R/W */
> +#define EXT_CSD_POWER_OFF_NOTIFICATION  34  /* R/W */
> +#define EXT_CSD_PACKED_FAILURE_INDEX  35  /* RO */
> +#define EXT_CSD_PACKED_CMD_STATUS 36  /* RO */
> +#define EXT_CSD_EXP_EVENTS_STATUS 54  /* RO, 2 bytes */
> +#define EXT_CSD_EXP_EVENTS_CTRL   56  /* R/W, 2 bytes */
> +#define EXT_CSD_DATA_SECTOR_SIZE  61  /* R */
> +#define EXT_CSD_GP_SIZE_MULT    143 /* R/W */
> +#define EXT_CSD_PARTITION_SETTING_COMPLETED 155 /* R/W */
> +#define EXT_CSD_PARTITION_ATTRIBUTE 156 /* R/W */
> +#define EXT_CSD_PARTITION_SUPPORT 160 /* RO */
> +#define EXT_CSD_HPI_MGMT    161 /* R/W */
> +#define EXT_CSD_RST_N_FUNCTION    162 /* R/W */
> +#define EXT_CSD_BKOPS_EN    163 /* R/W */
> +#define EXT_CSD_BKOPS_START   164 /* W */
> +#define EXT_CSD_SANITIZE_START    165     /* W */
> +#define EXT_CSD_WR_REL_PARAM    166 /* RO */
> +#define EXT_CSD_RPMB_MULT   168 /* RO */
> +#define EXT_CSD_FW_CONFIG   169 /* R/W */
> +#define EXT_CSD_BOOT_WP     173 /* R/W */
> +#define EXT_CSD_ERASE_GROUP_DEF   175 /* R/W */
> +#define EXT_CSD_PART_CONFIG   179 /* R/W */
> +#define EXT_CSD_ERASED_MEM_CONT   181 /* RO */
> +#define EXT_CSD_BUS_WIDTH   183 /* R/W */
> +#define EXT_CSD_STROBE_SUPPORT    184 /* RO */
> +#define EXT_CSD_HS_TIMING   185 /* R/W */
> +#define EXT_CSD_POWER_CLASS   187 /* R/W */
> +#define EXT_CSD_REV     192 /* RO */
> +#define EXT_CSD_STRUCTURE   194 /* RO */
> +#define EXT_CSD_CARD_TYPE   196 /* RO */
> +#define EXT_CSD_DRIVER_STRENGTH   197 /* RO */
> +#define EXT_CSD_OUT_OF_INTERRUPT_TIME 198 /* RO */
> +#define EXT_CSD_PART_SWITCH_TIME        199     /* RO */
> +#define EXT_CSD_PWR_CL_52_195   200 /* RO */
> +#define EXT_CSD_PWR_CL_26_195   201 /* RO */
> +#define EXT_CSD_PWR_CL_52_360   202 /* RO */
> +#define EXT_CSD_PWR_CL_26_360   203 /* RO */
> +#define EXT_CSD_SEC_CNT     212 /* RO, 4 bytes */
> +#define EXT_CSD_S_A_TIMEOUT   217 /* RO */
> +#define EXT_CSD_S_C_VCCQ          219     /* RO */
> +#define EXT_CSD_S_C_VCC                 220     /* RO */
> +#define EXT_CSD_REL_WR_SEC_C    222 /* RO */
> +#define EXT_CSD_HC_WP_GRP_SIZE    221 /* RO */
> +#define EXT_CSD_ERASE_TIMEOUT_MULT  223 /* RO */
> +#define EXT_CSD_HC_ERASE_GRP_SIZE 224 /* RO */
> +#define EXT_CSD_ACC_SIZE    225 /* RO */
> +#define EXT_CSD_BOOT_MULT   226 /* RO */
> +#define EXT_CSD_BOOT_INFO   228 /* RO */
> +#define EXT_CSD_SEC_TRIM_MULT   229 /* RO */
> +#define EXT_CSD_SEC_ERASE_MULT    230 /* RO */
> +#define EXT_CSD_SEC_FEATURE_SUPPORT 231 /* RO */
> +#define EXT_CSD_TRIM_MULT   232 /* RO */
> +#define EXT_CSD_PWR_CL_200_195    236 /* RO */
> +#define EXT_CSD_PWR_CL_200_360    237 /* RO */
> +#define EXT_CSD_PWR_CL_DDR_52_195 238 /* RO */
> +#define EXT_CSD_PWR_CL_DDR_52_360 239 /* RO */
> +#define EXT_CSD_BKOPS_STATUS    246 /* RO */
> +#define EXT_CSD_POWER_OFF_LONG_TIME 247 /* RO */
> +#define EXT_CSD_GENERIC_CMD6_TIME 248 /* RO */
> +#define EXT_CSD_CACHE_SIZE    249 /* RO, 4 bytes */
> +#define EXT_CSD_PWR_CL_DDR_200_360  253 /* RO */
> +#define EXT_CSD_FIRMWARE_VERSION  254 /* RO, 8 bytes */
> +#define EXT_CSD_PRE_EOL_INFO    267 /* RO */
> +#define EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_A  268 /* RO */
> +#define EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_B  269 /* RO */
> +#define EXT_CSD_CMDQ_DEPTH    307 /* RO */
> +#define EXT_CSD_CMDQ_SUPPORT    308 /* RO */
> +#define EXT_CSD_SUPPORTED_MODE    493 /* RO */
> +#define EXT_CSD_TAG_UNIT_SIZE   498 /* RO */
> +#define EXT_CSD_DATA_TAG_SUPPORT  499 /* RO */
> +#define EXT_CSD_MAX_PACKED_WRITES 500 /* RO */
> +#define EXT_CSD_MAX_PACKED_READS  501 /* RO */
> +#define EXT_CSD_BKOPS_SUPPORT   502 /* RO */
> +#define EXT_CSD_HPI_FEATURES    503 /* RO */
> +#define EXT_CSD_S_CMD_SET   504 /* RO */
> +
> +/*
> + * EXT_CSD field definitions
> + */
> +
> +#define EXT_CSD_WR_REL_PARAM_EN   (1 << 2)
> +#define EXT_CSD_WR_REL_PARAM_EN_RPMB_REL_WR (1 << 4)
> +
> +#define EXT_CSD_PART_CONFIG_ACC_MASK  (0x7)
> +#define EXT_CSD_PART_CONFIG_ACC_DEFAULT (0x0)
> +#define EXT_CSD_PART_CONFIG_ACC_BOOT0 (0x1)
> +
> +#define EXT_CSD_PART_CONFIG_EN_MASK (0x7 << 3)
> +#define EXT_CSD_PART_CONFIG_EN_BOOT0  (0x1 << 3)
> +#define EXT_CSD_PART_CONFIG_EN_USER (0x7 << 3)
> +
>  #endif
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 3c24810..60799aa 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -409,41 +409,45 @@ static void mmc_set_ext_csd(SDState *sd, uint64_t size)
>      uint32_t sectcount = size >> HWBLOCK_SHIFT;
>  
>      memset(sd->ext_csd, 0, sizeof(sd->ext_csd));
> -    sd->ext_csd[504] = 0x1; /* supported command sets */
> -    sd->ext_csd[503] = 0x1; /* HPI features  */
> -    sd->ext_csd[502] = 0x1; /* Background operations support */
> +    sd->ext_csd[EXT_CSD_S_CMD_SET] = 0x1; /* supported command sets */
> +    sd->ext_csd[EXT_CSD_HPI_FEATURES] = 0x3; /* HPI features  */
> +    sd->ext_csd[EXT_CSD_BKOPS_SUPPORT] = 0x1; /* Background operations
> +                                                 support */
>      sd->ext_csd[241] = 0xA; /* 1st initialization time after partitioning */
> -    sd->ext_csd[232] = 0x1; /* Trim multiplier */
> -    sd->ext_csd[231] = 0x15; /* Secure feature support */
> -    sd->ext_csd[230] = 0x96; /* Secure erase support */
> -    sd->ext_csd[229] = 0x96; /* Secure TRIM multiplier */
> -    sd->ext_csd[228] = 0x7; /* Boot information */
> -    sd->ext_csd[226] = 0x8; /* Boot partition size */
> -    sd->ext_csd[225] = 0x6; /* Access size */
> -    sd->ext_csd[224] = 0x4; /* HC Erase unit size */
> -    sd->ext_csd[223] = 0x1; /* HC erase timeout */
> -    sd->ext_csd[222] = 0x1; /* Reliable write sector count */
> -    sd->ext_csd[221] = 0x4; /* HC write protect group size */
> -    sd->ext_csd[220] = 0x8; /* Sleep current VCC  */
> -    sd->ext_csd[219] = 0x7; /* Sleep current VCCQ */
> -    sd->ext_csd[217] = 0x11; /* Sleep/Awake timeout */
> +    sd->ext_csd[EXT_CSD_TRIM_MULT] = 0x1; /* Trim multiplier */
> +    sd->ext_csd[EXT_CSD_SEC_FEATURE_SUPPORT] = 0x15; /* Secure feature
> +                                                        support */
> +    sd->ext_csd[EXT_CSD_SEC_ERASE_MULT] = 0x96; /* Secure erase support */
> +    sd->ext_csd[EXT_CSD_SEC_TRIM_MULT] = 0x96; /* Secure TRIM multiplier */
> +    sd->ext_csd[EXT_CSD_BOOT_INFO] = 0x7; /* Boot information */
> +    sd->ext_csd[EXT_CSD_BOOT_MULT] = 0x8; /* Boot partition size. 128KB unit */
> +    sd->ext_csd[EXT_CSD_ACC_SIZE] = 0x6; /* Access size */
> +    sd->ext_csd[EXT_CSD_HC_ERASE_GRP_SIZE] = 0x4; /* HC Erase unit size */
> +    sd->ext_csd[EXT_CSD_ERASE_TIMEOUT_MULT] = 0x1; /* HC erase timeout */
> +    sd->ext_csd[EXT_CSD_REL_WR_SEC_C] = 0x1; /* Reliable write sector count */
> +    sd->ext_csd[EXT_CSD_HC_WP_GRP_SIZE] = 0x4; /* HC write protect group size */
> +    sd->ext_csd[EXT_CSD_S_C_VCC] = 0x8; /* Sleep current VCC  */
> +    sd->ext_csd[EXT_CSD_S_C_VCCQ] = 0x7; /* Sleep current VCCQ */
> +    sd->ext_csd[EXT_CSD_S_A_TIMEOUT] = 0x11; /* Sleep/Awake timeout */
>      sd->ext_csd[215] = (sectcount >> 24) & 0xff; /* Sector count */
>      sd->ext_csd[214] = (sectcount >> 16) & 0xff; /* ... */
>      sd->ext_csd[213] = (sectcount >> 8) & 0xff;  /* ... */
> -    sd->ext_csd[212] = (sectcount & 0xff);       /* ... */
> +    sd->ext_csd[EXT_CSD_SEC_CNT] = (sectcount & 0xff);       /* ... */
>      sd->ext_csd[210] = 0xa; /* Min write perf for 8bit@52Mhz */
>      sd->ext_csd[209] = 0xa; /* Min read perf for 8bit@52Mhz  */
>      sd->ext_csd[208] = 0xa; /* Min write perf for 4bit@52Mhz */
>      sd->ext_csd[207] = 0xa; /* Min read perf for 4bit@52Mhz */
>      sd->ext_csd[206] = 0xa; /* Min write perf for 4bit@26Mhz */
>      sd->ext_csd[205] = 0xa; /* Min read perf for 4bit@26Mhz */
> -    sd->ext_csd[199] = 0x1; /* Partition switching timing */
> -    sd->ext_csd[198] = 0x1; /* Out-of-interrupt busy timing */
> -    sd->ext_csd[196] = 0xFF; /* Card type */
> -    sd->ext_csd[194] = 0x2; /* CSD Structure version */
> -    sd->ext_csd[192] = 0x5; /* Extended CSD revision */
> -    sd->ext_csd[168] = 0x1; /* RPMB size */
> -    sd->ext_csd[160] = 0x3; /* Partinioning support */
> +    sd->ext_csd[EXT_CSD_PART_SWITCH_TIME] = 0x1; /* Partition switching
> +                                                    timing */
> +    sd->ext_csd[EXT_CSD_OUT_OF_INTERRUPT_TIME] = 0x1; /* Out-of-interrupt busy
> +                                                         timing */
> +    sd->ext_csd[EXT_CSD_CARD_TYPE] = 0xFF; /* Card type */
> +    sd->ext_csd[EXT_CSD_STRUCTURE] = 0x2; /* CSD Structure version */
> +    sd->ext_csd[EXT_CSD_REV] = 0x5; /* Extended CSD revision */
> +    sd->ext_csd[EXT_CSD_RPMB_MULT] = 0x1; /* RPMB size */
> +    sd->ext_csd[EXT_CSD_PARTITION_SUPPORT] = 0x3; /* Partinioning support */
>      sd->ext_csd[159] = 0x00; /* Max enhanced area size */
>      sd->ext_csd[158] = 0x00; /* ... */
>      sd->ext_csd[157] = 0xEC; /* ... */
> 


