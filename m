Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A99341E66
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:34:03 +0100 (CET)
Received: from localhost ([::1]:48914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFGM-0001Ct-IM
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNF8Z-0000X2-OK; Fri, 19 Mar 2021 09:25:59 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:53889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNF8X-0003lh-P9; Fri, 19 Mar 2021 09:25:59 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MtO4E-1lgQRZ18BC-00uqAC; Fri, 19 Mar 2021 14:25:47 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] iotests: test m68k with the virt machine
Date: Fri, 19 Mar 2021 14:25:36 +0100
Message-Id: <20210319132537.2046339-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210319132537.2046339-1-laurent@vivier.eu>
References: <20210319132537.2046339-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:knVKPj2vfl5glMpKifxhMYz8gEGPS4zwMpXq/Z6NcjDhBa4LJn/
 9ee7uOs8dkjppVWIyaefkuvwpIw1kFySPv5kRjyuJ7CofBr+uc8SHu15WBtVQIfKpdarce1
 NdheHA1oUND7zSnZb0vxw73p5E3iZLnKku/LEkWIWFngLrIke6yatdyDglsgcDgW9lWyiXa
 IH5dUezeoFg5VaYk21Axw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t65QEJffBuU=:KJi+yCM6iOnVs6LfEsGnqq
 ketv6eTdnQzR+4KpWLgdd812u2dssxtcSf07ulaT/RObYUgANA0Xwb9oow81bmIEf9YBsow8t
 u8fwU5fI988tjjunFEFUamara507TsV71anwQg9CLc8DQA3TTjVNTq5dpPgYEB/jYyAg8Tuqi
 sSAdGbhwdDRjaX30hhlGqRL3be/kt16Eg+Xppk1HmIp+joxHOXXSZHQQ0FOOM7318hjsr/ROm
 nmi/QUb6iVhrzKsaqMTPSq5eDDaVbJXZo75S+PDOn4HlMhipg0IR884+g5O2Vjxg+SZwDFe1S
 38hXGdk2Xsov9FsBdQSWftAZ7SuKZEfYkAd/A4oSrA70LNKiVTE7TeTBNgjoStY+0a3Hyv1/X
 JkUL1V0veU9VMVmjX59FZ3dNhIcrJE2a+yuvCUSvGmtUuJodFLHZmP5It2WwkCTcASFY/ogaa
 0W2Te0eF7Q==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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


