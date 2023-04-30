Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5607E6F297B
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 18:21:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pt9ml-0007Bq-G4; Sun, 30 Apr 2023 12:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hahn@univention.de>)
 id 1pt9mi-0007BK-Ae
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 12:20:24 -0400
Received: from mail.univention.de ([82.198.197.8])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hahn@univention.de>)
 id 1pt9mf-0004CL-32
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 12:20:23 -0400
Received: from localhost (localhost [127.0.0.1])
 by lankmoj.knut.univention.de (Postfix) with ESMTP id 41B771021B8;
 Sun, 30 Apr 2023 18:20:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=univention.de;
 s=202111; t=1682871617;
 bh=zzaBtZSfPD7U71FKpH7sLtjQZqO9EDlwlLs/HFCpM/w=;
 h=Date:To:References:From:Subject:In-Reply-To:From;
 b=mFMA5zJBSJ1IHlEfZ7n1orvNBPhaHi944d+9X6n9qjtRHcaFhTJNzCIa5aFoteD6N
 PaD60OaUGk1J+xDFMVCzVN+OqIeFF671zR4Glb5HT/c0YdDKfvYS9G0F095HEfOvL5
 bKtYntGXFjskhxKEMyMz0zSFRc4VkEqzMVdAY/XVnnWEpH1ytYfWFrbkeTWL4eHq6A
 X0E3p0C576Pp5bntdDesEgZ5kxyY0qvI5wLvUnNRnWdMxnlWR2i+CIcPYCReZyECDs
 /UETyOshMUxb3TNHrRgp5ZtgDWzNdwsTi2WqrV6C71i7n1EU+ClcYHhX/5UDi4967Z
 MXshpKKoKdL/Q==
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 knut.univention.de
Received: from mail.univention.de ([127.0.0.1])
 by localhost (lankmoj.knut.univention.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kt18DDCWBh1I; Sun, 30 Apr 2023 18:20:15 +0200 (CEST)
Received: from [192.168.178.65] (p54909e08.dip0.t-ipconnect.de [84.144.158.8])
 by lankmoj.knut.univention.de (Postfix) with ESMTPSA id 49438FF14F; 
 Sun, 30 Apr 2023 18:20:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=univention.de;
 s=202111; t=1682871615;
 bh=zzaBtZSfPD7U71FKpH7sLtjQZqO9EDlwlLs/HFCpM/w=;
 h=Date:To:References:From:Subject:In-Reply-To:From;
 b=Q9dT0jmanZI9yXoiAduxWhVbiOomhPBPJmfDNMge/Hxe3mPpQ9FEEiNGU1xLorPFI
 9Ry3yhhCbLu8yT5LOYNgqaQwq/pLnKVmTKpthTCeXM850KWsX4dAr2QDWlMCiNwQYH
 0c1B4oFUgQTBbPD+ndN5HncSJnFn+slTmVHZ/Xi5Sqbgyv7tOdhm1O3fC1USam2aQN
 b1EM06Jjxvy/+vF/oC2OUpRkljAG8Bxm/pIwg2j3OQYF+hCopPZsXIbG1357QD+EBs
 lzKuUGd7o4uSEDglneTchiGD7DqdzmBr6ybZPoMXucFqwWiNOUb6I+t3gy1xEeq+U5
 ow8EE2TwTnCVQ==
Message-ID: <a4ce2f4b-f0fd-6a57-a3d0-aa0ed2f54e5f@univention.de>
Date: Sun, 30 Apr 2023 18:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "octaveflon@outlook.fr" <octaveflon@outlook.fr>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <CWLP265MB5209050A121EB63FE07F9BD5A8689@CWLP265MB5209.GBRP265.PROD.OUTLOOK.COM>
From: Philipp Hahn <hahn@univention.de>
Organization: Univention GmbH
Subject: Re: VNC clipboard support
In-Reply-To: <CWLP265MB5209050A121EB63FE07F9BD5A8689@CWLP265MB5209.GBRP265.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=82.198.197.8; envelope-from=hahn@univention.de;
 helo=mail.univention.de
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

Am 29.04.23 um 17:29 schrieb octaveflon@outlook.fr:
> I'm trying to use the copy/paste with VNC.
> 
> I'm launching qemu with:
> 
> $ qemu-system-x86_64 -hda debiandisk.img vnc :1
> 
> I'm using tightvncviewer which has support for copy/paste.
> 
> I try to copy text between guest and host.
> 
> It doesn't work. Neither from host to guest or guest to host.
> 
> As far as I know, there is clipboard support in VNC (ui/vnc-clipboard.c 
> and so on).
> With wireshark, I can see that tightvncviewer send clipboard requests.
> 
> Am I missing some configuration?

Clipboard via VNC to QEMU does not work: Basically the VNC protocol was 
originally used for remote-access to X11 application. There you work on 
a high-level were XKeySyms are used and where clipboard data can be 
exchanged.

In contrast with QEMU you work on a much lower level as you do hardware 
emulation: The operating system inside your QEMU process expects 
low-level hardware events like a USB or PS2 keyboard key Up / Down events.
As the VNC protocol only exchanges "XKeySyms" QEMU has to translate them 
back to those low-level USB/PS2 events expected by the OS.
This back-translation is not unique: For example most full-sized 
keyboards have the number block, so there are 2 keys to enter a digit.

Therefore QEMU added the "extended key event"-extension, which adds the 
low-level "KeyCode" in addition to the "XKeySym" to the VNC protocol: 
When you press a key in your VNC browser the X-Server luckily also gets 
the low-level "KeyCode", but the original VNC protocol did not include 
that information on the protocol level. By including that information 
QEMU no longer has to "fake" it and simply pass that information to the 
inside OS.

Even when your clipboards only contains text (it could also have a 
bitmap picture or some other rich data), you are basically back in the 
situation where you have to translate each character to one (or 
multiple) key-press/release events, again with the same issue mention 
above: You do not have the KeyCode and someone has to fake them.

Therefore it will not work: Albeit some VNC browsers or libraries 
implement that approach, but their result is unreliable, especially if 
the keyboard layout on your client computer does not match the keyboard 
layout configured in QEMU for the backward translation does not match 
the keyboard layout of your operating system running inside of QEMU.

If you want to know more, read this still excellent blog-post from 
Daniel Berrangé:
- 
https://www.berrange.com/posts/2010/07/04/more-than-you-or-i-ever-wanted-to-know-about-virtual-keyboard-handling/
- 
https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#qemu-extended-key-event-message

Philipp

