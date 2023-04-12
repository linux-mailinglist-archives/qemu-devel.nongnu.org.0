Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C356DF27B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:03:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYFZ-00029T-2e; Wed, 12 Apr 2023 07:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pmYFL-00025g-2K; Wed, 12 Apr 2023 07:02:39 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pmYEj-0001xx-OF; Wed, 12 Apr 2023 07:02:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.132])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id EEE44201A4;
 Wed, 12 Apr 2023 11:01:43 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Apr
 2023 13:01:43 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00170a2cb98-4d6e-4960-a7b0-c082574f91b3,
 5163A029651DE878447B53959E60E0FA73EB9D10) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <b4f80d34-886c-6fb5-587f-728cde13f57d@kaod.org>
Date: Wed, 12 Apr 2023 13:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/3] include/exec: Provide the tswap() functions for
 target independent code, too
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 <qemu-devel@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
CC: <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, David Gibson
 <david@gibson.dropbear.id.au>, Daniel Henrique Barboza
 <danielhb413@gmail.com>
References: <20230411183418.1640500-1-thuth@redhat.com>
 <20230411183418.1640500-3-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230411183418.1640500-3-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 2b38c4eb-8bbc-4634-9cee-177bc10d3b54
X-Ovh-Tracer-Id: 10346738671422704431
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekiedgfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeipdekvddrieeirdejjedrudduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhhuhhthhesrhgvughhrghtrdgtohhmpdhlvhhivhhivghrsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiug
 drrghupdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.17,
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

On 4/11/23 20:34, Thomas Huth wrote:
> In some cases of target independent code, it would be useful to have access
> to the functions that swap endianess in case it differs between guest and
> host. Thus re-implement the tswapXX() functions in a new header that can be
> included separately. The check whether the swapping is needed continues to
> be done at compile-time for target specific code, while it is done at
> run-time in target-independent code.


Reviewed-by: Cédric Le Goater <clg@kaod.org>

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/exec/cpu-all.h | 64 +------------------------------------
>   include/exec/tswap.h   | 72 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 73 insertions(+), 63 deletions(-)
>   create mode 100644 include/exec/tswap.h
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 090922e4a8..ad824fee52 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -21,6 +21,7 @@
>   
>   #include "exec/cpu-common.h"
>   #include "exec/memory.h"
> +#include "exec/tswap.h"
>   #include "qemu/thread.h"
>   #include "hw/core/cpu.h"
>   #include "qemu/rcu.h"
> @@ -44,69 +45,6 @@
>   #define BSWAP_NEEDED

I wonder if we could get rid of the BSWAP_NEEDED define also.
(used load_aout() and ELF loaders)

Thanks,

C.



>   #endif
>   
> -#ifdef BSWAP_NEEDED
> -
> -static inline uint16_t tswap16(uint16_t s)
> -{
> -    return bswap16(s);
> -}
> -
> -static inline uint32_t tswap32(uint32_t s)
> -{
> -    return bswap32(s);
> -}
> -
> -static inline uint64_t tswap64(uint64_t s)
> -{
> -    return bswap64(s);
> -}
> -
> -static inline void tswap16s(uint16_t *s)
> -{
> -    *s = bswap16(*s);
> -}
> -
> -static inline void tswap32s(uint32_t *s)
> -{
> -    *s = bswap32(*s);
> -}
> -
> -static inline void tswap64s(uint64_t *s)
> -{
> -    *s = bswap64(*s);
> -}
> -
> -#else
> -
> -static inline uint16_t tswap16(uint16_t s)
> -{
> -    return s;
> -}
> -
> -static inline uint32_t tswap32(uint32_t s)
> -{
> -    return s;
> -}
> -
> -static inline uint64_t tswap64(uint64_t s)
> -{
> -    return s;
> -}
> -
> -static inline void tswap16s(uint16_t *s)
> -{
> -}
> -
> -static inline void tswap32s(uint32_t *s)
> -{
> -}
> -
> -static inline void tswap64s(uint64_t *s)
> -{
> -}
> -
> -#endif
> -
>   #if TARGET_LONG_SIZE == 4
>   #define tswapl(s) tswap32(s)
>   #define tswapls(s) tswap32s((uint32_t *)(s))
> diff --git a/include/exec/tswap.h b/include/exec/tswap.h
> new file mode 100644
> index 0000000000..68944a880b
> --- /dev/null
> +++ b/include/exec/tswap.h
> @@ -0,0 +1,72 @@
> +/*
> + * Macros for swapping a value if the endianness is different
> + * between the target and the host.
> + *
> + * SPDX-License-Identifier: LGPL-2.1-or-later
> + */
> +
> +#ifndef TSWAP_H
> +#define TSWAP_H
> +
> +#include "hw/core/cpu.h"
> +#include "qemu/bswap.h"
> +
> +/*
> + * If we're in target-specific code, we can hard-code the swapping
> + * condition, otherwise we have to do (slower) run-time checks.
> + */
> +#ifdef NEED_CPU_H
> +#define target_needs_bswap()  (HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN)
> +#else
> +#define target_needs_bswap()  (target_words_bigendian() != HOST_BIG_ENDIAN)
> +#endif
> +
> +static inline uint16_t tswap16(uint16_t s)
> +{
> +    if (target_needs_bswap()) {
> +        return bswap16(s);
> +    } else {
> +        return s;
> +    }
> +}
> +
> +static inline uint32_t tswap32(uint32_t s)
> +{
> +    if (target_needs_bswap()) {
> +        return bswap32(s);
> +    } else {
> +        return s;
> +    }
> +}
> +
> +static inline uint64_t tswap64(uint64_t s)
> +{
> +    if (target_needs_bswap()) {
> +        return bswap64(s);
> +    } else {
> +        return s;
> +    }
> +}
> +
> +static inline void tswap16s(uint16_t *s)
> +{
> +    if (target_needs_bswap()) {
> +        *s = bswap16(*s);
> +    }
> +}
> +
> +static inline void tswap32s(uint32_t *s)
> +{
> +    if (target_needs_bswap()) {
> +        *s = bswap32(*s);
> +    }
> +}
> +
> +static inline void tswap64s(uint64_t *s)
> +{
> +    if (target_needs_bswap()) {
> +        *s = bswap64(*s);
> +    }
> +}
> +
> +#endif  /* TSWAP_H */


