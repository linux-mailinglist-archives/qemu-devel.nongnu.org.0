Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D43043095E
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 15:32:09 +0200 (CEST)
Received: from localhost ([::1]:44230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc6Gm-0007Z8-6n
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 09:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mc6FY-0006oe-0N
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 09:30:53 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:53681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mc6FU-0006LE-TU
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 09:30:50 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MA7X0-1mRcw01NSE-00BcoL; Sun, 17 Oct 2021 15:30:46 +0200
Subject: Re: [PATCH 3/8] q800: use GLUE IRQ numbers instead of IRQ level for
 GLUE IRQs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-4-mark.cave-ayland@ilande.co.uk>
 <76216e92-8a9b-4275-b009-00997f86fba2@vivier.eu>
 <665e4961-8bad-b4ad-c352-b2328c579828@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <701111ea-33e0-022f-f79b-3ba39d389580@vivier.eu>
Date: Sun, 17 Oct 2021 15:30:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <665e4961-8bad-b4ad-c352-b2328c579828@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Rh9XdL6NaachRjmvMiPcfmHKqRDCOfmFSoEXBdbeZT2TbPoeyaG
 2RnQ7Gjj36Z+U/aVe0R9DF4VNlQc2kXJ5U7tRKJZfpUQqFBSJdPs0E+BiyIyeOf/Gxb0Mcv
 W8TIhTkMNz616j/+dFPurBvq7M+Ww4BcZVAWpk7CK4ZE4vwwA+1CBfGp3ecQjE1PBg2yxql
 n1VpAND06ZlldGViPkiSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vIPQJkRsxqk=:ncONLOmz7Q2BVU98qylqOM
 jxSIZNyeSgRVAExR0ity8AyssXLKzmu6fB3nKfQhf7Ra5qp5jXZETyDqoSWe00vUhrEeeEsCR
 nl54nXfqkASUXRb5aq8HX+W+b6/0qFy8Z8SBwhfXX/23JyzDP8yAn6mbDhRDVDYCMfpD9F4+H
 IzJZFkg7D55pCGJDrCK4G5Lof6d3A7KWsPuhWJxZGAyfkDDcSnUnuh3TpxYcwu+PAa8bv2U+8
 9Xbr7fxYGVRGIhyue+Oa+2bTx5yKip6LMreR6y+BDNhHbKHhyPtVrIClSfATZIEYHGAvwmhMU
 L6TAtYAwWUnkAgtJx8FnHf0gl6e15xIfzzd/Kmn71QjOkL6Wszcsak4G0OBQWGYjvlzXOOJ+3
 zZxBTp6QPcw4L3KLafsxpOQpVZRTOcYdFBVQEcZLynnJmE+gftvRDxMd5E9++Uu0DuDzWWpLQ
 489V4BFgYTlblJFeO5RjN4LiE0gkcdIIFTi45Zr+saXJGgZsPFKi9GgBbVIXNs8uaoMNlUWUF
 6yAo24A1KtVhkPR1hW/WKMwdaBK5vy6dSGrCFohLP0RlH26w438MT+L0mTYHjcR845P9ygJzN
 Kd/W5iuMilNgK2zCm28n2eCnqH/+XbQruZLG3/BhOSb3BXyK0d0uYYzkILn5mGuXNltETKcs5
 hWIQCQ4/tPqpFmN1/322gjeE1QlxxtcwaTzEUFGZcOhMBe855oCX9PGVZt1yieseD6QGJ/eex
 weNEro9AzxhoBaCxL6DNkfv42Cev0/vTGjJ3yQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/10/2021 à 11:40, Mark Cave-Ayland a écrit :
> On 15/10/2021 07:31, Laurent Vivier wrote:
> 
>> Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
>>> In order to allow dynamic routing of IRQs to different IRQ levels on the CPU
>>> depending upon port B bit 6, use GLUE IRQ numbers and map them to the the
>>> corresponding CPU IRQ level accordingly.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hw/m68k/q800.c | 32 ++++++++++++++++++++++++++++----
>>>   1 file changed, 28 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
>>> index 15f3067811..81c335bf16 100644
>>> --- a/hw/m68k/q800.c
>>> +++ b/hw/m68k/q800.c
>>> @@ -102,11 +102,34 @@ struct GLUEState {
>>>       uint8_t ipr;
>>>   };
>>>   +#define GLUE_IRQ_IN_VIA1       0
>>> +#define GLUE_IRQ_IN_VIA2       1
>>> +#define GLUE_IRQ_IN_SONIC      2
>>> +#define GLUE_IRQ_IN_ESCC       3
>>> +
>>>   static void GLUE_set_irq(void *opaque, int irq, int level)
>>>   {
>>>       GLUEState *s = opaque;
>>>       int i;
>>>   +    switch (irq) {
>>> +    case GLUE_IRQ_IN_VIA1:
>>> +        irq = 5;
>>> +        break;
>>
>> Perhaps you can move this patch before patch 2 to help to understand why GLUE_IRQ_IN_VIA1 (0) is
>> mapped to irq 5 (before patch 2 it would be to 0).
>>
>>> +
>>> +    case GLUE_IRQ_IN_VIA2:
>>> +        irq = 1;
>>> +        break;
>>> +
>>> +    case GLUE_IRQ_IN_SONIC:
>>> +        irq = 2;
>>> +        break;
>>> +
>>> +    case GLUE_IRQ_IN_ESCC:
>>> +        irq = 3;
>>> +        break;
>>> +    }
>>> +
>>>       if (level) {
>>>           s->ipr |= 1 << irq;
>>
>> perhaps you can rename here "irq" to "shift"?
> 
> Were you happy to leave this as irq? Another alternative may be to use the BIT() macro as suggested
> by Zoltan.

I have no problem to keep this like that.

Thanks,
Laurent


