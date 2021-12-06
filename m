Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08C7469403
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:40:13 +0100 (CET)
Received: from localhost ([::1]:35774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBPo-00043x-F5
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:40:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNA-0001Bk-8q
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:29 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:60457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBN7-0001mq-9h
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 31BBF20AE0;
 Mon,  6 Dec 2021 10:37:14 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 11:37:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0016746f085-f9a9-483b-ba9c-aa4f4d70cdc9,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 00/15] ppc/ppc405: decade cleanup
Date: Mon, 6 Dec 2021 11:36:57 +0100
Message-ID: <20211206103712.1866296-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a2f5b4f3-fe33-4851-b2e7-fecf0b9f62db
X-Ovh-Tracer-Id: 16706665769931803500
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedttdelvdehuedtvdfggeeggedvkeffieevtddukefgudelhfejueeufeejffffffenucffohhmrghinhepghhithhlrggsrdgtohhmpdhoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

The goal of these changes is to refresh the QEMU ref405ep machine and
enable boot from a Linux kernel without relying on a U-Boot firmware.
The reason for doing so is that we are unable to find a "ppc405_rom.bin"
firmware image or a flash image for the 405EP machines.

Thomas fought is way through on a v2015.10 U-Boot and taihu defconfig
and provided a compatible image available here :

 https://gitlab.com/huth/u-boot/-/tree/taihu/

With this image, QEMU reaches the U-Boot prompt (with a simple
workaround in the SDRAM).

On the Linux side, the only available 405EP CPU board is the one for
the ESTeem 195E (PPC405EP) SBC (hotfoot). It was added in 2009. The
board information structure in Linux, in U-Boot and in QEMU are not in
sync and the hotfoot board also adds its own flavor because the FW was
an ancient U-Boot without dual ethernet support [1].

For this kernel to be loaded by the U-Boot image provided by Thomas,
we either need to modify U-Boot or Linux. The same question arise for
QEMU, see the last patch of this series which is controversial. Please
advise !

Thanks,

C.

[1] https://lists.ozlabs.org/pipermail/linuxppc-dev/2009-July/074487.html

Cédric Le Goater (14):
  ppc/ppc405: Change kernel load address
  ppc: Add trace-events for DCR accesses
  ppc/ppc405: Convert printfs to trace-events
  ppc/ppc405: Drop flag parameter in ppc405_set_bootinfo()
  ppc/ppc405: Change ppc405ep_init() return value
  ppc/ppc405: Add some address space definitions
  ppc/ppc405: Remove flash support
  ppc/ppc405: Rework FW load
  ppc/ppc405: Introduce ppc405_set_default_bootinfo()
  ppc/ppc405: Fix boot from kernel
  ppc/ppc405: Change default PLL values at reset
  ppc/ppc405: Fix bi_pci_enetaddr2 field in U-Boot board information
  ppc/ppc405: Add update of bi_procfreq field
  ppc/ppc405: Update U-Boot board information for hotfoot

Thomas Huth (1):
  ppc: Mark the 'taihu' machine as deprecated

 docs/about/deprecated.rst |   9 ++
 hw/ppc/ppc405.h           |  14 +-
 hw/ppc/ppc.c              |   2 +
 hw/ppc/ppc405_boards.c    | 245 ++++++++++++++++++----------------
 hw/ppc/ppc405_uc.c        | 270 +++++++++++++++++++++-----------------
 hw/ppc/trace-events       |  23 ++++
 6 files changed, 327 insertions(+), 236 deletions(-)

-- 
2.31.1


