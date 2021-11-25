Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FCA45DDE9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:48:05 +0100 (CET)
Received: from localhost ([::1]:52746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGye-0008Ts-RW
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:48:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGso-0006jI-CE
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:41:59 -0500
Received: from [2a00:1450:4864:20::335] (port=53936
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGsm-0002Kf-Fd
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:41:58 -0500
Received: by mail-wm1-x335.google.com with SMTP id y196so5935802wmc.3
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 07:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RyIHG7rbgW4Ax4rztavLtHw3c5eLl5GAByR6z8d2y5A=;
 b=sidRM2WpXMytLReznljvBEUHBx2b/gf2yuqTiHLl6GOSexDuLaJMcrhk0eQQ2HYNu9
 4mB2d3SOrwIMwMoRBoZZJomQ4QhpOcba5TO3lgJi/NX28Q13ZxZModG3pHXfvA9btdHt
 9qxsNFkVZV/3bN64rZV3d6Tm7Clgr3pIBtRt+4Lt80QfjQK6cW5FMjRKe8kEaptEvq/5
 nCLJb1F/jdDLZGPIyx5I5w9ZvdU8nzxCNpN5TMD0Se5prTRrl9Aml4yifv+Zlg4V/MtQ
 i33Q13otOTyesQ5LZK0PE/8jwM79znZ6IjrqODeL8KGJAIE+xOzWRFAj6KNDAC0WPQgD
 tcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RyIHG7rbgW4Ax4rztavLtHw3c5eLl5GAByR6z8d2y5A=;
 b=J11ZbE3mcrX/sU8TuDCUinJF5Fm1tJbBArPo8YDxTdDwlpvXmeXFErdR/yhKM7oeNB
 oK4BL1j+Nc+xkvJlumtgqo9Q1fn52SvWzHuzf1BtWwwLX8UKHjCcizkCJiG8pvQ2hzi0
 7I/GBZ3NhcY+3p/64mccLaiycESk459bvqaboDhohmiAF5QiCcA0DP28+Z+z3ReqcgzL
 YQM6lpiVPJbmwby4tw1pJKkooAHhmTwhsP0Z0HfRU6nmWN1PMGrXlxKIsNt/sPLzxVZq
 nC6AA7mX2tVx+I3D9f3tix5k4RU5er/2LMm2EN8HWSzriklCswsl0I6aLBsxE7JXiC/f
 I/1g==
X-Gm-Message-State: AOAM531uAfNotMPbP0CZz4CsSlOM1M1vzileX7+dWOro9V5u5R+zyPbD
 oEFfFLetbIRwOmuXgKlspJQrow==
X-Google-Smtp-Source: ABdhPJzpw4yXeQTSmgX+9tT6/vWmdmVePsfl5O2zYg4EwLG/sOVjruax37AzHECwPlgPEo/vac89Ww==
X-Received: by 2002:a05:600c:4f4b:: with SMTP id
 m11mr8082917wmq.151.1637854914940; 
 Thu, 25 Nov 2021 07:41:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h22sm3989564wmq.14.2021.11.25.07.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:41:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F5EC1FF9E;
 Thu, 25 Nov 2021 15:41:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] MAINTAINERS: Add section for Aarch64 GitLab custom
 runner
Date: Thu, 25 Nov 2021 15:41:44 +0000
Message-Id: <20211125154144.2904741-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211125154144.2904741-1-alex.bennee@linaro.org>
References: <20211125154144.2904741-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add a MAINTAINERS section to cover the GitLab YAML config file
containing the jobs run on the custom runner sponsored by the
Works On Arm project [*].

[*] https://developer.arm.com/solutions/infrastructure/works-on-arm

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211116163226.2719320-1-f4bug@amsat.org>
Message-Id: <20211123205729.2205806-8-alex.bennee@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8f5156bfa7..006a2293ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3511,6 +3511,12 @@ R: Beraldo Leal <bleal@redhat.com>
 S: Odd Fixes
 F: tests/avocado/
 
+GitLab custom runner (Works On Arm Sponsored)
+M: Alex Bennée <alex.bennee@linaro.org>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Maintained
+F: .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
+
 Documentation
 -------------
 Build system architecture
-- 
2.30.2


