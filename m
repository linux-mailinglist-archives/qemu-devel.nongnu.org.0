Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5968445EF8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 05:01:49 +0100 (CET)
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miqQG-0004BT-4X
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 00:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1miqBq-00087S-B7; Thu, 04 Nov 2021 23:46:54 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:57595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1miqBn-0004bf-Ao; Thu, 04 Nov 2021 23:46:53 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Hlmdy0gcgz4xdK; Fri,  5 Nov 2021 14:46:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636084006;
 bh=aHZzyBFHI7MBQGYdJkYN32ArcVLCa8GJchpd//cp/4g=;
 h=From:To:Cc:Subject:Date:From;
 b=cB72vYqgqsXEOmvs8ZlOsdUZuE0jsEXK38mQFoXsd6ojRiLnC7R/v8qOpZgm5v76Y
 Ex4E507WMt43F6jOaOACuRylu38uVBmt+z3ire3Yrf8tfE1tLpkqoKbk3kIsonEE8G
 JFsmzeljtFUpix9+anyAJNdU1GmdWBKfwSydLuvM=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org, clg@kaod.org,
 danielhb413@gmail.com
Subject: [PATCH] target/ppc, hw/ppc: Change maintainers
Date: Fri,  5 Nov 2021 14:46:40 +1100
Message-Id: <20211105034640.53754-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As our day jobs and interests have moved onto other things, Greg and I have
been struggling to keep on top of maintainership of target/ppc and
associated pieces like the pseries and powernv machine types, with their
platform specific devices.

We've therefore discussed and plan to transfer maintainership to Cédric Le
Goater (primary) and Daniel Henrique Barboza (backup).  Cédric and Daniel
have been actively contributing to the area for some time, and they're
supported in this by their current employer, IBM, who has an obvious
interest in the platform.

Greg and I do plan to stay around in some capacity for at least the next
6 months, providing reviews and advice to assist the new maintainers into
the role.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 MAINTAINERS | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 797be5b366..066c4fb2b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -262,8 +262,10 @@ F: hw/openrisc/
 F: tests/tcg/openrisc/
 
 PowerPC TCG CPUs
-M: David Gibson <david@gibson.dropbear.id.au>
-M: Greg Kurz <groug@kaod.org>
+M: Cédric Le Goater <clg@kaod.org>
+M: Daniel Henrique Barboza <danielhb413@gmail.com>
+R: David Gibson <david@gibson.dropbear.id.au>
+R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: target/ppc/
@@ -382,8 +384,10 @@ F: target/mips/kvm*
 F: target/mips/sysemu/
 
 PPC KVM CPUs
-M: David Gibson <david@gibson.dropbear.id.au>
-M: Greg Kurz <groug@kaod.org>
+M: Cédric Le Goater <clg@kaod.org>
+M: Daniel Henrique Barboza <danielhb413@gmail.com>
+R: David Gibson <david@gibson.dropbear.id.au>
+R: Greg Kurz <groug@kaod.org>
 S: Maintained
 F: target/ppc/kvm.c
 
@@ -1321,8 +1325,10 @@ F: include/hw/rtc/m48t59.h
 F: tests/acceptance/ppc_prep_40p.py
 
 sPAPR
-M: David Gibson <david@gibson.dropbear.id.au>
-M: Greg Kurz <groug@kaod.org>
+M: Cédric Le Goater <clg@kaod.org>
+M: Daniel Henrique Barboza <danielhb413@gmail.com>
+R: David Gibson <david@gibson.dropbear.id.au>
+R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/*/spapr*
@@ -1382,6 +1388,8 @@ F: include/hw/pci-host/mv64361.h
 
 Virtual Open Firmware (VOF)
 M: Alexey Kardashevskiy <aik@ozlabs.ru>
+R: Cédric Le Goater <clg@kaod.org>
+R: Daniel Henrique Barboza <danielhb413@gmail.com>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
-- 
2.33.1


