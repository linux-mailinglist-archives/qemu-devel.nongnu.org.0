Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8314133B3A9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:18:54 +0100 (CET)
Received: from localhost ([::1]:49056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLn7V-0000cZ-9d
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lLn5V-0007nY-ME
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:16:49 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lLn5T-0006Mw-2b
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:16:49 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DzcMn2q4Lz17L1h;
 Mon, 15 Mar 2021 21:14:45 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 21:16:29 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v7 0/3] vnc: support reload x509 certificates
Date: Mon, 15 Mar 2021 21:16:06 +0800
Message-ID: <20210315131609.2208-1-changzihao1@huawei.com>
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
{"execute": "display-reload", "arguments":{"type": "vnc", "tls-certs": true}}

Zihao Chang (3):
  crypto: add reload for QCryptoTLSCredsClass
  vnc: support reload x509 certificates for vnc
  qmp: add new qmp display-reload

 crypto/tlscredsx509.c     | 48 ++++++++++++++++++++++++++++++
 include/crypto/tlscreds.h |  8 +++--
 include/ui/console.h      |  1 +
 monitor/qmp-cmds.c        | 14 +++++++++
 qapi/ui.json              | 61 +++++++++++++++++++++++++++++++++++++++
 ui/vnc.c                  | 28 ++++++++++++++++++
 6 files changed, 157 insertions(+), 3 deletions(-)

-- 
2.28.0


