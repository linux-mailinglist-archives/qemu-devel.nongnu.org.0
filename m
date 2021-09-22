Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7105C414099
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 06:34:27 +0200 (CEST)
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mStxi-0005Mg-Gt
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 00:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mStwg-0004ej-Bl
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:33:22 -0400
Received: from [115.28.160.31] (port=60726 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mStwd-0003n7-OV
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:33:21 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 38479600FF;
 Wed, 22 Sep 2021 12:33:10 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632285190; bh=4HCL2d6ndr/TInCxZ+hbEZtxWKzktPakPDIuCmOBPVg=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=cqwwzHyCUNdjngjuPeaYV5YVeRRBgTDnCELrfi7LoFwP1DN3TZ+3TRsUOK2zRpbIF
 GVqTwckK/qtFrco3fr6fjtCyUcxghvag+vWVs46+67UYnhttGmSawBvZKKtxhsK7bI
 hrsgyvW9rKnYUNFUl8uesZC+2dySCIb7xXANzzHs=
Message-ID: <9d072cc6-c4d8-7b00-36b6-6e91de8734e5@xen0n.name>
Date: Wed, 22 Sep 2021 12:33:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v2 03/30] tcg/loongarch64: Add the tcg-target.h file
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-4-git@xen0n.name>
 <e73b36c7-05c7-9f9d-0912-5f8d8517fe83@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <e73b36c7-05c7-9f9d-0912-5f8d8517fe83@linaro.org>
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

On 9/22/21 11:55, Richard Henderson wrote:
> On 9/21/21 1:18 PM, WANG Xuerui wrote:
>> Signed-off-by: WANG Xuerui<git@xen0n.name>
>> ---
>>   tcg/loongarch64/tcg-target.h | 180 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 180 insertions(+)
>>   create mode 100644 tcg/loongarch64/tcg-target.h
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> However...
>
>
>> +#define TCG_TARGET_HAS_sub2_i32         0
>> +#define TCG_TARGET_HAS_mulu2_i32        0
>> +#define TCG_TARGET_HAS_muls2_i32        0
>> +#define TCG_TARGET_HAS_muluh_i32        1
>> +#define TCG_TARGET_HAS_mulsh_i32        1
>> +#define TCG_TARGET_HAS_ext8s_i32        1
>> +#define TCG_TARGET_HAS_ext16s_i32       1
>> +#define TCG_TARGET_HAS_ext8u_i32        1
>> +#define TCG_TARGET_HAS_ext16u_i32       1
>> +#define TCG_TARGET_HAS_bswap16_i32      0
>
> It might be better to enable these with the patch that adds the insns.
Sounds like a good idea, I'll re-organize to enable these individually 
in each commit in v3.
>
> r~

