Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB376E2437
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 15:25:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnJP0-0005W9-6R; Fri, 14 Apr 2023 09:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pnJOx-0005W1-Tl
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 09:23:44 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pnJOw-0003b6-1M
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 09:23:43 -0400
Received: by mail-ej1-x629.google.com with SMTP id xd13so11623131ejb.4
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 06:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681478620; x=1684070620;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A2BXdT97E5hcrpVpM8oTYO7nil98fWkajk73MVcsjNQ=;
 b=e1AJw77ePy8Mb+WusAsY5bcynEzqsEl62uCwa+VfQimfUvtCLZj+85eneWpsdQcCZO
 Inzmdy2k/JafB55SsiadoJ6/eSnUF/dbAEFd169E9fHISaGRR4TV5IZL512U7n2iopb7
 Mg9Xyb9ZNpkBl5Jy5XjJxwgcnY3PKk1GhYvRtbmDz2IhIfpIV323nO9T03pFhgbO0YPb
 IPhU8jUxO8lQ14piJ6MoOnaRoRnHs4Jc+qsIyYe5B1WwaqSEy0AVnJopkLTKjIIgCUV3
 s9NDOZuSSs7AOVNl/y6BaBC+OcHaKnOv7p6kei2kAgNXZeJgS3X6h/rHk0DTQCKty/we
 HOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681478620; x=1684070620;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A2BXdT97E5hcrpVpM8oTYO7nil98fWkajk73MVcsjNQ=;
 b=JCs37ZurOhmMtzkZfV1KYe54g9q7mhD3uQwArhi+hahE4ZNJim6fwygUMRLfeAorRr
 jNTIHK9oZcAuOfRx4msX+HWeTCeh/cOkEStF15pJgdej8qnU5O/6BGcc3F2x2KcVTFaT
 /hbJ+dFmwix2dG/qOu8IrfDULk2ubyX1loAOKdPK3WW5/cxX6gRDqb9/2/Pzl9r9S8Ok
 TBPocuri/jpPQvCXJ1E3vQdzcp0bu+h0Zx7h7z55DQ3BS16VNGbnmMs14+KxpAT5PFH9
 2pSyXK4Hqc3KH5OQWJesha7B+oP4rNS5TQU2c51FRkVDMdum/PlkA7mBgeCz2s9t3aUQ
 gLjQ==
X-Gm-Message-State: AAQBX9ekpPFvK2NorFDfvRQikHwlj1MZ7U5sKQ5Ov8+pHRZtNbVZsqqv
 9yhzhSzrxVvdosy+HJXeozI=
X-Google-Smtp-Source: AKy350ZlYgN8GDRR3/iVDXA8y/GJ7JIeQtEaICpPG2MiHfgYyVMGjVLOX++pnP+YxUxovegDjgzsWw==
X-Received: by 2002:a17:906:4a12:b0:948:fe00:77f2 with SMTP id
 w18-20020a1709064a1200b00948fe0077f2mr8073888eju.58.1681478620062; 
 Fri, 14 Apr 2023 06:23:40 -0700 (PDT)
Received: from [127.0.0.1] ([62.214.191.67]) by smtp.gmail.com with ESMTPSA id
 e2-20020a170906314200b0094bb4c75695sm2402704eje.194.2023.04.14.06.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 06:23:39 -0700 (PDT)
Date: Fri, 14 Apr 2023 13:23:08 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>,
 qemu-devel@nongnu.org
CC: Stefan Weil <sw@weilnetz.de>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/3] SDL2 usability fixes
In-Reply-To: <faa3a8a3-ae6b-18bb-90ac-533576544866@t-online.de>
References: <20230412203425.32566-1-shentey@gmail.com>
 <9e951bfd-a657-5968-5318-0cd276cd5b2d@t-online.de>
 <FF1C15C5-33A9-46FD-A491-3248CFE5167A@gmail.com>
 <faa3a8a3-ae6b-18bb-90ac-533576544866@t-online.de>
Message-ID: <630304F7-5D88-4A10-BBEE-31E4C4BC052A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



Am 13=2E April 2023 21:40:29 UTC schrieb "Volker R=C3=BCmelin" <vr_qemu@t-=
online=2Ede>:
>Am 13=2E04=2E23 um 22:43 schrieb Bernhard Beschow:
>>=20
>> Am 13=2E April 2023 17:54:34 UTC schrieb "Volker R=C3=BCmelin" <vr_qemu=
@t-online=2Ede>:
>>>> I'm trying to use QEMU on Windows hosts for fun and for profit=2E Whi=
le the GTK
>>>> GUI doesn't seem to support OpenGL under Windows the SDL2 GUI does=2E=
 Hence I
>>>> used the SDL2 GUI where I ran into several issues of which three are =
fixed in
>>>> this series, which are:
>>>>=20
>>>> * Alt+Tab switches tasks on the host rather than in the guest in full=
screen mode
>>>> * Alt+F4 closes QEMU rather than a graphical task in the guest
>>>> * AltGr keyboard modifier isn't recognized by a Linux guest
>>>>=20
>>>> More information about each issue is provided in the patches=2E
>>>>=20
>>>> Bernhard Beschow (3):
>>>>     ui/sdl2: Grab Alt+Tab also in fullscreen mode
>>>>     ui/sdl2: Grab Alt+F4 also under Windows
>>>>     ui/sdl2-input: Fix AltGr modifier on Windows hosts
>>>>=20
>>>>    ui/sdl2-input=2Ec | 13 +++++++++++++
>>>>    ui/sdl2=2Ec       |  2 ++
>>>>    2 files changed, 15 insertions(+)
>>>>=20
>>> Hi Bernhard,
>> Hi Volker,
>>=20
>>> I don't think these patches are necessary=2E The AltGr key and the key=
board grab was fixed in 2020 with commit 830473455f ("ui/sdl2: fix handling=
 of AltGr key on Windows") and a few commits before=2E
>> Indeed, this patch addresses the AltGr issue=2E What I noticed in my ca=
se is that the AltGr behavior is different, depending on whether the *guest=
* is in graphics mode or not=2E Pressing AltGr in graphics mode issues two =
key modifiers while only one is issued when the guest is in text mode=2E I'=
ll recheck tomorrow when I have access to a Windows host=2E
>>=20
>> What about the other two issues? My other two patches override SDL2 def=
aults which aren't addressed yet in QEMU AFAICS=2E The Alt+Tab one isn't ev=
en Windows-specific=2E
>
>Hi Bernhard,

Hi Volker,

>
>the keyboard behavior on Windows and Linux is identical=2E With the QEMU =
window activated and keyboard not grabbed, those key combos like Alt-Tab or=
 Alt-F4 are sent to the host=2E With the QEMU window activated and keyboard=
 grabbed they are sent to the guest=2E

That's the behavior I'd expect=2E I've confirmed today with 8=2E0rc4 that =
patches 1 and 2 are needed to achieve this=2E I'm using a Windows 11 host a=
nd I'm compiling under msys2 on the same Windows host=2E

Best regards,
Bernhard

>I'm not so sure if this should be changed only for SDL on Windows=2E
>
>With best regards,
>Volker
>
>>> Something broke in the last few weeks=2E At the moment my Linux guest =
fails to start on Windows with -display sdl=2E QEMU locks up a short time a=
fter the Linux kernel starts=2E
>> This doesn't happen for me with 8=2E0rc4 and latest msys2 environment=
=2E I'm running with `-accel whpx -vga none -device virtio-vga-gl -display =
sdl,gl=3Don` and I even get decent OpenGL accelleration when the Linux gues=
t is in graphics mode, with wobbly windows etc=2E Sometimes QEMU aborts whe=
n it can't map some OpenGL stuff when the guest enters graphics mode but on=
ce that succeeds it runs absolutely stable=2E
>>=20
>>> I'll try to find the commit that caused this regression=2E
>> Yes, this would be interesting=2E
>>=20
>> Best regards,
>> Bernhard
>>=20
>>> With best regards,
>>> Volker
>

