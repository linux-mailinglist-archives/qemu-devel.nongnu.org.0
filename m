Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DE6492761
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:42:05 +0100 (CET)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9okP-0007Nt-0A
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:42:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbe-0004aa-Pd; Tue, 18 Jan 2022 07:28:58 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:33739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbc-0001uy-Pz; Tue, 18 Jan 2022 07:28:58 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MFJfN-1n7pgC49wf-00FkCe; Tue, 18
 Jan 2022 13:28:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] linux-user: Fix comment typo in arm cpu_loop code
Date: Tue, 18 Jan 2022 13:28:44 +0100
Message-Id: <20220118122847.636461-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118122847.636461-1-laurent@vivier.eu>
References: <20220118122847.636461-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9Sc1dsPggki8oCQV/stELrG0WWdFAZR6OrITScov03rS0sg+LB1
 3DVM2jASnUM4HSVNclCIQOzWU042+FWraeGPlhpftGBHYLgba9Je2Yp59hWkSNibEIZQdi4
 oG0mozj/xeCh+MXy0Jl6j/9+tbbGLQm1MAd7RiyvDvyojS0A0SSJVlvT0ZUOdzSHklG7qET
 DLf8WoGXOgklSmd/kjttg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cj7vib6NnAA=:UKcKDejVukRreBu+SWx8fb
 Nw0OsbCY4vNXbjefyCRWbI9IsUH14yf+xB/1TqRmQHPsVsGigs/WooayH03HYn9zOiapn2wqs
 /HErHrDGMPMascDp+pM/9B5/sYmF7lGerLZITdkLMOTp4IK1T1HIjKD6upksxpt7Ht93rxgL8
 aHkocoWTUEGLJqr8IsEtrXiEgLcNlVvcdmqcRbe0GZ3Bv2xNzzUc4tcARIFIK7YBJ7sd0fmyY
 FCPP/tjizar5XESl2ZVFLx10sgV3RDuK2CSZbPBryHk//lLjuPRgWyfb7KrE4nscR7NeACdOP
 4f9t+pZjPvLcT8gUB3pjIgsUsOglhaMKqx4ODHvMRSbOMzUIBajHgJ/UoJrc34dSSjUa6MHaJ
 eT1wcV8ZjFReFmWytt9dSep6SajPmMENd3BrQjzr28QDEiPtCflNzi/XGyK5dF27OkBga8/1S
 AZMsA8qhRAQ/GobKR6gsxI1wXb6KK5DfpmTDXH2w4l2xk21bIaVFDsJycAtGXZe3D6IWra2PH
 baO9qLu8XpDolnZSRdztvCQ6tQ/D2LOM25c2ZWv6e8NgTk1C7NKzHy9nN9Iv/HW7O1A7FNkxT
 RMxYhM1Y/S8W8d9vWI+qkWSpZOt40CVhip9uDPQksmkrgwOSfBbIC3UTYGpwbFMMEQP0nNHNj
 d1aRJHC39trpx3jHhRiDtyuz2pG/hylQogDNVob9BL+Bjy6wS0FUXdOXL0/iJR5HE1iQ=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Fix a typo in a comment in the arm cpu_loop code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20220114182535.3804783-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/cpu_loop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index f153ab503a8a..032e1ffddfbd 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -434,8 +434,8 @@ void cpu_loop(CPUARMState *env)
             case 0x6: /* Access flag fault, level 2 */
             case 0x9: /* Domain fault, level 1 */
             case 0xb: /* Domain fault, level 2 */
-            case 0xd: /* Permision fault, level 1 */
-            case 0xf: /* Permision fault, level 2 */
+            case 0xd: /* Permission fault, level 1 */
+            case 0xf: /* Permission fault, level 2 */
                 si_signo = TARGET_SIGSEGV;
                 si_code = TARGET_SEGV_ACCERR;
                 break;
-- 
2.34.1


