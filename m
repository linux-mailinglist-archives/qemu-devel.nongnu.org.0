Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D72393332
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:09:32 +0200 (CEST)
Received: from localhost ([::1]:37738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIZf-0004VW-Q3
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmITm-0004mu-0a
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:26 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmITj-0000Kk-DO
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:25 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso2919312wmh.4
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NjUsaCVXvZBOoWNsWBWBwAfBbFCztzsGLeZKy47lhbY=;
 b=LtFo2qy63ju3qGaabFsIBUP6GQtGwZWclwkIOeZd23H/r1JrOIjggwxx00xZ8iRXPa
 njJ67IeQ7igTZAIz9dCuZ+Cd+OWiPlhV5e6ZlDS0NHcq33SmfXqf+SlP8Roo6UabNSsI
 WfUUS7rpLPVnqSLiQ4L3e8OHP3iLmr0XLFjcGcVAlz3RtXtRPIuet3wfRQHvZBSQcs2Y
 qxaU5PMvdXTUHT/YY9PSNzj4pvWwueEIP8vKthh1vHIab/HFplZzpyqH0fsA/iZA4dBh
 uHXuub9RzZGnUMSt2aS08rAZH58T6r6+a+/Pq7m9e8JLK+6VXQygKWgoFRrzzy0t8CJd
 bpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NjUsaCVXvZBOoWNsWBWBwAfBbFCztzsGLeZKy47lhbY=;
 b=SaqwdYoZps/zZMor4x1F4nT9QyqxColDHBX9rDHYx5ShczFCsZoxv1oIPDrXk1rA4l
 3yF4IvkNxIIL+/Sh6KaeRezWkkx1Z8ZIotuPwt63bY8o8/GM9YS9XixgtvOtPh+QFBfW
 KYcBT3OKwmbjkakqIMhZuFDfGv1fDbvL+WEoBq6LMAQ5PWPJVMcxGQfdpccJn/imEtRg
 d3UcEuXKAwbZyJbeyw+fZyS3sSkFHW/PHFVUvXhiBmp2QUvmtsOK1RWMqnoPpI8dOGTC
 aGIKCZKZXiFLR1XCFyAzmm3pj6l6CBkFBj+qEV0BwQwkQnI1rDQ9M3OT6Gs2e4UWTeft
 MaYw==
X-Gm-Message-State: AOAM532eIme7dmUZmcO/x9HDX0GywdEx1JdRfP2EBfrU0QNt1LbLJ+r9
 8a0phezOOiD6ueRG6u4ZLk/4PQ==
X-Google-Smtp-Source: ABdhPJzgtRtYhYzNfJ/nZe54rlkBORykApzCwZ0+W0ee6Awkka536FTWuPIMVsezOQAU1hnXiaE5ig==
X-Received: by 2002:a1c:e156:: with SMTP id y83mr8727749wmg.89.1622131401913; 
 Thu, 27 May 2021 09:03:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b81sm12080117wmd.18.2021.05.27.09.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:03:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 938221FF8C;
 Thu, 27 May 2021 17:03:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/6] meson.build: fix cosmetics of compiler display
Date: Thu, 27 May 2021 17:03:15 +0100
Message-Id: <20210527160319.19834-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210527160319.19834-1-alex.bennee@linaro.org>
References: <20210527160319.19834-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you specify something like --cc="ccache gcc" on your configure line
the summary output misses the rest of the cmd_array. Do some string
joining to make it complete.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 20d7035e44..3f065f53f2 100644
--- a/meson.build
+++ b/meson.build
@@ -2515,15 +2515,15 @@ summary(summary_info, bool_yn: true, section: 'Configurable features')
 summary_info = {}
 summary_info += {'host CPU':          cpu}
 summary_info += {'host endianness':   build_machine.endian()}
-summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
-summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
+summary_info += {'C compiler':        ' '.join(meson.get_compiler('c').cmd_array())}
+summary_info += {'Host C compiler':   ' '.join(meson.get_compiler('c', native: true).cmd_array())}
 if link_language == 'cpp'
-  summary_info += {'C++ compiler':      meson.get_compiler('cpp').cmd_array()[0]}
+  summary_info += {'C++ compiler':    ' '.join(meson.get_compiler('cpp').cmd_array())}
 else
   summary_info += {'C++ compiler':      false}
 endif
 if targetos == 'darwin'
-  summary_info += {'Objective-C compiler': meson.get_compiler('objc').cmd_array()[0]}
+  summary_info += {'Objective-C compiler': ' '.join(meson.get_compiler('objc').cmd_array())}
 endif
 if targetos == 'windows'
   if 'WIN_SDK' in config_host
-- 
2.20.1


