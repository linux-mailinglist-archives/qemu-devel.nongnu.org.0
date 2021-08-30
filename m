Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CAF3FBD76
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 22:34:03 +0200 (CEST)
Received: from localhost ([::1]:44342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKnyj-0003Sz-KF
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 16:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mKnuJ-0005wH-IY; Mon, 30 Aug 2021 16:29:27 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:35444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mKnuH-0005Bp-QA; Mon, 30 Aug 2021 16:29:27 -0400
Received: by mail-qt1-x831.google.com with SMTP id t9so12830570qtp.2;
 Mon, 30 Aug 2021 13:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qpJ4SuOtgjdgFm215VlbVxdUqf1F7oK4e2nveYJN2hQ=;
 b=gmQuYu9ZLcNzd717vy9fhFKW+WtqhuZGzZ6kvAsNJ3e/mio117IPh1Bn6PuE1VLNPr
 93NJaMNElhI0z3qPil9GbpPk9gjB4M7d/xqQlFDTAyDxPHK2bFEVhhUUm5tQE3sJVQZ0
 txv+PO9ptOfC1tHgvqpvTCQXi5UdUpEB19jgPjRIcsen2xF7N1uX5amEBjO3TZ5+gJcZ
 C/KTSxdAhgZBRv1y2gT0RmyDX0cK+GLDvadVGh69c0wQCa/DvyBKLehAwF32NRBgWumz
 k1ZHTFAWNev7S0w990G7XWVvJ41836sYaf5A4MN9/YGosUMfMVktB0oXyt5R7RlqjHOJ
 JdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qpJ4SuOtgjdgFm215VlbVxdUqf1F7oK4e2nveYJN2hQ=;
 b=SABj4Bhtk4DvFHsPzvADaQqxcrQBnAk5/0jho505e5g2xjR6BiGnYZYu3Bw1NBjw0F
 xbJ3Wxwcz6uD7n9bDpN0YmR8IZTy33jgfoOj+7hjcll/WCTUO4DDCUFc72GqG6YKZxvQ
 Wf+cn4b4pqvG08+ZNANN2qT8PMh5TxiAQhF2KRvw4eNZZcQck3Mp5TPI5wmO6vjUMcsl
 eXcIBsyEWN6Z1brVHMSAjlsPZ7heiadMBVAz168060Pk9h5akcEcJsIjJQFqVm/elFB9
 mH6DFLaUQSZdDYegx/pvZ/VZ7LMn3oDZPGoO9JE1Oh+7cvxY9rcpOczGmkAGs2yIgYAG
 pORg==
X-Gm-Message-State: AOAM533WLKOBvqpavxNQ3h/GZX4atJmb8r/hOc/Hml7bfp4reD/DmhQ6
 1Lych7F5PZZnlthiIzU4N24Mrc64ufs=
X-Google-Smtp-Source: ABdhPJwPa8IAo9XgCoswQVmLHR/LWWx7Eg+bIr/wvAtAfV2BmabH57wLC7tMqeD2X8UJvmxktQqrdg==
X-Received: by 2002:ac8:6601:: with SMTP id c1mr20000341qtp.179.1630355363686; 
 Mon, 30 Aug 2021 13:29:23 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id c2sm9029700qte.22.2021.08.30.13.29.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Aug 2021 13:29:23 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
Date: Mon, 30 Aug 2021 16:29:21 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <8ED650E0-5874-4AE6-85E3-631E7B76D37A@gmail.com>
References: <20210827181429.23609-1-programmingkidx@gmail.com>
 <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
 <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Aug 29, 2021, at 8:17 AM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On Sun, 29 Aug 2021 at 11:18, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>> What I don't understand is that the binary is installed by default in =
QEMU's sharedir
>> so everything works out of the box with "make install". Do you have =
some kind of
>> custom installer which is doing something different?
>=20
> John has had problems before with the QEMU binary not being able to =
find
> files at runtime (the previous example was the QEMU logo file). I =
suspect
> we have a common underlying bug there. John -- do you run QEMU from
> the build directory, or by installing it first and running the =
installed
> binary, or in some other way ?
>=20
> thanks
> -- PMM

I found out that there are two pc-bios folders. One in the root =
directory and one in the build directory. QEMU is looking in the pc-bios =
folder located inside the build folder. The qemu_vga.ndrv file is only =
located in the root directory pc-bios folder. I think a good solution to =
this issue is to first remove one of the pc-bios folders. I'm not sure =
if it is just me who has two pc-bios folders or if everyone does. Anyone =
else see this?=

