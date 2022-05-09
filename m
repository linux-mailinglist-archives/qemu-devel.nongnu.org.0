Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F951FBC1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:54:09 +0200 (CEST)
Received: from localhost ([::1]:40864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1xo-0002yh-Sd
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1no1sz-0007dm-Sz
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:49:09 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:59720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1no1sv-00080J-4y
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:49:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5A839746324;
 Mon,  9 May 2022 13:48:55 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2746F745958; Mon,  9 May 2022 13:48:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2636974579D;
 Mon,  9 May 2022 13:48:55 +0200 (CEST)
Date: Mon, 9 May 2022 13:48:55 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 0/3] Misc AC97 clean ups
In-Reply-To: <6ff58395-65a8-a50-90ee-571ccb131a8@eik.bme.hu>
Message-ID: <255fbc8f-3b2d-f121-472-91f4d5e36b81@eik.bme.hu>
References: <cover.1650706617.git.balaton@eik.bme.hu>
 <6ff58395-65a8-a50-90ee-571ccb131a8@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1061486857-1652096935=:59264"
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--3866299591-1061486857-1652096935=:59264
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 2 May 2022, BALATON Zoltan wrote:
> On Sat, 23 Apr 2022, BALATON Zoltan wrote:
>> During trying to implement via-ac97 I did some small clean ups to ac97
>> which is in this series. The via-ac97 is not working yet so that's not
>> included but these unrelated clean ups could be merged now.
>> 
>> v3: Fixed misalignments and drop spaces before commas (Víctor Colombo)
>> v2: Added R-b and changes from Peter Maydell
>
> Ping?
>
> https://patchew.org/QEMU/cover.1650706617.git.balaton@eik.bme.hu/

Ping2

Gerd, are you getting these messages?

>> Regards.
>> 
>> BALATON Zoltan (3):
>>  hw/audio/ac97: Coding style fixes to avoid checkpatch errors
>>  hw/audio/ac97: Remove unimplemented reset functions
>>  hw/audio/ac97: Remove unneeded local variables
>> 
>> hw/audio/ac97.c | 758 +++++++++++++++++++++++-------------------------
>> 1 file changed, 363 insertions(+), 395 deletions(-)
>> 
>
--3866299591-1061486857-1652096935=:59264--

