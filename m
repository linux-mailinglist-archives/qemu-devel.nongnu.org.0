Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69661EC10F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 19:36:56 +0200 (CEST)
Received: from localhost ([::1]:34650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgAqN-0006ow-AQ
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 13:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jgApN-0005g7-RK; Tue, 02 Jun 2020 13:35:53 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:36708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jgApL-00068B-2y; Tue, 02 Jun 2020 13:35:53 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 08F1274594E;
 Tue,  2 Jun 2020 19:35:46 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BB050745702; Tue,  2 Jun 2020 19:35:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B651E7456F8;
 Tue,  2 Jun 2020 19:35:45 +0200 (CEST)
Date: Tue, 2 Jun 2020 19:35:45 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Andrea_Palmat=E8?= <andrea.palmate@gmail.com>
Subject: Re: Sam460Ex screen mode, audio and network
In-Reply-To: <CAD+yzTTqHtQY-c9rJe-BLmaGPK8QdMuVyKxJo+-SeL8WV1k4-g@mail.gmail.com>
Message-ID: <alpine.BSF.2.22.395.2006021912270.10465@zero.eik.bme.hu>
References: <CAD+yzTSr2edTNmzkGOH7todx7uVPbL_BSNSJPb62mJWCUSa8NA@mail.gmail.com>
 <4d64c939-3431-b637-488e-676a5f9171e5@amsat.org>
 <alpine.BSF.2.22.395.2006021510140.40694@zero.eik.bme.hu>
 <alpine.BSF.2.22.395.2006021647240.70962@zero.eik.bme.hu>
 <CAD+yzTRCwsMgG9JUoyCi7ecc_Vmph7GJjrdH7moqLGfmKMjvVg@mail.gmail.com>
 <CAD+yzTTqHtQY-c9rJe-BLmaGPK8QdMuVyKxJo+-SeL8WV1k4-g@mail.gmail.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-916472972-1591119345=:10465"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 13:35:46
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-916472972-1591119345=:10465
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 2 Jun 2020, Andrea Palmatè wrote:
> Regard the resolution. I've seen if i call the video mode SM502 instead of
> SiliconMotion 502 it doesn't show the 1366x762 resolution.. that's weird..

I don't know much about how this works but maybe it has to match the chip 
or monitor driver to show up? I think on AmigaOS these use 
SiliconMotion502 name instead of the short name.

>> In the meanwhile i've tried to add -device ES1370 but i get no audio at
>> all. I've also a lot of shared "memfd open() failed: Function not
>> implemented" errors on console

I get none of these problems on Linux. Maybe it's a problem with WSL? If 
you're on Windows why don't you try a native Windows build? The official 
QEMU download page seems to not have 5.0.0 build yet but there are some 
alternative builds on the emaculation.com forum which should work. For 
AmigaOS use the vanilla 5.0.0 build, ignore the patched screamer sound 
build which is only needed for MacOS on mac99. See:

https://www.emaculation.com/doku.php/ppc-osx-on-qemu-for-windows

>> Regard the video mode. I'm pretty sure that resolutions like 1366x768
>> should work but not unticking the "default" checkbox. They needs to be
>> created by Screenmode program. The strange thing is that during
>> installation i've created successfully the resolution (that however had
>> that problem). Now with the OS even if the resolution is created i have
>> 1024x768 twice.

If you can compile QEMU sources you could try printing 
SM501_DC_PANEL_FB_WIDTH and SM501_DC_PANEL_FB_HEIGHT in 
sm501_disp_ctrl_write() in qemu/hw/display/sm501.c to see what resolution 
the guest programs the card. The high 16 bits are the value to check. 
Haven't tried with adding a mode but with unticking default and setting 
width these remained 1024x768. Your screen shot looks like the window is a 
bit smaller than 1366x768 but it's wide aspect not 4:3 so maybe it did 
change mode but not sure to what size and if that matches your resolution 
(looks like it doesn't that's why you get garbled output).

>> I've also a problem that host mouse pointer is shown. I've read that i
>> need to add a "tabled" device in the xml file. But where i have to create
>> that file? Keep in mind that i'm using Ubuntu on Windows 10 via WSL and not
>> an ubuntu machine

What you read is for vitual machines created via libvirt and probably 
using other OS than AmigaOS so does not apply to your case. You can add a 
tablet with -device usb-tablet (see -device help for all options) but I 
don't think AmigaOS has a tablet driver so likely it won't work so you can 
ignore that. If the build from emaculation.com did not fix this you may 
try adding -sdl instead to use the SDL graphics backend which works better 
for this, people had problem with the default gtk backend and mouse on the 
emaculation.com forum and recommended using -sdl instead.

Regards,
BALATON Zoltan
--3866299591-916472972-1591119345=:10465--

