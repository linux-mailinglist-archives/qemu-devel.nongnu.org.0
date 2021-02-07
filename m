Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D3B312252
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 08:54:33 +0100 (CET)
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ets-00078i-C5
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 02:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1l8enO-0003RK-2q
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 02:47:50 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1l8enM-0006wD-A9
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 02:47:49 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DYLmh22v6zlH86;
 Sun,  7 Feb 2021 15:45:40 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Sun, 7 Feb 2021 15:47:15 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/3] vnc: support reload x509 certificates
Date: Sun, 7 Feb 2021 15:47:07 +0800
Message-ID: <20210207074710.1029-1-changzihao1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=changzihao1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

This series supports reload x509 certificates for vnc
1. Support reload x509 certificates.
2. Support reload vnc certificates.
3. Add new qmp display-reload and implement reload x509 certificates
for vnc.

Example:
{"execute": "display-reload", "arguments":{"vnc-tls-certs": true}}


Zihao Chang (3):
  crypto: add reload for QCryptoTLSCredsClass
  vnc: support reload x509 certificates for vnc
  qmp: add new qmp display-reload

 crypto/tlscredsx509.c     | 112 ++++++++++++++++++++++++++++++++++++++
 include/crypto/tlscreds.h |   8 ++-
 include/ui/console.h      |   1 +
 monitor/qmp-cmds.c        |  12 ++++
 qapi/ui.json              |  32 +++++++++++
 ui/vnc.c                  |  28 ++++++++++
 6 files changed, 190 insertions(+), 3 deletions(-)

-- 
2.28.0


