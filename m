Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D313320565
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 13:43:40 +0100 (CET)
Received: from localhost ([::1]:51702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDRbn-0005dG-AR
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 07:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUI-000788-El; Sat, 20 Feb 2021 07:35:54 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:50981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUF-0003MY-2L; Sat, 20 Feb 2021 07:35:54 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M4rD7-1lEovd1jM7-0022Ds; Sat, 20 Feb 2021 13:35:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/12] u2f-passthru: put it into the 'misc' category
Date: Sat, 20 Feb 2021 13:35:22 +0100
Message-Id: <20210220123525.1353731-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210220123525.1353731-1-laurent@vivier.eu>
References: <20210220123525.1353731-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:p4QVjDjfxQqR/J3phMN3t/uYDEzag6sXSJPeEaTF67o1/+X+HLr
 T28qlGVpEHgU0TZjmcEPyNUsJ0FkpDk6kD8Az3LK8MqnIZKYV0vi/dXZbEjUSG0kMcDhhBq
 ++7XXFV4tS150doFUunWsMdhW2uvjNzQz/Qek7rYfnLbpKkdy7PyB8DJvB/UEVUW//C80py
 syeUbBXuBDJ04vrJaYDNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SydUieU+i/Y=:sPPi+HcZ7apXVfXQD4ZLD8
 F5g9gpm21kswpz7swmSi8tfspLINxxZoeqAXEb+syie3SrO59Wf9YHX5DiZAJvSsYM5VSDLst
 of3kW4U7tdrmWwD4WVTnTFxoi2G0B6CmbSGpfjKiYxXVLNSTH4FECUABMSFw5Nlm6ZpVIxGBl
 gOIhLDJINv2r5yKTf+cxewUa/AXxqM9lTnig95FGqh5A4wH6AtHk7EYQzLUIQuChjM03+dCvR
 TyIpavJeO4YK6jwpDkV9PuUMuji6p/p8QkzW0WtP4j8s0L1a9uvpX0Ke+IGHpxHpJ/r6IH47j
 bJ7UzAEfid+oIhNZwQu+Hs8yC0tWy/i5Dh5mpbqtU2L6smz/E/nbOB/nUTOZOONvBZ791gpkE
 vEepwmsxx4I+p1umE6XQTOTvqTXYwkv+bN9qBudrVEJoQaY7H2pYcR36oA7/t
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Gan Qixin <ganqixin@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gan Qixin <ganqixin@huawei.com>

The category of the u2f-passthru device is not set, put it into the 'misc'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20201130083630.2520597-10-ganqixin@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/usb/u2f-passthru.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/u2f-passthru.c b/hw/usb/u2f-passthru.c
index ae00e93f3507..fc93429c9c01 100644
--- a/hw/usb/u2f-passthru.c
+++ b/hw/usb/u2f-passthru.c
@@ -534,6 +534,7 @@ static void u2f_passthru_class_init(ObjectClass *klass, void *data)
     dc->desc = "QEMU U2F passthrough key";
     dc->vmsd = &u2f_passthru_vmstate;
     device_class_set_props(dc, u2f_passthru_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo u2f_key_passthru_info = {
-- 
2.29.2


