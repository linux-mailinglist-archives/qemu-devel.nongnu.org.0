Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754475365C3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:11:08 +0200 (CEST)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucYN-0001qk-IA
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8E-0002m7-UZ
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:06 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8D-0003rj-E8
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t6so6379048wra.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lCSPdnN4oozwo6SG6Lmh/EXCQHSe8HNg31cufY8WfJo=;
 b=uXMb4ZYD6309FYeiWHlmquC3aDwNaHv0T+5NvJuEALVNACmxmcGyVaRq1+HHwWqYV2
 F3WKi8ybubjvxDnXTdk4NFDgJDIp0ORiHMsYyMOxbtacWLA1eXQ60HmXVf112a5qy5YX
 1/DOpMGmXkPNCf7bvI7Dfi5/z04ZgqxWzTJOr3t4VesR9c+T9hTOwZwAx2Ki4QI9eAwx
 kEWvuNMwgCd29+sHdjb2E3dDOmS/RhOpvhEdasObj75k4OSy7cBIfO+qBAb0HFWkCNXq
 XtzHFZJhLkClhM4XVPYZkBx2QdHWIFMi7YfKtH3RelU/zkBwK3PKo6nqn7r96jYcHm+M
 QhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lCSPdnN4oozwo6SG6Lmh/EXCQHSe8HNg31cufY8WfJo=;
 b=OVAfPFcsiFTFTBcmihab3K26NIKqgDNIS5ghMV32phcRyYlR7w7Y50bbx6MNRVpZXS
 iss8+IwxTI0qWBRNlzuNede72v2YSt/sfEDIUfkV38osoqrTgBxLFMLpSSgvTQJdNFG0
 mB3l2QwdI7h/1kCkWwa6nOzFpmJK57qwdu3noMqASI+GHDcGL7rBQNohZP2QqA6Ewn+c
 sUalBKt7AobdqpOWOxg4hraPI/4Q4pSD7fUU9DOOBSwsQVUkJCcAIhsfxkR4TY1kxI/O
 47/rWEzoYbO4AHr+tQybWaRn84rMQeqUMJkYtcdS2OKCBv6/IjJ/ZnLBMiqE7c1YGr3C
 WGXg==
X-Gm-Message-State: AOAM5320H0tAvznoJhRsPLbHtlKHUDdzxgLzFypjd3gZJQUFvL+rQdlQ
 LiWt94nm1a+tR8U6bJLG9hRbCQ==
X-Google-Smtp-Source: ABdhPJxZ/gg2E/Mxi/RL9XArWjb7tkQoEE4BYLQIpZ+crHzz9WEdcjQQPPPaYXCp2Qf2GP8DRvmULw==
X-Received: by 2002:a05:6000:1882:b0:20f:de1d:9fb9 with SMTP id
 a2-20020a056000188200b0020fde1d9fb9mr20841989wri.504.1653666244089; 
 Fri, 27 May 2022 08:44:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a05600c348d00b0039754d1d327sm2468389wmq.13.2022.05.27.08.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:43:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3EBB21FFD3;
 Fri, 27 May 2022 16:36:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 27/33] configure: remove unused variables from
 config-host.mak
Date: Fri, 27 May 2022 16:35:57 +0100
Message-Id: <20220527153603.887929-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Paolo Bonzini <pbonzini@redhat.com>

The only compiler variable that is still needed is $(CC), for
contrib/plugins/Makefile.  All firmware builds have their own
config-host.mak file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220517092616.1272238-17-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/configure b/configure
index 89a0470cc2..4c01625459 100755
--- a/configure
+++ b/configure
@@ -2394,11 +2394,6 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
-echo "AR=$ar" >> $config_host_mak
-echo "AS=$as" >> $config_host_mak
-echo "CCAS=$ccas" >> $config_host_mak
-echo "OBJCOPY=$objcopy" >> $config_host_mak
-echo "LD=$ld" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
 echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
@@ -2406,7 +2401,6 @@ echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
-echo "STRIP=$strip" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
 # use included Linux headers
-- 
2.30.2


