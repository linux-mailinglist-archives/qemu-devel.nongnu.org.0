Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5814622A5
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 21:58:20 +0100 (CET)
Received: from localhost ([::1]:53978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrnj9-0005fd-SU
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 15:58:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mrneZ-0002wo-CY
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:53:35 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:52347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mrneW-0006XX-OL
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:53:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3DFCD21347;
 Mon, 29 Nov 2021 20:53:30 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 29 Nov
 2021 21:53:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002c75f1d59-eaf2-450c-abe9-d1204c30b2d4,
 5832CB413B33430C7B7B1B9ECA0BD44D35E8DE25) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.15
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 0/1] ppc queue
Date: Mon, 29 Nov 2021 21:53:26 +0100
Message-ID: <20211129205327.489558-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 151214ad-d6ef-4c88-a069-408f7cb97103
X-Ovh-Tracer-Id: 4452089708033706915
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgddugedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedtieekkeelgfduvdeijeeujefhheefjedtleegtdehteejteduuddtjeefjeeknecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a0fd8a5492240379a07c0b39c8dae3b8341b458f:

  Merge tag 'pull-for-6.2-291121-1' of https://github.com/stsquad/qemu into staging (2021-11-29 18:58:06 +0100)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-ppc-20211129

for you to fetch changes up to 7bf00dfb51566070960e0b7977e41abba96c130e:

  target/ppc: fix Hash64 MMU update of PTE bit R (2021-11-29 21:00:08 +0100)

----------------------------------------------------------------
ppc 6.2 queue:

* Hash64 MMU fix for FreeBSD installer

----------------------------------------------------------------
Leandro Lupori (1):
      target/ppc: fix Hash64 MMU update of PTE bit R

 target/ppc/mmu-hash64.h | 5 +++++
 hw/ppc/spapr.c          | 8 ++++----
 hw/ppc/spapr_softmmu.c  | 2 +-
 target/ppc/mmu-hash64.c | 4 ++--
 4 files changed, 12 insertions(+), 7 deletions(-)

