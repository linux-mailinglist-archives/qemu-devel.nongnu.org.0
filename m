Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A1933709F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:57:02 +0100 (CET)
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJ01-0002Fi-Oo
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lKIy1-0000n7-QR
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:54:58 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:4389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lKIxz-00028J-I2
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:54:57 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dx5Q12mc5z17JfY;
 Thu, 11 Mar 2021 18:52:57 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 11 Mar 2021 18:54:36 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 0/3] vnc: support reload x509 certificates
Date: Thu, 11 Mar 2021 18:54:21 +0800
Message-ID: <20210311105424.1370-1-changzihao1@huawei.com>
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
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 armbru@redhat.com, xiexiangyou@huawei.com, yebiaoxiang@huawei.com,
 kraxel@redhat.com
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

 crypto/tlscredsx509.c     | 117 ++++++++++++++++++++++++++++++++++++++
 include/crypto/tlscreds.h |   8 ++-
 include/ui/console.h      |   1 +
 monitor/qmp-cmds.c        |  13 +++++
 qapi/ui.json              |  19 +++++++
 ui/vnc.c                  |  28 +++++++++
 6 files changed, 183 insertions(+), 3 deletions(-)

-- 
2.28.0


