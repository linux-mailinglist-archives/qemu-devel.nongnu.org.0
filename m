Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9174405EC
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:53:51 +0200 (CEST)
Received: from localhost ([::1]:54962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbh0-0005dC-KM
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgbfZ-00049x-TO
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:52:21 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:52946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgbfY-0001Km-3w
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:52:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E511F748F4B;
 Sat, 30 Oct 2021 01:52:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BE8457475FA; Sat, 30 Oct 2021 01:52:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BD1227462D3;
 Sat, 30 Oct 2021 01:52:18 +0200 (CEST)
Date: Sat, 30 Oct 2021 01:52:18 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 00/30] More SH4 clean ups (including code style series)
In-Reply-To: <b9fca527-82b0-a75a-d67e-7309e4147a1d@amsat.org>
Message-ID: <4580b31-e584-2624-2788-a71d4fd689c@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <b9fca527-82b0-a75a-d67e-7309e4147a1d@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1371360833-1635551538=:5796"
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

--3866299591-1371360833-1635551538=:5796
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 29 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/29/21 23:02, BALATON Zoltan wrote:
>> This now includes the previous code style clean up series so
>> everything is in the series now. This got big enough for now so I'll
>> wait until these are merged (hopefully before the freeze) before going
>> on so I don't have to carry them in my tree. Only plan to submit
>> another version if needed from review otherwise that's it for now,
>> hopefully this is the last version.
>>
>> v6: Found some lines with wrong indentation missed in code style clean
>> up and one line missed removing sh_intc_source from header so I'm
>> posting the whole series with these two small fixes, otherwise same as
>> v5 but rebased on fixed code style series which is now also included.
>
>> BALATON Zoltan (30):
>>   hw/sh4: Coding style: Remove tabs
>>   hw/sh4: Coding style: Fix multi-line comments
>>   hw/sh4: Coding style: White space fixes
>>   hw/sh4: Coding style: Add missing braces
>>   hw/sh4: Coding style: Remove unnecessary casts
>>   hw/sh4: Fix typos in a comment
>>   hw/sh4: Change debug printfs to traces
>>   hw/sh4/r2d: Use error_report instead of fprintf to stderr
>>   hw/char/sh_serial: Do not abort on invalid access
>>   hw/char/sh_serial: Rename type sh_serial_state to SHSerialState
>>   hw/char/sh_serial: Embed QEMUTimer in state struct
>>   hw/char/sh_serial: Split off sh_serial_reset() from sh_serial_init()
>>   hw/char/sh_serial: QOM-ify
>>   hw/char/sh_serial: Add device id to trace output
>>   hw/intc/sh_intc: Use existing macro instead of local one
>>   hw/intc/sh_intc: Turn some defines into an enum
>>   hw/intc/sh_intc: Rename iomem region
>>   hw/intc/sh_intc: Drop another useless macro
>>   hw/intc/sh_intc: Move sh_intc_register() closer to its only user
>>   hw/intc/sh_intc: Remove excessive parenthesis
>>   hw/intc/sh_intc: Use array index instead of pointer arithmetics
>>   hw/intc/sh_intc: Inline and drop sh_intc_source() function
>>   hw/intc/sh_intc: Replace abort() with g_assert_not_reached()
>>   hw/intc/sh_intc: Avoid using continue in loops
>>   hw/intc/sh_intc: Simplify allocating sources array
>>   hw/intc/sh_intc: Remove unneeded local variable initialisers
>>   hw/timer/sh_timer: Rename sh_timer_state to SHTimerState
>>   hw/timer/sh_timer: Do not wrap lines that are not too long
>>   hw/timer/sh_timer: Fix timer memory region size
>>   hw/timer/sh_timer: Remove use of hw_error
>
> Hmm there is something odd with your mailer, your patches are
> not sent in order, making it hard for tools to collect them.

I know, sorry. Sort by name, that should fix the order. I use git 
format-patch but maybe don't know the right option for it to generate 
correct dates.

Regards,
BALATON Zoltan
--3866299591-1371360833-1635551538=:5796--

