Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2B937A5C2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:29:52 +0200 (CEST)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQaF-00049P-5n
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lgQZ2-0003FZ-AF; Tue, 11 May 2021 07:28:36 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:59159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lgQYy-0004Hc-GU; Tue, 11 May 2021 07:28:35 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7529D74570D;
 Tue, 11 May 2021 13:28:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 50186745709; Tue, 11 May 2021 13:28:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4E7897456E3;
 Tue, 11 May 2021 13:28:27 +0200 (CEST)
Date: Tue, 11 May 2021 13:28:27 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 0/6] hw/southbridge: QOM'ify vt82c686 as
 VT82C686B_SOUTHBRIDGE
In-Reply-To: <20210511041848.2743312-1-f4bug@amsat.org>
Message-ID: <ecdd9299-ec2-5049-fe1e-d3c7d261d@eik.bme.hu>
References: <20210511041848.2743312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-51727942-1620732507=:99606"
X-Spam-Probability: 9%
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-51727942-1620732507=:99606
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 11 May 2021, Philippe Mathieu-Daudé wrote:
> The motivation behind this series is to remove the
> isa_get_irq(NULL) call to simplify the ISA generic model.
>
> Since v1:
> - rebased on top of remotes/dg-gitlab/tags/ppc-for-6.1-20210504

I'll try to have a look at these later but some notes: The pegasos2 
changes are now in master so if this was before that maybe rebasing on 
master is now enough. However I wonder if any changes to pegasos2.c is 
needed due to changed init of the chip model or is that only affecting 
82c686b? Please also note that pegasos2 is not enabled by default due to 
needing undistributable firmware ROM so to test it you need to enable it 
in default-configs/devices/ppc-softmmu.mak

Regards,
BALATON Zoltan

> Philippe Mathieu-Daudé (6):
>  hw/isa/vt82c686: Name output IRQ as 'intr'
>  hw/isa/vt82c686: Simplify removing unuseful qemu_allocate_irqs() call
>  hw/isa/vt82c686: Let ISA function expose ISA IRQs
>  hw/ide/via: Replace magic 2 value by ARRAY_SIZE / MAX_IDE_DEVS
>  hw/ide/via: Connect IDE function output IRQs to the ISA function input
>  hw/southbridge/vt82c686: Introduce VT82C686B_SOUTHBRIDGE
>
> hw/ide/via.c               |  31 ++++++++---
> hw/isa/vt82c686.c          |  27 +++++-----
> hw/mips/fuloong2e.c        |  35 +++---------
> hw/southbridge/vt82c686.c  | 107 +++++++++++++++++++++++++++++++++++++
> MAINTAINERS                |   1 +
> hw/Kconfig                 |   1 +
> hw/isa/Kconfig             |   9 ----
> hw/meson.build             |   1 +
> hw/southbridge/Kconfig     |   8 +++
> hw/southbridge/meson.build |   1 +
> 10 files changed, 164 insertions(+), 57 deletions(-)
> create mode 100644 hw/southbridge/vt82c686.c
> create mode 100644 hw/southbridge/Kconfig
> create mode 100644 hw/southbridge/meson.build
>
> --
> 2.26.3
>
>
>
--3866299591-51727942-1620732507=:99606--

