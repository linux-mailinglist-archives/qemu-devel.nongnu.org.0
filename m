Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A67447007
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 20:15:54 +0100 (CET)
Received: from localhost ([::1]:55612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjRAO-0005pT-VW
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 15:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mjR8i-0004pL-KL
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 15:14:08 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:17264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mjR8f-0006qN-7Q
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 15:14:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C09C0756036;
 Sat,  6 Nov 2021 20:13:58 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A367675602D; Sat,  6 Nov 2021 20:13:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A1E06755FE6;
 Sat,  6 Nov 2021 20:13:58 +0100 (CET)
Date: Sat, 6 Nov 2021 20:13:58 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 0/4] hw/isa: Remove unuseful qemu_allocate_irqs() call
In-Reply-To: <471f53ee-4f93-927b-bd95-b666a5eaebb6@amsat.org>
Message-ID: <975db73-972f-c3e2-4bc7-66b15510d39a@eik.bme.hu>
References: <20210511040621.2736981-1-f4bug@amsat.org>
 <471f53ee-4f93-927b-bd95-b666a5eaebb6@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-925225441-1636226038=:87368"
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-925225441-1636226038=:87368
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 6 Nov 2021, Philippe Mathieu-Daudé wrote:
> Cc'ing Zoltan

What do I have to do with this? This was a while ago so I don't remember 
and it seems to not touch any of the devices I have some experience with 
so not sure what do you expect from me for this series.

Regards,
BALATON Zoltan

> On 5/11/21 06:06, Philippe Mathieu-Daudé wrote:
>> I started to fix the LeakSanitizer error in piix4_realize(),
>> then looked for similar pattern and found 2 other places.
>> The older is i82378 (historically the first one) which then
>> spread.
>>
>> Since v1:
>> - rebased
>> - removed vt82c686 patches
>>
>> Philippe Mathieu-Daudé (4):
>>   hw/isa/i82378: Name output IRQ as 'intr'
>>   hw/isa/i82378: Simplify removing unuseful qemu_allocate_irqs() call
>>   hw/isa/i82378: Rename output IRQ variable
>>   hw/isa/piix4: Fix leak removing unuseful qemu_allocate_irqs() call
>>
>>  hw/isa/i82378.c | 13 +++----------
>>  hw/isa/piix4.c  | 10 +---------
>>  hw/ppc/prep.c   |  4 ++--
>>  3 files changed, 6 insertions(+), 21 deletions(-)
>>
>
>
--3866299591-925225441-1636226038=:87368--

