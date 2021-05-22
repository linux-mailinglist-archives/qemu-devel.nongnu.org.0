Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85B538D40D
	for <lists+qemu-devel@lfdr.de>; Sat, 22 May 2021 08:53:21 +0200 (CEST)
Received: from localhost ([::1]:57916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkLVg-0006LS-Nb
	for lists+qemu-devel@lfdr.de; Sat, 22 May 2021 02:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1lkLU3-0005Hd-P2; Sat, 22 May 2021 02:51:39 -0400
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:46112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1lkLU0-0007wX-BZ; Sat, 22 May 2021 02:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lb9AheZ/TqKxUQFahonhimvGL5hzNcZCLcLdAP/iyq0=; b=ULXQpOmROjf8MNT4oAv5O47iRQ
 h+P4yDUbDvjnNb2eZK30jXNtRsUTNIfyxhd0LHnCdeI+FkLQ/s5fk224OKLzaQj9CUiOOEKlVAR64
 vEEJ9T3oeccTBtZ6S5p5ELaWYS/M/+M+InolEDau9VKi4qMeR/6L45hJKDxd59lFIyjw=;
Received: by iserv.reactos.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <hpoussin@reactos.org>)
 id 1lkLTn-0004P3-6C; Sat, 22 May 2021 06:51:23 +0000
Subject: Re: [PATCH v4 0/9] hw/block/fdc: Allow Kconfig-selecting ISA
 bus/SysBus floppy controllers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20210517183954.1223193-1-philmd@redhat.com>
 <6ef11e42-7778-762a-f11b-d88f1b688db3@redhat.com>
 <7ce0415a-50f9-d903-d1dd-d0b0b1757045@redhat.com>
 <b370382f-aa19-21b5-3c8a-9fac9be590d5@redhat.com>
 <fc985d03-ee24-33e8-d527-7dbb979a9eed@redhat.com>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <fc1be8eb-5c4e-9968-2ebd-a0b4e117eeeb@reactos.org>
Date: Sat, 22 May 2021 08:51:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <fc985d03-ee24-33e8-d527-7dbb979a9eed@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:1c17:5ae1::1;
 envelope-from=hpoussin@reactos.org; helo=iserv.reactos.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/05/2021 à 09:14, Philippe Mathieu-Daudé a écrit :
> Cc'ing Hervé, Aleksandar, Markus & Mark.
> 
> On 5/17/21 11:11 PM, John Snow wrote:
>> On 5/17/21 4:50 PM, Philippe Mathieu-Daudé wrote:
>>> On 5/17/21 9:19 PM, John Snow wrote:
>>>> On 5/17/21 2:39 PM, Philippe Mathieu-Daudé wrote:
> 
>>>>> The floppy disc controllers pulls in irrelevant devices (sysbus in
>>>>> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
>>>>>
>>>>> This series clean that by extracting each device in its own file,
>>>>> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.
> 
>>> Not good enough:
> 
>> Yup, I see. Dropping it from the queue for now. Thanks!
> 
> The Jazz machines use the sysbus FDC model, but register a DMA channel.
> 
> The DMA transfer is done using:
> 
>      if (fdctrl->dma_chann != -1 && !(fdctrl->msr & FD_MSR_NONDMA)) {
>          IsaDmaClass *k = ISADMA_GET_CLASS(fdctrl->dma);
>          k->release_DREQ(fdctrl->dma, fdctrl->dma_chann);
>      }
> 
> The IsaDmaTransferHandler is ISA specific...
> 
> I suppose the Jazz machines should use the ISA FDC model.
 >
 > Hervé, Aleksandar, do you know?

The Jazz machine uses the standard floppy controller (i82077)
FDC registers are accessible at memory-mapped address 0x80003000-0x80003007
FDC interrupt is using custom Jazz interrupt controller, with interrupt #1.
FDC DMA is using custom Jazz DMA channel controller, with channel #1.

You can find in jazz.c the following code:
     /* FIXME: we should enable DMA with a custom IsaDma device */
     fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), -1, 0x80003000, fds);

I had in the idea to wrap the custom Jazz interrupt controller in a IsaDma structure,
to use it with floppy controller, but I never took the time to do it + test it.

So, floppy drive never worked for me, neither with Windows NT 4, nor with Linux kernels.
You can do what you feel the best, as long as you keep the possibility to use the floppy
model with something else than a i8259 DMA controller.

Regards,

Hervé

