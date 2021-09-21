Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239C4412F59
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:26:30 +0200 (CEST)
Received: from localhost ([::1]:51254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSaAf-000239-79
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSa8W-0000o4-6r
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 03:24:16 -0400
Received: from [115.28.160.31] (port=48666 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSa8S-0002tX-CE
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 03:24:15 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 1CDEC600FF;
 Tue, 21 Sep 2021 15:24:05 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632209045; bh=N90pVo201oxKtkFdp3gOx2Axe1tBIYKE12VeDXgiU9c=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=v+KC9i6xZPSirR6UBxmuQWne2D+Oj87hU9w7dTTngU4fSOaWj+MreNxs2myQXA4JL
 HOeY1bCBYHYmJqLF4lkbrnJqrh21jp3Tnw3CmJmfAY6iF5YWMBfh3GM1+NWJnqmpXK
 ZQ+J8CDIb9BEq7w5KY2CxwpPnACFMiP3iFvqdvBI=
Message-ID: <e26e4c3d-672c-d5cf-17a5-e92aacc09840@xen0n.name>
Date: Tue, 21 Sep 2021 15:24:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH 28/30] configure, meson.build: Mark support for 64-bit
 LoongArch hosts
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-29-git@xen0n.name>
 <de7efdfe-24ae-015c-015d-50acc245df1c@linaro.org>
 <baa4bcf7-9e4f-1745-5957-6d715a14f711@xen0n.name>
 <1361ef78-1ac4-8d64-2897-3e3b5c7ef3bd@amsat.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <1361ef78-1ac4-8d64-2897-3e3b5c7ef3bd@amsat.org>
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

Hi Philippe,

On 9/21/21 14:59, Philippe Mathieu-Daudé wrote:
> On 9/21/21 08:02, WANG Xuerui wrote:
>> On 9/21/21 01:23, Richard Henderson wrote:
>>> On 9/20/21 1:04 AM, WANG Xuerui wrote:
>>>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>>>> ---
>>>>   configure   | 4 +++-
>>>>   meson.build | 4 +++-
>>>>   2 files changed, 6 insertions(+), 2 deletions(-)
>
>>> If there's no loongarch32, and never will be, then there's probably 
>>> no point in keeping the '64' suffix.
>>
>> The loongarch32 tuple will most certainly come into existence some 
>> time in the future, but probably bare-metal-only and without a Linux 
>> port AFAIK. That's a point the Loongson people and I didn't 
>> communicate well, apologizes for that. (While we're at it, the 
>> reserved "loongarchx32" which is x32/n32-like, most likely will never 
>> exist.)
>
> Are you trying to beat MIPS at their ABI complexity? /s

Hah, I'm not Loongson employee so maybe I'm not in the best position to 
answer this ;-)

But from an outsider's perspective, the Loongson people obviously 
reserved things upfront like a multi-millionaire, then suddenly realized 
they only have ~500 people on board, developers even less; so they did 
the Right Thing(TM), only later, to drop x32 altogether and focus their 
energy on bare-metal use cases for their 32-bit-only chips.

Plus, LoongArch is strictly little-endian, and only one baseline ISA 
revision is published so far, so IMO it can never beat MIPS in terms of 
combinatorial ABI possibilities. Maybe RISC-V have a chance? ;-)


