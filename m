Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4653D3E67
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:21:06 +0200 (CEST)
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yr5-0004Xo-Lf
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ygB-0005tv-Hs
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:43 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ygA-0008Fm-5P
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:43 -0400
Received: by mail-wr1-x435.google.com with SMTP id r2so3145588wrl.1
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3V4L+xcswcubAa4jaIcVHvA8OBGf7G8xZSDV3W2s35w=;
 b=K2ujWTDe9cNI9PxloSXz56Q+74MndNFVcyxoWh8NdyaNQEbpDitC3GzuZwC+SSnIef
 3Z3ml2nxKphjA7Wc14OdhwC3Fs0K5QiGWOvRYFwE2rbZhL8J83ZOs3GX+M4Ljk8T+D0y
 kWUU8F1AbOnt0JX+DEV6YArvEJe/yR0oDd/6eyd5wI5mh+VzLT6pihJxUpY9mbPrUdaV
 +dGzSc0C1wV1kM8WF4W0hpn5hEaUQuEKt+jVo3x3oSeUI5KSXUum0EWtk7ltJMmHKbWU
 BScNOPBCfXMBwd44ehfRxLdX/tp+ONPgI4ihNPog4JNT4W61qZmgjZ8u5r5nFwToXHck
 GLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3V4L+xcswcubAa4jaIcVHvA8OBGf7G8xZSDV3W2s35w=;
 b=muR8ury80ZCtoYrQjwvYkaO6EqgsFzcVu1ikX7UrAmXfa9/emqNj0Ky12XsoQOy8jw
 j+vp6H17Wst24d3tty4bNaRTlmOJ40jRPbgKnWmibDGWYvaP57Fa8LaurmNoDizZQc6h
 hdTyZ1uKvnBbm0YrIGf7qO/ifM0Y1a6hCyjEMfDOECSPTdpwtkJ8DwMgQhJ/dfzG4ADK
 LZG38ZKKNt7RaBM2LKwKnzh1kKk9psZN/oanV2ILZPhtnGvJBbCsHeNqXvsIlZwKCccT
 Clj1lBjiTTJasU+huejT7JqGRpGupb8KOPdLVcZ8wZOBQup71ieDmvyF+DbKj1NtY2FL
 YLlA==
X-Gm-Message-State: AOAM532KgYXbQHPjHrzAk2aUTcNFzXW2oHQpf3+W6TQ8eD3Rm4DfZUQg
 WpZR5WDKVvAl05Sh3KR1C2RsKA==
X-Google-Smtp-Source: ABdhPJxiLJ3pf5LjIfzc5oDN83qqAdwfrtmQVippnu6TlXntOqJ28nzV1ArzwDLIPh5z0v7iArbq9A==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr6331851wrm.220.1627060180898; 
 Fri, 23 Jul 2021 10:09:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p11sm33793757wrw.53.2021.07.23.10.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:09:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A96B61FF9F;
 Fri, 23 Jul 2021 18:03:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 16/28] contrib/gitdm: add group-map for Netflix
Date: Fri, 23 Jul 2021 18:03:42 +0100
Message-Id: <20210723170354.18975-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Warner confirmed he works for Netflix on IRC.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20210720232703.10650-17-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/group-map-netflix b/contrib/gitdm/group-map-netflix
new file mode 100644
index 0000000000..468f95dcb2
--- /dev/null
+++ b/contrib/gitdm/group-map-netflix
@@ -0,0 +1,5 @@
+#
+# Netflix contributors using their personal emails
+#
+
+imp@bsdimp.com
diff --git a/gitdm.config b/gitdm.config
index a3542d2fc7..5d5e70fe5f 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -35,6 +35,7 @@ GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
 GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
 GroupMap contrib/gitdm/group-map-ibm IBM
 GroupMap contrib/gitdm/group-map-janustech Janus Technologies
+GroupMap contrib/gitdm/group-map-netflix Netflix
 GroupMap contrib/gitdm/group-map-redhat Red Hat
 GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 
-- 
2.20.1


