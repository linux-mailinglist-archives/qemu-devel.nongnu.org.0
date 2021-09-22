Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9FA414591
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 11:52:40 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSyve-0000zd-R9
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 05:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSytD-0007zt-9l
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:50:07 -0400
Received: from [115.28.160.31] (port=35418 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSyt9-0001UO-OH
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:50:06 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E90B2600FF;
 Wed, 22 Sep 2021 17:49:56 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632304197; bh=qwcwKnnrdZVGeuTopJngCoSOF6HLaNvIqSjYNwdpbOE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jZQTHMgf+thR8ZXarK/kVGXqxFbO2xMBkB2d2hwrMtzFwB/2TxTSCcM4PR3suApWK
 eFjFWvGImmTdx5OFlnw6QlkzkAmoNDeXBu6/iLfrVpLFldLA7is8m4UfWPzSyPJUAP
 yyHK/yAaW2Z2isaIQ/9zE4ytnp/cZg/PvwyI4J6A=
Message-ID: <4873b569-fb74-177d-8888-2964c636d14e@xen0n.name>
Date: Wed, 22 Sep 2021 17:49:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v6 00/21] Add LoongArch linux-user emulation support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1631866380-31017-1-git-send-email-gaosong@loongson.cn>
 <5d524802-1083-7280-97a7-9cd80037d5a3@linaro.org>
 <77e2f5b9-ff55-aad4-77dc-13a5547717b1@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <77e2f5b9-ff55-aad4-77dc-13a5547717b1@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 alex.bennee@linaro.org, yangxiaojuan@loongson.cn, peterx@redhat.com,
 laurent@vivier.eu, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, philmd@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Song,

On 9/22/21 14:22, Song Gao wrote:
> Hi, Richard.
>
> On 09/21/2021 05:17 AM, Richard Henderson wrote:
>> On 9/17/21 1:12 AM, Song Gao wrote:
>>> The 'o32' code has been deleted at the latest kernel [1]. This series only support
>>> linux-user emulation.
>> I have now reviewed all but the linux-user/ portion.
>>
> Thank you!
>> I see that kernel upstreaming is in progress,
>>
>> https://lore.kernel.org/linux-kernel/20210917035736.3934017-1-chenhuacai@loongson.cn/
>>
>> so hopefully this will be resolved soon.
>>
>> Have you started working on system mode support for LoongArch, so that one may run that kernel?
>> Yes. We already support running the old kernel, but we don't support running the latest kernel yet.

(the reply was at the wrong quotation level, never mind though)

First of all, thanks for your contribution and continued engagement with 
the wider development community! That's what it takes to unlock the 
3A5000 and future products' so many possibilities.

As for the system emulation part, I have some questions though:

- How would you provide the necessary firmware bits? Ideally that would 
be some open-source reference implementation so people would be able to 
collaborate on that front, and to maybe customize for specialized needs 
(e.g. ultra-dense cloud use cases like with Firecracker).

- How is old/new kernel ABI affecting your system-level emulation 
compatibility? IIUC the underlying ISA and chip behavior should be the 
same, only difference would be the firmware-kernel ABI, but again it 
should be just a matter of substituting the right image.

- Would the resulting work support emulating both old-world and 
new-world systems? AFAIK those commercial distros who're VERY early 
adopters of LoongArch are given similarly early toolchains/kernels. They 
belong to the old-world as a result, and are very likely to be stuck on 
the old-world ABI for whole major versions before migrating, if at all 
possible. Closed-source/commercial software also risk being available 
only for the old-world, and it would be extremely important to provide 
some degree of interoperability so that we don't split the ecosystem.

Questions aside, you did a nice work so far; looking forward to your 
system emulation work!


