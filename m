Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB89A323BEE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:37:42 +0100 (CET)
Received: from localhost ([::1]:56670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtQD-0006DQ-TG
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lEtNf-0004xP-Et
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:35:03 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lEtNa-0005HA-Nz
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:35:03 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DlwLs6tMMzjPCD;
 Wed, 24 Feb 2021 20:33:25 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Feb 2021 20:34:36 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 0/3] vnc: support reload x509 certificates
Date: Wed, 24 Feb 2021 20:34:16 +0800
Message-ID: <20210224123419.786-1-changzihao1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=changzihao1@huawei.com; helo=szxga06-in.huawei.com
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
 monitor/qmp-cmds.c        |  12 ++++
 qapi/ui.json              |  32 +++++++++++
 ui/vnc.c                  |  28 +++++++++
 6 files changed, 195 insertions(+), 3 deletions(-)

-- 
2.28.0


