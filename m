Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7115450FDBD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 14:54:34 +0200 (CEST)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKi9-0003hd-Ik
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 08:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njKaC-0006KJ-Aj; Tue, 26 Apr 2022 08:46:20 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:46673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njKaA-0007Cy-Az; Tue, 26 Apr 2022 08:46:20 -0400
Received: from quad ([82.142.9.138]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MDgxt-1nYZsm0YJ5-00AluD; Tue, 26
 Apr 2022 14:46:15 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] docs: Replace HomeBrew -> Homebrew
Date: Tue, 26 Apr 2022 14:46:10 +0200
Message-Id: <20220426124610.639614-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426124610.639614-1-laurent@vivier.eu>
References: <20220426124610.639614-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Yj+9ulMqoVosLV89hZcGIHowETN+ZkNPxG55W3Uk6xDp59pClYe
 vfuUCPalBdFhVQ/8iftMn12XW11Y3sMC58afWq3teLHUrqLf74epAJXJzo6MSPw4T5RwXML
 gd238oHz+bBbh1/Dce03bqzMKllxCR7IdEy0aZjuxXNRKdjPDLWgLngvZB+uJn20+eLU+Ki
 ySqtDGgVltivdRU3353Ew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xAjV5a74ze4=:Q3aIN4bYG1ePNIw0qSi0b9
 uX3zAPI7eSIQqUEPs24vh3kBo3ppBxRliwTJ4cyQ1DOzNdcPBbB+j6qBy+EU4SCzX4YOYYTYC
 QsuhXvzRRHsMtxeqLJkxW0TpGVApcRKmCmSskBbdxzBy7PgTJZ58X/SjjPwRmUKwjnmW/pdmS
 8tCeBJczpdjmaAO1QX66exRZdCNuslAvVxeSqjoNlYeos0Kelw+4inY3e5X/cXlRYu/+DwYp9
 DcICp0X3/t0ihmk2WjOr1Gp7PJVv84KVjWGnwGJWL07BNFSwYxMRXeM+QC/Sfv6PPUVBO9UYF
 gSTAQTDpFcM7pD/kVzaUo6lbRM1l+wW74l3lmWeP/piCbHfU/2/TWo5wFjAk0lT2k1RCpRrjl
 5+2ZV5+QwkJ89o1nFiCF/xvjVR/aBnKQn8RQBfH/MHS1UndyF9sbq2ZzCs9FbM4pQTTgsVhii
 ImRp6NlVrbhIX2iuTh3lpSi1CF1kn/LX2XlsDmeKXktYUwaq0qgj7n/ZEmBpd8g/GG2zqiYDV
 rUYD8lP85Lj73zLjNyJ24lsrEs7FuHgfWJ7oNW2ZHiIlZktHsCbNUCp6pRRkAf3UkglnWNKhM
 6AIb/sQuJrDGR6CXlY5WV4E6SvYNfC1FtejHEsiARzd3lIYbOpBusGDpBlb6kVE/jMBavQ/TA
 YXIA/XyZ2lgu0pBaAkS94RjQnmOQhhP7Pm/DCaRw+XgV1cgWc0G2l/Sd352f0ryDxa54=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Bin Meng <bmeng.cn@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

The official spelling does not use camel case.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220422083403.1082924-1-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/about/build-platforms.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index c29a4b8fe649..e9163ba5563f 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -80,7 +80,7 @@ Ubuntu LTS. Other distros will be assumed to ship similar software versions.
 For FreeBSD and OpenBSD, decisions will be made based on the contents of the
 respective ports repository, while NetBSD will use the pkgsrc repository.
 
-For macOS, `HomeBrew`_ will be used, although `MacPorts`_ is expected to carry
+For macOS, `Homebrew`_ will be used, although `MacPorts`_ is expected to carry
 similar versions.
 
 Windows
@@ -92,6 +92,6 @@ hosted on Linux (Debian/Fedora).
 The version of the Windows API that's currently targeted is Vista / Server
 2008.
 
-.. _HomeBrew: https://brew.sh/
+.. _Homebrew: https://brew.sh/
 .. _MacPorts: https://www.macports.org/
 .. _Repology: https://repology.org/
-- 
2.35.1


