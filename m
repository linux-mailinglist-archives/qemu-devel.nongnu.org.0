Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085F6689B4C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:16:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNwqA-0007if-2u; Fri, 03 Feb 2023 09:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNwq7-0007hH-Br; Fri, 03 Feb 2023 09:14:55 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNwq5-0001mT-1Y; Fri, 03 Feb 2023 09:14:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D5D22746392;
 Fri,  3 Feb 2023 15:12:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9A854745712; Fri,  3 Feb 2023 15:12:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 98D057456E3;
 Fri,  3 Feb 2023 15:12:21 +0100 (CET)
Date: Fri, 3 Feb 2023 15:12:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 6/9] hw/display/sm501: QOM-alias 'dma-offset' property
 in chipset object
In-Reply-To: <91463ac0-f2ea-d225-30da-90efed93ac28@linaro.org>
Message-ID: <bdb1403e-d610-9755-d963-3a7864581245@eik.bme.hu>
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-7-philmd@linaro.org>
 <136f25e8-686a-1529-b114-08dd54e6b819@eik.bme.hu>
 <075577d7-d5c4-393b-9d0d-2aab32abe957@linaro.org>
 <27fc6a3d-78b4-91f7-6f05-8c0cbd1ef125@eik.bme.hu>
 <91463ac0-f2ea-d225-30da-90efed93ac28@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1226957222-1675433541=:62709"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1226957222-1675433541=:62709
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
> On 3/2/23 14:50, BALATON Zoltan wrote:
>> On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
>>> On 3/2/23 14:05, BALATON Zoltan wrote:
>>>> On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
>>>>> No need to use an intermediate 'dma-offset' property in the
>>>>> chipset object. Alias the property, so when the machine (here
>>>>> r2d-plus) sets the value on the chipset, it is propagated to
>>>>> the OHCI object.
>>>>> 
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>> ---
>>>>> hw/display/sm501.c | 22 +++++++++++-----------
>>>>> hw/sh4/r2d.c       |  2 +-
>>>>> 2 files changed, 12 insertions(+), 12 deletions(-)
>>>> 
>>>> It does not seem to be any simpler by the number of lines but maybe a bit 
>>>> cleaner.
>>> 
>>> Well it also moves to the "Embed QOM objects" pattern which Peter prefers.
>>> Note this device doesn't implement unrealize().
>> 
>> True. Maybe worth mentioning in the commit message to make this more 
>> explicit. I saw it in the patch but did not think about that.
>> 
>>>> I wonder if it would worth renaming the property to dma-offset to match 
>>>> that of ohci so it's less confusing what it refers to. It's only used by 
>>>> r2d and this patch already changing that so would be an easy change.
>>> 
>>> We can't because TYPE_PCI_SM501 is user-creatable, so we need to
>>> go thru the whole deprecation process and we don't have any API to
>>> deprecate QOM properties yet.
>> 
>> But the sm501 PCI device only creates the display part hence it has no base 
>> option only vram-size (see sm501_pci_properties) so only the sysbus version 
>> has this property. Is this still a problem in that case?
>
> Oh you are right, I misread the PCI/sysbus functions. Lucky me, thanks!

And I've just realized then we also don't need separate 
sm501_sysbus_properties[] and sm501_pci_properties[] so you can just keep 
one and call it sm501_properties.

Regards,
BALATON Zoltan
--3866299591-1226957222-1675433541=:62709--

