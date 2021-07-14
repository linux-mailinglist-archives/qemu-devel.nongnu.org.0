Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD033C8AF3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:29:50 +0200 (CEST)
Received: from localhost ([::1]:40874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jdl-0005fH-4U
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jcG-0002xk-6b
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:28:16 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jcE-0006d5-B1
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:28:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id f17so4403014wrt.6
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QOdG0qK8qKvht5/HtZKXRvg1iXHGXDtl2zK5ixtEEVo=;
 b=cnBcVFL9h9wbAQpkaymocoCFPNAlsexM5o7qFxgjDvuYprRtJZvIWm9SLk5NUfOMhK
 MNt9tb0PZiP0PjZf0Nb5Cs9tGLpHGN9ssT6eCwOnCD3j70fDC135B11jvnBc7H9PeEHD
 IAT+0r7Hi6BNoOajOkkFDdfexm0hj9RR2S37ZVmLXKgbpgZhnI/WtZEwRLPLYPp+Vd73
 mY+d4pmrS3MN1gumxNofL655ApX2ODP0nClLbjhrOlQp7Jw1qhwauMCooD0HcMq0naip
 NvfVI6qGD4BoEQKuDNFZqI0eVhC3l9DTFN0HkVERwpRVsfsRn30rWRnEyCg1T2ZzuSv0
 Ez8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOdG0qK8qKvht5/HtZKXRvg1iXHGXDtl2zK5ixtEEVo=;
 b=hljPkbyvY5lc48XLLWT5QN0FGpuqD3XM6aNkoO8FXRPZmpoQSlMmn5EMDoLBWG6rGQ
 8Djwp+1C+Smip3vEsCkVDtchNGvSDCWuw2oXv4bPREPf4OoAJOR08+o6yjzJfVLxdL+4
 qY2opfqrVFkSE/unx+REwcZG+4LpfxX2d2RHuX+6/R+b4bBZ7A+RwGWVnOX3JneZBBh7
 T/ZB05QUMkm252BpoGwMCeAObSDnt3zWD5NW045qD+4ux+/erj8Hq08qlqSxfBmZ16jj
 ziPdSZ9E4l04x/iR/OLWLH2OA3w/ADE8J4IyOVdVHwlldGhTHS3TkQF8k/Y/fnfDSvdI
 /Ubg==
X-Gm-Message-State: AOAM530oS/ZVbNGHqosSo4IhIUfnPaOtfZommctGS3w44CtqlcBnd0Ic
 aLgpKYkK6KHuYZb8fAYnx2KKdGbg6UPrfQ==
X-Google-Smtp-Source: ABdhPJwZx2HUq2zCjQ8oKYBbgkoJSHpnvplldmikZvKURQ34WkmYuUeRCLDf0gUlDqrxMMlMNkWL+Q==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr14736432wrs.192.1626287291913; 
 Wed, 14 Jul 2021 11:28:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o28sm3891562wra.71.2021.07.14.11.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:28:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5894A1FFA6;
 Wed, 14 Jul 2021 19:20:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 18/21] contrib/gitdm: add group-map for Netflix
Date: Wed, 14 Jul 2021 19:20:53 +0100
Message-Id: <20210714182056.25888-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Warner confirmed he works for Netflix on IRC.

Message-Id: <20210714093638.21077-19-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
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
index e7a744146e..17a7746892 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -35,6 +35,7 @@ GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
 GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
 GroupMap contrib/gitdm/group-map-ibm IBM
 GroupMap contrib/gitdm/group-map-janustech Janus Technologies
+GroupMap contrib/gitdm/group-map-netflix Netflix
 GroupMap contrib/gitdm/group-map-redhat Red Hat
 GroupMap contrib/gitdm/group-map-samsung Samsung
 GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
-- 
2.20.1


