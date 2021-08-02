Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72E03DD57C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:16:24 +0200 (CEST)
Received: from localhost ([::1]:59084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWrn-0006zU-SE
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaT-0000m9-5O
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:29 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaQ-0003cc-L4
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:28 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j2so21114536wrx.9
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lH6HoKCZEt04PFtJPWHcakIzQ8ljYUVe30v5xbEBgvA=;
 b=kXxOutYZirkqNKNtBXJvWTUvNJQSHsi3SEMOatzkser5sZTtuS3Tc3ctkCtevKfMKr
 zopvhXK3dWq39BFX9lbLOtT8Qmk916Y/Nu8LppIvbSMvqpYKZTNFfW1tRqSgnFGmBmDX
 Wex5psFADu8FPmNHTCNdNb2YFkQt5V+3TVbcDDyngBWB3V1EU9oarTsfd7Kx+KDOVJow
 Tkj6nGgEpAm/KjJTBHp2WCyUBACSbHG/3ZddpKMRBzK94715XJCD+g3GxiaUwgvz1SPP
 SdIn6HDAR3SBBy9ZbiR7wlpAv950B5p558upVRn+tfNWglQq8cIqU7fSFsq4Cmjfm8HZ
 q2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lH6HoKCZEt04PFtJPWHcakIzQ8ljYUVe30v5xbEBgvA=;
 b=A7HwQRjEln2TbKSRa5yePq2ya5zmztsqI8wwwtxgt8Ks5Ux2SHS7jjADC3DXKz6Gjn
 liZy5fLYMmmn5NoZckzMFgfGyKbG0O6Ni7sU8Zk2JYDGKrk6H174LjCeS9CNbV1hl6Iq
 LQrwzZftK++guqfdBwo4nVqs9Ls3EmSTu8KgrTQegx1MIjBl7vrdKcQ02RcGwJ896qy0
 XLILqEeSfrw+xx5q8kCx4/sDkW4dYlfUA7DsE4a7G3UkteTLiY7uEp05Omin+bSLlAbr
 UQ4hURYh5gLfbMfKSaLQjTXwZe/HlYR2oXaEtDYWCXXovAPwK3X5rUheDhY0pe4IcC9n
 +4hw==
X-Gm-Message-State: AOAM5328GxY4kvoq4KM442QLmKJSY8OxEoWYA02XP7SrSBe08CiEQYeL
 ANG92N9yPLfb5EJw10duWZ618TZbmp8BjQ==
X-Google-Smtp-Source: ABdhPJzu8KmOQ8UY9lgdqzrUsuGlmBxqMvnyVIROw7oBr/VuD7bD+uYXbMDS7QpJfHY479ufCnDmhw==
X-Received: by 2002:adf:e60c:: with SMTP id p12mr17128008wrm.285.1627905505385; 
 Mon, 02 Aug 2021 04:58:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/21] docs/tools/virtiofsd.rst: Delete stray backtick
Date: Mon,  2 Aug 2021 12:58:07 +0100
Message-Id: <20210802115812.10731-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The documentation of the posix_acl option has a stray backtick
at the end of the text (which is rendered literally into the HTML).
Delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-id: 20210726142338.31872-11-peter.maydell@linaro.org
---
 docs/tools/virtiofsd.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index c4ac7fdf38f..b208f2a6f05 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -102,7 +102,7 @@ Options
     default is ``no_xattr``.
 
   * posix_acl|no_posix_acl -
-    Enable/disable posix acl support.  Posix ACLs are disabled by default`.
+    Enable/disable posix acl support.  Posix ACLs are disabled by default.
 
 .. option:: --socket-path=PATH
 
-- 
2.20.1


