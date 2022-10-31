Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504C4613258
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 10:15:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQsI-0004ZR-OK; Mon, 31 Oct 2022 05:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1opQsG-0004Yz-UU
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:14:28 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1opQsF-0000Gu-Dv
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:14:28 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id A3A6FDA08F3;
 Mon, 31 Oct 2022 10:14:25 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 9F9AC46001C; Mon, 31 Oct 2022 10:14:25 +0100 (CET)
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PULL 1/4] scripts/nsis.py: Drop the unnecessary path separator
Date: Mon, 31 Oct 2022 10:14:03 +0100
Message-Id: <20221031091406.382872-2-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031091406.382872-1-sw@weilnetz.de>
References: <20221031091406.382872-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

There is no need to append a path separator to the destination
directory that is passed to "make install".

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20220908132817.1831008-2-bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 scripts/nsis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/nsis.py b/scripts/nsis.py
index 462d6cac3b..bbb41d9386 100644
--- a/scripts/nsis.py
+++ b/scripts/nsis.py
@@ -30,7 +30,7 @@ def main():
 
     destdir = tempfile.mkdtemp()
     try:
-        subprocess.run(["make", "install", "DESTDIR=" + destdir + os.path.sep])
+        subprocess.run(["make", "install", "DESTDIR=" + destdir])
         with open(
             os.path.join(destdir + args.prefix, "system-emulations.nsh"), "w"
         ) as nsh, open(
-- 
2.30.2


