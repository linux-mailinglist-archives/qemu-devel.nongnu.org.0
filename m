Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE76C5ADB5F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 00:21:20 +0200 (CEST)
Received: from localhost ([::1]:42102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVKT1-0007WR-Br
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 18:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <SRS0=szQ+=ZI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1oVKQd-00050H-Sz
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 18:18:52 -0400
Received: from sonata.ens-lyon.org ([140.77.166.138]:45756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <SRS0=szQ+=ZI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1oVKQb-0003nb-V3
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 18:18:51 -0400
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 7FF3C20165;
 Tue,  6 Sep 2022 00:18:45 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5qrV8JiObg74; Tue,  6 Sep 2022 00:18:45 +0200 (CEST)
Received: from begin (lfbn-bor-1-376-208.w109-215.abo.wanadoo.fr
 [109.215.91.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 09B262016C;
 Tue,  6 Sep 2022 00:18:44 +0200 (CEST)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1oVKQV-002LPQ-1J;
 Tue, 06 Sep 2022 00:18:43 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PULL 0/1] baum: better document usb-braille configuration
Date: Tue,  6 Sep 2022 00:18:40 +0200
Message-Id: <20220905221841.558943-1-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=140.77.166.138;
 envelope-from=SRS0=szQ+=ZI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org;
 helo=sonata.ens-lyon.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 3e01455edd5fce06c14e2926b6ef408d9a94c9fb:

  usb-braille: Better explain that one also has to create a chardev backend (2022-09-06 00:09:50 +0200)

are available in the Git repository at:

  https://people.debian.org/~sthibault/qemu.git tags/samuel-thibault

for you to fetch changes up to 3e01455edd5fce06c14e2926b6ef408d9a94c9fb:

  usb-braille: Better explain that one also has to create a chardev backend (2022-09-06 00:09:50 +0200)

----------------------------------------------------------------
baum: better document usb-braille configuration

Samuel Thibault (1):
  usb-braille: Better explain that one also has to create a chardev
    backend

----------------------------------------------------------------

