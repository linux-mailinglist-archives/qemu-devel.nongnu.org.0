Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72242AC31C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 19:02:39 +0100 (CET)
Received: from localhost ([::1]:42826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcBV0-0001Tf-Tf
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 13:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kcBFR-0007qa-Ph; Mon, 09 Nov 2020 12:46:33 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kcBFN-00033M-6q; Mon, 09 Nov 2020 12:46:33 -0500
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4CVJKj4PKXz67JKv;
 Tue, 10 Nov 2020 01:44:57 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 9 Nov 2020 18:46:18 +0100
Received: from localhost (10.52.120.237) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 9 Nov 2020
 17:46:17 +0000
Date: Mon, 9 Nov 2020 17:46:13 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH v3 10/13] target/arm/cpu: Add cpu cache description
 for arm
Message-ID: <20201109174613.00001d3f@Huawei.com>
In-Reply-To: <20201109030452.2197-11-fangying1@huawei.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
 <20201109030452.2197-11-fangying1@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.120.237]
X-ClientProxiedBy: lhreml748-chm.china.huawei.com (10.201.108.198) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 12:36:15
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com, salil.mehta@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Nov 2020 11:04:49 +0800
Ying Fang <fangying1@huawei.com> wrote:

> Add the CPUCacheInfo structure to hold cpu cache information for ARM cpus.
> A classic three level cache topology is used here. The default cache
> capacity is given and userspace can overwrite these values.
> 
> Signed-off-by: Ying Fang <fangying1@huawei.com>

I may be missing it another patch, but to add an L3 cache you need to
also supply a few CSR values.

CLIDR needs to reflect that there is an L3 present and you need a CSIDR[3]
entry to describe it. 0xB200123 should work for CLIDR. I'm too lazy to figure
out a CSIDR[3] value :)

Without those, Linux isn't going to pick up the PPTT entries etc when
building cacheinfo.  It only uses PPTT to update or supplement the
information gained from those CSRs.

Jonathan


> ---
>  target/arm/cpu.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu.h | 27 +++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 056319859f..f1bac7452c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -27,6 +27,7 @@
>  #include "qapi/visitor.h"
>  #include "cpu.h"
>  #include "internals.h"
> +#include "qemu/units.h"
>  #include "exec/exec-all.h"
>  #include "hw/qdev-properties.h"
>  #if !defined(CONFIG_USER_ONLY)
> @@ -997,6 +998,45 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
>      return (Aff1 << ARM_AFF1_SHIFT) | Aff0;
>  }
>  
> +static CPUCaches default_cache_info = {
> +    .l1d_cache = &(CPUCacheInfo) {
> +    .type = DATA_CACHE,
> +        .level = 1,
> +        .size = 64 * KiB,
> +        .line_size = 64,
> +        .associativity = 4,
> +        .sets = 256,
> +        .attributes = 0x02,
> +    },
> +    .l1i_cache = &(CPUCacheInfo) {
> +        .type = INSTRUCTION_CACHE,
> +        .level = 1,
> +        .size = 64 * KiB,
> +        .line_size = 64,
> +        .associativity = 4,
> +        .sets = 256,
> +        .attributes = 0x04,
> +    },
> +    .l2_cache = &(CPUCacheInfo) {
> +        .type = UNIFIED_CACHE,
> +        .level = 2,
> +        .size = 512 * KiB,
> +        .line_size = 64,
> +        .associativity = 8,
> +        .sets = 1024,
> +        .attributes = 0x0a,
> +    },
> +    .l3_cache = &(CPUCacheInfo) {
> +        .type = UNIFIED_CACHE,
> +        .level = 3,
> +        .size = 65536 * KiB,
> +        .line_size = 64,
> +        .associativity = 15,
> +        .sets = 2048,
> +        .attributes = 0x0a,
> +    },
> +};
> +
>  static void cpreg_hashtable_data_destroy(gpointer data)
>  {
>      /*
> @@ -1841,6 +1881,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          }
>      }
>  
> +    cpu->caches = default_cache_info;
> +
>      qemu_init_vcpu(cs);
>      cpu_reset(cs);
>  
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index cfff1b5c8f..dbc33a9802 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -746,6 +746,30 @@ typedef enum ARMPSCIState {
>  
>  typedef struct ARMISARegisters ARMISARegisters;
>  
> +/* Cache information type */
> +enum CacheType {
> +    DATA_CACHE,
> +    INSTRUCTION_CACHE,
> +    UNIFIED_CACHE
> +};
> +
> +typedef struct CPUCacheInfo {
> +    enum CacheType type;      /* Cache Type*/
> +    uint8_t level;
> +    uint32_t size;            /* Size in bytes */
> +    uint16_t line_size;       /* Line size in bytes */
> +    uint8_t associativity;    /* Cache associativity */
> +    uint32_t sets;            /* Number of sets */
> +    uint8_t attributes;       /* Cache attributest  */
> +} CPUCacheInfo;
> +
> +typedef struct CPUCaches {
> +        CPUCacheInfo *l1d_cache;
> +        CPUCacheInfo *l1i_cache;
> +        CPUCacheInfo *l2_cache;
> +        CPUCacheInfo *l3_cache;
> +} CPUCaches;
> +
>  /**
>   * ARMCPU:
>   * @env: #CPUARMState
> @@ -987,6 +1011,9 @@ struct ARMCPU {
>  
>      /* Generic timer counter frequency, in Hz */
>      uint64_t gt_cntfrq_hz;
> +
> +    /* CPU cache information */
> +    CPUCaches caches;
>  };
>  
>  unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);


