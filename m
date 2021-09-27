Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B09418E7E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 06:53:08 +0200 (CEST)
Received: from localhost ([::1]:56906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUidX-0003UN-Ik
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 00:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYt-0000Cr-VF; Mon, 27 Sep 2021 00:48:19 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYq-00008k-1j; Mon, 27 Sep 2021 00:48:19 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HHqrq0nNfz4xbZ; Mon, 27 Sep 2021 14:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632718091;
 bh=bccwpAUGq69vpHG6gbZORgRVzim6IxWJTMlfyrXZbng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k+G53lHfECMKakEouKwkCqpbkEOg/c+L0p+1qOJL+Sub6JzfvCfvgIKOAFiqxCtMx
 XfVX2N/MJ25Zea6jsVA06Yt+Jam7plcQmdIyAlIHDbCrP5vVxGOzW2wa+9dddVT+Qt
 tBSDPeIuclT+EXHSlGuByFcnueXkegANYqWkr3aI=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 2/7] MAINTAINERS: Remove machine specific files from ppc
 TCG CPUs entry
Date: Mon, 27 Sep 2021 14:48:03 +1000
Message-Id: <20210927044808.73391-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927044808.73391-1-david@gibson.dropbear.id.au>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 mark.cave-ayland@ilande.co.uk, groug@kaod.org, wainersm@redhat.com,
 hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, philmd@redhat.com,
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
index 53b318053c..e51bab91bd 100644
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


