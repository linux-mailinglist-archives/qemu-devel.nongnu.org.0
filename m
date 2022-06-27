Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0688355B5F6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 06:12:46 +0200 (CEST)
Received: from localhost ([::1]:33510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5g7B-0005VL-2r
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 00:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o5ftG-0004tc-En
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 23:58:23 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:42516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o5ft7-00086C-BM
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 23:58:20 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so8192376pjz.1
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 20:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=so1aZRcDpyrdxlBJDv3CBb5TATsqmUYPZ6aYDaBQuyc=;
 b=YL8DEq0V/gw9CQhl3Ds2FL2MNZsumrkI+fAT4qnJM4W75SDxMrcPW62e8esakHJ1Z2
 uZwwZk9bph+1iFHYLmMFJxI6dZRNU4tcoBgw+CHTpBHSN+NAHCjuCYOGtBzunR0D7jU1
 tIDH3vnWP4YrhIBnQaFo/KJUiSTVaQRqM0cWHv7fi3GzF9/h6scK+kNAH7d2IPC7G748
 Vzh+nwKwPSXbtLWIYinLwK0mnMqY0E8JDc4FbzvR+2ExaQSq+nCf9AtVGVo/wEzVQzmC
 Ook6Hyj/YonV/I6HOFR3PNcbTQ8kfu7+g0awvV44wFZNGSFyF2oJe7FjSpoD+kGyA/8P
 FtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=so1aZRcDpyrdxlBJDv3CBb5TATsqmUYPZ6aYDaBQuyc=;
 b=so/81GEIoC3DtsPlVATIGNbBZd8k1KYFS78gPo7c3ju4FV/SW5T6wMjSMdZnpZd+bE
 YgXBeOqNtu3XLCtHlokHij+ouyqswGfXnFdyPy1SMJDjbUd9x8gO7CIWxwiHqnprod9T
 A0gDPMpuoXic5JqekoiNfxeIe20vwWJqBVclnD8JwZ7Vf5W5rGCwW+Ck/1uH2CC9nQdE
 ZKvhccw8ONYdHPDLadu/mXALC4ESuPH1Gw/1T5bNiGZbqiATV8rkc9+AOqiwrpRLADdl
 bMncmt2u/y0QnCGOZzcuKfUDNlC767h7TeZPwmZ1y3eGvLFrBUWOLWcAXyXad2xMz0P4
 Zh6Q==
X-Gm-Message-State: AJIora9TMqxX90sucBwkzMXTqYRK0Xz8bYbCfulny+GMh0mA55bLsf83
 FCsq4wjJBfFjeXYaYRV15XQ=
X-Google-Smtp-Source: AGRyM1vuwURHBvG4brp2YcTIok5muGisQcR9N+Kpki4sXu4xOqCHC51WGhBa4LPsc7Nb7EKZS1bRCQ==
X-Received: by 2002:a17:902:ec91:b0:16a:32fb:49c5 with SMTP id
 x17-20020a170902ec9100b0016a32fb49c5mr12401164plg.157.1656302291252; 
 Sun, 26 Jun 2022 20:58:11 -0700 (PDT)
Received: from localhost.localdomain ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 a9-20020aa78649000000b0052531985e3esm5951314pfo.22.2022.06.26.20.58.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 26 Jun 2022 20:58:10 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v10 4/4] module: Use bundle mechanism
Date: Mon, 27 Jun 2022 12:57:44 +0900
Message-Id: <20220627035744.23218-5-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220627035744.23218-1-akihiko.odaki@gmail.com>
References: <20220627035744.23218-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Before this change, the directory of the executable was being added to
resolve modules in the build tree. However, get_relocated_path() can now
resolve them with the new bundle mechanism.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 util/module.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 6bb4ad915a1..8ddb0e18f51 100644
--- a/util/module.c
+++ b/util/module.c
@@ -274,7 +274,6 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
         dirs[n_dirs++] = g_strdup_printf("%s", search_dir);
     }
     dirs[n_dirs++] = get_relocated_path(CONFIG_QEMU_MODDIR);
-    dirs[n_dirs++] = g_strdup(qemu_get_exec_dir());
 
 #ifdef CONFIG_MODULE_UPGRADES
     version_dir = g_strcanon(g_strdup(QEMU_PKGVERSION),
-- 
2.32.1 (Apple Git-133)


