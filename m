Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CA822E5E0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 08:29:14 +0200 (CEST)
Received: from localhost ([::1]:60702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzwdM-0008Iq-VM
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 02:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jzwcd-0007fM-Jd; Mon, 27 Jul 2020 02:28:27 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:38827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jzwca-00042Y-O4; Mon, 27 Jul 2020 02:28:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BFVHQ4j1Lz9sRN; Mon, 27 Jul 2020 16:28:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1595831298;
 bh=FHMwJLw5r5AN3faDOZu7NVcPluA7piWRdGC3HvAX0k0=;
 h=From:To:Cc:Subject:Date:From;
 b=RDR19fQ5wExRFVvE7DODrtYOdUtCr6vVNHS70AIqWvI/88hEM/bmIU76qjY4madYv
 gmaLA2P4fEUmU4mvkEfiwKymwJApvw5WmYjU7AhwLwo9AkHepGj6tBP9l3pRTe3f60
 +r/W8828JsYI085jsRftpq1Wj3ric8H9/7yx//E0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 0/1] ppc-for-5.1 queue 20200727
Date: Mon, 27 Jul 2020 16:28:13 +1000
Message-Id: <20200727062814.179163-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 194f8ca825854abef3aceca1ed7eb5a53b08751f:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20200725' into staging (2020-07-26 17:17:58 +0100)

are available in the Git repository at:

  git://github.com/dgibson/qemu.git tags/ppc-for-5.1-20200727

for you to fetch changes up to aef92d87c59d257c0ff24ba1dc82506a03f1f522:

  pseries: fix kvmppc_set_fwnmi() (2020-07-27 11:09:25 +1000)

----------------------------------------------------------------
ppc patch queue 2020-07-27

Only one patch in this batch, but it fixes a fairly important
regression, so we want it in qemu-5.1

----------------------------------------------------------------
Laurent Vivier (1):
      pseries: fix kvmppc_set_fwnmi()

 hw/ppc/spapr_rtas.c  | 2 +-
 target/ppc/kvm.c     | 3 +--
 target/ppc/kvm_ppc.h | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

