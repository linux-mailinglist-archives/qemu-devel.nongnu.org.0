Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ECB434ACC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 14:05:32 +0200 (CEST)
Received: from localhost ([::1]:43978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdALb-00081n-3a
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 08:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mdAH4-0005JC-Qa
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 08:00:50 -0400
Received: from mail.xen0n.name ([115.28.160.31]:60600
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mdAH1-0007NK-HY
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 08:00:50 -0400
Received: from [100.100.57.93] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 0D8EF600B5;
 Wed, 20 Oct 2021 20:00:42 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1634731242; bh=xJE3wnfI7wPTB4qcAH7+SyryhrA72tyAsod1HsTHenE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P9sKf31ho2NrkJNsT99GFv1aSdG7fUr/5LmzG0CwuqtD3c9Xxl/SxBRE+QlZrIf/g
 MPzwYsRCNUkrqmhWqHTKLpfuhMqaPs5r3qUY82gHvxyNfN+XpwtfCbiL9Edsk7my3o
 3iHzq4VWYQ8QDRCPj3lkpLAWDPZBzc2Kyk09Kka0=
Message-ID: <74bbac65-2cd4-dac7-86d1-e18cfa3f3f1f@xen0n.name>
Date: Wed, 20 Oct 2021 20:00:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:95.0)
 Gecko/20100101 Thunderbird/95.0a1
Subject: Re: [PATCH v7 02/21] target/loongarch: Add core definition
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-3-git-send-email-gaosong@loongson.cn>
 <5d8d1719-c6f3-1de5-b086-298e8379d8b6@xen0n.name>
 <274b9066-66c1-b246-72c6-35d6791cba0e@amsat.org>
 <aa983155-85ed-f3e3-47b2-b7138125e8d0@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <aa983155-85ed-f3e3-47b2-b7138125e8d0@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 yangxiaojuan@loongson.cn, peterx@redhat.com, laurent@vivier.eu,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/10/20 16:54, Song Gao wrote:

> On 10/19/2021 01:38 AM, Philippe Mathieu-Daudé wrote:
>> On 10/18/21 18:06, WANG Xuerui wrote:
>>
>> On 10/18/21 20:47, Song Gao wrote:
>>>> +static void set_loongarch_cpucfg(CPULoongArchState *env)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < 49; i++) {
>>>> +        env->cpucfg[i] = 0x0;
>>>> +    }
>>>> +    env->cpucfg[0] = 0x14c010;
>>>> +    env->cpucfg[1] = 0x3f2f2fe;
>>>> +    env->cpucfg[2] = 0x60c3cf;
>>>> +    env->cpucfg[3] = 0xcff;
>>>> +    env->cpucfg[4] = 0x5f5e100;
>>>> +    env->cpucfg[5] = 0x10001;
>>>> +    env->cpucfg[16] = 0x2c3d;
>>>> +    env->cpucfg[17] = 0x6080003;
>>>> +    env->cpucfg[18] = 0x6080003;
>>>> +    env->cpucfg[19] = 0x60800f;
>>>> +    env->cpucfg[20] = 0x60f000f;
>>> I know these values are taken from a real 3A5000 chip, since I have such
>>> a machine and I've done the experiment, but others likely wouldn't
>>> notice so quickly. Maybe put some comment on top of this function to
>>> illustrate this?
>> Simpler: ...
>>
> On linux-user emulation. We don't care about the value of cpucfg[i]. 
> I think we only need to set cpucfg[i] to 0. and set value on system emulations, is that better? 

I'm afraid that wouldn't be better; actually it would be *wrong* to just
return zeroes for user-space CPUCFG accesses. CPUCFG is designed to
provide runtime feature probing like CPUID, and is usable from
user-space. So, one can only assume this data is being used, and
properly return data.

I've heard that kernel could choose to not actually enable all features
for which CPUCFG indicate support, while not configuring CPUCFG values
to reflect that, thus making CPUCFG values unreliable; that's not a
proper reason to return zeroes. Kernel should be fixed to properly
configure CPUCFG instead. Because otherwise you wouldn't make such an
instruction an unprivileged one in the first place...

