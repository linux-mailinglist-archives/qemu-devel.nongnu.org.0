Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F4425333F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 17:14:56 +0200 (CEST)
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAx8Z-00013v-Gw
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 11:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kAx6m-0007iE-G9
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 11:13:04 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kAx6k-0003zB-1L
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 11:13:03 -0400
Received: by mail-pf1-x441.google.com with SMTP id x143so1144731pfc.4
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 08:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rIP9TCfc3oqvA8Vp/R/E5MTUabOcrCowAJuIfVAgJrs=;
 b=WOEvVFLidXO8E65VFUzB5RxnMyoX//AIKATtsLFoqBGyHyCMS+Ky1u31LnqYz1Ngx3
 jkZdTul3UZlqFnBfaQUZXIyNcu9xiKSHEPgkmA+4EIeegjosPrc+RQDbojYVktwxQ96O
 UI0fONVJ/p8vkFns1lfMFnQA3tB1+Tk6M4BAzX0cfWI5MwlytRcqGIMeu8Dk/4xawkOh
 bqBizOgLCVkYfByKRvijZSLC62TYDnmC1zEHryupi1IByuwd8/izwrmGZ86XDjgUNu+C
 P1WxvPlSwpNL2R2Mn4Sdj/V5SlHLAO2GucUe17dJ1jD4DA7UDbgft4SyS+ja72VOAk4M
 tJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rIP9TCfc3oqvA8Vp/R/E5MTUabOcrCowAJuIfVAgJrs=;
 b=c5x8ft6RIHsvqvO9L0CWxtjsg8fZIiuVYWurRBCmNXaq2bwX2YJn7oXS7Rjod5IzFY
 aUbTCY4a2dTZtVpujb5nT+fZJqYTmYEEhDqyu02hkPV2TUxAO7PY2tUcouwBLMPzxfQ1
 2aO0/mSQ0FZNaHYg4fDR0tz0JtlMg0MFBE/KefOCEKn0aw2IaZNYVbgYwd8ra0e37KOh
 aVip1NXs7uPz/3BuFpOyut8xqAp4Ska2wgeATal1FmUWYdt4X7CWJArV5CgPvsRm+F7y
 x14dLJiS9mgEeQcK24Lwi+/LnMOjICPGmpRY2rKkh48N5JS9/2rDStwUZPkru+Nee585
 29jg==
X-Gm-Message-State: AOAM532nyWpElX1CNHOobGS2HFY3oALilZcFeIzShL48y8ZCbyILHOQy
 j6f5pV0n0/EIoAGLkGUF6AaOkW3PkKfSUhl6
X-Google-Smtp-Source: ABdhPJwt11R9etjBkG4loJ3X/m/Zv/NSKYVe/4qBTVs8k51Z90SOlQtS9DjkqAeK8PTDQiz9fQOZ9Q==
X-Received: by 2002:a63:1a0c:: with SMTP id a12mr10777133pga.24.1598454780273; 
 Wed, 26 Aug 2020 08:13:00 -0700 (PDT)
Received: from localhost.localdomain ([2401:c080:1c01:4fe:5400:2ff:fef1:b056])
 by smtp.googlemail.com with ESMTPSA id
 27sm2423169pgk.89.2020.08.26.08.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 08:12:59 -0700 (PDT)
From: luoyonggang@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/6] meson: Mingw64 gcc doesn't recognize system
 include_type for sdl2
Date: Wed, 26 Aug 2020 23:10:03 +0800
Message-Id: <20200826151006.80-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20200826151006.80-1-luoyonggang@gmail.com>
References: <20200826151006.80-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Fixes this for msys2/mingw64 by remove the include_type for sdl2 discovery in meson

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index f0fe5f8799..1644bbd83c 100644
--- a/meson.build
+++ b/meson.build
@@ -224,8 +224,7 @@ if 'CONFIG_BRLAPI' in config_host
   brlapi = declare_dependency(link_args: config_host['BRLAPI_LIBS'].split())
 endif
 
-sdl = dependency('sdl2', required: get_option('sdl'), static: enable_static,
-                 include_type: 'system')
+sdl = dependency('sdl2', required: get_option('sdl'), static: enable_static)
 sdl_image = not_found
 if sdl.found()
   # work around 2.0.8 bug
-- 
2.27.0.windows.1


