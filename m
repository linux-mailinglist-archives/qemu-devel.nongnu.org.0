Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30B1698726
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 22:13:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSP4D-0004KD-8h; Wed, 15 Feb 2023 16:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pSP4B-0004JP-21; Wed, 15 Feb 2023 16:11:51 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pSP48-0008TX-BU; Wed, 15 Feb 2023 16:11:50 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4309E746324;
 Wed, 15 Feb 2023 22:09:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 057377462DB; Wed, 15 Feb 2023 22:09:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0359D745712;
 Wed, 15 Feb 2023 22:09:11 +0100 (CET)
Date: Wed, 15 Feb 2023 22:09:10 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 17/20] hw/ide/pci: Unexport bmdma_active_if()
In-Reply-To: <AF8AE36D-4C5E-465D-A416-B854707166D7@gmail.com>
Message-ID: <0dc24395-ca89-323e-db20-7aecf0ed5df6@eik.bme.hu>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-18-philmd@linaro.org>
 <AF8AE36D-4C5E-465D-A416-B854707166D7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-664428399-1676495351=:47791"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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

--3866299591-664428399-1676495351=:47791
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 15 Feb 2023, Bernhard Beschow wrote:
> Am 15. Februar 2023 11:27:09 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> From: Bernhard Beschow <shentey@gmail.com>
>>
>> The function is only used inside ide/pci.c, so doesn't need to be exported.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/ide/pci.c         | 6 ++++++
>> include/hw/ide/pci.h | 6 ------
>> 2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
>> index 2ddcb49b27..fc9224bbc9 100644
>> --- a/hw/ide/pci.c
>> +++ b/hw/ide/pci.c
>> @@ -104,6 +104,12 @@ const MemoryRegionOps pci_ide_data_le_ops = {
>>     .endianness = DEVICE_LITTLE_ENDIAN,
>> };
>>
>> +static IDEState *bmdma_active_if(BMDMAState *bmdma)
>> +{
>> +    assert(bmdma->bus->retry_unit != (uint8_t)-1);
>> +    return bmdma->bus->ifs + bmdma->bus->retry_unit;
>> +}
>> +
>> static void bmdma_start_dma(const IDEDMA *dma, IDEState *s,
>>                             BlockCompletionFunc *dma_cb)
>> {
>> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
>> index 2a6284acac..7b5e3f6e1c 100644
>> --- a/include/hw/ide/pci.h
>> +++ b/include/hw/ide/pci.h
>> @@ -55,12 +55,6 @@ struct PCIIDEState {
>>     MemoryRegion data_bar[2];
>> };
>>
>> -static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
>> -{
>> -    assert(bmdma->bus->retry_unit != (uint8_t)-1);
>> -    return bmdma->bus->ifs + bmdma->bus->retry_unit;
>> -}
>> -
>> void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
>> void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>> extern MemoryRegionOps bmdma_addr_ioport_ops;
>
> Cool, where did you find this? ;)
>
> This patch, your other patches doing s/ide/ide_bus/, and the fact that 
> IDEBus instantiates two IDE devices itself make me wonder whether the 
> IDE devices should really be instantiated in the usual QOM way. Then 
> perhaps it could turn out that all the s/ide/ide_bus/ patches aren't 
> really needed since the functions could operate on the IDE device 
> directly. Not sure though...
>
> This might all be a rabbit hole, but since you already started looking 
> into it... ;)

If you want some more, we've also found another problem with ports that 
should not have anythnig connected but still appear to have a non-working 
device that causes some delay during guest boot (and I think this is the 
reason the pegasos2 firmware prints an "ATA device not present or not 
responding" error while detecting IDE devices. This was discussed here:

https://lists.nongnu.org/archive/html/qemu-devel/2020-02/msg02468.html

Just to spread knowledge about it. I don't exoect this to be fixed as it 
does not cause much trouble just if you wanted to dig into it in the 
future I thought I'd let you know.

Regards,
BALATON Zoltan
--3866299591-664428399-1676495351=:47791--

