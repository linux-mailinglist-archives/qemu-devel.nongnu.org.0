Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7317442BE9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:54:56 +0100 (CET)
Received: from localhost ([::1]:43134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrRP-0007Yj-Vj
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mhrPv-0005eh-Rl
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:53:23 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:39653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mhrPt-0005zE-2y
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:53:23 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B1B6A748F51;
 Tue,  2 Nov 2021 11:53:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 805F37463B7; Tue,  2 Nov 2021 11:53:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7D9E0746399;
 Tue,  2 Nov 2021 11:53:18 +0100 (CET)
Date: Tue, 2 Nov 2021 11:53:18 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 0/4] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
In-Reply-To: <6f955022-ba0c-5dbf-05bd-cb73d910a40f@amsat.org>
Message-ID: <a1dbf134-d273-85cb-a956-7c2be89f3fa@eik.bme.hu>
References: <cover.1635161629.git.balaton@eik.bme.hu>
 <6f955022-ba0c-5dbf-05bd-cb73d910a40f@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-369198054-1635850398=:63472"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-369198054-1635850398=:63472
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hello,

On Mon, 25 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/25/21 13:33, BALATON Zoltan wrote:
>> This is the same as posted before just omitting the two patches that
>> are optimisations by caching the func0 and avoiding QOM casts which
>> could not be measured to have an effect but these reamaining patches
>> are still needed to fix USB interrupts on pegasos2
>>
>> Gerd, could you please take them?
>>
>> Regards,
>>
>> BALATON Zoltan (4):
>>   usb/uhci: Misc clean up
>>   usb/uhci: Disallow user creating a vt82c686-uhci-pci device
>>   usb/uhci: Replace pci_set_irq with qemu_set_irq
>>   hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI interrupts
>
> Thanks, series applied to mips-next tree.

According to https://wiki.qemu.org/Planning/6.2 freeze starts today and I 
haven't yet seen a pull request with this series. Is it still to come? (As 
it is fixing a bug with USB IRQ it may be OK before hard freeze but to be 
safe I'm asking now to avoid missing a release and having to wait months 
to get it merged).

Thank you,
BALATON Zoltan
--3866299591-369198054-1635850398=:63472--

