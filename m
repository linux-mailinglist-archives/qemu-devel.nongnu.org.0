Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115355986E3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:07:57 +0200 (CEST)
Received: from localhost ([::1]:50340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOh7j-0003pO-6H
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOh2f-0005Tr-4O; Thu, 18 Aug 2022 11:02:42 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:53398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOh2c-0004wX-8e; Thu, 18 Aug 2022 11:02:40 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 82CDA746324;
 Thu, 18 Aug 2022 17:02:34 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 162E57461AE; Thu, 18 Aug 2022 17:02:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1445F745702;
 Thu, 18 Aug 2022 17:02:34 +0200 (CEST)
Date: Thu, 18 Aug 2022 17:02:34 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 00/31] QOMify PPC4xx devices and minor clean ups
In-Reply-To: <aed974eb-2723-9a4b-bf36-d16b319bf127@kaod.org>
Message-ID: <e38157fc-85a0-c755-1d77-85b43fff662@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
 <aed974eb-2723-9a4b-bf36-d16b319bf127@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-433892932-1660834954=:51256"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-433892932-1660834954=:51256
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 18 Aug 2022, Cédric Le Goater wrote:
> Daniel,
>
> On 8/17/22 17:08, BALATON Zoltan wrote:
>> Hello,
>> 
>> This is based on gitlab.com/danielhb/qemu/tree/ppc-7.2
>> 
>> This series contains the rest of Cédric's OOM'ify patches modified
>> according my review comments and some other clean ups I've noticed
>> along the way.
>
> I think patches 01-24 are good for merge.

When merging note the v3 for patch 21.

>> v2 now also includes the sdram changes after some clean up to simplify
>> it. This should now be the same state as Cédric's series. I shall
>> continue with the ppc440_sdram DDR2 controller model used by the
>> sam460ex but that needs a bit more chnages. But it is independent of
>> this series so this can be merged now and I can follow up later in a
>> separate series.
>
> I will take a look at the SDRAM changes later.

OK, I'll probably resend these starting from patch 25 with some small 
chnages: the v3 I've sent for the last patch and one I noticed in patch 30 
which is just making ppc4xx_sdram_bank_sizes array local to 
ppc4xx_sdram_ddr_realize() as it's not used anywhere else and this avoids 
clash with similar array when I move the sam460 version here. Other than 
these These patches should be stable I'll just plan to add additional 
patches to handle the sam460ex SDRAM controller as well. If you have any 
comments to the current patches I can incorporate those in this new 
series.

Regards,
BALATON Zoltan
--3866299591-433892932-1660834954=:51256--

