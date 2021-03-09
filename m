Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4C6332825
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:08:11 +0100 (CET)
Received: from localhost ([::1]:47526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJd1u-0007f5-Kj
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJcy3-00045R-Pf
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:04:13 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:20523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJcxx-0003lg-KR
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:04:11 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 02E787456B8;
 Tue,  9 Mar 2021 15:04:04 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D82C87456B4; Tue,  9 Mar 2021 15:04:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D70117456E3;
 Tue,  9 Mar 2021 15:04:03 +0100 (CET)
Date: Tue, 9 Mar 2021 15:04:03 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/6] hw/mips/gt64120: Minor fixes
In-Reply-To: <38c097d6-f93c-76ff-d7ad-ddcd95556a2c@amsat.org>
Message-ID: <c9b31c9-1a27-1ee6-ffb-bc5255e050fa@eik.bme.hu>
References: <20210305162107.2233203-1-f4bug@amsat.org>
 <38c097d6-f93c-76ff-d7ad-ddcd95556a2c@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-728301579-1615298643=:24425"
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-728301579-1615298643=:24425
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
> Hi Zoltan,
>
> On 3/5/21 5:21 PM, Philippe Mathieu-Daudé wrote:
>> Trivial fixes extracted from another series which became too big,
>> so I prefer to send them in a previous step.
>
> I just realized I meant to Cc you on this series but forgot :/
> As this model is pretty close to your MV64361 one, and this
> series is trivial, do you mind reviewing it? It shouldn't take
> more than 5min I hope ;)

Hello,

I've noticed this patch series and considered reviewing it but could not 
do it in five minutes and I've lost it since. Can you forward it to me 
again so I can reply to the patches? (It's been a while I've written the 
mv64361 model so I may need to check datasheets again.)

Regards,
BALATON Zoltan

> Thanks,
>
> Phil.
>
>>
>> Philippe Mathieu-Daudé (6):
>>   hw/mips/gt64xxx: Initialize ISD I/O memory region in DeviceRealize()
>>   hw/mips/gt64xxx: Simplify ISD MemoryRegion read/write handlers
>>   hw/mips/gt64xxx: Fix typos in qemu_log_mask() formats
>>   hw/mips/gt64xxx: Rename trace events related to interrupt registers
>>   hw/mips/gt64xxx: Trace accesses to ISD registers
>>   hw/mips/gt64xxx: Let the GT64120 manage the lower 512MiB hole
>>
>>  hw/mips/gt64xxx_pci.c | 67 +++++++++++++++++++++++++++----------------
>>  hw/mips/malta.c       |  7 -----
>>  hw/mips/trace-events  |  6 ++--
>>  3 files changed, 47 insertions(+), 33 deletions(-)
>>
>
>
--3866299591-728301579-1615298643=:24425--

