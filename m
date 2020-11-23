Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2C92C0484
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:29:17 +0100 (CET)
Received: from localhost ([::1]:51912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khA20-00041C-Ui
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yR-0007y8-Nf
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:35 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yP-0004j2-Ss
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:35 -0500
Received: by mail-wr1-x429.google.com with SMTP id b6so18250854wrt.4
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uf1eDGIAVRH0GmKGtydyGY1impeWIIls55yo/sTzgkw=;
 b=eS7S8uLQZZPbeprtrYdGSJX7dG+JCVUN1/sSmM0V+MU/LWkxZgMBfUZW5B0Xorc7/4
 sWDEQnRYmnoqzKyT2XPNygj5T2PmBqHMSIZ+k8vSi2A3o812KJOyuzd8gtHBKBYzMyED
 fyfDH3ecC0yIBcN1e30HtDQWsXa2/txbeJNy2FxpYqadrUCFiQXnQaPJfTiZ98v729v5
 6KkptW7Ci1r2z0pmEcL+k5/X8/6LTZMcDMgtfYPB9U0L62IMnDDgLlWmVO8rQgOLOnYD
 /BgeoDKPT4tE/9Eu+mGvz7/6D+ssQwu9y4iDFKnVgBmPVAptUW7gsXG+eZO1BwWbLCLQ
 foWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uf1eDGIAVRH0GmKGtydyGY1impeWIIls55yo/sTzgkw=;
 b=p0WXkbMQqXJU4m40lfLf5Q5ytXW0fYTNAUPIEcBJtX+nG4bK4IIPgsXUQ535nQ2Qsv
 AvitoExrqwp5PP1rdPqRLyDqZ1GCp2FaI0NrV+kJIstExlWmeZx2rh+vYckJQ2JkIpx3
 WTXwCefO6IkXWwsPgpESClsAn65QWvL7tWppnCkEbj/7Nrq8aX9PCZUCTLhmbW7dQaoC
 Tu2QWZtVbTTTUnLkpoVXzdQzrdtfMo9SzKodgUuKhKQkWRTnTfvPJUVFjUIt3L/11j/y
 Z9XvVYaD8P+xU2AO3pqTKI03FFXebnQtAkRMmfM1iVe6/VBEOrkSXDLsmUj73tCT6ggM
 Nn4A==
X-Gm-Message-State: AOAM530kVHO5zTDh47kzLoafkUSnOW+a/HS0i+ruRg7h8jn7ZhvbEfmI
 Ar/P5K9zAD6P1beNXNhqAlv+EQ==
X-Google-Smtp-Source: ABdhPJykIEqL09maLWwn2VPJyW5P0MqEpsyybXsLBMmSvvWDgUOzynt+IZYAXdLghGvhsphQ6kTONw==
X-Received: by 2002:a5d:6310:: with SMTP id i16mr30066311wru.284.1606130732344; 
 Mon, 23 Nov 2020 03:25:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u8sm16155389wmg.6.2020.11.23.03.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:25:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7175B1FF93;
 Mon, 23 Nov 2020 11:25:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 7/7] .cirrus.yml: bump timeout period for MacOS builds
Date: Mon, 23 Nov 2020 11:25:18 +0000
Message-Id: <20201123112518.13425-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123112518.13425-1-alex.bennee@linaro.org>
References: <20201123112518.13425-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These seem to trigger timeouts with some regularity.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201118140739.18377-1-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/.cirrus.yml b/.cirrus.yml
index f0209b7a3e..08db7c419f 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -18,6 +18,7 @@ freebsd_12_task:
     - gmake -j$(sysctl -n hw.ncpu) check V=1
 
 macos_task:
+  timeout_in: 90m
   osx_instance:
     image: catalina-base
   install_script:
@@ -32,6 +33,7 @@ macos_task:
     - gmake check V=1
 
 macos_xcode_task:
+  timeout_in: 90m
   osx_instance:
     # this is an alias for the latest Xcode
     image: catalina-xcode
-- 
2.20.1


