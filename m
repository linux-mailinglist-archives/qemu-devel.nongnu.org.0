Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28143426DB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 21:28:57 +0100 (CET)
Received: from localhost ([::1]:54312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNLjr-00027c-5H
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 16:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNLf6-0004uC-MC; Fri, 19 Mar 2021 16:24:00 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:45981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNLf4-0001Tj-AQ; Fri, 19 Mar 2021 16:24:00 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MfHUx-1lulrf2AId-00gntU; Fri, 19 Mar 2021 21:23:44 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] iotests: test m68k with the virt machine
Date: Fri, 19 Mar 2021 21:23:34 +0100
Message-Id: <20210319202335.2397060-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210319202335.2397060-1-laurent@vivier.eu>
References: <20210319202335.2397060-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Hsqgey4NK+7nLCVqA9rp6cTaJxObQqtjvxVrSahD1jNsnmFnYia
 p/paXzGMDdcHnP1pUPI1/bi13ESHvUANa7FmgbhNqpNgK98SBNNyL+TP5JQKj5ubbLEwuda
 UxqsmwEcWKZnNwbW4QQnB4HL7lyZ02Vk2MMAgjQ0TDv9AytWpDjOPbmFM5F2DtRaxt6SBgY
 typuVMaoSAJzL/nzV+snw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QXrVGJN1vYQ=:sO4A8F/OyIjISDY2dgZbBF
 eOBzdCwLjPGvvqeiwfagDIDllhP/zHFZeXBaX2RFcH61evEzSFOAY0865wh7ub9XR2IYQNoR4
 ekyee/Tx60lMC2MTrVjVHI3War+XNPC/njQBJBx5IU4+/fWvY7UOcCIWY8o5bGkQY8aZO0Rq/
 /xIK+oGsL3A1NY48ZPnzcY3MVTxRn2tq7A7luq4nAYIp1+sqwChlWIOhr2BaOxJeJVPIWaZQ/
 PL4HgaIixBd3buX3XiVhq0H9ibYomqU9is7NP6GQbctjq+PDdG+MV0l2WFgfFRblzJUaw4we/
 05LqOgmfdja7pHqNdyu3Pn1/r9ctP2zjhyB7nAcNfV+RgAfFYF1bZDDhYhR+J7UAJ5PS6Hgcg
 ka8TJahK4dwxMjkQFSkYYud8TTl9kQW+dKXBsBMVKeb/8HMBrMbwXuCjHxtlXiXX2lXg9Qct1
 tLjzOg5wzQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows to cover the virtio tests with a 32bit big-endian
virtio-mmio machine.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
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


