Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565565E6942
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:11:40 +0200 (CEST)
Received: from localhost ([::1]:33250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPje-0006ln-UH
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1obP3r-00037t-Up; Thu, 22 Sep 2022 12:28:28 -0400
Received: from mailgw.felk.cvut.cz ([147.32.82.15]:60726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1obP3W-00076T-Ij; Thu, 22 Sep 2022 12:28:10 -0400
Received: from mailgw.felk.cvut.cz (localhost.localdomain [127.0.0.1])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTP id 218A630B295D;
 Thu, 22 Sep 2022 18:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 cmp.felk.cvut.cz; h=cc:cc:content-transfer-encoding:content-type
 :content-type:date:from:from:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=felkmail; bh=ytavG
 Ik2vUrDag3f1RUiXx3JEyloTlyJk99yARd8hXU=; b=qUgPQJxBI9wgFGAxtmTew
 8yS0uJaHY4wRjEGYgrFeLGMW2B2S/GjNuSX2vBo1eAkluQkcj6vGwZPrhD5ac8IU
 EwRFcl5vHIDwoEB7Km28X18CzQx1VslNcK2rL4wJdelcXTOaaBcmvY6jeg7Xmb56
 0hCP04v5jwwxeaEhPWPkrgS3qmnseuyeNzwmiq9FFFmVBG5a2/d2H8wZyBM5T23t
 ZUDzC+v2SWnYtEnLXtlzvmrPj6SR9uE9QqaYf7qbp4vlzzV7lPPwyx2zPiV3Swdd
 8xou46VAEGWbzxRgrUDNS6KGRz+4La9HEZnqqeBB9O9f81OHEj7C/Cqz11KVg5gB
 A==
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTPS id B5EB730AE005;
 Thu, 22 Sep 2022 18:27:21 +0200 (CEST)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 28MGRLg9011775; Thu, 22 Sep 2022 18:27:21 +0200
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 28MGRLnw011774;
 Thu, 22 Sep 2022 18:27:21 +0200
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [QEMU][PATCH 2/5] hw/net/can: Introduce Xilinx Versal CANFD
 controller
Date: Thu, 22 Sep 2022 18:27:09 +0200
User-Agent: KMail/1.9.10
Cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org,
 edgar.iglesias@amd.com, francisco.iglesias@amd.com,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
References: <20220910061252.2614-1-vikram.garhwal@amd.com>
 <20220910061252.2614-2-vikram.garhwal@amd.com>
 <CAFEAcA9=O6yPo9RdFWgq6eJZ=7vX4bQFuaoV6y+JCoM-=+TSTg@mail.gmail.com>
In-Reply-To: <CAFEAcA9=O6yPo9RdFWgq6eJZ=7vX4bQFuaoV6y+JCoM-=+TSTg@mail.gmail.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202209221827.09886.pisa@cmp.felk.cvut.cz>
Received-SPF: none client-ip=147.32.82.15; envelope-from=pisa@cmp.felk.cvut.cz;
 helo=mailgw.felk.cvut.cz
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, NICE_REPLY_A=-1.893, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

thanks for the review and Vikram for his work, I do not know
much about Xilinx emulation nor Xilixn CAN controllers so I cannot
comment much on this part.

On Thursday 22 of September 2022 16:46:48 Peter Maydell wrote:
> On Sat, 10 Sept 2022 at 07:13, Vikram Garhwal <vikram.garhwal@amd.com> > > To create virtual CAN on the host machine, please check the QEMU CAN
> > docs: https://github.com/qemu/qemu/blob/master/docs/can.txt
>
> That link is a 404. You could just give the relative path to the
> docs in the repo, which is docs/system/devices/can.rst

The actual generated documentation is located at

  https://www.qemu.org/docs/master/system/devices/can.html

I think that that URL is stable for some time... Could it
be used directly in source to provide path to formated version?

> For the machine specifics, you should include (either in the patch 4
> where you add this to the xlnx-versal-virt board, or in a separate patch
> if it seems too big) updates to docs/system/arm/xlnx-versal-virt.rst
> which document the new functionality, including, if it's useful to users,
> some documentation of how to use it.

Some short example how to use emulation even with Xilinx Zynq and Ultra Scale
would be nice if added into the document. If the document length expands
too much, then probably division into individual documents per controllers
would be nice.

By the way, CAN in Automation publishes our overview article about our CAN
activities including some short netion of QEMU integration

  https://can-newsletter.org/uploads/media/raw/a9abe317ae034be55d99fee4410ad70e.pdf   

I hope I wind some time for CAN in QEMU, RTEMS and Linux ongoing projects,
but I need to finish some promissed project for ESA the first.

Best wishes,

                Pavel
-- 
                Pavel Pisa
    phone:      +420 603531357
    e-mail:     pisa@cmp.felk.cvut.cz
    Department of Control Engineering FEE CVUT
    Karlovo namesti 13, 121 35, Prague 2
    university: http://control.fel.cvut.cz/
    personal:   http://cmp.felk.cvut.cz/~pisa
    projects:   https://www.openhub.net/accounts/ppisa
    CAN related:http://canbus.pages.fel.cvut.cz/
    RISC-V education: https://comparch.edu.cvut.cz/
    Open Technologies Research Education and Exchange Services
    https://gitlab.fel.cvut.cz/otrees/org/-/wikis/home


