Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED04387452
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:48:33 +0200 (CEST)
Received: from localhost ([::1]:43634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livOy-00044J-MB
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livIO-0007bY-LX
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:41:44 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livIN-0005Zg-2o
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:41:44 -0400
Received: by mail-ed1-x529.google.com with SMTP id o5so1110230edc.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VzBzspIRtIDQuQTLLmpcCnuBfCb5UPg4rucM0zljC4U=;
 b=JwDGuEfrJ5DVfVYtacIEFiKH1AxPX+E0gl30MDOdrnv6+IdeGcoEGjtClLpVgzATGq
 87yjpy4+1g+k4ICEZxPi4QhCK9hptKTv+Qyfl6DP0lBSYqMXBMQf56/iN0EJUl/HzMfl
 nXabPhkQ5+m/PWruOaM+sEUbqWpWXj60ClcfSAsOL63XHAh9dBCMiFWgquMnwc3BjklS
 B1vvtvP9x8lLZ22ismin0p0VTMCOGut93LHW5gx24p1rq22kw7q3rFTN1ryRIXtGFX0f
 DDqaVXXtw0/KoXPRCI8+oC1CiGTB7WAkSuvmvTkr4nHPS1HdePiNpsvANqq7nbgyELRo
 Jwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VzBzspIRtIDQuQTLLmpcCnuBfCb5UPg4rucM0zljC4U=;
 b=bqnAzTSSS7WA/nlSrtOaicboiE86OQYgYxg0hyXAqhr2etx1Kk/7u8P13Bi8Ujeu8y
 Ekrf+5sFg5FIoYMwHPXuZvdUYT0dTOm+YQxpFuTPOtWV9HPrKDY6RUVNKf9VYdorc6ms
 2c/2R1SpUDilor6KFlv3Y4kXKP7wOKw2JnQjdxTX4R5vHcmdvqg5ofuy/8agbd8fQRae
 Fi5qZMNmZtfYJ3mJMAHKubg8Hsw49m8iE0pRULxM/RuVP/yHh3vBNWGTasyBlQya6hKb
 kt7VMxfbCottKu2Fl7g7y2W+6ezzub+taGnNCpMH/QnFZxg84///pZmIIy9E8GQbRI1d
 CoWw==
X-Gm-Message-State: AOAM531TQFvkVIbru6kfRP+v9lcT6XdHwuhggUmrkacyjGqWvst80oQw
 HHP4It41T3bTu15dGInlVGkA/21s4hwsRA==
X-Google-Smtp-Source: ABdhPJynvP8CTGDb3GleJmpT4mzYgbE2ZTvNMlW3bxGa7++wHvbH6ti2WxGPM8epuvBl8KHinyIC+w==
X-Received: by 2002:aa7:d718:: with SMTP id t24mr5763185edq.259.1621327301482; 
 Tue, 18 May 2021 01:41:41 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d7sm9851917ejk.55.2021.05.18.01.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 01:41:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] cirrus-ci: test installation
Date: Tue, 18 May 2021 10:41:37 +0200
Message-Id: <20210518084139.97957-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518084139.97957-1-pbonzini@redhat.com>
References: <20210518084139.97957-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Entitlements are applied via an install script that runs at installation
time.  Test it in CI.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .cirrus.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index f4bf49b704..340fd395c0 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -37,6 +37,7 @@ macos_task:
     - gmake check-qapi-schema V=1
     - gmake check-softfloat V=1
     - gmake check-qtest-x86_64 V=1
+    - gmake install DESTDIR=$PWD/destdir
 
 macos_xcode_task:
   osx_instance:
@@ -47,7 +48,7 @@ macos_xcode_task:
   script:
     - mkdir build
     - cd build
-    - ../configure --extra-cflags='-Wno-error=deprecated-declarations' --enable-modules
+    - ../configure --extra-cflags='-Wno-error=deprecated-declarations' --enable-modules --disable-strip
                    --enable-werror --cc=clang || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
     - gmake check-unit V=1
@@ -55,6 +56,7 @@ macos_xcode_task:
     - gmake check-qapi-schema V=1
     - gmake check-softfloat V=1
     - gmake check-qtest-x86_64 V=1
+    - gmake install DESTDIR=$PWD/destdir
 
 windows_msys2_task:
   timeout_in: 90m
-- 
2.31.1



