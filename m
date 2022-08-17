Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E9596BD8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 11:13:09 +0200 (CEST)
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOF6p-0004JT-Ox
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 05:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oOF5A-0002tm-LH
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 05:11:24 -0400
Received: from mail.xen0n.name ([115.28.160.31]:54616
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oOF55-0004sa-Su
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 05:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1660727431; bh=pFexvhbgr1yXfTzBNsQxNZ2CgWorwuJ5IXAx1P71ONw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b6J0x+jh8FTD/LuhfMNZYDUq+owNjScWfJLXTnHdiFhMV2lU6/04OoZSQj/GdouF5
 Rzf8i+927Ns1u7LHse/X/MSofddTlSLuvyoZwf27bAHHOwJanmXTnARQpJlgTXLpxr
 uJXY8izOXgtxZkNqInqk7moXzVDInVKUak8Ng5tE=
Received: from [100.100.57.219] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id EECC260074;
 Wed, 17 Aug 2022 17:10:30 +0800 (CST)
Message-ID: <a5fde3dc-0fd4-8739-82b1-d94781637169@xen0n.name>
Date: Wed, 17 Aug 2022 17:10:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:105.0)
 Gecko/20100101 Thunderbird/105.0a1
Subject: Re: [PATCH for-7.1 3/4] target/loongarch: rename the TCG CPU "la464"
 to "qemu64-v1.00"
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, chen huacai <zltjiangshi@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: WANG Xuerui <i.qemu@xen0n.name>, qemu-level <qemu-devel@nongnu.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, WANG Xuerui <git@xen0n.name>,
 maobibo <maobibo@loongson.cn>
References: <20220814145351.1474753-1-git@xen0n.name>
 <20220814145522.1474927-4-i.qemu@xen0n.name>
 <1c4ae4dd-7365-1d5b-0608-31ba04ee96e0@linaro.org>
 <CABDp7VrhdgGG5WP7Bm5G2KmUytZ17GTDA3kYO6RPMcB5FyUo9Q@mail.gmail.com>
 <2382c1cd-6318-34a2-35e8-addc751f6aeb@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <2382c1cd-6318-34a2-35e8-addc751f6aeb@loongson.cn>
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

On 2022/8/17 16:11, gaosong wrote:
>
> 在 2022/8/17 上午10:36, chen huacai 写道:
>> Hi, Richard and Xuerui,
>>
>> On Mon, Aug 15, 2022 at 4:54 AM Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> On 8/14/22 09:55, WANG Xuerui wrote:
>>>> From: WANG Xuerui <git@xen0n.name>
>>>>
>>>> The only LoongArch CPU implemented is modeled after the Loongson 
>>>> 3A5000,
>>>> but it is not the real thing, ...
>>> The 3A5000 is the SoC, as far as I could find, and the documentation 
>>> of that says the core
>>> is named the la464.
>>>
>>>
>>>> In general, high-fidelity models can and should be named after the 
>>>> real
>>>> hardware model, while generic emulation-oriented models should be 
>>>> named
>>>> after ISA levels.
>>> This wasn't intended to be a generic emulation model, as far as I 
>>> know.  There are missing
>>> features, but presumably those would eventually be filled in.
>>>
>>>
>>>> For now, the best reference for LoongArch ISA levels
>>>> is the revision number of the LoongArch ISA Manual, of which v1.00 is
>>>> still the latest. (v1.01 and v1.02 are minor revisions without
>>>> substantive change.)
>>>>
>>>> As defined by various specs, the vendor and model names are also
>>>> reflected in respective CSRs, and are 8 bytes long. So, rename "la464"
>>>> to "qemu64-v1.00", with "QEMU64" as vendor name and "v1.00" as model
>>>> name.
>>> Eh, I suppose.  I'm not really keen on this though, as I would 
>>> presume there will be
>>> eventual forward progress on completing the real cpu model. We 
>>> simply won't give any
>>> compatibility guarantees for loongarch until we are ready to do so.
>> In my opinion, real cpu name (Loongson-3A5000, Loongson-3A6000, etc.)
>> and generic qemu emulated name (qemu64-v1.00, qemu64-v2.00, vx.xx is
>> the ISA level, I found this style is used for x86) are both
>> acceptable. But la464 is not a good cpu name, because la264 and la464
>> are in the same ISA level, while la664 will be in a new level.
> I think that 'la264' , 'la464' and 'la664'  are  cpu core name. used 
> them as cpu type is more suitable.
> Although la264 and la464 are in the same ISA level,   but the features 
> should be different.

 From my own experiences, different use cases care about different 
aspects of the CPU, and that IMO is an argument in favor of providing 
both (high-fidelity models named after actual product model names, and 
virtual models named after ISA levels). But before we have truly 
high-fidelity models I think we should start with the virtual ones 
first. And don't pretend the currently implemented model is LA464 -- the 
kernel change I've linked to [1] implies the opposite.

If you're emulating certain boards to test kernels/drivers or similar 
things, it could help to be able to specify exact CPU models and/or 
machine type. However, for the linux-user case, it is almost always the 
ISA level that actually matters, and I don't think LA264/LA364/LA464 are 
going to differ w.r.t. unprivileged instruction behavior. Having to 
choose an overly specific model for a broad ISA level match seems 
inappropriate to my aesthetic sense.

[1]: 
https://github.com/torvalds/linux/commit/71610ab1d017e131a9888ef8acd035284fb0e1dd

