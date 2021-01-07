Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D2E2ED251
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 15:33:30 +0100 (CET)
Received: from localhost ([::1]:44154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxWLx-0001FG-B0
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 09:33:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kxWJb-0000Kg-SP
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:31:03 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kxWJT-0004oy-Ti
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:31:03 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DBTCJ0RSczhwf1;
 Thu,  7 Jan 2021 22:29:48 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Thu, 7 Jan 2021 22:30:35 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/2] support tls certificates reload
Date: Thu, 7 Jan 2021 22:30:30 +0800
Message-ID: <20210107143032.752-1-changzihao1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=changzihao1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, oscar.zhangbo@huawei.com, changzihao1@huawei.com,
 armbru@redhat.com, xiexiangyou@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set implements the reload interface for QCryptoTLSCredsX509
and add qmp to trigger the tls certificates reload.

Zihao Chang (2):
  crypto: add reload for QCryptoTLSCredsClass
  vnc: add qmp to support reload vnc tls certificates

 crypto/tlscredsx509.c     | 77 +++++++++++++++++++++++++++++++++++++++
 include/crypto/tlscreds.h |  8 ++--
 include/ui/console.h      |  1 +
 monitor/qmp-cmds.c        |  5 +++
 qapi/ui.json              | 18 +++++++++
 ui/vnc.c                  | 24 ++++++++++++
 6 files changed, 130 insertions(+), 3 deletions(-)

-- 
2.23.0


