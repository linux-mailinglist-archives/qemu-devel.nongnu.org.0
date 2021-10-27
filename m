Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCA443CFA3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:25:00 +0200 (CEST)
Received: from localhost ([::1]:50394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmfb-00055v-8Q
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mflWD-0000sl-Bt
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:11:13 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:22805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mflW7-0001Hq-6R
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:11:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A26AD75603A;
 Wed, 27 Oct 2021 18:11:02 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 81088756036; Wed, 27 Oct 2021 18:11:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7EFEC748F58;
 Wed, 27 Oct 2021 18:11:02 +0200 (CEST)
Date: Wed, 27 Oct 2021 18:11:02 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 10/11] hw/intc/sh_intc: Clean up iomem region
In-Reply-To: <baccd69d-43bd-0f85-5242-a7a9cfe4e328@amsat.org>
Message-ID: <73e5be2b-f3f5-a4db-9f5-f91dd9ee812b@eik.bme.hu>
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <c1ab09d39b30c1cb9290bcc95626814249dc4505.1635342377.git.balaton@eik.bme.hu>
 <baccd69d-43bd-0f85-5242-a7a9cfe4e328@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-221107283-1635351062=:34647"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-221107283-1635351062=:34647
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 27 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/27/21 15:46, BALATON Zoltan wrote:
>> Fix the size of the iomem region and rename it to "intc" from
>> "interrupt-controller" which makes the info mtree output less wide as
>> it is already too wide because of all the aliases. Also drop the
>> format macro which was only used twice in close proximity so we can
>> just use the literal string instead without a macro definition.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/intc/sh_intc.c | 10 +++-------
>>  1 file changed, 3 insertions(+), 7 deletions(-)
>
>> -    memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc,
>> -                          "interrupt-controller", 0x100000000ULL);
>> +    memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc, "intc", 4);
>
> Why the region size change from 4GB -> 4B? Did you mean '4 * GiB'?

No, it's really just 4 bytes, like the sh_serial region is 0x28 bytes but 
previously these were unnecessarily allocated as 4GB and then mapped in 
sysmem via the small 4 byte (or 0x28 byte for sh_serial) alias regions 
only. So we don't actually need these to be 4GB as there's nothing beyond 
the actual length so just declare them the necessary size. (I'm thinking 
maybe later we can drop one of the P4 or A7 alias and map the actual iomem 
at one of these directly and use an alias for the other but that's a 
separate clean up later.)

Regards,
BALATON Zoltan
--3866299591-221107283-1635351062=:34647--

