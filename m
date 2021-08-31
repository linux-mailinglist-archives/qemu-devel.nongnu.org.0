Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7C03FCB12
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 17:54:56 +0200 (CEST)
Received: from localhost ([::1]:51464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL662-0006x8-NF
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 11:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mL63s-0005aI-6h; Tue, 31 Aug 2021 11:52:32 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:37707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mL63n-0004v4-Nk; Tue, 31 Aug 2021 11:52:31 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id z7so6633999qvi.4;
 Tue, 31 Aug 2021 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=8wLZota3fDdSQGyQ34sdZBG/Wc47lY2RYPq16YHnTbQ=;
 b=Tf9N/j6DtqAUUM+8cRcfV691vQ+Y4itBV/kRdlluMPbuI0IPC7D3uDnWjhymr1gCAG
 +MmazWfQnpmOUamEoRwmSq4T/IHCxIi4EdnysT09gWSaBl9bsPG5q5AvxzFR9/fNmXaa
 zq1xujqqImsgDx1yzXtaYh9gZYvCiNuRXn8eOV9BLU6V+H90Unt3Bx8j9ONiBUgaEcX5
 dRN4s5vX7+o8u4Samv2Z+zJ61/PfTMHR5HnmWrRmH4cMsfNAgIwSPMH/y/aJ7eEQHgAs
 v5rNbxAAGI/GPgKZ6hNhoTF4r+K3VhYKOjPeK64uJ/Qe5Ac6pxFEwGPMEYwZDuYraWTC
 svZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=8wLZota3fDdSQGyQ34sdZBG/Wc47lY2RYPq16YHnTbQ=;
 b=HBuQah0N9dTFN/6DKwySb5sTRlD2ElPBX79Z0VxwqMlfq2fT+/FFFHTQqeXCpT8T+r
 nsDA7W159dFOZm1u0pQps8rONnAAMsbplhNhNWYmeCom08IwxWKmWaFPWf5j71zadmyU
 hFS25+tS9huy4z9GgeFgzVOIyqVtfEZ3S9Wcc7ybUa9AdmZ88GZJrue+lH1xvqG3vbFR
 IPEL4PTuVlBVbgUo5dT9/iU7gZlTbW0vIPFneBrQgyRsDULXssiUuhui8/Vx03nBfcf8
 MjRaAH3dixOMGsNOpKtnWxRMMV9ZRbemiDIyd9D6NHv4Ij8E7o1aQ9L/sXOFVGqdDzlQ
 SaHA==
X-Gm-Message-State: AOAM530bgzMOC92Khq5OSlI0COTC5shzAMDvO1YuvQznid9Ocz3XUvlm
 SJHrntLY2MKjKdXFvdeIrmI=
X-Google-Smtp-Source: ABdhPJzmIr32qD5V6aaxxGOOADrA7JjwgsyCYY0a6/0K78I13nwmHCnj7lmd1iSiOEJMZEPRagDnoA==
X-Received: by 2002:ad4:4f50:: with SMTP id eu16mr28874099qvb.27.1630425146366; 
 Tue, 31 Aug 2021 08:52:26 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id v27sm13884784qkj.129.2021.08.31.08.52.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Aug 2021 08:52:26 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <269a250-93ec-2e6-8813-5b65aa9fb76@eik.bme.hu>
Date: Tue, 31 Aug 2021 11:52:24 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <9E32E4A0-D1BB-4DDF-8F57-38BD5044DF1D@gmail.com>
References: <20210827181429.23609-1-programmingkidx@gmail.com>
 <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
 <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
 <8ED650E0-5874-4AE6-85E3-631E7B76D37A@gmail.com>
 <CAFEAcA96V6d-aAR65xiZQrB65aTfQEJfHq5x_ZSa3mpAoSUMQw@mail.gmail.com>
 <269a250-93ec-2e6-8813-5b65aa9fb76@eik.bme.hu>
To: BALATON Zoltan <balaton@eik.bme.hu>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf2a.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Aug 30, 2021, at 5:47 PM, BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>=20
> On Mon, 30 Aug 2021, Peter Maydell wrote:
>> On Mon, 30 Aug 2021 at 21:29, Programmingkid =
<programmingkidx@gmail.com> wrote:
>>> I found out that there are two pc-bios folders. One in the root =
directory
>>> and one in the build directory. QEMU is looking in the pc-bios =
folder
>>> located inside the build folder. The qemu_vga.ndrv file is only =
located
>>> in the root directory pc-bios folder. I think a good solution to =
this
>>> issue is to first remove one of the pc-bios folders. I'm not sure if =
it
>>> is just me who has two pc-bios folders or if everyone does.
>>=20
>> Having two pc-bios folders is expected. The one in the source tree is
>> the one which has the files we actually carry around in git. The one
>> in the build tree is created by 'configure' and populated with =
symbolic
>> links back to the files in the source tree. We need this one because
>> the QEMU executable doesn't (and shouldn't) know where the source =
tree is:
>> when it is looking for files it will look in places relative to the
>> location of the executable itself (ie relative to the build tree)
>> as well as places set by configure (used when you install QEMU and
>> its various supporting files).
>>=20
>> The reason qemu_vga.ndrv is not in the pc-bios folder in the build
>> tree is because when that file was added we forgot to add handling
>> for it in configure. I'm not sure why nobody else has fallen over
>> this in the intervening 3 years: running QEMU from the build tree
>> will never find the file, and it will not be installed via
>> 'make install' either.
>=20
> This file is a driver for MacOS and not many people run that old OS. =
Those who do probably use Howard's binaries and follow his guides that =
tell you to use -L pc-bios on command line. I always wondered why that's =
needed when it should find it by default but this explains it and =
probably also your question why nobody complained.
>=20
> Regards,
> BALATON Zoltan

This does sound like a good explanation. I am pretty sure I was able to =
use my Mac OS 9 VM without the -L option in the past and still have many =
video resolutions available.=20=

