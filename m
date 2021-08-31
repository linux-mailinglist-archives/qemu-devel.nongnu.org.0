Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5CE3FCB0B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 17:51:32 +0200 (CEST)
Received: from localhost ([::1]:48444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL62s-0004mG-QG
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 11:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mL61p-0003pR-Uy; Tue, 31 Aug 2021 11:50:25 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:35656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mL61l-0003LI-N1; Tue, 31 Aug 2021 11:50:25 -0400
Received: by mail-qt1-x829.google.com with SMTP id t9so15017901qtp.2;
 Tue, 31 Aug 2021 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=mnGhs7Q+wpRoSL9rhPlO6moiJq1wuWbGmmnOEi6Oebw=;
 b=Zxn8mEkS9LuEKjvD9jZ+e7ms4BMosXcCEYONPsoWCH5EeRa1WYJui2xJP8kj98/7Gl
 KRY1F+jN3T4g7hIZbwFB6Fm+UGoL2ruz4PLglL5yiVNP9iex6ce2bGGN6aEYj8ffoSQC
 V8UtVutVRP6FOR8UVRZ+IrQc2TlnYnUeHsgpsr0hwu1DyFFmj9D2VBGQjN77/+etqQOk
 75K5LcPpnkLZ0XlgDx8tX0A3eat3JsGpqYTtlT6U364e4WrdBzCHBH8Lgs4ErlhwNPMd
 UpH0UnTxcsn2Hp//bnvOokXFzlLLKQ3mHqUk6MsSR1t2bmECQZyBYv5OrtT73paaHlav
 HbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=mnGhs7Q+wpRoSL9rhPlO6moiJq1wuWbGmmnOEi6Oebw=;
 b=I/ZZVPSuIR7Wq7CA3pkAx2cQaouWk/vjoiql92q7kcDZdYnnJBNHh48lbnpBLev1B3
 57eEsvQp9KDZibBq0zbOovHDzIO8Aw0nIttbOkXz92l5d/wHYL0u1yVJnBC3A52vuvxJ
 z92W+1+0HSrYl151AouSCCp+UWesTN+EPbDqNjQv0bNETJA12bHJv7Jt4+JjsvDFpcme
 cWAtTFKgNZ/+lbSiAoz8VXgz+YfAZRrEORjJlNxWZ0PXspN7ziGiXvdfNZy699EM1Rh2
 YoK6MKcJX8LRnq4G1/SOH1tkcgQWiEz8SGWnaaoUfQTpSAisppvbLnUQ7tuCH523ZT9v
 uWJA==
X-Gm-Message-State: AOAM531xgy+LumXJ6rFLDIlM2ZXupdYRgMV84PcOpzcQt89QofQUXuBW
 Jd4l8hN1AzP8wZgrWqZJZKU=
X-Google-Smtp-Source: ABdhPJxGhNmnQHVC3hYvKx+S0P2nOnSBeANd5yKU5GCQW1RWVXDf8pngI1T3MjUmojGSVkuhB9svyA==
X-Received: by 2002:ac8:5e46:: with SMTP id i6mr3424575qtx.33.1630425019945;
 Tue, 31 Aug 2021 08:50:19 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id k10sm8723610qth.44.2021.08.31.08.50.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Aug 2021 08:50:19 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
Date: Tue, 31 Aug 2021 11:50:17 -0400
References: <20210827181429.23609-1-programmingkidx@gmail.com>
 <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
 <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
 <8ED650E0-5874-4AE6-85E3-631E7B76D37A@gmail.com>
 <CAFEAcA96V6d-aAR65xiZQrB65aTfQEJfHq5x_ZSa3mpAoSUMQw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>
In-Reply-To: <CAFEAcA96V6d-aAR65xiZQrB65aTfQEJfHq5x_ZSa3mpAoSUMQw@mail.gmail.com>
Message-Id: <8C4A73A1-22A7-4EC9-B561-F8487D56E8A9@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x829.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Aug 30, 2021, at 4:59 PM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On Mon, 30 Aug 2021 at 21:29, Programmingkid =
<programmingkidx@gmail.com> wrote:
>> I found out that there are two pc-bios folders. One in the root =
directory
>> and one in the build directory. QEMU is looking in the pc-bios folder
>> located inside the build folder. The qemu_vga.ndrv file is only =
located
>> in the root directory pc-bios folder. I think a good solution to this
>> issue is to first remove one of the pc-bios folders. I'm not sure if =
it
>> is just me who has two pc-bios folders or if everyone does.
>=20
> Having two pc-bios folders is expected. The one in the source tree is
> the one which has the files we actually carry around in git. The one
> in the build tree is created by 'configure' and populated with =
symbolic
> links back to the files in the source tree. We need this one because
> the QEMU executable doesn't (and shouldn't) know where the source tree =
is:
> when it is looking for files it will look in places relative to the
> location of the executable itself (ie relative to the build tree)
> as well as places set by configure (used when you install QEMU and
> its various supporting files).
>=20
> The reason qemu_vga.ndrv is not in the pc-bios folder in the build
> tree is because when that file was added we forgot to add handling
> for it in configure. I'm not sure why nobody else has fallen over
> this in the intervening 3 years: running QEMU from the build tree
> will never find the file, and it will not be installed via
> 'make install' either.
>=20
> (The pc-bios symlink stuff is a bit of a mess, as the comment about
> it in configure notes. Perhaps meson now offers a cleaner way to
> handle this? In particular pc-bios/meson.build already has to carry
> around a complete list of all the bios blobs, so it could probably
> create the symlink farm itself.)
>=20
> thanks
> -- PMM

I did try working on the pc-bios/meson.build file. I deleted all the =
entries in the 'blobs' list. Then I ran './configure =
--target-list=3Dppc-softmmu && make -j 9'. The pc-bios folder in the =
build directory was still populated with all the files (except for =
qemu_vga.ndrv). Anyone knows what exactly populates the pc-bios folder =
in the build folder?=

