Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5348058A13C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 21:29:09 +0200 (CEST)
Received: from localhost ([::1]:56082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJgWq-0007Se-BF
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 15:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJgQZ-0006UF-Ok; Thu, 04 Aug 2022 15:22:40 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:37617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJgQJ-0002ht-A2; Thu, 04 Aug 2022 15:22:39 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MbRwP-1niguO3uun-00bokS; Thu, 04
 Aug 2022 21:22:18 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/5] Trivial branch for 7.1 patches
Date: Thu,  4 Aug 2022 21:22:11 +0200
Message-Id: <20220804192216.1958922-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vS8JngDuQTLLbfZS+yfYrz31zqLTxOuLMsdN1ZoY+/YYLd2+Tzw
 /8vWWO4LVObysUy31owHZkS3xj7itdunrPec4FriFW3KK3yS489AEYVr4HFkoYVOeeqx8Wi
 aovgK6YL9cynC9aQ0mO8ceBSZAvzusxVxL3r2NobVvy+uWajRZDL1aZYNjvLJrpb4Q1gJRX
 wFG+vquxirBj2isF2BqJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DKBo9ftZiUw=:WrCfP+hKYLSKpN/r60sc8u
 BkfIVUMCZQUMUYBxc2x+DCEPkXm0F8JFTrutJBNdM8c2yj4z5nJHkRau3DsYSocslrgjwsMBn
 5uUU3CZ+FUErcoDlF0oCBOne9qMtPPpSbWuoSyEAgJODANO9svuHaA+GdObMmEceJpBIuzM94
 /UudXyBO4SZW+eFn9Gg0EgSH61NBfJgmYlSICN5WhEvdChcx/+oKmK1Y4wTrPLi5ejeAlmyMo
 CidVL2aJemmM3qjQMdDhO+LybQrc3wPebRE8sOuKVusmZg1mFf0gh26mxI2GzM6YhYdXUkImw
 T0cssWaIB9C8SpyEw3lluo90oVKeBZpUFYrSlxXhBIzh7mdfJzwsa8NEk2chIvdeoqHoNYdIP
 s9lJI7TTcGD6/qYWkm1wM+d9Wm31MWnXv1L8ZbFhvWIfx3KsL0IlYTfQz80gSh0riWD97IPeO
 uczzMgEpdAG2kJ2TcgRQhOTu0o2hmRzvUur6pHt3/hF4U5tLfXOTn2Wd9UGVb926nN9CQ+XQo
 hpppFoYSDDAMzR3X145pisrMhks+1th5Gf3ipwWwu9jJawYGjd9qMdC64688pMWPY87LOa4Hq
 jT9EBH483DrlltuRzH7P/7cIwNCyS+KhCGEVi3tn3Oeqb/xles5MS8iQTDm6YUqK5lmLdgAJT
 0KKTcpYNk7MLPiDsVHAwhEqRvtNAR494sBYElzQWfVY30Ul0VMzgsPa+Emlsl9hWsiC5d/f62
 pQWEc0vSpjXSJh9ceba6nqijd+kn1/l6bvOKlA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 2480f3bbd03814b0651a1f74959f5c6631ee5819:

  Merge tag 'linux-user-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-03 08:32:44 -0700)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.1-pull-request

for you to fetch changes up to 21d4e557e2fd0cb7f10b632b35f51146a1b6d892:

  include/qemu/host-utils.h: Simplify the compiler check in mulu128() (2022-08-04 13:49:47 +0200)

----------------------------------------------------------------
Pull request trivial branch 20220804

----------------------------------------------------------------

Cornelia Huck (1):
  README.rst: fix link formatting

Eugenio Pérez (1):
  vdpa: Fix file descriptor leak on get features error

Thomas Huth (2):
  docs/about/removed-features: Move the -soundhw into the right section
  include/qemu/host-utils.h: Simplify the compiler check in mulu128()

Yonggang Luo (1):
  ppc: Remove redundant macro MSR_BOOK3S_MASK.

 README.rst                      |  4 ++--
 docs/about/removed-features.rst | 14 +++++++-------
 include/qemu/host-utils.h       |  3 +--
 net/vhost-vdpa.c                |  4 ++--
 target/ppc/excp_helper.c        |  1 -
 5 files changed, 12 insertions(+), 14 deletions(-)

-- 
2.37.1


