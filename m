Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B86412E77
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 08:03:50 +0200 (CEST)
Received: from localhost ([::1]:40728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSYsf-0002bj-9C
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 02:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSYrm-0001st-Ps
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:02:54 -0400
Received: from [115.28.160.31] (port=47914 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSYrk-0001QA-6o
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:02:54 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id DAD5C600FF;
 Tue, 21 Sep 2021 14:02:45 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632204166; bh=fiXU4/NDv/ZxhMDOvZl4GRovSz4LR32GAtYngVPgS1A=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=lgwiyxv+r5IKv6t6UMi32EGfzpV32D53BBb9xL+BpbM1z4NL+HjW+NLLuXMP9spvr
 QKyv4sQWZzCIVbnfJw5FYw1/FUK3l9vbYwnloAIJcxitjj0bBiM/RilxUVuIhApa5t
 PtqQf/HDa+JQq6z7RrJCVSgJWXN6g/zf54aytdHM=
Message-ID: <baa4bcf7-9e4f-1745-5957-6d715a14f711@xen0n.name>
Date: Tue, 21 Sep 2021 14:02:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH 28/30] configure, meson.build: Mark support for 64-bit
 LoongArch hosts
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-29-git@xen0n.name>
 <de7efdfe-24ae-015c-015d-50acc245df1c@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <de7efdfe-24ae-015c-015d-50acc245df1c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/21/21 01:23, Richard Henderson wrote:
> On 9/20/21 1:04 AM, WANG Xuerui wrote:
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> ---
>>   configure   | 4 +++-
>>   meson.build | 4 +++-
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 1043ccce4f..f1bc85e71b 100755
>> --- a/configure
>> +++ b/configure
>> @@ -659,6 +659,8 @@ elif check_define __arm__ ; then
>>     cpu="arm"
>>   elif check_define __aarch64__ ; then
>>     cpu="aarch64"
>> +elif check_define __loongarch64 ; then
>> +  cpu="loongarch64"
>>   else
>>     cpu=$(uname -m)
>>   fi
>> @@ -667,7 +669,7 @@ ARCH=
>>   # Normalise host CPU name and set ARCH.
>>   # Note that this case should only have supported host CPUs, not 
>> guests.
>>   case "$cpu" in
>> -  ppc|ppc64|s390x|sparc64|x32|riscv32|riscv64)
>> +  ppc|ppc64|s390x|sparc64|x32|riscv32|riscv64|loongarch64)
>>     ;;
>>     ppc64le)
>>       ARCH="ppc64"
>> diff --git a/meson.build b/meson.build
>> index 2711cbb789..fb3befead5 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -57,7 +57,7 @@ python = import('python').find_installation()
>>     supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 
>> 'darwin', 'sunos', 'linux']
>>   supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 
>> 'x86', 'x86_64',
>> -  'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
>> +  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc', 
>> 'sparc64']
>>     cpu = host_machine.cpu_family()
>>   targetos = host_machine.system()
>> @@ -269,6 +269,8 @@ if not get_option('tcg').disabled()
>>       tcg_arch = 's390'
>>     elif config_host['ARCH'] in ['x86_64', 'x32']
>>       tcg_arch = 'i386'
>> +  elif config_host['ARCH'] == 'loongarch64'
>> +    tcg_arch = 'loongarch'
>
> Be consistent with loongarch or loongarch64 everywhere.
>
> If there's no loongarch32, and never will be, then there's probably no 
> point in keeping the '64' suffix.

The loongarch32 tuple will most certainly come into existence some time 
in the future, but probably bare-metal-only and without a Linux port 
AFAIK. That's a point the Loongson people and I didn't communicate well, 
apologizes for that. (While we're at it, the reserved "loongarchx32" 
which is x32/n32-like, most likely will never exist.)

So should I drop the explicit probing for __loongarch64, instead just 
probe for __loongarch__ and later #error out the non-__loongarch64 cases 
individually?

>
>
> r~

