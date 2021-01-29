Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3AD30870F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:34:38 +0100 (CET)
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PEj-0006c5-FS
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:34:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l5PCz-00051H-O2; Fri, 29 Jan 2021 03:32:51 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:54223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l5PCv-0002RP-Us; Fri, 29 Jan 2021 03:32:49 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MxHLs-1lto0H1vzs-00xXyr; Fri, 29 Jan 2021 09:32:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] MAINTAINERS: Update 9pfs tree URL
Date: Fri, 29 Jan 2021 09:32:33 +0100
Message-Id: <20210129083236.584238-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129083236.584238-1-laurent@vivier.eu>
References: <20210129083236.584238-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yvhI0fkZHNwhSXS/JG97y/oAuAg34XOkmIN7KWFkOGgUZ8A+smP
 P/UvUWm1rkr4Xxn7G4jkwMSpUl61N9+YIrFm6F1nlZMNZo3wuav8EL1EYU7OZsPbkGOWKJ+
 tu0YGgR8EOCeKvro8kERa2IYatJKy8bxNGx0AtCUBxtcoJ3aFHpz2ZVh1LOscNIjXFNBFRD
 +RDYm3g6RbtVYpBL3uGgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xAhx/aSGbk8=:E4A6xbHwd7GdkCFul46dS+
 /e/N80SOFzgXvTra+pPhNkjEU1gv8tLs2qbrkqVQ90SAkSRkBAIaXZGYBFxprntK80MQ8r59K
 4MmNhNW7koWLmqdu3WfYjo1GXbVXwMFu+oU4QksYYWgHACXvcD0MXsa4XQmObv+VgbAsjJloI
 qUHrRmvMADXy4XiJrhBvf+Aa/sN+4w0GYHoV/SvKi4W3SFtwoIWUNvCDXqXkMY6/MyXo1Ilng
 ta9tSKCjRaqssf1Oik83EMUMtG2sLobNSIdfvqBJ9C5Qf1oMOA3Cv6LC+CnLT9dw0tHxJg0O0
 tWTz1U/4Bj94eJPxZmXyjz6ZZSxrFFOXxfpMBOxG5ARqmDZeUfns96U4eT/8NXR/bOILDSMij
 omPhLHF3k9a70pFqJXUZsO6YH1DrpO182XZHTmT9n6TWLECd/4z7Q9tZO4VgC
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

I've already moved my repositories to gitlab for extra CI coverage,
and I won't use the ones at github anymore.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <161071814430.152031.14540382419012818908.stgit@bahia.lan>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34359a99b8e7..fbb228ef2b34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1828,7 +1828,7 @@ X: hw/9pfs/xen-9p*
 F: fsdev/
 F: docs/interop/virtfs-proxy-helper.rst
 F: tests/qtest/virtio-9p-test.c
-T: git https://github.com/gkurz/qemu.git 9p-next
+T: git https://gitlab.com/gkurz/qemu.git 9p-next
 
 virtio-blk
 M: Stefan Hajnoczi <stefanha@redhat.com>
-- 
2.29.2


