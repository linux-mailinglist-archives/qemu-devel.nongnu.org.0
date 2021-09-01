Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DB33FD9CD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:37:59 +0200 (CEST)
Received: from localhost ([::1]:46656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPV8-0000eu-47
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mLPGv-0006ca-Jd; Wed, 01 Sep 2021 08:23:17 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:39820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mLPGt-0003W6-U9; Wed, 01 Sep 2021 08:23:17 -0400
Received: by mail-qk1-x730.google.com with SMTP id y144so2716821qkb.6;
 Wed, 01 Sep 2021 05:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=FosCg8NsR9lp048gBtIzzt96cDOtCleXHbWuYb9TL2U=;
 b=k0H3UrlhzzP9karmkaRNzCBN2w8kzQTwV+tKUGMXDISNO72NHutxhlq3cdrVozuSDj
 xaYR32ZvO4FvSOQWsOKahQEkI8X87xYJe3MJzH0XghsXVIxOzPbywDYEl8Q06JPtlwEF
 U/tjv5xorN1p0FWBztzYR9tqxbhopSkh+my7xEvv7qDoX830JRKhtZEuvWxkONpnhi0u
 pooU4beAVgky5hLAH+QxqlMFkeF2dNiz2LWWYJH77xFV+t6JyN1G3ALhKjH9JO2Dc+VP
 nwfVyYrD39n63v7k4Dcb/OTto37DRQKUGzyo0aUn4xNb6VW4dAlYK30DONTcMqZTNw8p
 klFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=FosCg8NsR9lp048gBtIzzt96cDOtCleXHbWuYb9TL2U=;
 b=QlW/lF9PHGWT6TcMtsjjLWCikK2otSHn5MoDWiId3bi5vJOzVqKd8oLcCeSa8MKPRs
 /Lubxkct9B5N8Q4cnjlxkg1ZVV8/mSpA4YCcxfv7cT4sXtkiLGWDv3JZGK6BZ/2kaBDx
 5jPhr5C7kKLd1qEi7SwCBc/lrQVJnVz/dS+n4R28+9Tca+cIL9+FH9zQXEaJPpRxPiLC
 Yci6f8OHVLxxd0pycyG+sofvuAI73BMGUwbukXUDYH8coiWGMyXj+LX0IBE4h9spLNvg
 Lr5T8ekEBnAiyzFrm+gmDQCp9q4t05hmnpo5n17d6jllTk0Yccjr7FQlSlyMiwym5Is2
 t+yg==
X-Gm-Message-State: AOAM533W0AkN4cE5tciQQCnrXLtMHY1oyYdXtbzj1g31Vofbj3b1UWBj
 yex7LF8KIUGUhCavivrW6HM=
X-Google-Smtp-Source: ABdhPJzvs4BBlCWfSZM8VzsxirhFZAvML4PoHOERkE3JQ6Y6MneWn3xVBW9ppqUaRNxNv3pMiTmL9Q==
X-Received: by 2002:a05:620a:13cc:: with SMTP id
 g12mr7883673qkl.277.1630498994551; 
 Wed, 01 Sep 2021 05:23:14 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id o4sm12722114qti.24.2021.09.01.05.23.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Sep 2021 05:23:14 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <d4343e2-cfd6-347f-d265-56cac2492643@eik.bme.hu>
Date: Wed, 1 Sep 2021 08:23:12 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <50CE0E53-CD58-4D1C-82A2-02239E7492EB@gmail.com>
References: <20210827181429.23609-1-programmingkidx@gmail.com>
 <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
 <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
 <8ED650E0-5874-4AE6-85E3-631E7B76D37A@gmail.com>
 <CAFEAcA96V6d-aAR65xiZQrB65aTfQEJfHq5x_ZSa3mpAoSUMQw@mail.gmail.com>
 <269a250-93ec-2e6-8813-5b65aa9fb76@eik.bme.hu>
 <9E32E4A0-D1BB-4DDF-8F57-38BD5044DF1D@gmail.com>
 <91bc8dea-deb6-193e-326d-7a6467fa1214@eik.bme.hu>
 <3FAD6D5D-E8E1-40AB-BAE8-0D92F6F4A171@gmail.com>
 <d4343e2-cfd6-347f-d265-56cac2492643@eik.bme.hu>
To: BALATON Zoltan <balaton@eik.bme.hu>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x730.google.com
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



> On Sep 1, 2021, at 5:08 AM, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>=20
> On Tue, 31 Aug 2021, Programmingkid wrote:
>> I just realized, I sent a patch to the developer list that fixes the =
missing qemu_vga.ndrv problem, but I do not know which maintainer to =
send it to. Who maintains the configure script? A search of the =
maintainers page was not clear as to who this is.
>=20
> That's what the get_maintainer script is for, try
> scripts/get_maintainer.pl -f configure
> Interestingly there's no maintainer listed for configure, in that case =
probably pick the contributor with highest percentage and since it's a =
very simple patch you can also cc qemu-trivial list. See:
> https://wiki.qemu.org/Contribute/SubmitAPatch
> where all this should be explained.
>=20
> Regards,
> BALATON Zoltan

Thank you for the advice. I have sent the patch to the trivial list and =
its maintainers.=

