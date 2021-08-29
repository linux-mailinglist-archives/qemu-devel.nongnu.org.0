Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375753FAC0F
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 15:54:00 +0200 (CEST)
Received: from localhost ([::1]:40546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKLFs-0001Q9-QU
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 09:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mKLE4-0008WJ-JP; Sun, 29 Aug 2021 09:51:56 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:38771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mKLE3-0003p1-6Q; Sun, 29 Aug 2021 09:51:56 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id ew6so6888295qvb.5;
 Sun, 29 Aug 2021 06:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qVrTX4oyB5+e3Zr15wg0jEtc+HB4CtTf+p/UABR/aF0=;
 b=f9sJ+yn40oCLsvn9EkPnMrx+DqM9pbYR/T1xwXnedFbphw/OjHOKWQwyh3AOB1l1bs
 jYDFIbqazzKH5lOgU0yxbcQtrNHkZ/C0WE1aJ/ZPZC0SmF9JXR8k6IfJ/JedxENKEHeM
 MHoK5LE9dre44hCK1ly9SJAUDvktIiWXaLgTS9z7QNjS3qXKGnymfIa9bp1EbIbnQfv8
 e47Qbctud9d4Cf2NdWH2VkCEcRb1j57H2Oc3L2JitN+K2U2ThbeeRrz24sByCfGxhDun
 JhiPha2uN9Fu3oiE+88kKC27Rd5bZ9A04oI1f7rKVdyb83xI1Ccwo2ycvCGSev8MKGNW
 EJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qVrTX4oyB5+e3Zr15wg0jEtc+HB4CtTf+p/UABR/aF0=;
 b=AGtJ1zu/OsG/3m0oIjp45eABHoMvXyc6KA+BXb1/iy2Pk3q/xGQzSJODeUKN5yrvK6
 MUE3cvKbxuyTz/sKhv7GGfjHYCUezIoIUiEe/vBieQMGAE0OPR7s6ex5Xt3TECQPDz9G
 N+X8dB4MYi2NI258+Tjbr0ZZUmzpcBmkQJQCC18hsIcx+lA7X8NAe5UVgN4bOoxN8mvf
 RjxfWvUk6kwySNzgyuJELiTAS8dtlVywNJ5hhwpbF/GqN5vdRN8Ok9BTVuoZhTkGjS8i
 H7UxQ0RxxWxmZtglcUZzbwN6Kxz8D4ZFmFYA6lWo53WdfFm2QmcQ2CzeQYUBLJsEfFKL
 ZdKg==
X-Gm-Message-State: AOAM531vQBR3U0DrUUdpjQjv6MLVnYxS/y4SlrXeZIm2+QZnmWKlJFR9
 2aeCE1T4ybiHVW2y3ECY3+M=
X-Google-Smtp-Source: ABdhPJznEp+5jyElhpiwhm/AkTUeyayJ6ltYwSyP9u1++woBAZEdO4WAf0TnVPTxep+wVB3/O7oCcA==
X-Received: by 2002:ad4:40d1:: with SMTP id x17mr19111620qvp.7.1630245113295; 
 Sun, 29 Aug 2021 06:51:53 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id g12sm6772350qtq.92.2021.08.29.06.51.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Aug 2021 06:51:52 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
Date: Sun, 29 Aug 2021 09:51:51 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <862FC94E-4A38-4322-9F32-137ED868A24C@gmail.com>
References: <20210827181429.23609-1-programmingkidx@gmail.com>
 <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
 <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
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

I run QEMU from the build directory.=

