Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DB63D0578
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:36:12 +0200 (CEST)
Received: from localhost ([::1]:51984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zHX-00065M-PF
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8v-0003MD-N7
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:17 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8u-0005dQ-2H
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:17 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c15so170957wrs.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNfklYXP2ypL96EAgvqm+qo2e9hAGJxnihYx993X5yE=;
 b=YH5s+pjtFGd+tSc8dSRnQPWLLUqXYikVPhVD5QuhZF/pqmHj4Pe1U4q9WAm9zGzGMK
 vrdRVmdS9taS/uE/wJvk49K0sgXCfd72BIMAoCS/47eurFLiK3z9dUOw4T4788RTD5s4
 4zlpQf5W6OoZ+3rdpX9Y1uGQByIPIMggx2XLyKT0eR+x63bMPKOBhjHgl3amL8eQCbOC
 U+CvGUY8arVIqh5o65dsJAEFuSW/iKPl6veQO6mSWrwlpYf+hNMp+pkJfwvHaVfRn+5T
 TzCEt9kzSo7zhG+As3JKdHc6zBeGn9LenfTStoV8S5oF5LVk2tmjh7icmpka8WK0PREy
 QWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNfklYXP2ypL96EAgvqm+qo2e9hAGJxnihYx993X5yE=;
 b=GtqA4V7sGtR4NyNlG/oKGJO+TdAcKGfgJh/LoRM13o/vrgTfXChbhGytiRIHsFW36K
 F3Uv88Sk470Yxu8EKd6pMq8QZk30IBvGBtA1XvIXRQ3s0TmmqnD+VXFiqg/Jor0yBSvn
 LVqNmy8TtjQzDg+iI9H8nVC26qYXI3bIBlm3AmcGRGo6Yp5aQyKOrfENx/1GvolQFfj4
 9S6OedtYduxxk/sd7QOBIQWK+kiTEoFchMJpmo69VRpHVjnROf4k/s7GliLlCHoRHIHH
 uGQ3x5TNUG/fKBygXWYn+2hwP7Y3hGAXi8zTbt4nNsMSSfZSR18DVTk0XhRKvqPzsDPp
 cX8A==
X-Gm-Message-State: AOAM531YRr0sIKTVCsAlSHd8s2mmY2Lxxjh2RZCDWrNTA9jtt0rFxJvj
 V0oz3a5iFjnGp3K6nFJUtzfr0A==
X-Google-Smtp-Source: ABdhPJwbmTeqKN7q20aQmGsFnKpaG1L7+Q2tvmE4wzLjYC/dAtfxjUqoR7lxYByW24fkGI797O6lYg==
X-Received: by 2002:a05:6000:1a86:: with SMTP id
 f6mr19015705wry.127.1626823634612; 
 Tue, 20 Jul 2021 16:27:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n18sm24129951wrt.89.2021.07.20.16.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 706BA1FF93;
 Wed, 21 Jul 2021 00:27:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 07/29] contrib/gitdm: add domain-map for MontaVista
Date: Wed, 21 Jul 2021 00:26:41 +0100
Message-Id: <20210720232703.10650-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Corey Minyard <cminyard@mvista.com>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-Id: <20210714182056.25888-8-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 0074da618f..efbbb15643 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -18,6 +18,7 @@ igalia.com      Igalia
 intel.com       Intel
 linaro.org      Linaro
 microsoft.com   Microsoft
+mvista.com      MontaVista
 nokia.com       Nokia
 nuviainc.com    NUVIA
 oracle.com      Oracle
-- 
2.32.0.264.g75ae10bc75


