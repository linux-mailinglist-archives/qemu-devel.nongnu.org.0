Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDA33A5FB8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 12:08:42 +0200 (CEST)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjWL-0003ZO-Hk
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 06:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lsjQS-0000wP-1v; Mon, 14 Jun 2021 06:02:36 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:14641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lsjQL-00075D-Ux; Mon, 14 Jun 2021 06:02:34 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B2D667457ED;
 Mon, 14 Jun 2021 12:02:22 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7DDFF74570D; Mon, 14 Jun 2021 12:02:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7CC6B7456E3;
 Mon, 14 Jun 2021 12:02:22 +0200 (CEST)
Date: Mon, 14 Jun 2021 12:02:22 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 0/3] i2c: Match parameters of i2c_start_transfer and
 i2c_send_recv
In-Reply-To: <8230aaa5-73b4-4bf6-6567-38bb5cde3883@amsat.org>
Message-ID: <b5f020d9-53e6-602c-74f8-d2695462a5c@eik.bme.hu>
References: <20200623063123.20776-1-f4bug@amsat.org>
 <46692025-50b-2734-e394-513b2761b979@eik.bme.hu>
 <8230aaa5-73b4-4bf6-6567-38bb5cde3883@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-387435162-1623664942=:82798"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-387435162-1623664942=:82798
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 14 Jun 2021, Philippe Mathieu-Daudé wrote:
> On 6/12/21 9:33 PM, BALATON Zoltan wrote:
>> Hello,
>>
>> On Tue, 23 Jun 2020, Philippe Mathieu-Daudé wrote:
>>> This is v2 of Zoltan's patch:
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg714711.html
>>>
>>> - rebased
>>> - added docstring
>>> - include hw/misc/auxbus.c fix
>>>
>>> Supersedes: <20200621145235.9E241745712@zero.eik.bme.hu>
>>
>> What happened to this series? I did not find it in patchew, only my
>> original patch:
>>
>> https://patchew.org/QEMU/20200621145235.9E241745712@zero.eik.bme.hu/
>>
>> I still have this in one of my branches so I think it was not merged at
>> the end. Could this be resurrected or should I forget about it and live
>> with the inconsistency in parameters instead?
>
> I suppose it was not queued because you asked to remove the
> "Reported-by" tag :/ I agree with you it would be nice to get this in
> the tree

I think I said only Reported-by is enough no need for Suggested-by as well 
but I don't see this as a reason to drop these patches. So maybe just 
nobody cared enough.

> for good. However 1 year passed, so it might need adjustment.

Should I try to rebase it or will you do it eventually?

Regards,
BALATON Zoltan
--3866299591-387435162-1623664942=:82798--

