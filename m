Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21713FB5C3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 14:18:13 +0200 (CEST)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKgEu-0007aa-VU
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 08:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mKgCc-0005bZ-Db
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 08:15:51 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mKgCZ-0001KF-Lh
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 08:15:50 -0400
Received: by mail-wr1-x432.google.com with SMTP id x6so13905992wrv.13
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 05:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mRZAyUANStAU/jLFyUI9w/uXXddpmlTi8fzbECdo/Jw=;
 b=lL/4aGhDV5D75vSDm6bz0Gn9b4owUNlNG2eI+jvBXSqsTtlsne3fB5nx+evpNVFMiK
 E7TIOq5wFefASdq8nf0XBEMnTtUxhW+ADpqWhz9H5PlCPTRPxc1Wqa8PhAe8eR3X/ZFA
 a3RtoZUtezMtOaeO/hvyk++P4epWF46J4Izm+dJhD1EY9850HBgOfgUazzg14QxGmqez
 XZqLETfd7+w4mwX62J2NKho5WAlznHiV2OXdqts8Omk8nDM434RG0dDQvEO0akwMexj/
 FNllCLq1wETy7B6KKuiJ3zmYetPJWadw+X+e41sc9NQKuVeNiM4yaFg7vr+ROLADds8s
 H8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mRZAyUANStAU/jLFyUI9w/uXXddpmlTi8fzbECdo/Jw=;
 b=hEDUNAGuTj8Wg9cve2ZpIKOrW/EHnyVRFFUjfytDrhpoH8TaRQHAO9jULnwaG3Bhsq
 Ena+2MjqO50XMTj4GwC2Y44OF4Git0JEa5iqPNFH8fbjSbW1Ezm0565A1bopc36yhzKA
 VMliEBIm3tT6BTHQm9WuzJ1CBPSu+o3OUJa8wzGLcM6WvP/kDIxi2j//ZlOXgqWTvy2b
 IYINvAdXM99a8kzdvS+UKfahIhZLmVuswTHON9gGrFVZCdht7syrQv/f+lemuVXX0wnV
 LJkUrYVu4iK5Kriiv6L3OABOXFpo70PayR7GP41uXp+tvMw0J2l4MxiLgr3Bao0dwTqZ
 Wy2g==
X-Gm-Message-State: AOAM531CYwqeVZ4BOA9kXs198nGO/hE46UU1j4YO2he0v7mZNop5Movw
 eMhuK4qgkKAn7ERSWdJpG+WIcSlPSoQ=
X-Google-Smtp-Source: ABdhPJzI1Gxvk1Ftr/N93mhBW1vb6nue4xz6tTE1XmTXnpGuBwqefPxyzD4tyk06BVNRKpkYIS6rqg==
X-Received: by 2002:adf:9f05:: with SMTP id l5mr24954662wrf.188.1630325742785; 
 Mon, 30 Aug 2021 05:15:42 -0700 (PDT)
Received: from localhost.localdomain ([197.61.134.204])
 by smtp.gmail.com with ESMTPSA id l124sm15001426wml.8.2021.08.30.05.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 05:15:42 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/devel: be consistent about example plugin names
Date: Mon, 30 Aug 2021 14:15:34 +0200
Message-Id: <20210830121534.656559-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some plugins were prefixed with `.c`, some were not. Since the name is
essentially the full-name of the plugin file, it's logical to include
the extension.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 docs/devel/tcg-plugins.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 047bf4ada7..f96aad4ae7 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -286,7 +286,7 @@ which will eventually report::
     previously @ 0x000000ffd08098/5 (809900593 insns)
     previously @ 0x000000ffd080c0/1 (809900588 insns)
 
-- contrib/plugins/hwprofile
+- contrib/plugins/hwprofile.c
 
 The hwprofile tool can only be used with system emulation and allows
 the user to see what hardware is accessed how often. It has a number of options:
@@ -345,7 +345,7 @@ which will output an execution trace following this structure::
   0, 0xd34, 0xf9c8f000, "bl #0x10c8"
   0, 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM
 
-- contrib/plugins/cache
+- contrib/plugins/cache.c
 
 Cache modelling plugin that measures the performance of a given cache
 configuration when a given working set is run::
-- 
2.33.0


