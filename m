Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736CA458A92
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:32:20 +0100 (CET)
Received: from localhost ([::1]:60988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4kM-0003oF-R3
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:32:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4bp-0001bt-3b
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:37 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:60065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4bj-000387-EN
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:28 -0500
Received: from quad ([82.142.2.234]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MfYgC-1m9PC50Osa-00g1kL; Mon, 22
 Nov 2021 09:23:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] linux-user: Fix member types of target_dirent64
Date: Mon, 22 Nov 2021 09:23:08 +0100
Message-Id: <20211122082310.377809-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211122082310.377809-1-laurent@vivier.eu>
References: <20211122082310.377809-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V8SCLv3shdtwPoBM8doLJzITV7wB1dalB7sfrFHL9Jsu4zwveix
 Jp9UCYTiEpwPBuBjMq1rpzuWrwufzJ7Ly/6Bx0tL9rOuiOYu1Wr8JDasHTmoaJFiuNGeCDy
 xW08tV0jrWFM01UZOKYw86kthvFtZo/bR6jQdm6k3GbwCJ2nXLY2Ahv9DYSCuWyjg/zI7SL
 UXkXATo2Vzj/KP/v/4HeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LznGhAElsyA=:U5n/s0gz/e19U6uwyWL+pG
 quXHKIKe7Hj/3MjxSb5o32UNEeafUUZC896YkuGj2pQbaOAaHltM+KVTZvflQuxC1UWhNALGz
 gAjK8cMIUTtmBPj6sPqGyuUONwBnuewv4jzZ59DjHy8LB5Sidw03fyKyoWWANcNw+dBdCmiM8
 SIHKzE3wcv6KVcwJ+dyyUU4ShltGRh8UOFiOyY8vH+lgErXHQYTQnoBeMADAbnR8r7KnNs9c/
 DV1g62FRn7i8u485MEZ1K6IZSsr4INi66a+LGVaOqVfsCt2oNZJG1l3sPjNK1yezo+KMgG1HS
 qRXLjD6QxHONPZPbwzTDHtZb2OnuBkjcAWG7GcyKlym1UvI/wjJrUCgdLl5dYPl7Vzg7Nvg9v
 3eomqd2gNuF+aB2YFjHwsXMESVkaoPaJ+scAqbm1v02ztkTdbY+4XgoHMT4jImDH8wEUeh57H
 diThL+Owi29NXodK0ZM63gkU5TXEO4DxygfV9MpKjIr9UkWP3ds0uXEph0AXNjrIsZfryA20U
 TpNY1BuwDYnCdGRqFlqyZ1ie7T/Zz7qUEe+vfaDQlbF3f+CAgoANNgmg4dlgfboCNqa/mUiOb
 DVIXFWroTmjUSFnQ24vUYNEVOtUy+mQwqt1WHj03VC3xzHe6N16Zzh1ilNxIWL01EvDF3m/hm
 qB7kCKQGyR1LLGTrq4Nia6l7Cr4TXORXdccoP0sUXKOz5z2P5ObdKooQ4lh6aeBBtZiY=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The host uint64_t (etc) does not have the correct
alignment constraint as the guest: use abi_* types.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211114103539.298686-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall_defs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 98b09ee6d656..41aaafbac12c 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -437,9 +437,9 @@ struct target_dirent {
 };
 
 struct target_dirent64 {
-	uint64_t	d_ino;
-	int64_t		d_off;
-	unsigned short	d_reclen;
+	abi_ullong      d_ino;
+	abi_llong       d_off;
+	abi_ushort      d_reclen;
 	unsigned char	d_type;
 	char		d_name[];
 };
-- 
2.31.1


