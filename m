Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E082DB970
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:52:04 +0100 (CET)
Received: from localhost ([::1]:58456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMv5-0007JW-DA
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpMtb-0006mY-Ja
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:50:31 -0500
Received: from relay4.mymailcheap.com ([137.74.80.156]:56545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpMtZ-0006RI-5l
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:50:31 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id 8DEB33F162;
 Wed, 16 Dec 2020 03:50:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id A249F2A366;
 Tue, 15 Dec 2020 21:50:24 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608087024;
 bh=NPhTL66SvgI8FcWD0LCzrfFz5neA9mfCDobCPQUeBig=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=yUr3O5PE3XioelU73+OvlzPyBex7fSp0zN8YDCKwElLlpK01mVi8fB8dEC7bz5Rw7
 3BsmMrE+5yPoHG8JbeNn6wIuTPkmgjDcISftKkhnc1FntTy6V0oMpacDxIFlFbAlVC
 5YW3q3su40y29FRUWjs0XDDxrZRs4/G+UEHRGqVo=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4XQkpF0n3NO2; Tue, 15 Dec 2020 21:50:23 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Tue, 15 Dec 2020 21:50:23 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 5FA4F41990;
 Wed, 16 Dec 2020 02:50:20 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="B08xGvDp"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 4026341990;
 Wed, 16 Dec 2020 02:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608087014;
 bh=NPhTL66SvgI8FcWD0LCzrfFz5neA9mfCDobCPQUeBig=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=B08xGvDprLHPsCgb/UiXfS2Kzarf4sD2l5NHPEk4ZytLeu9NPwU59mIeac8F6E5Ox
 DlV69t4jDMSyMTIp/sV6pYdXbePx8DguXG4atJq7UBeOydU2VbOHAGyZB4UlLBLziX
 wkiORYZMbPzfzwtADS5r7MPOiqkav4y/h3pdKFw8=
Subject: Re: [PATCH v2 03/24] target/mips/cpu: Introduce isa_rel6_available()
 helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-4-f4bug@amsat.org>
 <508441db-8748-1b55-5f39-e6a778c0bdc0@linaro.org>
 <40e8df0f-01ab-6693-785b-257b8d3144bf@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <af357960-40f2-b9e6-485f-d1cf36a4e95d@flygoat.com>
Date: Wed, 16 Dec 2020 10:50:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <40e8df0f-01ab-6693-785b-257b8d3144bf@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 R_SPF_SOFTFAIL(0.00)[~all]; ML_SERVERS(-3.10)[148.251.23.173];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 RCPT_COUNT_SEVEN(0.00)[8];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: 5FA4F41990
Received-SPF: pass client-ip=137.74.80.156;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay4.mymailcheap.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2020/12/16 上午7:48, Philippe Mathieu-Daudé 写道:
> On 12/16/20 12:27 AM, Richard Henderson wrote:
>> On 12/15/20 4:57 PM, Philippe Mathieu-Daudé wrote:
>>> +bool isa_rel6_available(const CPUMIPSState *env)
>>> +{
>>> +    if (TARGET_LONG_BITS == 64) {
>>> +        return cpu_supports_isa(env, ISA_MIPS64R6);
>>> +    }
>>> +    return cpu_supports_isa(env, ISA_MIPS32R6);
>>> +}
>> So... does qemu-system-mips64 support 32-bit cpus?
> Well... TBH I never tested it :S It looks the TCG code
> is compiled with 64-bit TL registers, the machine address
> space is 64-bit regardless the CPU, and I see various
> #ifdef MIPS64 code that look dubious with 32-bit CPU.
qemu-system-mips64 and qemu-system-mips64el do support 32bit
CPUs like M14Kc and P5600 :-)
Sometimes I'm just curious about the necessity of having mips/mipsel 
targets
>> If so, this needs to be written
>>
>>    if (TARGET_LONG_BITS == 64 && cpu_supports_isa(...)) {
>>      return true;
>>    }
>>
>> Otherwise, this will return false for a mips32r6 cpu.
> I see. Rel6 is new to me, so I'll have to look at the ISA
> manuals before returning to this thread with an answer.

TBH I do think it doesn't sounds like a good idea to make 32-bit
and 64-bit different. In fact ISA_MIPS32R6 is always set for targets
with ISA_MIPS64R6.

We're treating MIPS64R6 as a superset of MIPS32R6, and ISA_MIPS3
is used to tell if a CPU supports 64-bit.

FYI: https://commons.wikimedia.org/wiki/File:MIPS_instruction_set_family.svg

Thanks.

- Jiaxun


>
> Thanks for reviewing the series!
>
> Phil.

