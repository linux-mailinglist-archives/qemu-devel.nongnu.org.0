Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B8F341073
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 23:44:40 +0100 (CET)
Received: from localhost ([::1]:51398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN1Nf-000142-1t
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 18:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lN1Ih-00042F-CS; Thu, 18 Mar 2021 18:39:32 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:52971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lN1Ic-0003zp-1p; Thu, 18 Mar 2021 18:39:31 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N4hj5-1lnW2x0igB-011kNg; Thu, 18 Mar 2021 23:39:20 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] iotests: test m68k with the virt machine
Date: Thu, 18 Mar 2021 23:39:06 +0100
Message-Id: <20210318223907.1344870-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318223907.1344870-1-laurent@vivier.eu>
References: <20210318223907.1344870-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lRjGTTDaLT7GgAORaeikSkAvQ1GfEYdI7+zcQtNk/13evhmTcCx
 6LixES3+DgWqjgScuvkFI+h2WJATf9HWNhHvqlat+F5GLNSwQ+q4t3aOQH74BvklTtUgDs8
 HbEGXLf2uBIsh4Yux4wTNhDbkoIjLJtoWayu5F7GLxEvguOtAbd+U+Om3/hqWv3biQ8Vy32
 fPrh+XlCZmnypcCACG3Ng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dU81XvDu+1o=:ocd9AJ6gy/dyxY420KzO6o
 xhQdwDYZkr181o5XnYoC9zqIsdwyg0e5i66wkMk8ZqK4TF5yJZGzdHkt0lLl+5Jc9f8ABz22M
 KEAD6NFVrWE/NA6fFUolL4kqBiJHBRtFW1K7ZiKJ9GKtNgL8sUsBNnu+7Qer/DzLDFnTSAmv/
 P/Pms+TPpjAqz8DxL6c3A7CLV8xTKvX7fFBapcMgbMIMT6hZjPZm/nnsiqffLyTs9BYFZUEpR
 9qmxmtOzGSaNKVCN8/5U46wVd/pDv4HOhtTZbvHwWLpj3SSeecTS2vDxjEEDxaOi6UQ38aRm7
 1t2GTw/OsRjhHywT0gprSc4dxEm6XVr5sBhbbiVKLY+QheT1g3m3IMSHhq73A+Iz9txgNO8mv
 +2QYwHyumC+w2NowWWPaZQRSVvn1zOwVbN//J2V+eh0keEi2itWMBh03qdi6aY2Tqz3rWcjXL
 WI1J2sAOpA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows to cover the virtio tests with a 32bit big-endian
virtio-mmio machine.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/qemu-iotests/testenv.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 1fbec854c1f7..6d27712617a3 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -208,6 +208,7 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
             ('arm', 'virt'),
             ('aarch64', 'virt'),
             ('avr', 'mega2560'),
+            ('m68k', 'virt'),
             ('rx', 'gdbsim-r5f562n8'),
             ('tricore', 'tricore_testboard')
         )
-- 
2.30.2


