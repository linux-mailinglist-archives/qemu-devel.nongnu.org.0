Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D062428C8E9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 09:02:06 +0200 (CEST)
Received: from localhost ([::1]:58778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSEJx-0006jC-Qx
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 03:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kSEBg-0005EI-9m; Tue, 13 Oct 2020 02:53:32 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:38177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kSEBe-0000Gh-Dv; Tue, 13 Oct 2020 02:53:31 -0400
Received: from localhost.localdomain ([82.252.141.186]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mwfj0-1kHqwf1eDS-00y6HB; Tue, 13 Oct 2020 08:53:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/15] target/sparc/int32_helper: Remove duplicated 'Tag
 Overflow' entry
Date: Tue, 13 Oct 2020 08:53:11 +0200
Message-Id: <20201013065313.7349-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201013065313.7349-1-laurent@vivier.eu>
References: <20201013065313.7349-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KXZZ2TrB0nnRLlFeIy20mAe1kBtwpCT7gfXkKzlt86gfzs6U1i9
 lwCgEtVEQm/cKH46IlKMpxcWBR+Y6YyzO+a3hjKCyYaAR1s/rGFTxPWZe4SsjyPU1y7LcVQ
 Vds+6qHzSTbAux3neqv6amPuBTwaqaTBofSj7rDw+/kXzwCVcxKd2gJxQVwlXXJRlcl4CYF
 4zn02ruqoh9iLJVE1D/Wg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IU7tJzsiB6Y=:QISINX6YZvUjxGSAZd1wZh
 f8EIfB8PybvPTFAty9Kd5hG7P+gCGm00JDTeJdpheH63NcF4Yop1MZkmQ0sr8kpgAJinspGFO
 z1eI3KanasrYr4DxyzVC4fFSmMfIGjmyaBrm0TEa47OPPl1YD6q9ZVtYJlit/iVYmIuVtE5Gr
 W9kpOQSvJaQDkHApOMwTpYE+uzSDOVk0AM90ecV92MlqxNyclVvmpnYw9oGRwcLoshoULvBPW
 XMcuufN29LKTDNtcPA+EN1/5T0bXCPGKdbyCr2qra2gHCleC29jFknSbwUxwhUYNCi6QKCsw4
 9dI+dCGVC/DUL7Qn8e7B9t0wH1WVQ8cCw0bylroSNgR278GqxaqAWa9r0YAxUkZX9fKvKPjgz
 I7roviLSecVsomMC7jpOi5r/mxFsuF1hJnqb1ug+tba99HqNo5sQLSiJrYKWO+SkMrTjTTVXu
 qK2vNaErPh+HKrIzWQUBVQgTzIxrHhY/v6pKzsgliekRva7EsSGObLgYekSoHm+ka8ZSv/s6/
 7rsOGeIS3aAgvBoYFH2RXEl/XCgpF96XkUfWhxPWuqcgo7KU6OjC1hTPEglcJcSbS/U0pacpN
 bd9AV36J6cqMGjwHlMXn+FGkH4PXjgpeIGUHriVn+yL4caPFYsHjwClYdbpcQza3Pj5R6HIxr
 zT09EGEsbTEQhi+2ouIQtb6byzuT2nztm8H+2hP3YEoU9nO9dEqd8BB4H88Ena6z+/Y41rdz4
 xda5zSD6uwzpZ5vixcZhp96aiOVaiJfsHUo4563JKQErvl9FIgwKpV+fFldTuDI8V80Qc2wFx
 d8BlZgJtqCxELItp+i+6we+/tmkmo04JWwmVrSbpsNHNNO5h7RZkeeQCt9Ug17si2sWIvO2
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:53:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit 0b09be2b2f ("Nicer debug output for exceptions") added
twice the same "Tag Overflow" entry, remove the extra one.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20201011200112.3222822-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/sparc/int32_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/sparc/int32_helper.c b/target/sparc/int32_helper.c
index 9a71e1abd871..ba63c739c1e8 100644
--- a/target/sparc/int32_helper.c
+++ b/target/sparc/int32_helper.c
@@ -50,7 +50,6 @@ static const char * const excp_names[0x80] = {
     [TT_EXTINT | 0xd] = "External Interrupt 13",
     [TT_EXTINT | 0xe] = "External Interrupt 14",
     [TT_EXTINT | 0xf] = "External Interrupt 15",
-    [TT_TOVF] = "Tag Overflow",
     [TT_CODE_ACCESS] = "Instruction Access Error",
     [TT_DATA_ACCESS] = "Data Access Error",
     [TT_DIV_ZERO] = "Division By Zero",
-- 
2.26.2


