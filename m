Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1D13B4578
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:22:41 +0200 (CEST)
Received: from localhost ([::1]:37672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmjA-0002xp-EG
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmf7-0002r5-9S
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:29 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmf5-00038P-Si
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:29 -0400
Received: by mail-ed1-x52a.google.com with SMTP id df12so13653262edb.2
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VP9s5JyOxdlmVpItLUdNGhW5j1cHS9B8ambxVV+LEbo=;
 b=cxIus2mGi5r1g8z1dLxv5GR090xMmwf81kAWXXYiMqtrBOqbGtkoCZWAoRg96vfP7u
 vERxXnxJorTk6kme1KsiNmhG74Tpi07uW4mlYROqOMTQU13ygi6ZhLLfjXxjKcdyK5Rg
 j+6DoexH0lNsxbJvD6yCEIRqFR5yHRklmy1vzLb4O7r13e8v4EVk1hQTD14y4g5EEIZQ
 tQQmSn6/Pt732fDpIjmoskXtLvZMe33waQG9e244Q0kwmQyf+wFuIsq03Q7mIl9M0wX4
 xj7tJu8fZabSUXPztUkxq/d74AogVlnaNbEbKK3k1/mSNlq9BRcuxqODS7NflHYRty7t
 2lKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VP9s5JyOxdlmVpItLUdNGhW5j1cHS9B8ambxVV+LEbo=;
 b=X7Lv21+a+anU4AL2ilesfaGqwahzJFcEfLSTqYlxKtqWY5qQw+fuvvD8nZeb9aAeL3
 emqf0kr9yW+TR36C+wJ/iBEXlB140hLoGSoae2OAGp/H2O3QPnpDfp291L2Ku30iDYnT
 Mos6d03l9uIOonKNb3pPokzGXKEzjylwjjyKSrZSPCrv0qQjgodU9zcv2s2A+EFtmFLK
 trsqcCAwB3UR2gVCffQLHzU5dhX2lhhEHNsYT8M7JItNLfh54X518whiG7AOtoo/Vpzb
 z65iVHdwsazXB3ekEDqva9Zk/+YGCusBL2Aq1sQF1rzbAW8mO2oHKAHEKX+IvMfCwPCB
 z/aQ==
X-Gm-Message-State: AOAM530hAcmBtWjfsLYM2r/UAy/DZ13kCH5633WVBX46i0G+FdlMO0LP
 S2GTnH5sCIC131E+VJbICRGmyejn59U=
X-Google-Smtp-Source: ABdhPJx8pneiXTUE/ORKHdMkj3iW/Z6Ip7d/2AC426r5U20EV8XhuUFiAp9dVjpwE02pTP/R/7KsDw==
X-Received: by 2002:aa7:c614:: with SMTP id h20mr14949706edq.67.1624630706533; 
 Fri, 25 Jun 2021 07:18:26 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/28] configure: drop unused variables for xts
Date: Fri, 25 Jun 2021 16:17:57 +0200
Message-Id: <20210625141822.1368639-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All XTS configuration uses qemu_private_xts.  Drop other variables as
they have only ever been used to generate the summary (which has since
been moved to meson.build).

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@liaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/configure b/configure
index 38704b4e11..00e7dd749a 100755
--- a/configure
+++ b/configure
@@ -406,9 +406,7 @@ gtk="auto"
 tls_priority="NORMAL"
 gnutls="$default_feature"
 nettle="$default_feature"
-nettle_xts="no"
 gcrypt="$default_feature"
-gcrypt_xts="no"
 qemu_private_xts="yes"
 auth_pam="$default_feature"
 vte="$default_feature"
@@ -2897,7 +2895,6 @@ int main(void) {
 }
 EOF
         if compile_prog "$nettle_cflags" "$nettle_libs" ; then
-            nettle_xts=yes
             qemu_private_xts=no
         fi
     fi
@@ -2938,7 +2935,6 @@ int main(void) {
 }
 EOF
         if compile_prog "$gcrypt_cflags" "$gcrypt_libs" ; then
-            gcrypt_xts=yes
             qemu_private_xts=no
         fi
     elif test "$gcrypt" = "yes"; then
-- 
2.31.1



