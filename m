Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024BA1091D6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 17:32:40 +0100 (CET)
Received: from localhost ([::1]:46298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZHHz-0006fC-Jl
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 11:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40559)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iZHGA-0005hH-9Y
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 11:30:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iZHG9-0007xS-8S
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 11:30:46 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:55311)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iZHG8-0007wr-VZ
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 11:30:45 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MeCxd-1hzwlr3lix-00bGpe; Mon, 25 Nov 2019 17:30:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] linux-user: fix translation of statx structures
Date: Mon, 25 Nov 2019 17:30:14 +0100
Message-Id: <20191125163014.16789-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191125163014.16789-1-laurent@vivier.eu>
References: <20191125163014.16789-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g5ZWpo9OPUH5+ITwd/2wL7VDYH+dY1Eu47se5nnHjkHoyZLutof
 rrLiCGaB2g0Nop8S+dEP1sNFowwnlMuyMphWu6LaG1BZMXexQoJADLyG+6JxXIt05J6orv4
 0EEdEF2awCHkdBoYwYqLeN4xenjTFli1n6rM51BtejrFIc359jL/TXcNmDZ6XVZbIfgmGZr
 kyjdOsKvTZv6eFmBmnAQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ayHm7Gp1fFI=:Xh6D8OWmnhQbOy0GY0thSP
 16dVkxRKcsDF/fSI9dm5TxPXNC0H/Cg7WKVeVxHPJS6Zyy4jUVADgQWefet3n0Hk4O72o3xzt
 2EMSHGWpOAdaFoHxSCIZub4pg+yU0ym+/nLgwdk2CqvxZxD4NZJukWv7SGJB5aEpUYWoDTfPK
 80KmozCQyvUWs6iUeELTWD30Vvm5EUSjlmd3n5PcSm7uqI3p73O80Iie2DeaLFePFHytcbx7s
 du9AugALdbFn5G6+uiuzhVr0wdxHN3wgGjzpUl2/nCFl00pipQCgMLd4xUT6YUgeO9bpZHvVM
 X0BqgXsbDfKlahRvua4ZBTJThXv/VIziN2ZCrFsoJ/TgfyQvJEGGRiJxx26TfgJfQGSCAuwMH
 2/tK1h7u/jX2btUaGM47AXENYRrzLaqu36yCj237fcgsOXGp3ROGVBebkKRT0Cqfn4j0agT+B
 eYyoftyTkyCKxFkVQE+NzWKEaGwWxGIlD478MNOueUmfwIIllWF6nlFcMkTZRNiZGL52qqyaY
 n+uCzKEpjAyEH5pokOMr11S4nUgsITF0434z/AwsDS04fT4WjsJiLsDCQ0hqjnEz7x10Nt29x
 wROYl3vGR8ItGs11rgurti/u+eVrJQLs5DMk20dggMiGpu3Ic1aM7gcELYv8kJHRWqCpGwwlg
 buMLjeE7139B+1C1C1Va30pAoW11+XMy48SScNZotAPmHs3GH+OoFnaW3GeV7f1kGAqAwpsa7
 0iiHGwVrC/n2Omehj7WS6iA05uefB+T8N8rFgDKhHF54gWyS1dSHZlha4tMoujsn7hsLV9JFH
 VAzp0/eQ0qehWaMxGsOA3mFqz1hBf7DVaFAjy7DP/Rxi0Kam41fcs1/+YU7BoRe4OOsBGDPNA
 B1VW6zD2TVfeJSEIWbwQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.74
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
Cc: Aleksandar Markovic <amarkovic@wavecomp.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Ariadne Conill <ariadne@dereferenced.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ariadne Conill <ariadne@dereferenced.org>

All timestamps were copied to atime instead of to their respective
fields.

Fixes: efa921845c03 ("linux-user: Add support for translation of statx() syscall")
Signed-off-by: Ariadne Conill <ariadne@dereferenced.org>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20191122174040.569252-1-ariadne@dereferenced.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ce399a55f0db..171c0caef3a1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6743,12 +6743,12 @@ static inline abi_long host_to_target_statx(struct target_statx *host_stx,
     __put_user(host_stx->stx_attributes_mask, &target_stx->stx_attributes_mask);
     __put_user(host_stx->stx_atime.tv_sec, &target_stx->stx_atime.tv_sec);
     __put_user(host_stx->stx_atime.tv_nsec, &target_stx->stx_atime.tv_nsec);
-    __put_user(host_stx->stx_btime.tv_sec, &target_stx->stx_atime.tv_sec);
-    __put_user(host_stx->stx_btime.tv_nsec, &target_stx->stx_atime.tv_nsec);
-    __put_user(host_stx->stx_ctime.tv_sec, &target_stx->stx_atime.tv_sec);
-    __put_user(host_stx->stx_ctime.tv_nsec, &target_stx->stx_atime.tv_nsec);
-    __put_user(host_stx->stx_mtime.tv_sec, &target_stx->stx_atime.tv_sec);
-    __put_user(host_stx->stx_mtime.tv_nsec, &target_stx->stx_atime.tv_nsec);
+    __put_user(host_stx->stx_btime.tv_sec, &target_stx->stx_btime.tv_sec);
+    __put_user(host_stx->stx_btime.tv_nsec, &target_stx->stx_btime.tv_nsec);
+    __put_user(host_stx->stx_ctime.tv_sec, &target_stx->stx_ctime.tv_sec);
+    __put_user(host_stx->stx_ctime.tv_nsec, &target_stx->stx_ctime.tv_nsec);
+    __put_user(host_stx->stx_mtime.tv_sec, &target_stx->stx_mtime.tv_sec);
+    __put_user(host_stx->stx_mtime.tv_nsec, &target_stx->stx_mtime.tv_nsec);
     __put_user(host_stx->stx_rdev_major, &target_stx->stx_rdev_major);
     __put_user(host_stx->stx_rdev_minor, &target_stx->stx_rdev_minor);
     __put_user(host_stx->stx_dev_major, &target_stx->stx_dev_major);
-- 
2.21.0


