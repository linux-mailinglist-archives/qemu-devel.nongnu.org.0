Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE91EE49F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 14:41:04 +0200 (CEST)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgpB8-0000p0-C7
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 08:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jgp9a-0007uL-FP; Thu, 04 Jun 2020 08:39:26 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:56975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jgp9Z-0001g9-BC; Thu, 04 Jun 2020 08:39:26 -0400
X-Originating-IP: 82.252.130.88
Received: from localhost.localdomain (lns-bzn-59-82-252-130-88.adsl.proxad.net
 [82.252.130.88]) (Authenticated sender: jcd@tribudubois.net)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D0CDAE0007;
 Thu,  4 Jun 2020 12:39:18 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Subject: [PATCH v5 0/3] hw/net/imx_fec: improve the imx fec emulator
Date: Thu,  4 Jun 2020 14:39:07 +0200
Message-Id: <cover.1591272275.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.196; envelope-from=jcd@tribudubois.net;
 helo=relay4-d.mail.gandi.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 08:39:21
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, peter.chubb@nicta.com.au,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of path makes various improvement to the i.MX FEC ethernet
emulator.
  
 * PATCH 1: Convert the Ethernet emulator debug output to trace event
 * PATCH 2: Allow Ethernet PHY to be at any position on the MDIO bus
 * PATCH 3: Improve the i.MX FEC related PHY emulator by using standard
            header symbols instead of hardcoded values.

Jean-Christophe Dubois (3):
  hw/net/imx_fec: Convert debug fprintf() to trace events
  hw/net/imx_fec: Allow phy not to be the first device on the mii bus.
  hw/net/imx_fec: improve PHY implementation.

 hw/net/imx_fec.c     | 197 +++++++++++++++++++++----------------------
 hw/net/trace-events  |  18 ++++
 include/hw/net/mii.h |   4 +
 3 files changed, 119 insertions(+), 100 deletions(-)

-- 
2.25.1


