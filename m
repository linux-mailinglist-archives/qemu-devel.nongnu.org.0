Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CD3FCF30
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 23:35:22 +0200 (CEST)
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLBPd-0000Kv-6Q
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 17:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mLBO9-0006lx-KT; Tue, 31 Aug 2021 17:33:49 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:43551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mLBO7-0000gv-6X; Tue, 31 Aug 2021 17:33:49 -0400
Received: by mail-qk1-x72b.google.com with SMTP id ay33so871352qkb.10;
 Tue, 31 Aug 2021 14:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Hk+mr7WrVk/NkrOA+M1hgdNFbHSJRLj3o0yzaECEWYg=;
 b=CUrBrQvO+wTpIsaY39f4vmq/Jx9WYUXz6Hlw7M4Gc6rQQ8RiWL0K3GYqZPLIRAfL9x
 nkLhJ1Tx2Z0NaZYBYvl2RjvMdm9zxX4iet3Hq4EvTA4wkkzYipFMp0FUWIhhid0Ye6Rk
 6eEMxkMKEj+kbmW3SXP1tKdugniVGSfYoR0ggaLOm2WWwefQx4MRrkfk02xdvDYvxAVt
 qeG08whojltVFOLCnGZeJgruWq87/Zm9okM+Yik9S2cAxTFIhn7GkIF1J5kgz1MqFOMN
 4esUYFXDjqXwbagaMKJoizxRTVhNAQL3mpSR3cwTsVHMK9xsFACzKuhHjEqGhHKsN2o9
 SaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Hk+mr7WrVk/NkrOA+M1hgdNFbHSJRLj3o0yzaECEWYg=;
 b=W7++OXNl8xopYIW7dy3ugrqEIf0v1nSq7BaVIHE9DoW0xPD1sMLnFYD4/pwl+Usp6f
 YDIkIzMzt6KARSpK6n6EiHWhdqHZo0l93a+V6O+zh7Ba7zmt+37f7Ohkda0AIetDmIFo
 ks9x0Ykw9GigSpbA9HFuNQhKIoIssmZ7fj8Nu9gVqkYvMulWhT3chhcIaAQRMMdOfS/N
 xYrXSBT2U/sZXhB2S2DQM0B/J3EO18MtS2bBwnKPAn2iTtAvkxvUK+3iLMj6RBWLCf5/
 jbNxwh8qlHdqxid+t9BMfTZ/zeNeaIzaEgcDYphqDEAhOEKMwvqm0MhGh3qKEhBJBP9D
 w5kw==
X-Gm-Message-State: AOAM532n1yi1RjE15VTYi7ZoReKftPf7Ca9GZ160oJNXbueUeyeqOZVt
 N1Lwv2LYD72OgHXgJb7t3rI=
X-Google-Smtp-Source: ABdhPJwVKWfPOId9e8ZDQT3xXHA3MhvjaSPOPQfac4MFWzLbPybkCGU248Pl21WkZQZ+wrIB85uBnw==
X-Received: by 2002:a37:ab15:: with SMTP id u21mr5081375qke.439.1630445625885; 
 Tue, 31 Aug 2021 14:33:45 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id 9sm10844528qtz.83.2021.08.31.14.33.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Aug 2021 14:33:45 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <91bc8dea-deb6-193e-326d-7a6467fa1214@eik.bme.hu>
Date: Tue, 31 Aug 2021 17:33:43 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <3FAD6D5D-E8E1-40AB-BAE8-0D92F6F4A171@gmail.com>
References: <20210827181429.23609-1-programmingkidx@gmail.com>
 <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
 <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
 <8ED650E0-5874-4AE6-85E3-631E7B76D37A@gmail.com>
 <CAFEAcA96V6d-aAR65xiZQrB65aTfQEJfHq5x_ZSa3mpAoSUMQw@mail.gmail.com>
 <269a250-93ec-2e6-8813-5b65aa9fb76@eik.bme.hu>
 <9E32E4A0-D1BB-4DDF-8F57-38BD5044DF1D@gmail.com>
 <91bc8dea-deb6-193e-326d-7a6467fa1214@eik.bme.hu>
To: BALATON Zoltan <balaton@eik.bme.hu>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Aug 31, 2021, at 5:08 PM, BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>=20
> On Tue, 31 Aug 2021, Programmingkid wrote:
>>> On Aug 30, 2021, at 5:47 PM, BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>=20
>>> On Mon, 30 Aug 2021, Peter Maydell wrote:
>>>> On Mon, 30 Aug 2021 at 21:29, Programmingkid =
<programmingkidx@gmail.com> wrote:
>>>>> I found out that there are two pc-bios folders. One in the root =
directory
>>>>> and one in the build directory. QEMU is looking in the pc-bios =
folder
>>>>> located inside the build folder. The qemu_vga.ndrv file is only =
located
>>>>> in the root directory pc-bios folder. I think a good solution to =
this
>>>>> issue is to first remove one of the pc-bios folders. I'm not sure =
if it
>>>>> is just me who has two pc-bios folders or if everyone does.
>>>>=20
>>>> Having two pc-bios folders is expected. The one in the source tree =
is
>>>> the one which has the files we actually carry around in git. The =
one
>>>> in the build tree is created by 'configure' and populated with =
symbolic
>>>> links back to the files in the source tree. We need this one =
because
>>>> the QEMU executable doesn't (and shouldn't) know where the source =
tree is:
>>>> when it is looking for files it will look in places relative to the
>>>> location of the executable itself (ie relative to the build tree)
>>>> as well as places set by configure (used when you install QEMU and
>>>> its various supporting files).
>>>>=20
>>>> The reason qemu_vga.ndrv is not in the pc-bios folder in the build
>>>> tree is because when that file was added we forgot to add handling
>>>> for it in configure. I'm not sure why nobody else has fallen over
>>>> this in the intervening 3 years: running QEMU from the build tree
>>>> will never find the file, and it will not be installed via
>>>> 'make install' either.
>>>=20
>>> This file is a driver for MacOS and not many people run that old OS. =
Those who do probably use Howard's binaries and follow his guides that =
tell you to use -L pc-bios on command line. I always wondered why that's =
needed when it should find it by default but this explains it and =
probably also your question why nobody complained.
>>>=20
>>> Regards,
>>> BALATON Zoltan
>>=20
>> This does sound like a good explanation. I am pretty sure I was able =
to use my Mac OS 9 VM without the -L option in the past and still have =
many video resolutions available.
>=20
> Depends how far back in the past was that. If before the meson =
conversion that introduced the build dir maybe you run it from the =
source dir (if used in-tree build) and it found the file. I'm not sure =
if it still works if you run from source dir such as =
build/qemu-system-ppc that is without changing current dir to build dir. =
If it works that way then maybe you ran it like that before. (Or maybe =
had an installed version and it picked up the file from there.)
>=20
> Regards,
> BALATON Zoltan

That was around version 2.10 so a while back.

I just realized, I sent a patch to the developer list that fixes the =
missing qemu_vga.ndrv problem, but I do not know which maintainer to =
send it to. Who maintains the configure script? A search of the =
maintainers page was not clear as to who this is.


