Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575F13FD636
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:09:41 +0200 (CEST)
Received: from localhost ([::1]:55048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLMFY-0004nL-E5
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mLMEm-00042H-RJ; Wed, 01 Sep 2021 05:08:52 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:19430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mLMEk-0005zd-6w; Wed, 01 Sep 2021 05:08:52 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 62896749693;
 Wed,  1 Sep 2021 11:08:47 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3A1EC749697; Wed,  1 Sep 2021 11:08:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 383C3749624;
 Wed,  1 Sep 2021 11:08:47 +0200 (CEST)
Date: Wed, 1 Sep 2021 11:08:47 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
In-Reply-To: <3FAD6D5D-E8E1-40AB-BAE8-0D92F6F4A171@gmail.com>
Message-ID: <d4343e2-cfd6-347f-d265-56cac2492643@eik.bme.hu>
References: <20210827181429.23609-1-programmingkidx@gmail.com>
 <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
 <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
 <8ED650E0-5874-4AE6-85E3-631E7B76D37A@gmail.com>
 <CAFEAcA96V6d-aAR65xiZQrB65aTfQEJfHq5x_ZSa3mpAoSUMQw@mail.gmail.com>
 <269a250-93ec-2e6-8813-5b65aa9fb76@eik.bme.hu>
 <9E32E4A0-D1BB-4DDF-8F57-38BD5044DF1D@gmail.com>
 <91bc8dea-deb6-193e-326d-7a6467fa1214@eik.bme.hu>
 <3FAD6D5D-E8E1-40AB-BAE8-0D92F6F4A171@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 31 Aug 2021, Programmingkid wrote:
> I just realized, I sent a patch to the developer list that fixes the 
> missing qemu_vga.ndrv problem, but I do not know which maintainer to 
> send it to. Who maintains the configure script? A search of the 
> maintainers page was not clear as to who this is.

That's what the get_maintainer script is for, try
scripts/get_maintainer.pl -f configure
Interestingly there's no maintainer listed for configure, in that case 
probably pick the contributor with highest percentage and since it's a 
very simple patch you can also cc qemu-trivial list. See:
https://wiki.qemu.org/Contribute/SubmitAPatch
where all this should be explained.

Regards,
BALATON Zoltan

