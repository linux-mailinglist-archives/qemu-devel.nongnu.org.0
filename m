Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CED1963AA
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 06:13:41 +0100 (CET)
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jI3mu-0000FY-7q
	for lists+qemu-devel@lfdr.de; Sat, 28 Mar 2020 01:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39072)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiaoyao.li@intel.com>) id 1jI3mC-0008I0-7w
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 01:12:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xiaoyao.li@intel.com>) id 1jI3mA-0007M2-Dh
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 01:12:55 -0400
Received: from mga02.intel.com ([134.134.136.20]:8176)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <xiaoyao.li@intel.com>)
 id 1jI3mA-0007AN-6K
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 01:12:54 -0400
IronPort-SDR: dFr62eK8V9XrEFKRxmE6WzmZ44WJ0TDNhpCgayxpA/Ox4rC6T/EEDFEj1YecVYM0iHl4kJO8FQ
 T/auhdA7iw4g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 22:12:46 -0700
IronPort-SDR: oFNzmKGc7dI5tAhEtxmdk4Nr0OIvf7ILNm6KRBl5yx4J2pQlO2Gm4Y+x+nmEv69d0jBrxLHQr2
 WigIcMXsSyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,315,1580803200"; d="scan'208";a="394582432"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.249.174.239])
 ([10.249.174.239])
 by orsmga004.jf.intel.com with ESMTP; 27 Mar 2020 22:12:44 -0700
Subject: Re: [PATCH v2 3/4] target/i386: add the missing features for
 Icelake-Server CPU model
To: Chenyi Qiang <chenyi.qiang@intel.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20200328030625.16428-1-chenyi.qiang@intel.com>
 <20200328030625.16428-4-chenyi.qiang@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
Message-ID: <437d5644-a1ae-a278-b846-ac8254561bd2@intel.com>
Date: Sat, 28 Mar 2020 13:12:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200328030625.16428-4-chenyi.qiang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 134.134.136.20
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
Cc: qemu-devel@nongnu.org, Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/2020 11:06 AM, Chenyi Qiang wrote:
> Add the SHA_NI and AVX512IFMA feature bits in FEAT_7_0_EBX, RDPID
> feature bit in FEAT_7_0_ECX and FSRM feature bit in FEAT_7_0_EDX.
> 
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
> ---
>   target/i386/cpu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index b01421c6bb..babb074abf 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -3552,6 +3552,16 @@ static X86CPUDefinition builtin_x86_defs[] = {
>                       { /* end of list */ }
>                   },
>               },
> +            {
> +                .version = 3,

Maybe you need to make it as version = 4, since 3 is used to add 
ARCH_CAPABILITIES bits and the Patch is queued:

https://lore.kernel.org/qemu-devel/20200323183936.GA3784@habkost.net/

> +                .props = (PropValue[]) {
> +                    { "sha-ni", "on" },
> +                    { "avx512ifma", "on" },
> +                    { "rdpid", "on" },
> +                    { "fsrm", "on" },
> +                    { /* end of list */ }
> +                },
> +            },
>               { /* end of list */ }
>           }
>       },
> 


