Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25F35846D7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 22:13:59 +0200 (CEST)
Received: from localhost ([::1]:40786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH9tO-0001Tr-H3
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 16:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oH9rN-00088c-5M; Thu, 28 Jul 2022 16:11:53 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:44587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oH9rL-0005LV-Ms; Thu, 28 Jul 2022 16:11:52 -0400
Received: by mail-oi1-x229.google.com with SMTP id bb16so3594944oib.11;
 Thu, 28 Jul 2022 13:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hiEjRFlAgoccjxp61aUxpMG3U9muC5EC79x0NFbjkGA=;
 b=R3i6WMa7algu6EIe+z6MB3pPPvrqTizE3Xt02OcZgW4Eq6HBEpw9yBavlGudFaXFoR
 JEOcP3rJUQtm/ayzvix/y47HrFr+YdOuTGC9EeUw7N08RKZK3jHvsaUF2zXSScPRoXqE
 SZB7cVsaZgUyjTLGF9+UU6y4oSm/mYX5sVRkY+fH2/NdIsFieCqje3CfSpi5VbdWYSZ2
 gekVEOMB5ier3HM+A1qxyv8R2QwpfSikeoVSoDfUFakMxQ8bWow+uuMqL3rulhtJdYF4
 UOOwL3NH3DBYHKRpavxNOflW9MdEgb00ipbzO5wJ692gRtomPLh4YR4X+eJuyfLugDii
 M3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hiEjRFlAgoccjxp61aUxpMG3U9muC5EC79x0NFbjkGA=;
 b=fkab7/DpCCsIdPJ608OVUpuccy0E11hbB0IRJAZF/fzihuvy7zDm+16nBGa8/4xrNn
 TF5KcEhFv8CtJUkBTOyKn8kZLSODR3n0iBBfeg1TL0viLxCLnoeDchu7fw9Su7y0hWGM
 46KfqJKXr+kcjGKSfJtBrL3AQ6wDy6T+cQZ0CWP3WzTKftxxl+5CLdm0FfTw7WODEUP9
 CMfeCs7KayhKNnyteSn1Lzj0n4JZMUeLUg9p+KZJWgztvLK7defCK6A14wzu+ZnIe9n6
 iOTTYnz5LM9KBFKxdYo4UrXLmWCymziSJDWOEaseam/YZD08DJuT+vatoF3ihj2rBtag
 IF0g==
X-Gm-Message-State: AJIora/mMGKE8tPVRFQHDBAtZlfemaktmmIw6Md48REfL8VhCBKLFtjg
 /qJFmQQNJdzbrI9P03MbHJo+OaFlq/w=
X-Google-Smtp-Source: AGRyM1uTNgBSEl9ELlCkLsMSPPZt3fPaMq+EzJARj/gKlTFtOBtynjMfS+Gs3b16b98tUAFTqGQ+Fg==
X-Received: by 2002:a05:6808:1586:b0:33a:b957:4491 with SMTP id
 t6-20020a056808158600b0033ab9574491mr492998oiw.288.1659039109451; 
 Thu, 28 Jul 2022 13:11:49 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 o14-20020a9d6d0e000000b0061c4a7a37fasm677434otp.41.2022.07.28.13.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 13:11:49 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH] ppc: Remove redundant macro MSR_BOOK3S_MASK.
Date: Fri, 29 Jul 2022 04:11:35 +0800
Message-Id: <20220728201135.223-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.36.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=luoyonggang@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/ppc/excp_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index cb752b184a..7550aafed6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2015,7 +2015,6 @@ void helper_rfi(CPUPPCState *env)
     do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful);
 }
 
-#define MSR_BOOK3S_MASK
 #if defined(TARGET_PPC64)
 void helper_rfid(CPUPPCState *env)
 {
-- 
2.36.1.windows.1


