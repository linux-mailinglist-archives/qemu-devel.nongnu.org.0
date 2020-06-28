Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0E520CA55
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jun 2020 22:22:52 +0200 (CEST)
Received: from localhost ([::1]:34372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpdpC-0006gx-GR
	for lists+qemu-devel@lfdr.de; Sun, 28 Jun 2020 16:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jpdnr-0005kp-Pz
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 16:21:27 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:58159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jpdno-0004DJ-W1
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 16:21:27 -0400
X-Originating-IP: 82.252.130.88
Received: from localhost.localdomain (lns-bzn-59-82-252-130-88.adsl.proxad.net
 [82.252.130.88]) (Authenticated sender: jcd@tribudubois.net)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A94F4FF807;
 Sun, 28 Jun 2020 20:21:19 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, peter.chubb@nicta.com.au,
 f4bug@amsat.org
Subject: [PATCH 0/3] Allow to specify the PHY number to use with a specific
 i.MX FEC/ENET Ethernet device
Date: Sun, 28 Jun 2020 22:20:55 +0200
Message-Id: <cover.1593296112.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.199; envelope-from=jcd@tribudubois.net;
 helo=relay9-d.mail.gandi.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/28 16:21:22
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PHY device associated to a specific i.MX Ethernet device is not 
necessarily at address 0 on the MDIO bus.

This patch series adds the ability to set the PHY number on the MDIO bus
for any i.MX6UL based board.

Jean-Christophe Dubois (3):
  Add a phy-num property to the i.MX FEC emulator
  Add the ability to select a different PHY for each i.MX6UL FEC
    interface
  Select MDIO device 2 and 1 as PHY devices for i.MW6UL EVK board.

 hw/arm/fsl-imx6ul.c         | 10 ++++++++++
 hw/arm/mcimx6ul-evk.c       |  2 ++
 hw/net/imx_fec.c            | 24 +++++++++++++++++-------
 hw/net/trace-events         |  4 ++--
 include/hw/arm/fsl-imx6ul.h |  2 ++
 include/hw/net/imx_fec.h    |  1 +
 6 files changed, 34 insertions(+), 9 deletions(-)

-- 
2.25.1


