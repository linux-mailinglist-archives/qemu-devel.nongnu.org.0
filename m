Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C190F6C610A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 08:46:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfFci-00029j-13; Thu, 23 Mar 2023 03:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pfFcb-00029H-2e
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 03:44:29 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pfFcZ-0000bk-8R
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 03:44:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7228121260;
 Thu, 23 Mar 2023 07:44:21 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 23 Mar
 2023 08:44:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0012503dcff-48cb-4cc7-877e-d8213ef18736,
 176673217AFB8255045F9FD15030271BA63368C6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <18fd2a6a-a7e6-f9d4-e993-05dc2142f4d4@kaod.org>
Date: Thu, 23 Mar 2023 08:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/3] TPM TIS: Add support for TPM devices over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <joel@jms.id.au>, <andrew@aj.id.au>, <stefanb@linux.ibm.com>
References: <20230323030119.2113570-1-ninad@linux.ibm.com>
 <20230323030119.2113570-3-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230323030119.2113570-3-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d22fe90d-ea02-4d38-9d68-a96f482dd09e
X-Ovh-Tracer-Id: 240098157239896995
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegfedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehnihhnrggusehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdpshhtvghfrghnsgeslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 3/23/23 04:01, Ninad Palsule wrote:
> Qemu already supports devices attached to ISA and sysbus. This drop adds
> support for the I2C bus attached TPM devices.
> 
> This commit includes changes for the common code.
> - Added support for the new checksum registers which are required for
>    the I2C support. The checksum calculation is handled in the qemu
>    common code.
> - Added wrapper function for read and write data so that I2C code can
>    call it without MMIO interface.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> V2:
> 
> Incorporated Stephen's comments.
> 
> - Removed checksum enable and checksum get registers.
> - Added checksum calculation function which can be called from
>    i2c layer.
> ---
>   hw/tpm/tpm_tis.h        |  3 +++
>   hw/tpm/tpm_tis_common.c | 32 ++++++++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
> 
> diff --git a/hw/tpm/tpm_tis.h b/hw/tpm/tpm_tis.h
> index f6b5872ba6..6f29a508dd 100644
> --- a/hw/tpm/tpm_tis.h
> +++ b/hw/tpm/tpm_tis.h
> @@ -86,5 +86,8 @@ int tpm_tis_pre_save(TPMState *s);
>   void tpm_tis_reset(TPMState *s);
>   enum TPMVersion tpm_tis_get_tpm_version(TPMState *s);
>   void tpm_tis_request_completed(TPMState *s, int ret);
> +uint32_t tpm_tis_read_data(TPMState *s, hwaddr addr, unsigned size);
> +void tpm_tis_write_data(TPMState *s, hwaddr addr, uint64_t val, uint32_t size);
> +uint16_t tpm_tis_get_checksum(TPMState *s);
>   
>   #endif /* TPM_TPM_TIS_H */
> diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
> index 503be2a541..b1acde74cb 100644
> --- a/hw/tpm/tpm_tis_common.c
> +++ b/hw/tpm/tpm_tis_common.c
> @@ -26,6 +26,8 @@
>   #include "hw/irq.h"
>   #include "hw/isa/isa.h"
>   #include "qapi/error.h"
> +#include "qemu/bswap.h"
> +#include "qemu/crc-ccitt.h"
>   #include "qemu/module.h"
>   
>   #include "hw/acpi/tpm.h"
> @@ -447,6 +449,27 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr addr,
>       return val;
>   }
>   
> +/*
> + * A wrapper read function so that it can be directly called without
> + * mmio.
> + */
> +uint32_t tpm_tis_read_data(TPMState *s, hwaddr addr, unsigned size)
> +{
> +    return tpm_tis_mmio_read(s, addr, size);
> +}
> +
> +/*
> + * Calculate current data buffer checksum
> + */
> +uint16_t tpm_tis_get_checksum(TPMState *s)
> +{
> +    uint16_t val = 0xffff;
> +
> +    val = cpu_to_be16(crc_ccitt(0, s->buffer, s->rw_offset));

this routine could simply return cpu_to_be16(....

Thanks,

C.


> +
> +    return val;
> +}
> +
>   /*
>    * Write a value to a register of the TIS interface
>    * See specs pages 33-63 for description of the registers
> @@ -767,6 +790,15 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
>       }
>   }
>   
> +/*
> + * A wrapper write function so that it can be directly called without
> + * mmio.
> + */
> +void tpm_tis_write_data(TPMState *s, hwaddr addr, uint64_t val, uint32_t size)
> +{
> +    tpm_tis_mmio_write(s, addr, val, size);
> +}
> +
>   const MemoryRegionOps tpm_tis_memory_ops = {
>       .read = tpm_tis_mmio_read,
>       .write = tpm_tis_mmio_write,


