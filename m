Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142466E2777
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:53:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLiZ-0006DA-06; Fri, 14 Apr 2023 11:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pnLiS-0006Cb-HO
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:52:00 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pnLiC-0004JS-N2
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:52:00 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7B630746369;
 Fri, 14 Apr 2023 17:50:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3D05C746361; Fri, 14 Apr 2023 17:50:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3B33474634B;
 Fri, 14 Apr 2023 17:50:18 +0200 (CEST)
Date: Fri, 14 Apr 2023 17:50:18 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: =?ISO-8859-15?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>, 
 qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/3] SDL2 usability fixes
In-Reply-To: <9AEEC7FB-A3DB-44FC-81C2-87C16643756A@gmail.com>
Message-ID: <d5791efb-9a12-1f1b-da46-c2698f7c20b3@eik.bme.hu>
References: <20230412203425.32566-1-shentey@gmail.com>
 <9e951bfd-a657-5968-5318-0cd276cd5b2d@t-online.de>
 <FF1C15C5-33A9-46FD-A491-3248CFE5167A@gmail.com>
 <071a249e-2168-0bdf-2088-7faaa4987df8@t-online.de>
 <9AEEC7FB-A3DB-44FC-81C2-87C16643756A@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1253714670-1681487418=:22688"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1253714670-1681487418=:22688
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 14 Apr 2023, Bernhard Beschow wrote:
> Am 14. April 2023 06:53:18 UTC schrieb "Volker Rümelin" <vr_qemu@t-online.de>:
>> Am 13.04.23 um 22:43 schrieb Bernhard Beschow:
>>> Am 13. April 2023 17:54:34 UTC schrieb "Volker Rümelin" <vr_qemu@t-online.de>:
>>>>> I'm trying to use QEMU on Windows hosts for fun and for profit. While the GTK
>>>>> GUI doesn't seem to support OpenGL under Windows the SDL2 GUI does. Hence I
>>>>> used the SDL2 GUI where I ran into several issues of which three are fixed in
>>>>> this series, which are:
>>>>>
>>>>> * Alt+Tab switches tasks on the host rather than in the guest in fullscreen mode
>>>>> * Alt+F4 closes QEMU rather than a graphical task in the guest
>>>>> * AltGr keyboard modifier isn't recognized by a Linux guest
>>>>>
>>>>> More information about each issue is provided in the patches.
>>>>>
>>>>> Bernhard Beschow (3):
>>>>>     ui/sdl2: Grab Alt+Tab also in fullscreen mode
>>>>>     ui/sdl2: Grab Alt+F4 also under Windows
>>>>>     ui/sdl2-input: Fix AltGr modifier on Windows hosts
>>>>>
>>>>>    ui/sdl2-input.c | 13 +++++++++++++
>>>>>    ui/sdl2.c       |  2 ++
>>>>>    2 files changed, 15 insertions(+)
>>>>>
>>>> Hi Bernhard,
>>> Hi Volker,
>>>
>>>> I don't think these patches are necessary. The AltGr key and the keyboard grab was fixed in 2020 with commit 830473455f ("ui/sdl2: fix handling of AltGr key on Windows") and a few commits before.
>>> Indeed, this patch addresses the AltGr issue. What I noticed in my case is that the AltGr behavior is different, depending on whether the *guest* is in graphics mode or not. Pressing AltGr in graphics mode issues two key modifiers while only one is issued when the guest is in text mode. I'll recheck tomorrow when I have access to a Windows host.
>>
>> Hi Bernhard,
>
> Hi Volker,
>
>>
>> the AltGr behavior depends on the keyboard grab. The AltGr key works without keyboard grabbed and it doesn't with keyboard grabbed. That's a bug.
>
> Interesting. The keyboard is grabbed automatically for some reason when 
> the guest enters graphics mode. Together with what you describe this 
> could explain the difference in behavior I'm seeing.

Not sure how it works on Windows but keyboard grab may depend on the 
drivers or devices in the guest. I think using a usb-tablet may auto-grab 
mouse while using a mouse needs to click in the window to grab. Also not 
sure how this relates to keyboard at all so maybe this is not relevant 
here in which case sorry for the noise. I guess what I wanted to say is 
also check what command line you use (what input devices you VM has) and 
what guest side drivers you use that may have an effect (such as some 
vmware drivers could or maybe some other drivers). In any case first you 
should sync to make sure you're on the same page and testing the same 
thing to avoid some confusion. Sorry if this is not really helpful.

Regrads,
BALATON Zoltan
--3866299591-1253714670-1681487418=:22688--

