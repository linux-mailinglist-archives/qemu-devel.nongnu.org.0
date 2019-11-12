Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559A5F8C7D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 11:09:18 +0100 (CET)
Received: from localhost ([::1]:32842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUT6r-0007NU-5v
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 05:09:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53715)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iUT4n-0004lp-IW
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 05:07:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iUT4m-0003FE-Ig
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 05:07:09 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:48959)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iUT4g-0003DP-By; Tue, 12 Nov 2019 05:07:02 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MILru-1iip1u0vUC-00EMBo; Tue, 12 Nov 2019 11:04:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] ivshmem-server: Terminate also on SIGINT
Date: Tue, 12 Nov 2019 11:04:29 +0100
Message-Id: <20191112100429.11957-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191112100429.11957-1-laurent@vivier.eu>
References: <20191112100429.11957-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lCdy1/ah0HDEBjmlm8KfY2Kri3NDqzdrhbdMmkirTMD8Q241Yy+
 kOMsT65UfB/3jxREvRcwDw7V4uLVkqBaXGhxLk9V471bqaFEzwl8gMsgDz2p9/2QN4Xj34O
 Oq5T4xpd13/C+CsAGdYIPamYPPd7/uEdn9JKIKasJ7XT3w7CbEvL9+Wg6vSncFb9bhGXz4X
 yVsio5+nEL+cgE4SdJ6pg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nT1R0aW2zw0=:O4k4rXb9MR9LTPv9YHBj4s
 b4x5FJmGzhdxoUZiZZDrP7+gyKr88c3Ig01yAtSBXdqXcgQlukE+/UoW4mHQQ3Y7UjWgLfJvQ
 UsFk6wYYpuWTg/71cV68IVzTSFSAtQj8667WL2XzgQ8CJ1LtQaoFlzSI72i8MmthitoOXAUzd
 XMKOgt72E0Nq6xo2wOYMJfCRuqbId03vDxjyNcI+KT+bVvmS4mtqYYST0g1iMvZG/M+UT2zVQ
 6UFtvfIoeVnYRh4u62KhHo3lgWLqYybbWgtDp0n1T1gbb7tlnXgbgH5Pa0gvChvGv07cqXdNC
 x0ahzoDwiueTt2hUpl6wH031/YiSAK5Xor03kBah1NyHrwx4sO06HnhQWWZj7GNKlOGAozQta
 rPkQ5foSAikwhUsf9ButLiKYMOYEJJfQP5RXwmoP0CjIvjPxJdecULMmBFiHeEAuVWGE+83km
 gBQPsIfuVEv1v9B32tXmeiLtFADfpTRM1cnNgIuDNwX+YIK2RatG4OQO4d8kGhppSqnrs8T0O
 hY5xijT90G4D0cqR07lnVGP/cqjsCV9vssEaRZ0I0YNWopaUSdIDZ4yQleKyv6I2Jo3PzGfji
 ADw7e8si9ehBJfxkvdA6mXXIBHwcl1qzcT84yrHxB4JUCxnIwDx+wko+nfwbjGzE9T2vBTUHl
 xoqozdn91LoSvFCc5bAUJP6xX2Yf7mlPYmRbZqmoXwDLbHmbpw9mUfMNsA+SXlwcl/cisM2cJ
 Dzoju9spqmcPE/RlA7bXBVE0CuMgGzkcAMQH7qM9bFDKSBEOp3U7oJlkgsci3nFmwgiYUw8Kx
 ssE9N1bAGZeVTx0pzsp1gBX8hUK1ZaY5OPDTEra4N5Z90kzvG02nNBchJeNjXEUIPxUZPfgOa
 ooKQAZzZSmpeeP1cjh8A==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.75
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@siemens.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Claudio Fontana <claudio.fontana@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jan Kiszka <jan.kiszka@siemens.com>

Allows to shutdown a foreground session via ctrl-c.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Reviewed-by: Claudio Fontana <claudio.fontana@suse.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <99c1a7bd-1876-66a2-4b8e-d5bc86116fe7@web.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 contrib/ivshmem-server/main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/contrib/ivshmem-server/main.c b/contrib/ivshmem-server/main.c
index 197c79c57ec2..e4cd35f74c61 100644
--- a/contrib/ivshmem-server/main.c
+++ b/contrib/ivshmem-server/main.c
@@ -223,8 +223,9 @@ main(int argc, char *argv[])
     sa_quit.sa_handler = ivshmem_server_quit_cb;
     sa_quit.sa_flags = 0;
     if (sigemptyset(&sa_quit.sa_mask) == -1 ||
-        sigaction(SIGTERM, &sa_quit, 0) == -1) {
-        perror("failed to add SIGTERM handler; sigaction");
+        sigaction(SIGTERM, &sa_quit, 0) == -1 ||
+        sigaction(SIGINT, &sa_quit, 0) == -1) {
+        perror("failed to add signal handler; sigaction");
         goto err;
     }
 
-- 
2.21.0


