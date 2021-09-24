Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7589417033
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:19:18 +0200 (CEST)
Received: from localhost ([::1]:38840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTiIX-0005mK-P5
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mThvz-00007j-3N; Fri, 24 Sep 2021 05:55:59 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:51189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mThvx-0003Tz-7Z; Fri, 24 Sep 2021 05:55:58 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HG6pz1nfhz4xbR; Fri, 24 Sep 2021 19:55:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632477339;
 bh=Q/D0dn/QZi1yQEkazIOxAV1MoaDq5WpsIXbFbi3vBtk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YjIlgUtyGtXk9NEd0/iBGXs7qi6wP9Sfuz0/K/aqVI88bX4/IDyJ6HgCBogC/z+qu
 pHwJsGndO5OCsZ3FKIQfyMOrUgErs7Jgnc2G8LHf8XX3g6aNGnYMCFgghi3vV+v5hc
 Ksd6ZVg6Q1C5dDF0qRgZ0RiIekFu2F51xvK+9hM4=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 4/5] MAINTAINERS: Add information for OpenPIC
Date: Fri, 24 Sep 2021 19:55:35 +1000
Message-Id: <20210924095536.441849-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924095536.441849-1-david@gibson.dropbear.id.au>
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, hpussin@reactos.org,
 aik@ozlabs.ru, mark.cave-ayland@ilande.co.uk, groug@kaod.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The OpenPIC interrupt controller was once the de facto standard on ppc
machines.  In qemu it's now only used on some Macintosh and the
Freescale e500 machine.  It has no listed maintainer, and as far as I
know, no-one who's really familiar with it any more.

Since I'm moving away from the area, I no longer have capacity to do even
minimal maintenance of it under the auspices of the ppc targets in general.

Therefore, this patch lists the main part of openpic, and marks it as
"Odd Fixes" to be looked after by Mark Cave-Ayland who handles the
Macintosh targets.  The openpic_kvm variant is only used on e500, so
add it to the files for that machine type (itself already Orphaned).

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c82a634a70..937c191c8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1256,6 +1256,8 @@ F: hw/pci-host/ppce500.c
 F: include/hw/ppc/ppc_e500.h
 F: include/hw/pci-host/ppce500.h
 F: pc-bios/u-boot.e500
+F: hw/intc/openpic_kvm.h
+F: include/hw/ppc/openpic_kvm.h
 
 mpc8544ds
 L: qemu-ppc@nongnu.org
@@ -2255,6 +2257,12 @@ F: net/can/*
 F: hw/net/can/*
 F: include/net/can_*.h
 
+OpenPIC interrupt controller
+M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
+S: Odd Fixes
+F: hw/intc/openpic.c
+F: include/hw/ppc/openpic.h
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.31.1


