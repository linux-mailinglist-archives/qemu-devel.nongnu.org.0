Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B65597B88
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 04:35:45 +0200 (CEST)
Received: from localhost ([::1]:47548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOVNo-0000hC-Jx
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 22:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oOVJa-0005ll-Li
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 22:31:23 -0400
Received: from mail.xen0n.name ([115.28.160.31]:54618
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oOVJX-00081O-Pc
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 22:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1660789865; bh=j/lOjkfQp8T51hTAqSZPPE0w7zz8Xagzy9QU1MpThxw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FSb4Onr90A0xp05RUyG4Rx4cRXUklywJgEyLaLAV3g+yfFO9UEDrlY199BvvYXnx6
 9zsevtKDQQCW7DX0+PJ/WD3FE4e926uP0LnoaZKoM1hjbsmo370a4d4KP4Gqj0FLUf
 ZMmF4GUUTdlL+r/Q6knWyhSRanYBaN1APmKJhZzY=
Received: from [100.100.57.219] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 9E79960074;
 Thu, 18 Aug 2022 10:31:05 +0800 (CST)
Message-ID: <daca3a69-08b3-be35-04b2-e6fcfe8207cd@xen0n.name>
Date: Thu, 18 Aug 2022 10:31:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:105.0)
 Gecko/20100101 Thunderbird/105.0a1
Subject: Re: [PATCH for-7.1 3/4] target/loongarch: rename the TCG CPU "la464"
 to "qemu64-v1.00"
To: Richard Henderson <richard.henderson@linaro.org>,
 WANG Xuerui <i.qemu@xen0n.name>, gaosong <gaosong@loongson.cn>,
 chen huacai <zltjiangshi@gmail.com>
Cc: qemu-level <qemu-devel@nongnu.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, WANG Xuerui <git@xen0n.name>,
 maobibo <maobibo@loongson.cn>
References: <20220814145351.1474753-1-git@xen0n.name>
 <20220814145522.1474927-4-i.qemu@xen0n.name>
 <1c4ae4dd-7365-1d5b-0608-31ba04ee96e0@linaro.org>
 <CABDp7VrhdgGG5WP7Bm5G2KmUytZ17GTDA3kYO6RPMcB5FyUo9Q@mail.gmail.com>
 <2382c1cd-6318-34a2-35e8-addc751f6aeb@loongson.cn>
 <a5fde3dc-0fd4-8739-82b1-d94781637169@xen0n.name>
 <ac55b78a-602a-e875-5bf0-c5040d7de2a1@linaro.org>
Content-Language: en-US
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <ac55b78a-602a-e875-5bf0-c5040d7de2a1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/8/17 21:26, Richard Henderson wrote:
> On 8/17/22 04:10, WANG Xuerui wrote:
>>  From my own experiences, different use cases care about different 
>> aspects of the CPU, and that IMO is an argument in favor of providing 
>> both (high-fidelity models named after actual product model names, 
>> and virtual models named after ISA levels). But before we have truly 
>> high-fidelity models I think we should start with the virtual ones 
>> first. And don't pretend the currently implemented model is LA464 -- 
>> the kernel change I've linked to [1] implies the opposite.
>
> No, it simply pointed to a bug in qemu that could have been fixed.
>
> The trouble with inventing virtual models is that no one knows what 
> they mean.  Targeting real hardware is better, because we have a 
> documented standard.
>
Hmm, I've looked up more context and it is indeed reasonable to 
generally name the QEMU models after real existing models. But in this 
case we could face a problem with Loongson's nomenclature: all of 
Loongson 3A5000, 3C5000 and 3C5000L are LA464, yet they should be 
distinguishable software-side by checking the model name CSR. But with 
only one CPU model that is LA464, currently this CSR is hard-coded to 
read "3A5000", and this can hurt IMO. And when we finally add LA264 and 
LA364 they would be identical ISA-level-wise, again the only 
differentiator is the model name CSR.

And by "not high-fidelity", I mean some of the features present on real 
HW might never get implemented, or actually implementable, like the DVFS 
mechanism needed by cpufreq. And I believe Bibo wouldn't have to change 
the kernel if it's not needed after all to run the unmodified upstream 
kernel on top of qemu-system-loongarch64. (I would of course accept, and 
learn something along the way, if this turns out not to be the case though.)

Lastly, the "ISA level" I proposed is not arbitrarily made up; it's 
direct reference to the ISA manual revision. Each time the ISA gets some 
addition/revision the ISA manual has to be updated, and currently the 
manual's revision is the only reliable source of said information. 
(Loongson has a history of naming cores badly, like with the MIPS 3B1500 
and 3A4000, both were "GS464V"; and 3A5000 was originally GS464V too, 
even though the insn encodings and some semantics have been entirely 
different.)

In conclusion, I'd accept the micro-architecture naming if the model CSR 
behavior could be sorted out, otherwise I'd personally prefer real model 
names if ISA level naming is not going to fly. This is not a strong 
objection to the current way of doing things though, more like some 
minor but anyway needed discussion that happened a bit late. Sorry for 
not chiming in earlier during the review process.

