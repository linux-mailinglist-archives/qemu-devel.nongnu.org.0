Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8D54F174E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 16:41:49 +0200 (CEST)
Received: from localhost ([::1]:35928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbNtq-0008Ae-Nz
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 10:41:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nbNqZ-0005kl-Ee
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 10:38:23 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:39671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nbNqW-0006cb-FA
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 10:38:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.66])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EB099F31DA64;
 Mon,  4 Apr 2022 16:38:17 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 4 Apr
 2022 16:38:17 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001ac6b0702-cda4-4f70-a50e-945bdc4f3aed,
 193BEDB8EED17CFBFC1316EE01F9191BF107EB6B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 0/3] ppc queue
Date: Mon, 4 Apr 2022 16:38:10 +0200
Message-ID: <20220404143813.673262-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 76c35ea9-4595-4bcc-b78d-a0dacfd6e0a6
X-Ovh-Tracer-Id: 205195261372500960
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejvddgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfffuefffeegudduheevgfeludevvdejieetjedvffduuefhteejvdegieetgedvnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bc6ec396d471d9e4aae7e2ff8b72e11da9a97665:

  Merge tag 'pull-request-2022-04-01' of https://gitlab.com/thuth/qemu into staging (2022-04-02 09:36:07 +0100)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-ppc-20220404

for you to fetch changes up to 0798da8df9fd917515c957ae918d6d979cf5f3fb:

  linux-user/ppc: Narrow type of ccr in save_user_regs (2022-04-04 08:49:06 +0200)

----------------------------------------------------------------
ppc-7.0 queue:

* Coverity fixes
* Fix for a memory leak issue

----------------------------------------------------------------
Daniel Henrique Barboza (1):
      hw/ppc: free env->tb_env in spapr_unrealize_vcpu()

Frederic Barrat (1):
      ppc/pnv: Fix number of registers in the PCIe controller on POWER9

Richard Henderson (1):
      linux-user/ppc: Narrow type of ccr in save_user_regs

 include/hw/pci-host/pnv_phb4.h | 2 +-
 include/hw/ppc/ppc.h           | 1 +
 hw/ppc/ppc.c                   | 7 +++++++
 hw/ppc/spapr_cpu_core.c        | 3 +++
 linux-user/ppc/signal.c        | 2 +-
 5 files changed, 13 insertions(+), 2 deletions(-)

