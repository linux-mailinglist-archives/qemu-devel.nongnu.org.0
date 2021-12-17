Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E63479552
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:15:56 +0100 (CET)
Received: from localhost ([::1]:34292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myJdz-0007DN-U1
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:15:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYm-0005zx-CV; Fri, 17 Dec 2021 15:10:32 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:33149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYk-0001Ke-PB; Fri, 17 Dec 2021 15:10:32 -0500
Received: from quad ([82.142.30.186]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N2lzA-1mUMXO1t4W-0138e5; Fri, 17
 Dec 2021 21:10:26 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] checkpatch: Do not allow deprecated g_memdup()
Date: Fri, 17 Dec 2021 21:10:19 +0100
Message-Id: <20211217201019.1652798-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217201019.1652798-1-laurent@vivier.eu>
References: <20211217201019.1652798-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:n/0qUk+ExpCi1UzF9vwS45WsPPf2mwPWWO2GJ9rfDGfVjQqWMPv
 t6QsnZSNduTTgQzTm0Kxe6rOkaGJbxgjZwmu3D/+7jlTUmUNuf16DNr33VSY81/ldFEO0Hh
 HnGdOcK4YqQsE+lIEScWenWNdi1uIPuXGsle4NWxAaurJz490B1Ys32sbA3AL1sMLBVPDpN
 7lT1tKlVLPF8n0mlEgUOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:swnoLcIIHrc=:B+upXRvFACYoJr0Z3Ffkxc
 be4ez8vZNZ09q9IaDUZsx1UQRVw48yBYIm2ip4FCBnDHtNwfYMSkalMuMZyFsR0jTGZhrPt9n
 x4F8VYWrKSK0g8aXtGvxKsLSFBT1To7fHbMLtFLWfaBd8Ugzj49jhx84+3GCtNzeYWNeVKQss
 xNThTOOJxQK++I+sBE388/ptpbW2v6x8k6porhjlA3HhxcHtLTuo3CBLA+m8mxpipbkhY+Iqf
 NPf/pGK6KWZGkfvFQNumI2Yly4+3Uh95XrVexFyJneH1G1I5hgLLcgrpZis2sJM1XfFLIdT08
 GUv4yf4NUUoRA0oC2B1AVCMAvTfMEm1bvL01futC7ETLkeY9TxLxpBvTKdEms3AFFMNedXVxh
 X6wh5Z1pVhCDfSNlie03SUIDV6kb+GL7BStvx7g27TDWufNZ6K/rn0zJnjmssU5rH2ghrOQ/K
 kBLykbR/u4kBwkN45XawjTdWFOkXOKGBKQ0FdAZw7/NJbP/C2xJb6IpX2FRNGEpuavPw1kn1h
 vTuZycn9+knKjGRP7l6RmnMBQxMH/984zQKn97/XEJZJyGK0fw46Cb7idESXX0//jLcvNODlX
 D7zlKcMdXxttejfLJYufvS/CroNm+4ciaoAx9LWaAVQBwiDGBDJvpE5usJJCWysKHHsiZGz1d
 u3PwzsGrkC5D2rEUSOdO8+XbG+qE33MT5wOlSVivjSRGaRLac8qM20hxoPUr5LcZ6rbw=
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
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

g_memdup() is insecure and as been deprecated in GLib 2.68.
QEMU provides the safely equivalent g_memdup2() wrapper.

Do not allow more g_memdup() calls in the repository, provide
a hint to use g_memdup2().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210903174510.751630-29-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/checkpatch.pl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index cb8eff233e06..5caa739db486 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2850,6 +2850,11 @@ sub process {
 			WARN("consider using g_path_get_$1() in preference to g_strdup($1())\n" . $herecurr);
 		}
 
+# enforce g_memdup2() over g_memdup()
+		if ($line =~ /\bg_memdup\s*\(/) {
+			ERROR("use g_memdup2() instead of unsafe g_memdup()\n" . $herecurr);
+		}
+
 # recommend qemu_strto* over strto* for numeric conversions
 		if ($line =~ /\b(strto[^kd].*?)\s*\(/) {
 			ERROR("consider using qemu_$1 in preference to $1\n" . $herecurr);
-- 
2.33.1


