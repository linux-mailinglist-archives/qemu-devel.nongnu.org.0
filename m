Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0F44968C5
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:33:10 +0100 (CET)
Received: from localhost ([::1]:42558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB4L5-0005tj-KF
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:33:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB4BY-0003db-N6; Fri, 21 Jan 2022 19:23:17 -0500
Received: from [2607:f8b0:4864:20::1036] (port=38861
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB4BT-0002IG-RS; Fri, 21 Jan 2022 19:23:13 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 d12-20020a17090a628c00b001b4f47e2f51so11860205pjj.3; 
 Fri, 21 Jan 2022 16:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UKZAFvJiBwJ053eAdNYYvJqZVgfO9npCRqUR9ReQ2mo=;
 b=gGbgTDNQ76uRlUlOU04EooKlMN5BQSzWcWlxqcREhQn+VnzNdOokWOgOUY1ijIXymP
 x+jz7jOq+tjGfnJi0wFKcyYy91pxLaiMsDnLQm+1MJicSmkjA5GLCG6hcqLmD9XxROKK
 uPfEVGBXri3dhPhwVm1OwdXo0H9BXnlhuq3j+NGqsFoUS9IAdQ3aSp+PiFCXoh/9TFaQ
 bIxzSkINuMkVbUWCcIh9vGi02KIBx6DxuWMDm8DiVkHBjOYOUp+TaU3DMniTIQiJfgR9
 vFDZy/Ik7dX6IUAZ1sUNuwhnKt7j0hE6uyo2r07VQ9SzFVd2kx+k9AzQWhKry3KSC7Qo
 28wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=UKZAFvJiBwJ053eAdNYYvJqZVgfO9npCRqUR9ReQ2mo=;
 b=CE9A7bPrVpAqhhmYil2Y2VE0LtSszt2SJ0NafQrMAQa4g6l5mXbpXY4XEXTcCzFXsT
 0jCy0tw/8Qva6o3JpZ1WgRoMGdf6xC4eqfB2tL5tVrK9A6RG8qA67mMHRgkgfKQwCceG
 1/TVc1yMAwl1zq/XPuHFgJkK6mTtb+jJ58FABMt37JR9XER/x3dNy2jWjs0+pQ+9BXTT
 h125ASMimleXzE1xghHspreGxBvNrhxGj15imG9BDSRO24KVSv3FxUxh1VzUSgGdplrb
 YMH1wnLqvBhoZHt2CHaa7ok5xs20tVzbde0hrJPwmLCNRJ2qBFlin1pAIG92j0zf0c2G
 I95Q==
X-Gm-Message-State: AOAM533yEx9KTYxOiomrb8xUnD6X3heb6CQTjlthdghuXdrGIQaPDYJA
 6LHd0TEFf9IBLSWi6SQC/eJTFEktDJo=
X-Google-Smtp-Source: ABdhPJwPaYnvLS2TfxXcgf/ViAVCAUF3FNESC9Yy0xvicnv3lpkZ90w7BcieKuR6M73tdfAjlqwcSA==
X-Received: by 2002:a17:902:7297:b0:14a:9df9:6424 with SMTP id
 d23-20020a170902729700b0014a9df96424mr6023869pll.19.1642810989759; 
 Fri, 21 Jan 2022 16:23:09 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id oa13sm13613291pjb.33.2022.01.21.16.23.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jan 2022 16:23:09 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] target/rx: Remove unused ENV_OFFSET definition
Date: Sat, 22 Jan 2022 01:23:04 +0100
Message-Id: <20220122002304.84016-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/rx/cpu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 657db84ef0..58adf9edf6 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -116,8 +116,6 @@ struct RXCPU {
 
 typedef RXCPU ArchCPU;
 
-#define ENV_OFFSET offsetof(RXCPU, env)
-
 #define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
 #define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_RX_CPU
-- 
2.34.1


