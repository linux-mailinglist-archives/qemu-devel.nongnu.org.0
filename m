Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98564206E2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:57:39 +0200 (CEST)
Received: from localhost ([::1]:59566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIqw-0002k7-SH
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeN-0004Bj-JC
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:39 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:36207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeJ-0004om-A6
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:39 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MjPYI-1nCNy11fw2-00kxmE; Mon, 04
 Oct 2021 09:44:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 14/26] linux-user/mips: Tidy install_sigtramp
Date: Mon,  4 Oct 2021 09:44:09 +0200
Message-Id: <20211004074421.3141222-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MF1ClMZWLH7snp9g0k31JJ4nz9sKCHsId4zVvy56P3u910pMbcJ
 sbH1OBPzVpKMblsZgP8WUVjuogAksbzQfSflwr1YTKtSxHlxwNBGNqdWqGu7nsWIURRjJtL
 UBmCcIlUm/dphBZRRU+0EeiaXCtw8H7sHTSoS5N9qtfss6XfDf6Dp5cSPRD9W9A/ZADQNdy
 QfjHfvOfhxKSy97Rii5Zg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sKq/+TSn7VA=:ldsHfOsU17GXWA4gBbTvLG
 nfDqB73jA/PIFwxKSl0Vwy4nVqIope+m+RoQOe/9WtJegYrurNbVcpm7ix+tWHv3cVih6+3tq
 UnCEMcra36o78VeQ3+FYf0X7Ay6OFWbK+0ERqM4bDP7qhBbLZSNJV5uYDYLPg5jYBDeq4dfsL
 63HIqmOlLUVhyDuWiqwaBd68QYfWctZzh0D3rDOLjNCCKH8KSjjEQKOImK9AJ3g41oMZUgXpW
 zM160BIW4yz/rXJinxH8Mfs2wZxlduGJ2JqciQ0HxqyJy6ttNB8k5T43gZhbxSreD03mOmDMJ
 94gmr8pnGJJCA/j+CUH2CMa0ULDJwr44U8COx6plimSLU3iRLfgaysooNn8GHtkm0GWXdXhDj
 BCLUOcl5lRQe8Tog/DpTwXcM8XshvVnDXQlq3NVn+H2/Ou4iGFhKV6l6B4pxjmRc2XS941k89
 sXWzU9Ch8aqKf1vbfeLXespGCWvdlB+cn/ipdn28HhNO02iyhSt5qZhrgYrq25pdn5qvKFRul
 JBFgQRiGnAtuYog1Hx1OkGFKOjAsT6Cg7/eSKeZz8IJ9FTaf9nvAHtyacjw0cnF2PHaFSbwZW
 bY9aIE7LUJOO9k0fJv2/UyaEhaB2eV43Ia071q7VSvjcVhdBoyfNlBe4Ylq6lHy7GqMA4IE83
 hK/j0PAsj8nuPn9iHCb8GPlHJylVDQyixUrYFKJZIdk9Z91501FBZ2bjSb2xqbjSVudCgHcSC
 beYQr/jLJvl70NlZ7OE2g7YabthWFvPBWAm34Q==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The return value is constant 0, and unused as well -- change to void.
Drop inline marker.  Change tramp type to uint32_t* for clarity.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-15-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mips/signal.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index d174b3453cc0..64072779b94a 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -87,10 +87,8 @@ struct target_rt_sigframe {
 };
 
 /* Install trampoline to jump back from signal handler */
-static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
+static void install_sigtramp(uint32_t *tramp, unsigned int syscall)
 {
-    int err = 0;
-
     /*
      * Set up the return code ...
      *
@@ -100,7 +98,6 @@ static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
 
     __put_user(0x24020000 + syscall, tramp + 0);
     __put_user(0x0000000c          , tramp + 1);
-    return err;
 }
 
 static inline void setup_sigcontext(CPUMIPSState *regs,
-- 
2.31.1


