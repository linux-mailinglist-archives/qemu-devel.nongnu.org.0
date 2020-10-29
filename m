Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B34529E4E5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 08:49:46 +0100 (CET)
Received: from localhost ([::1]:49038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY2gr-0001WA-2q
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 03:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kY2e2-0000A5-CW
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 03:46:50 -0400
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:21489)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kY2dz-0000Zc-Ll
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 03:46:49 -0400
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 09T7jgaN047389;
 Thu, 29 Oct 2020 08:45:42 +0100 (CET)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 09T7jgw6016938; Thu, 29 Oct 2020 08:45:42 +0100
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 09T7jfYY016937;
 Thu, 29 Oct 2020 08:45:41 +0100
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Romeo Sansaet <romeosansaet@gmail.com>
Subject: Re: [Q&A] QEMU CAN Controller Emulation with Connection to a Host
 System CAN Bus
Date: Thu, 29 Oct 2020 08:45:41 +0100
User-Agent: KMail/1.9.10
References: <CAJPbEzY5_dCZ9=MTMcXZMSKGdckUnSM=JR0fdfU9vARShdU_SQ@mail.gmail.com>
In-Reply-To: <CAJPbEzY5_dCZ9=MTMcXZMSKGdckUnSM=JR0fdfU9vARShdU_SQ@mail.gmail.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202010290845.41203.pisa@cmp.felk.cvut.cz>
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 09T7jgaN047389
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-1.018, required 6, autolearn=not spam, BAYES_00 -0.50,
 KHOP_HELO_FCRDNS 0.40, NICE_REPLY_A -0.92, SPF_HELO_NONE 0.00,
 SPF_NONE 0.00, URIBL_BLOCKED 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1604562345.71943@fkbee++Ifii8rOC+ueKHog
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 03:46:42
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.921,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Michal Sojka <michal.sojka@cvut.cz>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear Romeo,

On Thursday 29 of October 2020 08:02:08 Romeo Sansaet wrote:
> I would like to ask a few questions regarding your project "QEMU CAN
> Controller Emulation with Connection to a Host System CAN Bus."
>
> Is this project limited to Kvaser PCI only?
> Can I use another PCI instead of Kvaser? If yes, can you give me some main
> points on how I can achieve this?
>
> I am new to this concept and I would really appreciate your answers.
> Reference:
> http://rtime.felk.cvut.cz/publications/public/rtlws2015-qemu-can.pdf

The project is now mainlined in QEMU. Documentation there

https://git.qemu.org/?p=qemu.git;a=blob;f=docs/can.txt

as for the RTIME reference, it is dead link and even whole site
from my point of view owned by IIG/IIRC Industrial Research Center now,
I was only one who invested time to the CAN QEMU project there,
found funding (GSoC, Volkswagen, only other member contribution
was review of referenced article by doctor Sojka).
They reference results even after actions to eliminate
my influence to studnets they take. But they people have minimal
knowledge in the area.

So direct your questions to QEMU devel and for our faculty projects
look at

  http://canbus.pages.fel.cvut.cz/

As for the project, actual version supports multiple SJA1000
based PCI cards, actual setup of QEMU parameters differs
from the old presentation and article, complete QEMU
object model has been introduced thanks to help
of Paolo Bonzini and other QEMU core developers.

The Kvaser is good target, because it is supported
by mainline Linux kernel for many years and I have
lot of experience with it, SocketCAN driver is based
on my LinCAN work

  https://elixir.bootlin.com/linux/latest/source/drivers/net/can/sja1000/kvaser_pci.c

Addition of more SJA1000 based PCI cards is relatively easy.
There already PCM-3680I, MIOe-3680 supported.
Addition of platform bus (device tree) based integration
of SJA1000 is for small (ideally funded or some studnet work)
project.

Emulation of another controller is a bigger project. I think
I would find students if there is some funding available.

We have added support for CTU CAN FD core recently.
So it is another alternative, it provides full CAN FD
support in addition and it is model of our fully
open-source/open-hardware CAN FD controller design.
There s well tested driver available even as DKMS.
Unfortunately, it is not supported by mainline Linux kernel
yet, review process takes time and responsible maintainer
have not found time yet so we do our best to update
patches on base of others reviews and friends comments. 

Best wishes,

                Pavel Pisa
    e-mail:     pisa@cmp.felk.cvut.cz
    Department of Control Engineering FEE CVUT
    Karlovo namesti 13, 121 35, Prague 2
    university: http://dce.fel.cvut.cz/
    personal:   http://cmp.felk.cvut.cz/~pisa
    projects:   https://www.openhub.net/accounts/ppisa
    CAN related:http://canbus.pages.fel.cvut.cz/

