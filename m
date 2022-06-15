Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0EF54CEA7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:31:09 +0200 (CEST)
Received: from localhost ([::1]:47108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Vv9-0008GC-9S
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1VOI-0000OP-G5
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:57:10 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1VOG-0008AZ-92
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:57:10 -0400
Received: by mail-pg1-x529.google.com with SMTP id e66so11745019pgc.8
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 08:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aG6jWR2ULP2xw6JngYJwBLq712UM8a2hVTANKtklgoI=;
 b=AhiPKTvezwR1nDW7fXaRxBWLMgWaHbXHTSWHvUGvnIjPfXsRjoR34OAwq915QyrtRD
 Sygd+fEfeEXc86yw+wb13J44yEdggaJz2eVx2luGcINGUIGKGfyznx2uaRBi/qskp2vX
 PJPLqOT0ZECkYDRpy0VfuKv9E/lGR1lXBG92szYS21GTIMmmUt0W1gYuO2ZzSiKFik2m
 +GO2Dw7Pgyji1IdGMxv4NlWJBQswFiAmmbT2j43xEhpHMVjVYucMkodtQXcMZF6RuA3C
 ZIXMxGUjynqXaFmWHxCMwH0ArU0QXK+3r1vnqS3e987+f1wanfTVTJ6tr1qvnQj10Ab/
 JHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aG6jWR2ULP2xw6JngYJwBLq712UM8a2hVTANKtklgoI=;
 b=Nob7af5Vqp0lVx8odhHKoH9jh2JuJXwS7Q9Kn405pjyzHbKevd60SnHBMHqCf4WzUx
 3uEzyjaqFWeqBRgT1vYMFNSFRnLi/ljbcCObcZV3JLhsqmxME4dBn2JnoyNUtsDn0cJQ
 lbKLw4lveh2s3IdrsbMMnCsYxo04WbZfHkGADf+0X+VZdcwQNblFX0JwJzqvPapCr8MF
 Nd0pS7Cmx9DvX+uuqzE/omI8mRbGH1HrrztJNRPd5JT3J8GT8mGx64F6eciVVZviY2eG
 JCASnDx5DL0RHZc8HFjDRZ2PljAK9nVxJsJldMQd48HLUBpCtA4pcAnPw+0n8YXMNP4+
 6wqA==
X-Gm-Message-State: AJIora83IiE2LSzXHc1poLb+5u3wXIxA+XJDoy0k4mrpUFm5AhDVGAXe
 TUNOtLG1O/AEbUdfJ0OftGc=
X-Google-Smtp-Source: AGRyM1tXhSt5NlGILA20T/BUDP0DaOb3J6p6LmL+/tahR8sJREpniVtO36TJJTsXcf0HHo4xIqQRRg==
X-Received: by 2002:a65:4183:0:b0:3fc:1370:9c37 with SMTP id
 a3-20020a654183000000b003fc13709c37mr451237pgq.4.1655308627019; 
 Wed, 15 Jun 2022 08:57:07 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 a34-20020a056a001d2200b0051874318772sm9860038pfx.201.2022.06.15.08.57.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 08:57:06 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v6 7/7] net: Use bundle mechanism
Date: Thu, 16 Jun 2022 00:56:34 +0900
Message-Id: <20220615155634.578-8-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220615155634.578-1-akihiko.odaki@gmail.com>
References: <20220615155634.578-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x529.google.com
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 meson.build | 2 ++
 net/tap.c   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index ab5ab85bf4e..72e42048cbe 100644
--- a/meson.build
+++ b/meson.build
@@ -3574,6 +3574,8 @@ if have_tools
                dependencies: [authz, crypto, io, qom, qemuutil,
                               libcap_ng, mpathpersist],
                install: true)
+
+    bundles += { get_option('libexecdir') / 'qemu-bridge-helper': '../../qemu-bridge-helper' }
   endif
 
   if have_ivshmem
diff --git a/net/tap.c b/net/tap.c
index b3ddfd4a74b..5beba85fb22 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -507,7 +507,7 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
     sigprocmask(SIG_BLOCK, &mask, &oldmask);
 
     if (!helper) {
-        helper = default_helper = get_relocated_path(DEFAULT_BRIDGE_HELPER);
+        helper = default_helper = find_bundle(DEFAULT_BRIDGE_HELPER);
     }
 
     if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) == -1) {
-- 
2.32.1 (Apple Git-133)


