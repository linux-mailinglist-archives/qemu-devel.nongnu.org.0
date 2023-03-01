Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA836A6C4D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 13:26:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXLW1-0004b0-TE; Wed, 01 Mar 2023 07:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXLVz-0004aR-Fe; Wed, 01 Mar 2023 07:24:59 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXLVx-0007N2-UW; Wed, 01 Mar 2023 07:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ym5+Tton9L4NM3BVYMCx5ga1bD6RFLEJqXXEqlAGd6I=; b=wSleAuIwoLfWGxc21XirI3exDq
 1KAbiAKKDVTprtJXjNlZ3ZDGzv2CX0t3p4+gvUKfXVf+ESd3o45DgRR/YfioDbsQlc8/0Kfm8Vfj2
 CuFt/tewv9Pxavz7y8UFwVmvaolZlFaAGEuU1eEHU+mtINICOrp2UeWQWBGJUuDo/4xYKDcnbuIaa
 fzTI+Tb2pIHJXaOFqpznm/9NaYQZW6VBcvxku0zL++wm52Iu9N4KyL3YgRj1nJ8y+E21GFdETfWBv
 uGRnZXkSWIVN8SJltfCpIoQhRIen2tTeUrAl2fzK0I9ZSljxKBpSCBv45+jefb7swH82mnfY0HeD7
 KcpJ1tnWB+fT24VJO8kkpEDIZHwBkJJPnKcMYoI/l/pgG0J/k1uwNJx40Dk+mqOnFw1ZVTISgZPXY
 x2XSJcNJRcOcxO/WlNO6aBIF6s5v6QrHMcgqwxgKef4RsSID6X5Lt9otPvsCLuuuHaRX0R+/frYmq
 387CldBvh0Ni/Do2hkuQ3e2p/jPQN5W06DzI2ka0lRpIoLykLMAnHf6KxrTAmEH39i/4x8EMlv0Ou
 5CFvs2rfIEf/DBEUrZQG85ibzfy3Ojwnsv57oJ0lXUY+XKALdahoXI3xN43F0f3QQXPD4OAX1RpGm
 D+yp1uMG+K8bNC8/bzk3tks7Scws3I3uQknKw24/4=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXLVL-0000e7-Is; Wed, 01 Mar 2023 12:24:19 +0000
Message-ID: <63d47400-d2ad-3583-e17f-a8701d1fb780@ilande.co.uk>
Date: Wed, 1 Mar 2023 12:24:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-ppc <qemu-ppc@nongnu.org>
References: <a728cf1f-49b5-ef09-cd68-57179a44438e@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <a728cf1f-49b5-ef09-cd68-57179a44438e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: hw/ppc/mac_newworld: Problem with Uninorth IRQ lines
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 21/02/2023 13:44, Philippe Mathieu-Daudé wrote:

> Hi Mark,
> 
> The mac99 machines use the same PIC input IRQs for the Uninorth
> output IRQs:
> 
> 379     if (PPC_INPUT(env) != PPC_FLAGS_INPUT_970) {
> 380         /* Uninorth AGP bus */
> 381         for (i = 0; i < 4; i++) {
> 382             qdev_connect_gpio_out(uninorth_agp_dev, i,
> 383                                   qdev_get_gpio_in(pic_dev, 0x1b + i));
> 384         }
> 385
> 386         /* Uninorth internal bus */
> 387         for (i = 0; i < 4; i++) {
> 388             qdev_connect_gpio_out(uninorth_internal_dev, i,
> 389                                   qdev_get_gpio_in(pic_dev, 0x1b + i));
> 390         }
> 391     }
> 
> Did you mean to use an OR gate here?

Hi Phil,

These are separate PCI buses so I suspect they should be wired up with different 
IRQs, but this wiring has been the same ever since the code was introduced. I think 
it should be possible to dig the values out from a suitable device tree but it's not 
something I've looked at in any detail.


ATB,

Mark.

