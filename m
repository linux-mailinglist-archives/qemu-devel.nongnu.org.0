Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BCA21484A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 21:14:05 +0200 (CEST)
Received: from localhost ([::1]:58596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrnbw-0007LB-PJ
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 15:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jrnas-0005lv-EV
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 15:12:58 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:44615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jrnap-0002Dt-4w
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 15:12:58 -0400
X-Originating-IP: 90.127.194.69
Received: from jcd-UX305CA.home (lfbn-idf1-1-2027-69.w90-127.abo.wanadoo.fr
 [90.127.194.69]) (Authenticated sender: jcd@tribudubois.net)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0F9C920004;
 Sat,  4 Jul 2020 19:12:48 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, peter.chubb@nicta.com.au,
 f4bug@amsat.org
Subject: [PATCH v2 0/3] Add ability to choose MDIO phy number to i.MX
 processors
Date: Sat,  4 Jul 2020 21:12:42 +0200
Message-Id: <cover.1593806826.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.200; envelope-from=jcd@tribudubois.net;
 helo=relay7-d.mail.gandi.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 14:54:37
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

This patch set adds the ability to select the Ethernet PHY device number
for the i.MX25 processor, the i.MX6 processor and the i.MX7 processor.

Note: the i.MX6UL processor was addressed in a previous patch.

Jean-Christophe Dubois (3):
  Add the ability to change the FEC PHY MDIO device number on i.MX25
    processor
  Add the ability to change the FEC PHY MDIO device number on i.MX6
    processor
  Add the ability to change the FEC PHY MDIO devices numbers on i.MX7
    processor

 hw/arm/fsl-imx25.c         | 7 +++++++
 hw/arm/fsl-imx6.c          | 7 +++++++
 hw/arm/fsl-imx7.c          | 9 +++++++++
 include/hw/arm/fsl-imx25.h | 1 +
 include/hw/arm/fsl-imx6.h  | 1 +
 include/hw/arm/fsl-imx7.h  | 1 +
 6 files changed, 26 insertions(+)

 v2: same patch after pull request from peter is validated.

-- 
2.25.1


