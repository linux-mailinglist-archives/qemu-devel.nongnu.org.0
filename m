Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABC744A711
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:54:59 +0100 (CET)
Received: from localhost ([::1]:49024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkL22-0002fM-EN
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:54:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK5G-0006Jl-8z; Tue, 09 Nov 2021 00:54:14 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:36839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK5D-0006yX-NM; Tue, 09 Nov 2021 00:54:13 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDq0FgTz4xfZ; Tue,  9 Nov 2021 16:52:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437131;
 bh=VBfYdBAQsD/HFUnwDBV2+uw+GpEQu+btD8mWoxWd0us=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c2cjmc37EWiHZ9c2SZWDuQRTtU0HIMnawTDX7cN2oauwpjW/M4zme43GjbtXx0kX0
 7tvHnsSYfL3jEPTNVuo/PHnDzG+qMM6DB+TijVxW+e2e+f497UABIu4eoG6gzoK14M
 to+N6CcSXp+UeGMxqDiguaNVqZZFcWflYR8Ycdcw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 53/54] target/ppc, hw/ppc: Change maintainers
Date: Tue,  9 Nov 2021 16:52:03 +1100
Message-Id: <20211109055204.230765-54-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
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
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Acked-by: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 53b63df407..d3879aa3c1 100644
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
 F: tests/avocado/ppc_prep_40p.py
 
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


