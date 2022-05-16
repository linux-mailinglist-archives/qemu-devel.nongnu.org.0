Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D24528C03
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:31:32 +0200 (CEST)
Received: from localhost ([::1]:48120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeZ8-0000RJ-RI
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nqdx8-0006KC-Dp
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:52:16 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nqdx6-0004c3-MF
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:52:14 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nqdw2-0007Ml-Tm; Mon, 16 May 2022 17:51:11 +0100
Message-ID: <c427cc10-60e0-203e-0af4-065920c58623@ilande.co.uk>
Date: Mon, 16 May 2022 17:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Sven Schnelle <svens@stackframe.org>
References: <20220511235054.185435-1-deller@gmx.de>
 <cc38de01-0f6c-343f-535d-f84ef35aca0b@ilande.co.uk>
 <8b2ac5b2-73fb-90dc-6c42-30ceedf43bd7@gmx.de>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <8b2ac5b2-73fb-90dc-6c42-30ceedf43bd7@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/6] hppa: Artist graphics driver fixes for HP-UX
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 16/05/2022 15:43, Helge Deller wrote:

> On 5/16/22 09:19, Mark Cave-Ayland wrote:
>> On 12/05/2022 00:50, Helge Deller wrote:
>>
>>> This series adds additional HP fonts to the SeaBIOS-hppa firmware.
>>>
>>> And in the qemu artist graphics driver it:
>>> - fixes the vertical postioning of the X11 cursor with HP-UX
>>> - allows X11 to blank the screen (e.g. screensaver)
>>> - allows the X11 driver to turn the X11 cursor on/off
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>
>>> Helge Deller (6):
>>>     seabios-hppa: Update SeaBIOS-hppa to VERSION 4
>>>     artist: Introduce constant for max cursor size
>>>     artist: Use human-readable variable names instead of reg_xxx
>>>     artist: Fix vertical X11 cursor position in HP-UX
>>>     artist: Allow to turn cursor on or off
>>>     artist: Emulate screen blanking
>>>
>>>    hw/display/artist.c       | 134 +++++++++++++++++++++++++++++---------
>>>    pc-bios/hppa-firmware.img | Bin 701964 -> 715240 bytes
>>>    roms/seabios-hppa         |   2 +-
>>>    3 files changed, 106 insertions(+), 30 deletions(-)
>>>
>>> --
>>> 2.35.3
>>
>> I've applied these patches to latest git and done a quick test with
>> my cut-down Linux image and the latest HPPA image at
>> https://parisc.wiki.kernel.org/index.php/Qemu, and confirmed I can
>> successfully switch fonts without seeing any other graphical issues.
>> This isn't a particularly comprehensive test though, since I don't
>> have a copy of HP-UX and the latest HPPA image doesn't have X
>> installed.
> 
> Thanks for testing anyway. I agree, there are not many people who
> can test the HP-UX graphics changes...

:)

>>  From a general QEMU perspective the patches look okay, except for the
>> separate patch posted after the original series which fails
>> checkpatch due to styling issues around the block comments.
> 
> Argh... I just sent out v2 but missed to fix the style issues.
> Please ignore v2 - I will send out a v3 soon....
> 
>> It is possible to do this directly on a checkout of the git source
>> tree with "./scripts/checkpatch.pl master..HEAD", or once you have
>> the final PR ready to go then a push to GitLab to confirm it passes
>> CI should help locate any potential problems.
> 
> Can you give some more info about this GitLab integration?
> I'm currently using github for my tree...

Sure! Simply create an account on GitLab, log in, and then create a fork of the QEMU 
repository at https://gitlab.com/qemu-project/qemu. If you then add your personal 
fork of the QEMU repository as a git remote and push a branch to it, the GitLab 
infrastructure will run the in-tree CI which you can track from the menu at "CI/CD" 
-> "Pipelines".

This is almost identical to the gating CI used for merges, so a pass is a good 
indicator that the branch/PR doesn't cause any expected regressions. However I don't 
know if there is a HPPA image included as part of the CI tests.

>> I don't have any knowledge of the internals of the artist framebuffer, but feel free to add an:
>>
>> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>> when you respin the v2. It's not far off a Tested-by but I don't feel I can offer that without being able to test a HP-UX X environment.


ATB,

Mark.

