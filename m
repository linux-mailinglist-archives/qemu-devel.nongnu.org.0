Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27720623FFE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:37:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4vW-0004mE-29; Thu, 10 Nov 2022 05:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ot4vN-0004gz-PE
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:36:47 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ot4vL-0003vW-Km
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NOZQsBtCZDWmWrS/JFO5tVdUFl6GPYQ6jhgFkult7mU=; b=auLuk2heu5nm20xd4Vpjw1VwG5
 Rk90iA1aTeDUk5KuS5RndPbZrGy3Z+aKLMNGV+pPA9qnx8oRiP18wyvKueT2+LHp3SKzCny5ZoXPW
 6vs0Pq6RgeLqNAUy3LQYZYnwD0lD+hPXL6u3Q9hCNgYpeD82gbmEmv/XIoqnHAkoNKdQBjFih7AWG
 r3B6xHkfjgDlAjpg2wszZNBVnoURJv3LA6K5Xmh48pl5OZHxlvRzi5uFC32F5ipky1aXn18Y03LYP
 bfgduEbIocBxfxR7hUYcHyvuGV89UYFZsp6Kw7B79XzzGmWPMbk7W4XOo3sPtNsLL/c72w39zg48z
 iiQ6T1gCzMYgjHv+DmpoCUygfVWqhcG2dzZZ3Nr5ZxjXSO5HCcvuFSSGXb5xnwAoF+Zz2QOoL7NpT
 qfX70aC7Rx4X4+WKTlZgpQB8qEwzvFDhYg7CqkPW18H9wYGSkHxoDBJ0Zvd4grZ2a1+4Z9Z3WqK34
 LM89//qT6yoSGJYlw5jdyc6RzYKiSX4tFu0l9xyA43HzKIKKbWBzAf5x37ZX/UqtZJl1PfDe98ZJ4
 aTwdnS9Eka9RT4RlTtDjCNA76qt7V/x/54fvYa2K5qmoSsXAbw10/3xrt3o/SKujsvhFI87GiJnbq
 WaZLUHIbIRf/C6ehUdvh3+jwY4Swa1KtfAQRFml9U=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=[10.8.0.10])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ot4v4-0000sk-SG; Thu, 10 Nov 2022 10:36:30 +0000
Message-ID: <cfbb4196-90e2-bb1a-eb2f-c49465b58f04@ilande.co.uk>
Date: Thu, 10 Nov 2022 10:36:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20221109170009.3498451-1-peter.maydell@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20221109170009.3498451-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-8.0 0/2] hw/input/ps2: Convert to 3-phase reset
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09/11/2022 17:00, Peter Maydell wrote:

> This patchset converts the ps2 keyboard and mouse devices to 3-phase
> reset. The rationale here is that it would be nice to get rid of the
> device_class_set_parent_reset() function, which is used by
> legacy-reset subclasses which want to chain to their parent's reset
> function. There aren't very many of these devices in total, and if we
> convert them all to 3-phase reset they can use the 3-phase-reset
> equivalent (resettable_class_set_parent_phases()).  Eventually this
> will then let us simplify the transitional code for handling old-style
> device reset.
> 
> This is one of a number of patchsets to do this that I'm planning to
> write and send out over the next few weeks. It's all 8.0 material.
> 
> thanks
> -- PMM
> 
> Peter Maydell (2):
>    hw/input/ps2: Convert TYPE_PS2_DEVICE to 3-phase reset
>    hw/input/ps2.c: Convert TYPE_PS2_{KBD,MOUSE}_DEVICE to 3-phase reset
> 
>   include/hw/input/ps2.h |  2 +-
>   hw/input/ps2.c         | 45 +++++++++++++++++++++++++++++-------------
>   2 files changed, 32 insertions(+), 15 deletions(-)

I haven't used the new ResettableClass myself previously, however it seems to match 
the excellent documentation at https://qemu.readthedocs.io/en/latest/devel/reset.html 
so feel free to add my Acked-by tag.

One part that did stand out to me in the docs is the part that reads "For now 
migration of a device or bus in reset is not supported. Care must be taken not to 
delay resettable_release_reset() after its resettable_assert_reset() counterpart". Is 
this still a valid concern and something we need to think about? I'm thinking about 
if a guest triggers a SCSI bus or PCI bus reset for example.


ATB,

Mark.

