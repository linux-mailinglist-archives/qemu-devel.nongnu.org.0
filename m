Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8F8479545
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:12:51 +0100 (CET)
Received: from localhost ([::1]:54034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myJb1-0001Fq-1X
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:12:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYj-0005u1-SO; Fri, 17 Dec 2021 15:10:29 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:46733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYi-0001J5-AQ; Fri, 17 Dec 2021 15:10:29 -0500
Received: from quad ([82.142.30.186]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MYNeM-1n3AzP0r6g-00VTr1; Fri, 17
 Dec 2021 21:10:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] configure: Symlink binaries using .exe suffix with MinGW
Date: Fri, 17 Dec 2021 21:10:11 +0100
Message-Id: <20211217201019.1652798-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217201019.1652798-1-laurent@vivier.eu>
References: <20211217201019.1652798-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zqP7h73vrj28ySvPM1QIgAFipWSIY22h++MPsCYVLUBSq+UsPPW
 XxyNd60ZwYAuGmd5rz1/HLZ7YDqil+lj7M4tat14NTuJvenuB0SeQ5YGdOZ3MMMZHAfEvOF
 pe8UQD4QMCHQqnSKfSDYVrnwVacP6D+ye1Mk3zXbk8cj0XJuigyLlajso1QyQUSilK6PhFo
 n6u1BSnj/sAV/CjviPrKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:24eMlDOtQvc=:h5wrPM837Y2lvrfFMt4t3L
 suFJS+HA5HWMT6O9sWsdvK12BSS575gzanZcsO1R4migyYsAKgiSZoqkL8v8ATClVMEg+mcFr
 HmD2w/anx6I2PSaKy7wdbLocI2Wa0h2hTEW2N407blVYHvQ9sMFITk9G1ZHa1qtACrAnuvgjK
 VfKKvBerjBWFja7ZPUDhLxndsHyO21Db20aCJwzEUNqq2xc8g2UeuLmJu6IEaHPBz+WgcFTqE
 GMtsOWmi1EVPDosvIVJe1nSlkkN8jxYU/KHZE6nF4PkxGAjxA6Kyw5HOBR1wMEpft79GP5FLi
 D2nTu0c94bM/Y6LgG8Hs/ukpm2xgF/vyd7rWB1tp+vUqEKK8ZJdTc/9gVL1pf12NO973xhovx
 gKE562uHg4Eq0AITVqFf5fi21TUFn2zUop78fJUZDOWx+Cf4GtcJaouOUxpf58voGXmNIfq3/
 J2JlrkIWwq256MjoCWIeihZMKFGiloWx7yUXfzA/5AoxZEXE/QU05FaOYSbZ+4trf9iVBNidP
 rAQLZ5oonHjMIQOiRnzZEqBTNwu+IdKmqRDeKay/BoH0p3RM9Q0aC4Oyp7oUH2TkUjEG/AD8S
 sj7+djnaS6XCADoXQWXY5qSFXCAmbW3FEA+ID62eNxvSGMiOlvacHz9K1drANqm7WCE332SxS
 bCVE0VCcRTO9qp37zrVMYrAiXYnYwlq9AzSbUFPgPSBIofTwbIs4QrCUwdt206lqR1O4=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When using the MinGW toolchain, we use the .exe suffix for the
executable name. We also need to use it for the symlinks in the
build directory.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20211109144504.1541206-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 5fae19858d58..28e1cf6291bb 100755
--- a/configure
+++ b/configure
@@ -3754,7 +3754,7 @@ fi
 
 for target in $target_list; do
     target_dir="$target"
-    target_name=$(echo $target | cut -d '-' -f 1)
+    target_name=$(echo $target | cut -d '-' -f 1)$EXESUF
     mkdir -p $target_dir
     case $target in
         *-user) symlink "../qemu-$target_name" "$target_dir/qemu-$target_name" ;;
-- 
2.33.1


