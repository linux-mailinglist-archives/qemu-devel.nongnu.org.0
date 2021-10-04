Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240BF42079B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:52:18 +0200 (CEST)
Received: from localhost ([::1]:59318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJho-0005ag-TA
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXJNQ-0000zz-7a; Mon, 04 Oct 2021 04:31:12 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:55057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXJNO-0003T6-F8; Mon, 04 Oct 2021 04:31:11 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MP2zs-1mAGBV14Dk-00PIch; Mon, 04
 Oct 2021 10:31:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] hw/remote/proxy: Categorize Wireless devices as 'Network'
 ones
Date: Mon,  4 Oct 2021 10:30:55 +0200
Message-Id: <20211004083055.3288583-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004083055.3288583-1-laurent@vivier.eu>
References: <20211004083055.3288583-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ijj8Jguyg4AO06sBIh6TEiMLxTsX3qu1gUgUmyVRsRntAWq3wf+
 2cJ4rly7J2y9brIHA1cg9545GvX6CLV8/DGR2ho9wL6f3YzBJO/oxLgKWtv9qiiqc4ev2aj
 PLIHFbSyNLSk9Z5heTsm3f73rYz0Nu2R1p4Rgnab8fsgXR/hZoc2qJPrYIzzq3sMdMN19OR
 ZEsObnODoI/zFzIjNWMoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:myX44dPtxZc=:xN9SQD+/N6YJD6Qy7+ekal
 Ga3fuHtfnF+xbExoZb4LbsLmZbvtPa4LMBi5/qAcyNkhJdfxD7dgGx7dmbAB64YdDdWFL4YLz
 GGXZXI3lCDWBFD7pyr5A8Yalkv3B2sV7+Y4YToIZ7IMleL9tXwkbmO9WfqYKLM/mLspGJND4p
 y9Vvs/Njwvmo4RePD9POe8dX44EX/E3EyPJCAe7Qyt2HXn8dWYiWVZZxZwnRVu0iam4QSvzma
 xlGkPeVb/Eq9AsLZH/R7aPsUj5+oIdbYXW522iB8YVdfusro97S7cH9FlaW1JMFhuGjWqKYI7
 rPIfnZGQewtVrAux4vud1YCg7gQHlMA/aqn2JLIJc4JsyjhvSkE+1jPXgCIHfopx0/VDX7Gkm
 hiulpWZAxUbZi9U/wwS4k2ikZNsLQu/+aZn6JAJaaJuUEdZzmnpoNEBrvlzVrJFhB2K6wxVEj
 xXwK7a82JTckvATbDhQDdI2Ak9TJDEPvKCKQGloVNJXHmk8vHMqCirEzL6ccz2qrxQ+reoneP
 ijxEyxudnqmN0fCpZP71BJvg2egwTmd3r6+pSlLYdeQC0ZYe13H9Cq4KgqaFLlpqV6gj98w75
 8WAjuyejlGh39Jl5NCwD15HUC/x4WRrCOEwCXpvUdA7teuguG8fTu/hbjoKFU9WxTF9WbiZNe
 HKPXQ2CXtFlYiUaKTcwm7oE35q4Yc/V3W2VXB47gFe5CFur5Cb3F/vBUXUMcflvwkHDJUUCga
 lrzaWi93kqen+fbKxt+OwR5zQ85wcoqxME2AHQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

QEMU doesn't distinct network devices per link layer (Ethernet,
Wi-Fi, CAN, ...). Categorize PCI Wireless cards as Network
devices.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
Message-Id: <20210926201926.1690896-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/remote/proxy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 499f540c947d..bad164299dd4 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -324,6 +324,7 @@ static void probe_pci_info(PCIDevice *dev, Error **errp)
         set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
         break;
     case PCI_BASE_CLASS_NETWORK:
+    case PCI_BASE_CLASS_WIRELESS:
         set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
         break;
     case PCI_BASE_CLASS_INPUT:
-- 
2.31.1


