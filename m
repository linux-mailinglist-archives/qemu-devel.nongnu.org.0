Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA2DE07A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 12:25:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55247 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL3TX-000800-PS
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 06:25:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hL3R6-0006df-MV
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 06:23:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hL3Mu-0006rF-Qj
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 06:18:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56134)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hL3Mu-0006qt-Id; Mon, 29 Apr 2019 06:18:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF2343082162;
	Mon, 29 Apr 2019 10:18:39 +0000 (UTC)
Received: from [10.36.118.17] (unknown [10.36.118.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99F945D71D;
	Mon, 29 Apr 2019 10:18:34 +0000 (UTC)
To: Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>
References: <20190429090250.7648-1-borntraeger@de.ibm.com>
	<20190429090250.7648-9-borntraeger@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <87f1441f-f081-e693-065c-b930fba588da@redhat.com>
Date: Mon, 29 Apr 2019 12:18:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429090250.7648-9-borntraeger@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 29 Apr 2019 10:18:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 8/9] s390x/cpumodel: add gen15 defintions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
	Collin Walling <walling@linux.ibm.com>, qemu-devel <qemu-devel@nongnu.org>,
	Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.04.19 11:02, Christian Borntraeger wrote:
> add several new features (msa9, sort, deflate, additional vector
> instructions, new general purpose instructions) to generation 15.
> 
> Also disable csske and bpb from the default and base models >=15.
> This will allow to migrate gen15 machines to future machines that
> do not have these features.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  target/s390x/gen-features.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 8fc2e8e72f..c346b76bdf 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -13,6 +13,7 @@
>  
>  #include <inttypes.h>
>  #include <stdio.h>
> +#include <string.h>
>  #include "cpu_features_def.h"
>  
>  #define ARRAY_SIZE(array) (sizeof(array) / sizeof(array[0]))
> @@ -419,6 +420,10 @@ static uint16_t base_GEN14_GA1[] = {
>  
>  #define base_GEN14_GA2 EmptyFeat
>  
> +static uint16_t base_GEN15_GA1[] = {
> +    S390_FEAT_MISC_INSTRUCTION_EXT3,
> +};
> +
>  /* Full features (in order of release)
>   * Automatically includes corresponding base features.
>   * Full features are all features this hardware supports even if kvm/QEMU do not
> @@ -548,6 +553,16 @@ static uint16_t full_GEN14_GA1[] = {
>  
>  #define full_GEN14_GA2 EmptyFeat
>  
> +static uint16_t full_GEN15_GA1[] = {
> +    S390_FEAT_VECTOR_ENH2,
> +    S390_FEAT_GROUP_ENH_SORT,
> +    S390_FEAT_GROUP_DEFLATE_CONVERSION,
> +    S390_FEAT_VECTOR_BCD_ENH,
> +    S390_FEAT_GROUP_MSA_EXT_9,
> +    S390_FEAT_GROUP_MSA_EXT_9_PCKMO,
> +    S390_FEAT_ETOKEN,
> +};
> +
>  /* Default features (in order of release)
>   * Automatically includes corresponding base features.
>   * Default features are all features this version of QEMU supports for this
> @@ -624,6 +639,16 @@ static uint16_t default_GEN14_GA1[] = {
>  
>  #define default_GEN14_GA2 EmptyFeat
>  
> +static uint16_t default_GEN15_GA1[] = {
> +    S390_FEAT_VECTOR_ENH2,
> +    S390_FEAT_GROUP_ENH_SORT,
> +    S390_FEAT_GROUP_DEFLATE_CONVERSION,
> +    S390_FEAT_VECTOR_BCD_ENH,
> +    S390_FEAT_GROUP_MSA_EXT_9,
> +    S390_FEAT_GROUP_MSA_EXT_9_PCKMO,
> +    S390_FEAT_ETOKEN,
> +};
> +
>  /* QEMU (CPU model) features */
>  
>  static uint16_t qemu_V2_11[] = {
> @@ -740,6 +765,7 @@ static CpuFeatDefSpec CpuFeatDef[] = {
>      CPU_FEAT_INITIALIZER(GEN13_GA2),
>      CPU_FEAT_INITIALIZER(GEN14_GA1),
>      CPU_FEAT_INITIALIZER(GEN14_GA2),
> +    CPU_FEAT_INITIALIZER(GEN15_GA1),
>  };
>  
>  #define FEAT_GROUP_INITIALIZER(_name)                  \
> @@ -808,6 +834,11 @@ static void set_bits(uint64_t list[], BitSpec bits)
>      }
>  }
>  
> +static inline void clear_bit(uint64_t list[], unsigned long nr)
> +{
> +    list[nr / 64] &= ~(1ULL << (nr % 64));
> +}
> +
>  static void print_feature_defs(void)
>  {
>      uint64_t base_feat[S390_FEAT_MAX / 64 + 1] = {};
> @@ -818,6 +849,12 @@ static void print_feature_defs(void)
>      printf("\n/* CPU model feature list data */\n");
>  
>      for (i = 0; i < ARRAY_SIZE(CpuFeatDef); i++) {
> +        /* With gen15 CSSKE and BPB are deprecated */
> +        if (strcmp(CpuFeatDef[i].name, "S390_FEAT_LIST_GEN15_GA1") == 0) {
> +            clear_bit(base_feat, S390_FEAT_CONDITIONAL_SSKE);
> +            clear_bit(default_feat, S390_FEAT_CONDITIONAL_SSKE);
> +            clear_bit(default_feat, S390_FEAT_BPB);
> +        }
>          set_bits(base_feat, CpuFeatDef[i].base_bits);
>          /* add the base to the default features */
>          set_bits(default_feat, CpuFeatDef[i].base_bits);
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 

Thanks,

David / dhildenb

