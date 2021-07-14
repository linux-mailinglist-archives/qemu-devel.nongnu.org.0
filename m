Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43F3C8270
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:08:50 +0200 (CEST)
Received: from localhost ([::1]:58126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bov-0007Sn-DG
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQG-0005IN-4S
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:24 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQE-0000Dr-JD
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id j34so1154840wms.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1EVjp93iyy+fsZ4pGlqUTgPVvJF7tVC1WY/cwqgCcuM=;
 b=GcJyuOQdhE0gupz2ogxQKl59g1S36EkMKqGaqNU1jPoq7VzSFtBMuEfL+pUyXvh1/h
 xxROAMpCaIOqksgH9fPIae92riESJC4P9lKssIIymdnig4ONbe6HTjDZqmIrjditHlWm
 YfhAFGAEr5R/3WPqCuHFUznYkGpZ4kGIesakjUu7mSQ4EZtM6Qx+2Jg/Z4jFzvXyiqL4
 CoEti0gjDEEtd7RaFOr29bA3IK9uixS+N/3jHy/wKaKXqKdgT3cYtWwP5UOsRBESWmqJ
 s+1KmNdOEULS0oFXOFpJPtMCR8XUQSC1myuxrYQVKhuYCk4O/NRZqmzoi0WtgtROymWe
 2yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1EVjp93iyy+fsZ4pGlqUTgPVvJF7tVC1WY/cwqgCcuM=;
 b=sTuCZV0M1QeUNz/+NFqubBVJxhb4cLjlYzblucPdYGINlCTYShgQSRHmtfbdry8NZw
 KS3oAorDinbk3Xp4w1GyF5wmxUYtjjOvnzzFNl/thwhKAMMtJbf51HvdqKlsjG2Maf6n
 VPri1iLoU5tcfmyfB1s4X6YdcSUbKdgTT35j/Y9CQFeMbNS5MGQhTCgbzpve5GgsSBgo
 dNY3wDaTEJlsmRQgi7QzjrgWIOcZmrA+OH86IPjxij4uulM3tcZq7PGNm9DL0eO4JXPu
 MHTo+lWLFnO6yQi0QT9B0L893l5lsCUiT283P/MEXzI51sctjq61zTCb/xvpfvR0DAdD
 +ziw==
X-Gm-Message-State: AOAM532sfvyFLFrDnZ9iNlEMhQj5GkuKYwBk27D8F/LDyAQhLiSMV9uw
 XmOM/wxvSaQbsfZEUY08TRxr1w==
X-Google-Smtp-Source: ABdhPJxICeExcJBLmrn3NO6RbScCFczD4in/HPDgmetC1+RXOo64oJrdGk7V/TT+gwdtveol/zY5Lg==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr821091wmi.110.1626255797327;
 Wed, 14 Jul 2021 02:43:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v2sm1807874wro.48.2021.07.14.02.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:43:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7550A1FFA6;
 Wed, 14 Jul 2021 10:37:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 09/21] gitdm.config: sort the corporate GroupMap entries
Date: Wed, 14 Jul 2021 10:37:07 +0100
Message-Id: <20210714093719.21429-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lets try and keep them that way.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gitdm.config | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/gitdm.config b/gitdm.config
index 7378238c20..a3542d2fc7 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -28,15 +28,15 @@ EmailMap contrib/gitdm/domain-map
 #
 # Use GroupMap to map a file full of addresses to the
 # same employer. This is used for people that don't post from easily
-# identifiable corporate emails.
+# identifiable corporate emails. Please keep this list sorted.
 #
 
-GroupMap contrib/gitdm/group-map-redhat Red Hat
-GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
 GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
 GroupMap contrib/gitdm/group-map-ibm IBM
 GroupMap contrib/gitdm/group-map-janustech Janus Technologies
+GroupMap contrib/gitdm/group-map-redhat Red Hat
+GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 
 # Also group together our prolific individual contributors
 # and those working under academic auspices
-- 
2.20.1


