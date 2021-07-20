Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0123D05DD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:53:30 +0200 (CEST)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zYH-0005yD-7Z
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFz-0004OH-GP
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:35 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFx-0001iO-9B
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:35 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso2397721wmh.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O7IVJHCATEGXNeDbzxK2nbzIHdp6g1pT+scnHJt0O/4=;
 b=WFicx/8/uZ+VmxPpAvfbGRv6jcKjcXylMhygaPvz3i1dLp/UHyplBphOi2KDbXOwq4
 Ms4CANTcPBtSmqcAGihbns8bbh25bAhQvGGpIfjDoBcnDX0hhvKAvqKaLc2ci3oRYpPm
 y4qZ7iuJOY3hmyBFRSWN70bZ/oePtqHhxJTc2qXoYXDAwbXGJTX+P1jEvv8Z+INleNtn
 YmkZ5wy8xNe9MO4CFfFmJo7QhTQjhsG5N8B3NcxN+d8qaXu2X8YaJ6rm5YFQbm0aAg/D
 Lj4l5Iy9hms9zXjHq1q/45NikS77FBhRyNTxrYQyLduDZiAauu8fF+4OdWz9xNoVkxZB
 vbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O7IVJHCATEGXNeDbzxK2nbzIHdp6g1pT+scnHJt0O/4=;
 b=YmOg2p/2M6wyKwbVdzj2yye6HsRUd7Rr/HQ0q1h5ZYXEmF4ApRzE+xrdRe5dzL35yZ
 Ehx88rYXoEB4AzoP9IZM3xt1ERP6e6kAR1WgjkJREVH57p8Kr1TMbcjLxlBxrXSmE+hb
 kQQY9WHAX+KltTePgE5fR/VJnA7rkyy0CYpmFllQTPVopoYdvCPbwNHnHk92YraOJnmT
 9XySt7KQMEyakhimrvT4FkN9otV4ga51meq/8lz/T1Bou3ppigaPLNcmgy5XpyRsvQZB
 gk9okCW3PpYbAB5fj2QFqhZiEzK/jsadOPvxMdAppqooS5BHy3VHWmZD/kztYesLZGJW
 VVGg==
X-Gm-Message-State: AOAM533g6YsWiqDW4me5Q6zjcOvog11z+nyTwQ9FIHOCHE4rSkGcJBbA
 FWzgViiHsYIBpl4KzrMQZUbpRA==
X-Google-Smtp-Source: ABdhPJxA9LaR51iLf6f3WHe8o0M3ajRzKNTCBuJrrJCnvVGIKr69cUvB7KXmghxTRzrKB/OeNhHkeA==
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr34472668wmk.1.1626824071743; 
 Tue, 20 Jul 2021 16:34:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n18sm24143134wrt.89.2021.07.20.16.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:34:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4AC711FF9F;
 Wed, 21 Jul 2021 00:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 16/29] contrib/gitdm: add group-map for Netflix
Date: Wed, 21 Jul 2021 00:26:50 +0100
Message-Id: <20210720232703.10650-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Warner confirmed he works for Netflix on IRC.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20210714182056.25888-19-alex.bennee@linaro.org>
---
 contrib/gitdm/group-map-netflix | 5 +++++
 gitdm.config                    | 1 +
 2 files changed, 6 insertions(+)
 create mode 100644 contrib/gitdm/group-map-netflix

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
2.32.0.264.g75ae10bc75


