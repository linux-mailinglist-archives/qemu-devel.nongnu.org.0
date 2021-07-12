Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA54B3C5E81
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:40:43 +0200 (CEST)
Received: from localhost ([::1]:42460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2x6x-0006TM-15
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m2x57-00055I-IJ; Mon, 12 Jul 2021 10:38:50 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:12584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m2x54-0005rR-Lb; Mon, 12 Jul 2021 10:38:48 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B0D9374570E;
 Mon, 12 Jul 2021 16:38:43 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 45EE174570D; Mon, 12 Jul 2021 16:38:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 447D17456B4;
 Mon, 12 Jul 2021 16:38:43 +0200 (CEST)
Date: Mon, 12 Jul 2021 16:38:43 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] mv64361: Remove extra break from a switch case
In-Reply-To: <5a2131d6-4b85-839d-8cd3-18cdcea15925@amsat.org>
Message-ID: <f0ea5e8c-f575-1f8-6914-de69a0c4b04b@eik.bme.hu>
References: <20210712131259.B705B7456E3@zero.eik.bme.hu>
 <5a2131d6-4b85-839d-8cd3-18cdcea15925@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-583204199-1626100723=:20424"
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-583204199-1626100723=:20424
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 12 Jul 2021, Philippe Mathieu-Daudé wrote:
> On 7/12/21 3:11 PM, BALATON Zoltan wrote:
>> The switch case of writing PCI 1 IO base address had an extra break
>> statement that made part of the code unreachable. This did not cause a
>> problem as guests ususally leave this register at its default value.
>>
>> Reported-by: Coverity (CID 1458135)
>
> Fixes: dcdf98a9015 ("Add emulation of Marvell MV64361 PPC system
> controller")
> ?

Yeah, why not. Feel free to add the Fixes tag when merging, although 
that's the only commit this file had so far so linking to it does not seem 
to add much more info.

Regards,
BALATON Zoltan

>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/pci-host/mv64361.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
>> index 20510d8680..92b0f5d047 100644
>> --- a/hw/pci-host/mv64361.c
>> +++ b/hw/pci-host/mv64361.c
>> @@ -687,7 +687,6 @@ static void mv64361_write(void *opaque, hwaddr addr, uint64_t val,
>>      case MV64340_PCI_1_IO_BASE_ADDR:
>>          s->pci[1].io_base = val & 0x30fffffULL;
>>          warn_swap_bit(val);
>> -        break;
>>          if (!(s->cpu_conf & BIT(27))) {
>>              s->pci[1].remap[4] = (val & 0xffffULL) << 16;
>>          }
>>
>
>
--3866299591-583204199-1626100723=:20424--

