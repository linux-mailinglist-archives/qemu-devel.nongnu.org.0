Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1B053681D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:33:13 +0200 (CEST)
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugdz-0001re-SV
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1nufWH-00045E-Iy
 for qemu-devel@nongnu.org; Fri, 27 May 2022 15:21:09 -0400
Received: from mailgw.felk.cvut.cz ([147.32.82.15]:60702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1nufWC-0005W9-9e
 for qemu-devel@nongnu.org; Fri, 27 May 2022 15:21:09 -0400
Received: from mailgw.felk.cvut.cz (localhost.localdomain [127.0.0.1])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTP id B368030ADE7F;
 Fri, 27 May 2022 21:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 cmp.felk.cvut.cz; h=cc:cc:content-transfer-encoding:content-type
 :content-type:date:from:from:message-id:mime-version:reply-to
 :subject:subject:to:to; s=felkmail; bh=h9Y0cvZI4+RvSjcessw6yfJWn
 cjIYvn6+xbYSZuUMAM=; b=keaGHQRdU3Ab4Z46PG9ZfypovLrGBziw7G149WcMj
 ZiFMT9lSvHzPKK7Bo1LRghx5me2J25QLRw7CjRcK95LJ8wZgPBgFoaLMPxsYQ1PX
 6LvgZekmQmEwnUUb45D2GMvPWb6O1QnodtIHAZ5ke7Ew4jHobV2y1Y+51NhD2A8O
 bpuWc4gvc17k6r9gWI43oJq0LyzjT18pRgvgKQOHZWhQrRjCr0a9YBvw2bzBDkAW
 2K1OnQx3Y44o/bg3KpbbSBClOLrvwR+B0eWjzyydCM8jvKuY6w7Jr2A/IsOBauzu
 07YswXd+BiD04A3ty3He7w9fJTudFRl/I1AiS3wxpJs8w==
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTPS id E78B230ADE46;
 Fri, 27 May 2022 21:19:47 +0200 (CEST)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 24RJJl7H002542; Fri, 27 May 2022 21:19:47 +0200
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 24RJJkwK002541;
 Fri, 27 May 2022 21:19:46 +0200
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: linux-can@vger.kernel.org, qemu-devel@nongnu.org,
 Marin Jerabek <martin.jerabek01@gmail.com>,
 Ondrej Ille <ondrej.ille@gmail.com>, Jiri Novak <jnovak@fel.cvut.cz>,
 Jaroslav Beran <jara.beran@gmail.com>,
 Petr Porazil <porazil@pikron.com>, Pavel Machek <pavel@ucw.cz>,
 Drew Fustini <pdp7pdp7@gmail.com>
Date: Fri, 27 May 2022 21:19:46 +0200
User-Agent: KMail/1.9.10
Cc: "Marc Kleine-Budde" <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>, Carsten Emde <c.emde@osadl.org>,
 Matej Vasilevski <matej.vasilevski@gmail.com>,
 Jan =?utf-8?q?Charv=C3=A1t?= <jancharvat.charvat@gmail.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Andrew Dennison <andrew.dennison@motec.com.au>,
 Reiner Zitzmann <zitzmann@can-cia.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: CTU CAN FD IP core SocketCAN driver - success with mainine Linux
 kernel and mainline QEMU builds
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <202205272119.46182.pisa@cmp.felk.cvut.cz>
Received-SPF: none client-ip=147.32.82.15; envelope-from=pisa@cmp.felk.cvut.cz;
 helo=mailgw.felk.cvut.cz
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello everybody,

I want to report successful build and test of the CTU CAN FD driver
from actual Linux kernel mainline GIT on actual QEMU build from
mainline git. Test on HW from net-next has been repeatedly
run by Matej Vasilevski during his timestamping patches work.

Thanks to all who helped, namely Ondrej Ille for his investment
in the project and rewrite of registers generator to provide
headers files acceptable for mainline, Marc Kleine-Budde
for review, integration and cleanup and together with
Pavel Machek to provide valuable feeback what is not acceptable.

I hope that we will be ready with with timestamping patches
cleanup for 5.20 merge windows as well as with support
for HDL sources parameterizable number of Tx buffres.

In the long term, I consider to use mechanism of software
virtual FIFO to implement multiqueue Tx support which
is in the fact needed in all serious CAN applications
to prevent bus level priority inversion.

We plan to visit and present on the Embedded World
in Nuremberg, so I would be happy to meet you there.
I hope that Carsten Emde and OSADL will pass over
information where we are available.

Program for Tuesday afternoon is given already
Talk QtRvSim =E2=80=93 RISC-V Simulator for Computer Architectures
Classes, June 21, 2022 Session 10.3 =E2=80=93 System-on-Chip (SoC)
Design RISC-V Development (16:00 - 16:30) at Embedded World
Conference. Our toy there https://github.com/cvut/qtrvsim

Best wishes,

                Pavel Pisa
    phone:      +420 603531357
    e-mail:     pisa@cmp.felk.cvut.cz
    Department of Control Engineering FEE CVUT
    Karlovo namesti 13, 121 35, Prague 2
    university: http://control.fel.cvut.cz/
    personal:   http://cmp.felk.cvut.cz/~pisa
    projects:   https://www.openhub.net/accounts/ppisa
    CAN related:http://canbus.pages.fel.cvut.cz/
    Open Technologies Research Education and Exchange Services
    https://gitlab.fel.cvut.cz/otrees/org/-/wikis/home


