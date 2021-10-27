Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307DA43CFA5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:28:13 +0200 (CEST)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmii-0000y2-0Z
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mflYq-00059W-Ck
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:13:58 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:15826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mflYi-0001gh-UL
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:13:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 86EC5756047;
 Wed, 27 Oct 2021 18:13:47 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6523C748F58; Wed, 27 Oct 2021 18:13:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 63BCC7463B7;
 Wed, 27 Oct 2021 18:13:47 +0200 (CEST)
Date: Wed, 27 Oct 2021 18:13:47 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 02/11] hw//sh4: Use qemu_log instead of fprintf to
 stderr
In-Reply-To: <f40a2ecb-0596-5821-7fdf-4b9528ce342f@amsat.org>
Message-ID: <e3eddcf-fbe1-106f-c6ce-9ab9c43f9463@eik.bme.hu>
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <c788cbcd379e42908b55df5785c031e437f81a5b.1635342377.git.balaton@eik.bme.hu>
 <f40a2ecb-0596-5821-7fdf-4b9528ce342f@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1572257822-1635351227=:34647"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--3866299591-1572257822-1635351227=:34647
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 27 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/27/21 15:46, BALATON Zoltan wrote:
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  hw/char/sh_serial.c |  7 ++++---
>>  hw/sh4/sh7750.c     | 13 ++++++-------
>>  2 files changed, 10 insertions(+), 10 deletions(-)
>
>>      case SH7750_GPIOIC_A7:
>>          s->gpioic = mem_value;
>>          if (mem_value != 0) {
>> -            fprintf(stderr, "I/O interrupts not implemented\n");
>> +            qemu_log_mask(LOG_UNIMP, "I/O interrupts not implemented\n");
>>              abort();
>
> This change is annoying. Before you'd get an error message and the abort
> signal. Now if you don't use "-d unimp" you get an abort without
> explanation. Can we use error_report() instead?

I plan to remove the aborts later. What's annoying is that the guest can 
crash QEMU by doing something invalid. Other devices don't do this just 
report the error with LOG_UNIMP and continue even if it will not work so I 
follow that convention but did not yet cleaned up the aborts.

Regards,
BALATON Zoltan
--3866299591-1572257822-1635351227=:34647--

