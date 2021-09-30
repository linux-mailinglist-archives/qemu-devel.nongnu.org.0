Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2375141D316
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:12:48 +0200 (CEST)
Received: from localhost ([::1]:55342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpJG-00050w-2B
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVotB-0002Uj-6j; Thu, 30 Sep 2021 01:45:49 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVot9-00048B-Ek; Thu, 30 Sep 2021 01:45:48 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR49Y8z4xc8; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=zpoGl4ZOsubjpwlXExoZXFfbNEPNU4OilVjT8S7sKuM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ie8ffuq3YRQPUuJaFnJISpAO8nNE5/8RJDTvrR+ggjt1KcQtJzb3b8NjC8MYJly9m
 OvLoLz1/ZUwF1ppmZiNWRS86ULmIaPlO76K7MLnAj/6KaMXTf6XzdF2HeUHM1P69CJ
 Ih9oWxdpTUORihOvq40uygUVVXOygWX+bz2fzu+s=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 39/44] MAINTAINERS: Remove machine specific files from ppc TCG
 CPUs entry
Date: Thu, 30 Sep 2021 15:44:21 +1000
Message-Id: <20210930054426.357344-40-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the PowerPC TCG CPUs entry in MAINTAINERS lists all of hw/ppc/
and include/hw/ppc.  Nearly all the files in those places are related to
specific ppc machine types, rather than to the actual CPUs however.  Those
machine types list their own files separately, often overlapping with this.
For greater clarity, remove these misleading entries from the TCG CPUs
stanza, leaving just hw/ppc/ppc.c and hw/ppc/ppc_booke.c which are the only
ones common to a wide range of PPC TCG cpus each.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf1fc5b21e..b57a4c733b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -271,8 +271,9 @@ M: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: target/ppc/
-F: hw/ppc/
-F: include/hw/ppc/
+F: hw/ppc/ppc.c
+F: hw/ppc/ppc_booke.c
+F: include/hw/ppc/ppc.h
 F: disas/ppc.c
 
 RISC-V TCG CPUs
-- 
2.31.1


