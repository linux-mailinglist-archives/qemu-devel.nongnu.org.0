Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC44F55FBBB
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:21:53 +0200 (CEST)
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6TtQ-0007vh-Qe
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6ThC-0000k1-5a; Wed, 29 Jun 2022 05:09:20 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:49557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Th9-0003Z6-8M; Wed, 29 Jun 2022 05:09:13 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N7AAk-1nYbix3LNk-017VJb; Wed, 29
 Jun 2022 11:09:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Zhang Chen <chen.zhang@intel.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 08/11] common-user: Only compile the common user code if
 have_user is set
Date: Wed, 29 Jun 2022 11:08:46 +0200
Message-Id: <20220629090849.1350227-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629090849.1350227-1-laurent@vivier.eu>
References: <20220629090849.1350227-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vo5/ky3HxCpxN4GiWAWnszRGsYnJW6gcn4kq766y3yUrJqDKk4I
 Ok9IhxcCenMq7EbR5P+9CcmluxY/ESX5GPcTe96UH5q5g0Mry/zN3uZEewfGdQG/5ZD4ckS
 +VtXswVlTZKfpCrHsIoWrJCNUwNGFfwPZ56clu218QJ0NK5c3Gf6Scz2NhC0iw6ALf1yJL0
 dWFSV5PPlNefU5y5Dd0Rg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1UxnVJbY/k8=:7RyiZALtVjlhPLJi0D1xvV
 sufY/llIy2vCvCtofxt/eJO7RFNWkC9sYC5se5oR3XdWeOkjtafNdLREtzW5u0YHNCum9Cyfu
 FCQ9Y206Kw7wHZ8GIVSune8DPV6Kn0cPcamJ6osHU0reg7BMq88LtItRNYJTJ40/kaOi1Xf8W
 qc/+GpQDzCO57eUKueSw/T0X0iqsmlKGYGKdrkXtFB2xBk5uG2bQxpapcRpls5rdAawz3UOE6
 UVPds7T+VQTLwIALRFHCdB2aXPQ3H/cHp7Bul2Kr2LQnCuL4FPbp24nviTAdlKvwq+LT893a9
 B1aMuoouWgC6NL0YGT5MkbFGJsPfT0lLAUdqzM4If/YphSMt97qJwhUj7YmpD7P26bPEzOXaQ
 7x4zDLjy9ywn9OksmSurmTWSROFVCFCdBm1EA64SGu+1ukiEQX6z7PqIRp648DFAIjPEa265O
 M9HT7fjuC7nMNerEyAZp1LJgNYJUXJheNw5iXpQKY6igqjw3Ye8UnlsiY6fABrimJf72wSWi5
 cUHXAIVuv6ZmW7HzUzg+HdmW071OS0Uejxf+85WLD82jCcdi6iXvbK+LFA6gjyuz3KuPdl4hl
 wR7d6Xvgn9SLDgGRav315slZ2Ip8XDcAm7elGP6JvzFx+OB9lS7Rj94GrL8a+bBdUfumNC/4u
 2TlEw85DDw18DxY4gib/4/kbvTlvUYc5n9buL6IrIwm40K0Auhcwgx9bKObcILl3fHXM0zxIQ
 ImF83ts/l5wHUCKvZfaHmuHd1lI8ASr6kSeq9w==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

There is no need to waste cycles here if we only compile the system
binaries or tools. Additionally, this change is even a hard requirement
for building the tools on systems that do not have an entry in the
common-user/host/ folder (since common-user/meson.build is trying
to add such a path via the include_directories() command).

Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Message-Id: <20220622140328.383961-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 common-user/meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/common-user/meson.build b/common-user/meson.build
index 26212dda5c7a..ac9de5b9e3f5 100644
--- a/common-user/meson.build
+++ b/common-user/meson.build
@@ -1,3 +1,7 @@
+if not have_user
+   subdir_done()
+endif
+
 common_user_inc += include_directories('host/' / host_arch)
 
 user_ss.add(files(
-- 
2.36.1


