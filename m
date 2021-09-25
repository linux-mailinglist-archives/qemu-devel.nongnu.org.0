Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25947418361
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 18:21:32 +0200 (CEST)
Received: from localhost ([::1]:48292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUAQc-0000F0-Ap
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 12:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mUAOU-0006lW-RL
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 12:19:18 -0400
Received: from [115.28.160.31] (port=56096 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mUAOP-0001yJ-Ps
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 12:19:18 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7C97160B2D;
 Sun, 26 Sep 2021 00:19:06 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632586746; bh=IiKWZZEl0J/MKjoYvKIy059QlTHTce8te8sOaUQJV+c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YKGJbvuvErVmjXBy1++YTHIump/IP+YDi3LD+qhmKjZbRSyzSZQ7SmulIyBfKisQ2
 CtrK7es/vjogaPVUsgRGMXLdMoSLYOWkPyYkw4SIIftvvSsbtJHWQoTnd6lQI81miD
 i3dgS7vmggF1J8n8qedQdMVOwiH6mdIkbdwWMFZY=
Message-ID: <a31c70a4-6e49-2fd8-d31b-9be901ce2995@xen0n.name>
Date: Sun, 26 Sep 2021 00:19:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v5 04/30] tcg/loongarch64: Add generated instruction
 opcodes and encoding helpers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-5-git@xen0n.name>
 <313df1b0-9edf-7333-da46-7342ca308dfb@xen0n.name>
 <6bc47454-7475-7b02-3621-54d064a975e7@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <6bc47454-7475-7b02-3621-54d064a975e7@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/25/21 22:20, Richard Henderson wrote:
> On 9/24/21 11:51 PM, WANG Xuerui wrote:
>> Hi all,
>>
>> On 9/25/21 01:25, WANG Xuerui wrote:
>>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   tcg/loongarch64/tcg-insn-defs.c.inc | 979 
>>> ++++++++++++++++++++++++++++
>>>   1 file changed, 979 insertions(+)
>>>   create mode 100644 tcg/loongarch64/tcg-insn-defs.c.inc
>> This patch series is only lacking Reviewed-by tag for this commit 
>> now; may I ask whose review do I additionally need to get this across 
>> the finish line? Or is this series waiting for upstream merge of 
>> toolchain and kernel support too?
>
> An ack is as good as a review in this case.
> I don't normally "review" machine-generated code.
>
> While the toolchain is not upstream, the ABI seems solid enough. So 
> there's no worries on that account.  The safe-syscall code has nothing 
> in it that's kernel api specific, so there's no block there either.
>
> It looks like one more revision to address the valid nits in 
> tcg_out_movi are all that remains before I can merge this.  I'll work 
> around the conflict with my SIGSEGV patch set, and Cc you for testing 
> when it is time.
Thanks for the clarification; v6 is ready and I'll send shortly. (And 
sorry for the conflict! I looked at the refactor series, though, and it 
seems some simple code motion is enough. LoongArch is not that different 
from other arches after all...)
>
>
> r~

