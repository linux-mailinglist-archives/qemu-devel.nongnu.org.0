Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D162DC4F3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:02:40 +0100 (CET)
Received: from localhost ([::1]:37352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaCF-0007hI-7Y
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:02:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZys-0008O8-Ql
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:50 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyr-0002Pi-1O
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:50 -0500
Received: by mail-wr1-x42b.google.com with SMTP id i9so23865794wrc.4
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPjzI6V7f3w9vt7Ex/NxJEhkQFHcnsnZ7sXAvMsjW94=;
 b=AzHMKJypdCdViQeP7TPtvfLFj/YraD/Ft2OypzyahQagWwkOOUxgVRXQViGvjhjvma
 AGnB6Q5bWUA8Rr2gyDL+xONSXkjE7SnLOtBZ+NPym7Kjc+G3geuWRq7r8CGyroTV4xvH
 cnlCvTm08/hAf9M6XF2jIzTu8Ntq2/qjRDr8E7Ja23u2vfiqvTtAFIgI5DLG7D3YGy+c
 hQf9R6mg17WOY9EWHJ9t0oKq/1+f45U3R4Cf2tilo3kjAHudQxifuYcXg3FrJ2dWPsIJ
 AnuOt/czzbV+IHU2LB109UAvyBD5NqpT5j+qiQx+Eh77jXLUUE6aZ6+zmdEn2vLGEAYc
 pwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPjzI6V7f3w9vt7Ex/NxJEhkQFHcnsnZ7sXAvMsjW94=;
 b=E182/7CpYnsucGVpyb3HZNil8nzWNKErY0z5SqOC7H4WmQ3XEfXMQ32R6b9X33J+OK
 d82vX33nyWJLog9vZgEKaUev9DG0AOCezv5Ugqm6TGVztAKXsHQ3CBx3iJnTzNOToVO2
 mUT+aH8h+Swo8vpbIWxI8a0oxYJ3p5U7egGy3kX8dOv6h2mRf1DJvNVYxIX7g7g3TyfV
 D7c6ZMsHG5BaQRfn19Xj4a1j4EDQrq23ekfgy5VfmZ+dJmuNuU0D6ruGvotf2y+bCwp8
 SwC7Zfyu2WgiYPU9E1MjbX8Rr99ZGllBy71f2EHeRnR49b4jcVEFk3jrAm1iWQzh6ebH
 Chlw==
X-Gm-Message-State: AOAM531nzorRYYE7Phq8Yicrzj27WbnHZ1PruQ79rmB2BZRLEpXX6t7A
 s3qgDV/GmrgdTKEsjZcG+bOv1w==
X-Google-Smtp-Source: ABdhPJxqTD3itgPWq17j7ClOehg7PFL4XocuYAlYd+tf8k8K4iCcCCEZY3T25vJdyxl+3d9C5bIV3Q==
X-Received: by 2002:adf:fb49:: with SMTP id c9mr7974026wrs.72.1608137327672;
 Wed, 16 Dec 2020 08:48:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v20sm3900563wra.19.2020.12.16.08.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:48:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DC9AE1FF9A;
 Wed, 16 Dec 2020 16:48:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/11] tests: update for rename of CentOS8 PowerTools repo
Date: Wed, 16 Dec 2020 16:48:27 +0000
Message-Id: <20201216164827.24457-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201216164827.24457-1-alex.bennee@linaro.org>
References: <20201216164827.24457-1-alex.bennee@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This was intentionally renamed recently to be all lowercase:

https://bugs.centos.org/view.php?id=17920
https://wiki.centos.org/Manuals/ReleaseNotes/CentOS8.2011#Yum_repo_file_and_repoid_changes

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20201216141653.213980-1-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 54bc6d54cd..06b67962fd 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -31,6 +31,6 @@ ENV PACKAGES \
     zlib-devel
 
 RUN dnf install -y dnf-plugins-core && \
-  dnf config-manager --set-enabled PowerTools && \
+  dnf config-manager --set-enabled powertools && \
   dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.20.1


