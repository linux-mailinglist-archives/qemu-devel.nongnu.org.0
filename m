Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0681F6E1DEA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 10:16:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnEZh-0007EJ-ND; Fri, 14 Apr 2023 04:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pnEZf-0007Dy-I5
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 04:14:27 -0400
Received: from mailout09.t-online.de ([194.25.134.84])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pnEZJ-0006p7-7I
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 04:14:27 -0400
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout09.t-online.de (Postfix) with SMTP id 2C99420182;
 Fri, 14 Apr 2023 08:53:22 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.18.128]) by fwd85.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pnDJ8-1RKQ2j0; Fri, 14 Apr 2023 08:53:18 +0200
Message-ID: <071a249e-2168-0bdf-2088-7faaa4987df8@t-online.de>
Date: Fri, 14 Apr 2023 08:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/3] SDL2 usability fixes
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20230412203425.32566-1-shentey@gmail.com>
 <9e951bfd-a657-5968-5318-0cd276cd5b2d@t-online.de>
 <FF1C15C5-33A9-46FD-A491-3248CFE5167A@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <FF1C15C5-33A9-46FD-A491-3248CFE5167A@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1681455198-A4FC4C52-174C56CE/0/0 CLEAN NORMAL
X-TOI-MSGID: c49575f5-1ed4-4793-8bd2-4d31507d1325
Received-SPF: none client-ip=194.25.134.84; envelope-from=vr_qemu@t-online.de;
 helo=mailout09.t-online.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Am 13.04.23 um 22:43 schrieb Bernhard Beschow:
>
> Am 13. April 2023 17:54:34 UTC schrieb "Volker Rümelin" <vr_qemu@t-online.de>:
>>> I'm trying to use QEMU on Windows hosts for fun and for profit. While the GTK
>>> GUI doesn't seem to support OpenGL under Windows the SDL2 GUI does. Hence I
>>> used the SDL2 GUI where I ran into several issues of which three are fixed in
>>> this series, which are:
>>>
>>> * Alt+Tab switches tasks on the host rather than in the guest in fullscreen mode
>>> * Alt+F4 closes QEMU rather than a graphical task in the guest
>>> * AltGr keyboard modifier isn't recognized by a Linux guest
>>>
>>> More information about each issue is provided in the patches.
>>>
>>> Bernhard Beschow (3):
>>>     ui/sdl2: Grab Alt+Tab also in fullscreen mode
>>>     ui/sdl2: Grab Alt+F4 also under Windows
>>>     ui/sdl2-input: Fix AltGr modifier on Windows hosts
>>>
>>>    ui/sdl2-input.c | 13 +++++++++++++
>>>    ui/sdl2.c       |  2 ++
>>>    2 files changed, 15 insertions(+)
>>>
>> Hi Bernhard,
> Hi Volker,
>
>> I don't think these patches are necessary. The AltGr key and the keyboard grab was fixed in 2020 with commit 830473455f ("ui/sdl2: fix handling of AltGr key on Windows") and a few commits before.
> Indeed, this patch addresses the AltGr issue. What I noticed in my case is that the AltGr behavior is different, depending on whether the *guest* is in graphics mode or not. Pressing AltGr in graphics mode issues two key modifiers while only one is issued when the guest is in text mode. I'll recheck tomorrow when I have access to a Windows host.

Hi Bernhard,

the AltGr behavior depends on the keyboard grab. The AltGr key works 
without keyboard grabbed and it doesn't with keyboard grabbed. That's a bug.

>
> What about the other two issues? My other two patches override SDL2 defaults which aren't addressed yet in QEMU AFAICS. The Alt+Tab one isn't even Windows-specific.
>
>> Something broke in the last few weeks. At the moment my Linux guest fails to start on Windows with -display sdl. QEMU locks up a short time after the Linux kernel starts.
> This doesn't happen for me with 8.0rc4 and latest msys2 environment. I'm running with `-accel whpx -vga none -device virtio-vga-gl -display sdl,gl=on` and I even get decent OpenGL accelleration when the Linux guest is in graphics mode, with wobbly windows etc. Sometimes QEMU aborts when it can't map some OpenGL stuff when the guest enters graphics mode but once that succeeds it runs absolutely stable.
>
>> I'll try to find the commit that caused this regression.

I tested with QEMU 7.1 and sometimes it also locks up. This indicates 
that the QEMU code doesn't have an issue.

With best regards,
Volker

> Yes, this would be interesting.
>
> Best regards,
> Bernhard
>
>> With best regards,
>> Volker


