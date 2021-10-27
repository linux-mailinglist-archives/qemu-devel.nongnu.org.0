Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1DE43CF54
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:02:39 +0200 (CEST)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmJy-0005Wg-KY
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfli1-0004W1-1P
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:23:26 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:64477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mflhz-0004DS-64
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:23:24 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D783E756036;
 Wed, 27 Oct 2021 18:23:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B5C7B748F58; Wed, 27 Oct 2021 18:23:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B4269746399;
 Wed, 27 Oct 2021 18:23:19 +0200 (CEST)
Date: Wed, 27 Oct 2021 18:23:19 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 01/11] hw/sh4: Fix a typo in a comment
In-Reply-To: <0e3fdeaa-9580-ed81-ee17-63ec0c19a062@amsat.org>
Message-ID: <9b449a9d-3388-deb7-d864-c8a97547cf4@eik.bme.hu>
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <f03f38eb6b70b8586f33868b0ba4839f3b214fc9.1635342377.git.balaton@eik.bme.hu>
 <0e3fdeaa-9580-ed81-ee17-63ec0c19a062@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-30470199-1635351799=:34647"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-30470199-1635351799=:34647
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 27 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/27/21 15:46, BALATON Zoltan wrote:
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  hw/timer/sh_timer.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
>> index 02eb865908..0a18ac8276 100644
>> --- a/hw/timer/sh_timer.c
>> +++ b/hw/timer/sh_timer.c
>> @@ -107,7 +107,7 @@ static void sh_timer_write(void *opaque, hwaddr offset,
>>          if (s->enabled) {
>>              /*
>>               * Pause the timer if it is running. This may cause some inaccuracy
>> -             * dure to rounding, but avoids a whole lot of other messyness
>> +             * due to rounding, but avoids a whole lot of other messyness
>
> Also "messiness", otherwise:

I wasn't sure that's a word but appears in a dictionary so I'll change 
that too.

Regards,
BALATON Zoltan

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
>>               */
>>              ptimer_stop(s->timer);
>>          }
>>
>
>
--3866299591-30470199-1635351799=:34647--

