Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB95EEE2E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 08:58:43 +0200 (CEST)
Received: from localhost ([::1]:33334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odnVJ-0002nh-Ro
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 02:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odnQ5-0007jF-AR
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:53:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odnQ3-0000it-Dr
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:53:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YbwT+0ccT6I5WsLV6sOG696gJx0JfegAHk8sqJTSYsE=; b=k9dcw6szH8xrxCnta5NEm6PVqS
 oz1u1x4jffboWpuF8R7dqKAL1OxxtZNOskhDhSA30PyWd2iYuufPJ/P/UBEckpTqz7kWwY6X1ZRbP
 6+gJZ2bNnbr8HigxZqsighcQ3V8GpLj0eWI5ZoVEFeptMLF1YYwNaXjSXQi/H7c8lmP/MN3cjX4ZK
 TxhDOV4tdJhhgTkndjWxMwnE8ioJLd1bgPlbXOQ3paIiL7fjDwF1DohfR8a/V1GO+V7R1VYfL/vUc
 QDbPhl+eYqLJBYKNcW34iPqyjr6/BUT7tv/qB3i5Nuj8jxau1rfYh434Zl9I2e01FNzQSN/HAvkTe
 IXwO00QxoQO4GgykmXbfJUQw6MWnHVAnOxd+Rx3octDtw7M0Sp3Y4cehAI6Oyzq+mEyESIrt96TO0
 h5suj0CfpSaJS5XZk0G7dk0pQ80pWumhToFAVoUZOR0Y6Ik1Tkq9aBBm7pDWUnwdf/jLcqx3fI9eR
 fygy0vO5lBs9jEQoY+6Rh+wdLJfM5i4Td9y4A43KSOYBDOyLrvAOYQq+1AOjjLsrr8AnlYtPzCN1i
 idG1tOSzPo78tAJQEYudH2Bk3Ijv/5Rn24aOiiflvEW/5WVA6sz1iYY9TQY9sNJADOMIOwMVBvFsG
 MbkOJK2bf7yoBqROMl4KSdd5Ibat8rQXO/L+tC+m8=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odnOJ-000BWU-KA; Thu, 29 Sep 2022 07:51:27 +0100
Message-ID: <c298709e-7775-5dac-4dd8-94c66a4487f5@ilande.co.uk>
Date: Thu, 29 Sep 2022 07:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <788dbfca-75ae-154d-f4ff-c1abeb3adef7@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <788dbfca-75ae-154d-f4ff-c1abeb3adef7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 00/17] tcg: CPUTLBEntryFull and TARGET_TB_PCREL
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 29/09/2022 03:16, Richard Henderson wrote:

> On 9/25/22 03:51, Richard Henderson wrote:
>> Smooshing these two patch sets back together for review bandwidth.
>> I hope to make this the next tcg-next pull.
>>
>> There are three from the first half, tlbentryfull, which are new.
>> These are following a hallway conversation with Peter about bits
>> in MemTxAttrs that are not actually related to memory transactions,
>> and infrastructure to address a to-do in an Arm patch set.
>>
>> There are a few patches from the second half, pcrel, that have not
>> been reviewed.
>>
>>    07-target-sparc-Use-tlb_set_page_full.patch
>>    08-accel-tcg-Move-byte_swap-from-MemTxAttrs-to-CPUTL.patch
>>    09-accel-tcg-Add-force_aligned-to-CPUTLBEntryFull.patch
>>    10-accel-tcg-Remove-PageDesc-code_bitmap.patch
>>    13-accel-tcg-Do-not-align-tb-page_addr-0.patch
>>    15-accel-tcg-Introduce-tb_pc-and-tb_pc_log.patch
>>    16-accel-tcg-Introduce-TARGET_TB_PCREL.patch
> 
> FWIW, the target/sparc patch fails (the peril of insufficiently tested airport 
> updates), so I'm going to drop 7+8 until I have time to investigate.  I'm also going 
> to drop patch 9 for now, and present it alongside the Arm patch that will use it.

If it helps, the test case that exercises the IE (Invert Endian) page bit in 
target/sparc is Milax (OpenSolaris) which uses it to map PCI devices. Grab a suitable 
copy of milax032sparc.iso and test with:

     qemu-system-sparc64 -m 256 -cdrom milax032sparc.iso -nographic -boot d

You should see the IE pages accessed at the point where it starts poking the CDROM 
device, and timeouts if it isn't working.


ATB,

Mark.

