Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7524408A3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 13:52:35 +0200 (CEST)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgmuY-00005N-Ld
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 07:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgmsj-0007Qs-UF
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 07:50:42 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:58322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgmsc-0006e7-3L
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 07:50:41 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D5BE4748F48;
 Sat, 30 Oct 2021 13:50:30 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 512EB746333; Sat, 30 Oct 2021 13:50:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4E7847462D3;
 Sat, 30 Oct 2021 13:50:30 +0200 (CEST)
Date: Sat, 30 Oct 2021 13:50:30 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 00/30] More SH4 clean ups (including code style series)
In-Reply-To: <e3b94e2b-0dad-f7aa-779e-3684b7c956d4@amsat.org>
Message-ID: <a03e21b8-ac3d-baa6-6cb9-6df9fc9066b4@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <e3b94e2b-0dad-f7aa-779e-3684b7c956d4@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-947882195-1635594630=:76261"
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

--3866299591-947882195-1635594630=:76261
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hello,

On Sat, 30 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/29/21 23:02, BALATON Zoltan wrote:
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
> Thanks, series queued.

Thanks again for taking care of this.

> Since you are hacking the SH-4 machines, please have a look at
> Yoshinori work, possibly helping with reviewing once he respin
> these series, which are good material (and where we want to
> take our emulation) but are not yet ready for upstream:
>
> "Unified peripheral emulation for Renesas chips"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg811384.html
>
> "Integrate renesas MCU/SoC timer module"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg818332.html

I'll try to do what I can but don't know SH too much just found it 
interesting so looked at it a bit. These series seem to touch timer and 
serial so I'll keep out of those now to not cause more rebasing for 
Yoshinori. (If you told me before then maybe I've left those but hopefully 
the clean up in this series does not cause big problems for rebasing the 
RX series and maybe help a little to see clearer what existing code does 
or where it should go.)

I plan to work on sh_intc next as that seems to need some improvements. 
Yoshinori, do you have any patches or plans for sh_intc? Maybe the 
interrupt controllers are different in RX and SH so these will be kept 
separate but asking to avoid doing work that's intended to be replaced 
anyway.

Regards,
BALATON Zoltan
--3866299591-947882195-1635594630=:76261--

