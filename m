Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13157616C22
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 19:31:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqIV2-0008Iq-AX; Wed, 02 Nov 2022 14:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqIUs-0008Hy-R9; Wed, 02 Nov 2022 14:29:55 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqIUr-00020J-1m; Wed, 02 Nov 2022 14:29:54 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MrgcU-1pM0DS3Bq8-00nlhc; Wed, 02 Nov 2022 19:29:43 +0100
Message-ID: <cda12ec5-1af1-0dbc-ad12-f44980742098@vivier.eu>
Date: Wed, 2 Nov 2022 19:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/3] target/m68k: Rename qregs.def -> qregs.h.inc
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-trivial@nongnu.org
References: <20221025235006.7215-1-philmd@linaro.org>
 <20221025235006.7215-2-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221025235006.7215-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k0z2Rs2/WV78eoVKSFm/TBX4eDyQDhKEaFXJ9tZdguXXYM9KDR2
 liL1Bxhi+Cu4jCQ2hG7QLSieq+0ohn/ji0S9xgJWrxgCLqDMQ8/rX4rQ8IZEdeBqq9cZhVC
 9cuUeSc0FJ+pbCSOsK+xm7F+mYWRn2+Byxp1PNqdBEryAL//sgWL1D9sDDTRkuKlfna81qk
 T0DGA7TRQe8oZfW845u/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OVQ14kZ7ioE=:xf/hjk7mpUryysTh+wyJbr
 F+cKKcqpz+4MwEWSbV0M63kTxCvlFjrN0pDCxQt68BMqoX1rn7Uy4VzYRauMtqCaEYhnn9ooA
 XfFl2TSDhcghsOcCyEdIgcLtHdb3Yo/LXFpGJfDMB4sjN7s2g5HPVqGZPJ47UWWHT640n1ocG
 Nuwb1e5suHs6CFPpGR3/yRghHFGZz8TukJIN0FmfGpyeKpuHGMq2Cq/WUibI6yAbngwikntSa
 cwSa21rrbkIYuQGUKNkEUs7JKE64TwizaFdotBe42b5MnBpb0xZNBhFTpKkFDvWLzxQmFOugf
 a/rZmF7N9qNBWPI2JXmFXMQHJEtnswYRTRgXNUn1iFcMw9g7ZdKpZ78uy/gl5LyqLyZLHeqaQ
 ZOdBvLK2J9IyOlfPw79GsCqXUyIWAcOoSKavCVmLm6eHmzD72eCR/IQxFeOUyKqra87OYxmpl
 nkpmFRFzcpAUYqwEL7ZwXJLIYPQVaMN4tJhLR4Dbp0poB7c2EGfKl3J/g76HQ1JGITaxFay9D
 dtKu4IzhOby3cYMbtJaljUvqbc07Aj+vPCelf5ia4paGw6Iuu9D8fHLbjW2pM0n9wZGkuDxS3
 ilI7stxKOCo6zUw/0sOaQvaPUS8oPpispuJjPMmRSBPr71bgUQdESJn9zPk3poYLKpwajjjQN
 iOo+UbB81ZbmmLWnodtj8usMfKe2k8c78d3K66WGfpoVDhg+Bav2Ty3bYDLc7JjW2qGQkoiz4
 GO3Zo73uug0O8z7SJMp5zi1QWKhykgq+6uX2cb85gErJUZY7CUR8eRwKco56R4IK0G5g2aAVJ
 XMqJqiE
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 26/10/2022 à 01:50, Philippe Mathieu-Daudé a écrit :
> We use the .h.inc extension to include C headers. To be consistent
> with the rest of the codebase, rename the C headers using the .def
> extension.
> 
> IDE/tools using our .editorconfig / .gitattributes will leverage
> this consistency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/m68k/{qregs.def => qregs.h.inc} | 0
>   target/m68k/translate.c                | 4 ++--
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename target/m68k/{qregs.def => qregs.h.inc} (100%)
> 
> diff --git a/target/m68k/qregs.def b/target/m68k/qregs.h.inc
> similarity index 100%
> rename from target/m68k/qregs.def
> rename to target/m68k/qregs.h.inc
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 9df17aa4b2..f018fa9eb0 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -39,7 +39,7 @@
>   
>   #define DEFO32(name, offset) static TCGv QREG_##name;
>   #define DEFO64(name, offset) static TCGv_i64 QREG_##name;
> -#include "qregs.def"
> +#include "qregs.h.inc"
>   #undef DEFO32
>   #undef DEFO64
>   
> @@ -75,7 +75,7 @@ void m68k_tcg_init(void)
>   #define DEFO64(name, offset) \
>       QREG_##name = tcg_global_mem_new_i64(cpu_env, \
>           offsetof(CPUM68KState, offset), #name);
> -#include "qregs.def"
> +#include "qregs.h.inc"
>   #undef DEFO32
>   #undef DEFO64
>   

Applied to my trivial-patches branch.

Thanks,
Laurent



