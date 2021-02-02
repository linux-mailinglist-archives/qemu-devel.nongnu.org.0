Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA6B30BFE1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:46:03 +0100 (CET)
Received: from localhost ([::1]:47246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6w0H-0000Om-UF
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vun-0003i5-Iv
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:21 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vui-0007HK-Gg
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:21 -0500
Received: by mail-wr1-x435.google.com with SMTP id z6so20440231wrq.10
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gv66Zl+JJThTP2BwD8boLPRFsip1I6v/inGKghozlIo=;
 b=k1xSkQ7IJzkX11Fx+cOQ49iZecTLXnE6S1N5821XM1PW/ZzSFteclwslKRNMeU70TC
 NIr7+VxB7Z8MSX8ovAK4ZTTc0NT6eXV7nLAx5gfsJQnrtPutYISmkd8HedhhdcJRKh1x
 EKD6bWpZNC9xhQNAh0dI0EMzza59tviF5yUQ9rAXJo0Nna8ijInbdc3QNR3mxDw4XmYN
 oUdE+Ezxg5FOrLVs7B/3BKLwmzTr1G4+pJi+CigLdYE2s1pvLCkiYxPE+7N2YjJf4nK8
 ym3STB69i12kS59u7otiyOzEPE3HAwc9G7bhHKbfo6wKtzoEfslT0y7k1oiixaQ6RD6Y
 pImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gv66Zl+JJThTP2BwD8boLPRFsip1I6v/inGKghozlIo=;
 b=Q1PgqqqVR8EXlAHHYobhCXb7POQHRy9WS8rh+SagAh8BKHxKM4dV7gacUZL8dsJL4K
 7AusiyS+XQan20amkDPZ34R0kxphSFm76XrL+K0I7amTOwFTlyYms+V+M1u2ScCioqVp
 eJS31I7RdfugHMSrqDWdOCLFcC9xOVi02qNa+OglnMwjaUwPOii/vTghjR3b9sNXIG8l
 C1srAQnDrGfgHRhu1EgfBsLPm/v38l0d+GV1kR+L3SKSGkq0yMZPrKmnKEeE6kcCj00R
 P+4DJ/caIhTy9cmVEiML5by/lSBqlfHT96Y3okDAaM7lwEIu41185DNS2GSxMOJWVzuL
 l67A==
X-Gm-Message-State: AOAM533NSTrkqqNYLFU0i+YZ3YLnkjWbJlsXWs3ZDmAGlMvG/3kPYzL3
 5GEGgA+A7VuzCpoqF1mP9zEl+A==
X-Google-Smtp-Source: ABdhPJzdA658RnOB39+X6c174hCUg4pxFcr6D7s9AiQDJ/4fIQDlA5a2yqSZNUyTAlAcQ0U2sRWvDg==
X-Received: by 2002:a5d:62c1:: with SMTP id o1mr23022283wrv.275.1612273215295; 
 Tue, 02 Feb 2021 05:40:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i18sm23889506wrn.29.2021.02.02.05.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B134F1FF93;
 Tue,  2 Feb 2021 13:40:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 07/15] configure: make version_ge more tolerant of shady
 version input
Date: Tue,  2 Feb 2021 13:39:52 +0000
Message-Id: <20210202134001.25738-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When checking GDB versions we have to tolerate all sorts of random
distro extensions to the version string. While we already attempt to
do some of that before we call version_ge is makes sense to try and
regularise the first input by stripping extraneous -'s. While we at it
convert the old-style shell quoting into a cleaner form t shut up my
editors linter lest it confuse me by underlining the whole line.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Thomas Huth <thuth@redhat.com>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index e85d6baf8f..432b83fadf 100755
--- a/configure
+++ b/configure
@@ -198,8 +198,8 @@ has() {
 }
 
 version_ge () {
-    local_ver1=`echo $1 | tr . ' '`
-    local_ver2=`echo $2 | tr . ' '`
+    local_ver1=$(expr "$1" : '\([0-9.]*\)' | tr . ' ')
+    local_ver2=$(echo "$2" | tr . ' ')
     while true; do
         set x $local_ver1
         local_first=${2-0}
-- 
2.20.1


