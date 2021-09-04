Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC01400D6B
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 01:04:40 +0200 (CEST)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMeiF-0004yE-47
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 19:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMegp-00046r-RX; Sat, 04 Sep 2021 19:03:11 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMego-00069d-97; Sat, 04 Sep 2021 19:03:11 -0400
Received: by mail-wr1-x433.google.com with SMTP id n5so3930752wro.12;
 Sat, 04 Sep 2021 16:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FgQDLUWLaloKRTG5AXS57dd2Noh8UeBSOKslSoHAlRM=;
 b=QPq4cKpqUvlFiuvNsesQrGK/CsPSL0NkzYAfZG9NfWFu64Mycx6VLrLR1N0kOjHSCe
 sHAEJ5utGEI8RNkRxbJTjBnazYSettBjoWOS11mQSp8fT+d9KNoBlJ+wHnb0mZ9wFfJe
 2hmxzFUJw/Ez0e/IoBJuFTWIIVwh0zDU3F05x56nhrfvnIMCVF1xD01auNpztlgLOZwr
 W+9181ikqlj9VfMWuL6df86TdAvuQIopbk4DN7SMad08+QqXAw0uOvismYutj1imuQil
 g72emK0F3c9HbAxEmSdiLmhRBin36p46SgEpba+7CwRlEfN8l8SyttciLv3xDPSfos05
 EaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FgQDLUWLaloKRTG5AXS57dd2Noh8UeBSOKslSoHAlRM=;
 b=qluNWevyTO/U4wpUb7Ds8juAD5NHKTrC/HNre+Rxu/mxtXWSQGhCfSvcCDqVmjuRIa
 5FMlZogjYlhisB75jZeQmVBT3x98pqzv8YlvXfLsVNDaD+dngnBHrO22TrrjlaMDBRjf
 kYJB562RetrNJpc5PwtmMMZIHCPH0oQt5awSBNtD9HQYxYC9qxCxc9S28cxotYihn0/z
 E3V3BEwslPNREOxihqWaLk29/f7ZNzpnToaKVecPMpNt2/TX3JtgqAQzmbCg4iUHbxns
 RUsNyCkOW8HI6zAhnRwbB3g6FksogB0Zp7IbQL+s2VV5O/wXEVMV4BjATkkhj9mQyRa/
 MAnw==
X-Gm-Message-State: AOAM533cWpK4LgBk1Q5F0vVH8wgmGBgZv+fkH8TqxDrGkG3xq0RTfIKu
 p65VtqyEryCbZHHuxD4ZK/c6LTsPBJk=
X-Google-Smtp-Source: ABdhPJx2yrwUJe5EdC7orhBdTWI/OwudueTfmDWbHY+1Bh0K2XDivc77ZGj94QGhGLl0KmZkOWJdWQ==
X-Received: by 2002:adf:b78d:: with SMTP id s13mr5848553wre.344.1630796586022; 
 Sat, 04 Sep 2021 16:03:06 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o23sm3311827wro.76.2021.09.04.16.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 16:03:05 -0700 (PDT)
Subject: Re: [PULL 00/14] aspeed queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210903194108.131403-1-clg@kaod.org>
 <beab1f50-d8f5-b3d3-5612-15e5f74eb961@amsat.org>
 <9ef56813-94f9-a1cb-aba5-9d2e2a081d23@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <24abcdb3-e666-477b-a3e7-746326640bca@amsat.org>
Date: Sun, 5 Sep 2021 01:03:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9ef56813-94f9-a1cb-aba5-9d2e2a081d23@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.832,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Peter Delevoryas <pdel@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/21 7:33 AM, Cédric Le Goater wrote:
> On 9/3/21 10:41 PM, Philippe Mathieu-Daudé wrote:
>> Hi Peter,
>>
>> On 9/3/21 9:40 PM, Cédric Le Goater wrote:
>>> The following changes since commit 8880cc4362fde4ecdac0b2092318893118206fcf:
>>>
>>>   Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20210902' into staging (2021-09-03 08:27:38 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210903
>>>
>>> for you to fetch changes up to 907796622b2a6b945c87641d94e254ac898b96ae:
>>>
>>>   hw/arm/aspeed: Add Fuji machine type (2021-09-03 18:43:16 +0200)
>>>
>>> ----------------------------------------------------------------
>>> Aspeed patches :
>>>
>>> * MAC enablement fixes (Guenter)
>>> * Watchdog  and pca9552 fixes (Andrew)
>>> * GPIO fixes (Joel)
>>> * AST2600A3 SoC and DPS310 models (Joel)
>>> * New Fuji BMC machine (Peter)
>>>
>>> ----------------------------------------------------------------
>>
>>> Peter Delevoryas (3):
>>>       hw/arm/aspeed: Initialize AST2600 UART clock selection registers
>>>       hw/arm/aspeed: Allow machine to set UART default
>>>       hw/arm/aspeed: Add Fuji machine type
>>
>> I have a pending question with the last patch, do you mind holding
>> this PR until it is resolved with Cédric and the patch author please?
>>
>> Thanks,
>>
>> Phil.
>>
> 
> I guess we can drop the following from the commit log : 
> 
> 	git clone https://github.com/facebook/openbmc
> 	cd openbmc
> 	./sync_yocto.sh
> 	source openbmc-init-build-env fuji build-fuji
> 	bitbake fuji-image
> 	dd if=/dev/zero of=/tmp/fuji.mtd bs=1M count=128
> 	dd if=./tmp/deploy/images/fuji/flash-fuji of=/tmp/fuji.mtd \
> 	    bs=1k conv=notrunc
> 	
> 	git clone --branch aspeed-next https://github.com/peterdelevoryas/qemu
> 	cd qemu
> 	./configure --target-list=arm-softmmu --disable-vnc
> 	make -j $(nproc)
> 	./build/arm-softmmu/qemu-system-arm \
> 	    -machine fuji-bmc \
> 	    -drive file=/tmp/fuji.mtd,format=raw,if=mtd \
> 	    -serial stdio \
> 	    -nic user,hostfwd=::2222-:22
> 	sshpass -p 0penBmc ssh root@localhost -p 2222

Sounds good. Eventually document that in docs/system/arm/aspeed.rst
in a follow up patch?

Regards,

Phil.

