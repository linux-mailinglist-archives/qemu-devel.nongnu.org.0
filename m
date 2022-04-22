Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8116350B109
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 09:05:32 +0200 (CEST)
Received: from localhost ([::1]:37882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhnMB-0005kD-4A
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 03:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1nhnIq-0003JQ-FA
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 03:02:04 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:50522
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1nhnIn-0008VF-M1
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 03:02:03 -0400
Received: from qemu.weilnetz.de (unknown [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id B99B9DA0C54;
 Fri, 22 Apr 2022 09:01:57 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 6C3BC462074; Fri, 22 Apr 2022 09:01:57 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] libvhost-user: Add format attribute and fix format strings
Date: Fri, 22 Apr 2022 09:01:41 +0200
Message-Id: <20220422070144.1043697-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At least the 1st two patches could also be applied via qemu-trivial.
One of them missed release 7.0, so hopefully the fixes will be
included in the next QEMU release.

Stefan W.

[PATCH 1/3] libvhost-user: Fix wrong type of argument to formatting
[PATCH 2/3] libvhost-user: Fix format strings
[PATCH 3/3] libvhost-user: Add format attribute to local function


