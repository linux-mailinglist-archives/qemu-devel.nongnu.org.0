Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AFD2E31EA
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 17:52:55 +0100 (CET)
Received: from localhost ([::1]:42264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktZHq-0000sL-PJ
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 11:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktZF4-00084U-IR
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:50:02 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:45223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktZF3-0006Gu-1f
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:50:02 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6679A74646C;
 Sun, 27 Dec 2020 17:49:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 39B3E74645F; Sun, 27 Dec 2020 17:49:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 37C2074645B;
 Sun, 27 Dec 2020 17:49:59 +0100 (CET)
Date: Sun, 27 Dec 2020 17:49:59 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 03/12] vt82c686: Remove unnecessary _DEVICE suffix from
 type macros
In-Reply-To: <b9ae563c-5780-6d97-4873-46ebd4c7cfc0@amsat.org>
Message-ID: <ea63770-2d6d-b4e8-3aa7-9df7b5e1326a@eik.bme.hu>
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <f4697f5ba4c8bae032234f48a91e074fb3d62a91.1609031406.git.balaton@eik.bme.hu>
 <b9ae563c-5780-6d97-4873-46ebd4c7cfc0@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-734052811-1609087799=:84491"
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-734052811-1609087799=:84491
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 27 Dec 2020, Philippe Mathieu-Daudé wrote:
> On 12/27/20 2:10 AM, BALATON Zoltan via wrote:
>> There's no reason to suffix everything with _DEVICE when the names are
>> already unique without it and shorter names are more readable.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/isa/vt82c686.c | 48 +++++++++++++++++++++++------------------------
>>  1 file changed, 23 insertions(+), 25 deletions(-)
>>
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index 2a0f85dea9..1be1169f83 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -49,8 +49,8 @@ struct VT82C686BState {
>>      SuperIOConfig superio_conf;
>>  };
>>
>> -#define TYPE_VT82C686B_DEVICE "VT82C686B"
>> -OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B_DEVICE)
>> +#define TYPE_VT82C686B "VT82C686B"
>> +OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B)
>
> Can we name this one VT82C686B_ISA?

Yes, actually this is coming up in later patches adding VT8231 but I still 
need to think about that. Once I clean that up but maybe I can do the 
rename already here.

Regards,
BALATON Zoltan
--3866299591-734052811-1609087799=:84491--

