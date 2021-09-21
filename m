Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA3B4132C1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 13:42:33 +0200 (CEST)
Received: from localhost ([::1]:33634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSeAS-00049P-7t
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 07:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSe8r-0002tG-CW
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 07:40:53 -0400
Received: from [115.28.160.31] (port=51022 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSe8n-0002eK-2H
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 07:40:52 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id D3C1E600FF;
 Tue, 21 Sep 2021 19:40:42 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632224442; bh=IPEJHwWII5LUooU6RAav5VQpH/upI5UJnW24lc1JWfY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=p4Up5bU0pjen+oFLm3DsgTOntI6MmhepbVjCAfP6CKG+DYu1fr/mg6A7e/Oh3n1m6
 q0JE6nPPwoCaxz2xb4PkfEHnL5xI8HvvOMrDSMBs4pzZmxzVLpdPeA/lIjBBOkGrRO
 n9ONPKqKTlNbQFvbNBLmzSCOsElXVay7maXS+0ls=
Message-ID: <c91cbd8a-ccf5-07e5-bcda-45afd844433e@xen0n.name>
Date: Tue, 21 Sep 2021 19:40:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH 04/30] tcg/loongarch: Add generated instruction opcodes
 and encoding helpers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-5-git@xen0n.name>
 <37d8ad22-a440-83b1-6d2d-d851df96723b@amsat.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <37d8ad22-a440-83b1-6d2d-d851df96723b@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 9/21/21 17:58, Philippe Mathieu-Daudé wrote:
> On 9/20/21 10:04, WANG Xuerui wrote:
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> ---
>>   tcg/loongarch/tcg-insn-defs.c.inc | 1080 +++++++++++++++++++++++++++++
>>   1 file changed, 1080 insertions(+)
>>   create mode 100644 tcg/loongarch/tcg-insn-defs.c.inc
>
>> +static int32_t encode_dj_slots(LoongArchInsn opc, uint32_t d, 
>> uint32_t j)
>> +{
> Can we move the range check to the callee and avoid masking the values
> in the caller?
>
>        tcg_debug_assert(d < 0x20);
>        tcg_debug_assert(j < 0x20);

Making use of tcg_debug_assert would be rather nice, but in fact 
different instructions could have differently sized fields start from 
the same offset. Take the "bstrpick.w" and "bstrpick.d" instructions, 
they belong to DJUk5Um5 and DJUk6Um6 formats respectively; the "Uk5" and 
"Uk6" fields both start from the 10th bit but have different value 
ranges. So the range checks necessarily live in encoders for the 
individual formats.


