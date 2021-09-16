Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D53940DC91
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:17:48 +0200 (CEST)
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsCx-0000vz-Hk
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs63-0000YB-6m; Thu, 16 Sep 2021 10:10:39 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:40843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs60-0005qL-Sa; Thu, 16 Sep 2021 10:10:38 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MGA0o-1mhOth1TFk-00GasX; Thu, 16
 Sep 2021 16:10:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] configure: add missing pc-bios/qemu_vga.ndrv symlink in
 build tree
Date: Thu, 16 Sep 2021 16:10:21 +0200
Message-Id: <20210916141026.1174822-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916141026.1174822-1-laurent@vivier.eu>
References: <20210916141026.1174822-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9BA2pgzc5u9CNywlhK+tSwD/iueJ87rLuGvMtGZqFFfA4xELrih
 vlsz2ZosEiLehJq9TOhnBrYvizYfH3v4vRii1FC/L7FjnXBMaeq/FYDXiJkD2BDmBJ6T+B4
 xmI+cf+5/sLXvJQewp9Bwn+etorA01ixbEEzv0O8/6TKwbzueSfKndEvA0NtMQagpI1U7AQ
 0tSt30IF05y5V+M447ZdA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:roFIoukUcnM=:Iz40SEJt8KqJTE0WCNTRgj
 nMupeU3WBoB2l+KKBumKtCH5HG5YcFmQGg+pn+eI20nSN9L6+vcznAXFdT6GNnAkN5SC6jgoZ
 6YuEaGW3PQepOWfTB4m/RLBRUXjTxR25S5IT/p9jn2lEciLTnWzOKBRu+a0Pp2VE0938UZwWQ
 iJNztyBc4oOTqtPRdog9BG67wzlt7ajOk0GLgPztaOMOO/OQauNQ2iHv6SJE2j+rcHf2cvHLX
 x+Usn/40JOxs30LxZg7bhvjY7p7F8tqksN3vulVmqx0q2xzUQAnAbPAzw8IzCkdRn4u5PpEAl
 gUnHYpHjToLqHpuD3/uFOdCPZR/M1ULdJkYuluRqSV7lGRafe0cMCD/8ZwHxvIcqPKvrTgfPX
 0OAKj/zE5QPxRCBdZodYuwzA/I3gRqlhkRey/ZUzz9wrs+gNVBhqI3lLh4OTB9yd//RA3u9HC
 fJ8wv8M/paGCkw/H+Jn4etn4cp6LoUXfyL7VGJbY5rCgLgfewLhW1tkfwzBX8JkgGYDfPkD/c
 Vp24YZlMUusGCAS2CYfLEU5CP0/RhIVt21wEITazL/8HEcFBGv/vtZYcAAvCVvCoYDRDw6wLl
 ek/Nt+jeK0hJCaaMTbYKIJcwXMgLn9Swvcg4/p65PJg4HN17yHYc4Q0ptSbQ17J86X/IbGATN
 HnTf/gFydeKnu0EMaxNkB9n2Gp6c4lOG02xc5bAEgWjHgOYYCfnJ0/xQmEQlsyzrSMYUwIoTu
 HSCc2TYxkIs1ogpynb7SKkFdYFXkBMNhM9VWgg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-trivial@nongnu.org, John Arbuckle <programmingkidx@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Arbuckle <programmingkidx@gmail.com>

Ensure that a link to pc-bios/qemu_vga.ndrv is added to the build tree,
otherwise the optional MacOS client driver will not be loaded by OpenBIOS
when launching QEMU directly from the build directory.

Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210831165020.84855-1-programmingkidx@gmail.com>
[lv: commit message rewording as suggested by Mark]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index da2501489f34..1043ccce4f99 100755
--- a/configure
+++ b/configure
@@ -5052,7 +5052,9 @@ for bios_file in \
     $source_path/pc-bios/openbios-* \
     $source_path/pc-bios/u-boot.* \
     $source_path/pc-bios/edk2-*.fd.bz2 \
-    $source_path/pc-bios/palcode-*
+    $source_path/pc-bios/palcode-* \
+    $source_path/pc-bios/qemu_vga.ndrv
+
 do
     LINKS="$LINKS pc-bios/$(basename $bios_file)"
 done
-- 
2.31.1


