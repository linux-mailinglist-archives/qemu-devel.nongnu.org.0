Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C544D13C978
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:35:53 +0100 (CET)
Received: from localhost ([::1]:56862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irle3-0008Ig-Od
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35861)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1irlbE-0006Ac-F5
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 11:32:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1irlbA-0004Al-L6
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 11:32:56 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:56169)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1irlbA-0004A6-BX
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 11:32:52 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPXMa-1j4Sut1ZWE-00Mcvo; Wed, 15 Jan 2020 17:32:21 +0100
To: Arnd Bergmann <arnd@arndb.de>, Filip Bozuta <Filip.Bozuta@rt-rk.com>
References: <1579103618-20217-1-git-send-email-Filip.Bozuta@rt-rk.com>
 <1579103618-20217-9-git-send-email-Filip.Bozuta@rt-rk.com>
 <CAK8P3a187rPhma7Q6o+hCF3h0=5MLZwh49+JqKt6BvVsAB1efQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH 08/12] linux-user: Add support for setting alsa timer
 enhanced read using ioctl
Message-ID: <ceaf44c0-fd6c-c280-7f95-7bc133553089@vivier.eu>
Date: Wed, 15 Jan 2020 17:32:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a187rPhma7Q6o+hCF3h0=5MLZwh49+JqKt6BvVsAB1efQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EdX/0RYqWETKZVZ0WAaLG/i8/xUBF4CBLf3+jtp/fYLrIIDEG1i
 MsEhWZEkmLx30OfibYRZbkWXqLuSginkG31t6Cw4FWBDMkvow1OteH8PuVLMZSJU2wU3mHp
 BO/6sKyg12iOdQt52aKfVxC48FGUWobMpAE2IuycJiZDGzZ1pHoG2i3/qGDv4QP7Soimv1B
 gO7WibSKjXZHKYc3e3gkQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6SX65npOEXM=:8gs4N2mXoQDwhMIP6tKzT2
 Q5NRj6Rrvu3nipgZ7puCrJ0Vv5C4qC+VemQysmOlmRpRPjcKpUkVjZ2lpkJ0PUlhGnuIztEhy
 ObhoQdbufoh3Gf5/BFuh175Hik8MwqqaB9bQtIYfHYmLAvA3MrR2oaygAR1FVyqzJLchvCU0k
 vz6RVT2CGKS9o1rOFCt5hN91w9IJ5aJfMf9qzNuAdpjfo/8vyRnerUYtM2FW62AlH3px+JNLv
 Sb3gMCSKszn9Qay4n4B/40GRf/JnvOLNs+LEzloD4ERUruyvkn33Egxp2DNF5ZsQbo8PdOd1a
 WD3LRi2BL0HtnbFEoLH+QxYvfSi3tFQHbdRHnr9E/dCQQBGZk8nV9If+8j32rrNTdld3wcrwZ
 J026pe+D0EIB3pkJ0we+kjJ6iHQv9fc1Tl6/lZ30jMGjYbkoYtOeEaWoD83DlIhdyacaGpC/W
 26Ziqy7z9ZFnevhmuF/a3TqTVooV45NvXgBkL7VT/F5BBBMaEiSnSgMEDYLosNq1KRcYKqrUr
 U00sOfFaqUV2QsQqCm13Qrifq+kVRAjzjmTRpEKL8yKXmo93Euu8rBHox9CiHSmeH27LtH6Y+
 3E5CZevNJqqvpiE3poi8DBvNCGy0cgTX3fhaDqnmG6qM3xLMc5zmr1i78eHMid6yXJgBZx7XY
 /0hBQICx11nBs/TQW92W142fXuBY2LUf6Uzv8LV1Wiwg1YOkKupXlGTVMtDrLWfUbZOsAdmFH
 5gq93f6qIfp2zmxJQhksopseENTp8+QUvrFG6S2Vbm4y++BxE7os2MDv/gMEXq7BubyQG+Wga
 JQxRr90imDr+MxtqTYMuQ3ic2t6YKYhRHoBnd7Ko0sNrQ3gS6Vi5G3nHbueoJHn3scS4pAiTv
 ulwq7RkYCEO0yyX0Ov8SsnAwOx7cmMKzeb/HuNe6g=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.17.24
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, amarkovic@wavecomp.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/01/2020 à 17:18, Arnd Bergmann a écrit :
> On Wed, Jan 15, 2020 at 4:53 PM Filip Bozuta <Filip.Bozuta@rt-rk.com> wrote:
>>
>> This patch implements functionality of following ioctl:
>>
>> SNDRV_TIMER_IOCTL_TREAD - Setting enhanced time read
>>
>>     Sets enhanced time read which is used for reading time with timestamps
>>     and events. The third ioctl's argument is a pointer to an 'int'. Enhanced
>>     reading is set if the third argument is different than 0, otherwise normal
>>     time reading is set.
>>
>> Implementation notes:
>>
>>     Because the implemented ioctl has 'int' as its third argument, the
>>     implementation was straightforward.
>>
>> Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
> 
> I think this one is wrong when you go between 32-bit and 64-bit

kernel uses an "int" and "int" is always 32bit.
The problem is most likely with timespec I think.

> targets, and it gets worse with the kernel patches that just got
> merged for linux-5.5, which extends the behavior to deal with
> 64-bit time_t on 32-bit architectures.
> 
> Please have a look at
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?h=80fe7430c70859
> 
>        Arnd
> 

Yes, we already had the same kind of problem with SIOCGSTAMP and
SIOCGSTAMPNS.

Do the kernel patches add new ioctl numbers to differentiate 32bit and
64bit time_t?

Thanks,
Laurent

