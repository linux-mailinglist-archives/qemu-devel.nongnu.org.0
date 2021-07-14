Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486743C8288
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:12:56 +0200 (CEST)
Received: from localhost ([::1]:38608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bst-0004yf-Bk
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQL-0005MH-N5
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:26 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQI-0000GK-VB
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:25 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l17-20020a05600c1d11b029021f84fcaf75so3493775wms.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=clqrKAvQN2EMsh/NXQ/kMnkpkQ3oL3snCpv5YEPIOdY=;
 b=iPUXCud84CSJsUPKfDyzxpG/qgqojt+KMcM9uYfBGdu4wV+kP9Q2akPGG02gog2RFB
 CXcB2ei7p+PU+kWnjDWBAAqWfkQ+Xd+9Ra/vbju7N0NxYD6OTPhKthWTr1tiUoKB10pV
 0uLPPjt6CTCFlP3Yr+k5T6sNqHtgyMNP+Cb6V2WCay+q1xb61SMQAhiuyeVptD98ccA/
 /QoHKtdCIcfdk72QB9XBhYtLhaVg5r4OdqbmZAQ4NO1NnaMaSTTJYHfiWbNgv1llfRsm
 rx6nggAuLEOFeU4j9hVAiCjjXyYJLOm11yMfY0hOlVDxzNDnf2Z/UtDE/eOpfQien2PR
 BXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=clqrKAvQN2EMsh/NXQ/kMnkpkQ3oL3snCpv5YEPIOdY=;
 b=ZJ1KXiDrVX3aJBI3H34/T03slLz4WNOnZGKl49FenqbRyRhH8uT53dJR+8+F0BcUy1
 HHp33To8z8IzmeFFbEH69DI2ksRppU/FIdeQSqxgCVx9wfJZY6/W5LGkTYxMkiGCNNA7
 w4CNrwM+0XNGzNpXoQ+Xw4avqsGdoB3gfRndo3BMa4TF9b13qz41KvMAhSL8UUbGgvzZ
 NM9IOnrO42nb/Sj32EfIEX67RbEzJPn2bBMv/ysYWBjnrjtref54BIfMk9bYIt95ekCr
 7evFEU68VEd2bcFFYiRIHqHc71/dMsPUOLgFbVMmCh9MND1sH9kHVuqzL6q24J4DFMtx
 +Z0g==
X-Gm-Message-State: AOAM533L19mA9QS4wdedlA7bwL2ADhCRbj5KIZbKD0oeWgEKHtvk53vA
 ILMn7nVuhpmgDyHH6uEtr//03Q==
X-Google-Smtp-Source: ABdhPJxxuuIj+D/+MalKtb7Fgt+/2GUY7XwXwif8Xvt3TALkXCZ7rRgYIPtD+gRki2l5vBcEXkaBQw==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr10137618wmj.120.1626255801691; 
 Wed, 14 Jul 2021 02:43:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t6sm1968612wru.75.2021.07.14.02.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:43:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21D091FFAF;
 Wed, 14 Jul 2021 10:37:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 16/21] contrib/gitdm: add domain-map for Syrmia
Date: Wed, 14 Jul 2021 10:37:14 +0100
Message-Id: <20210714093719.21429-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Filip Bozuta <Filip.Bozuta@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have multiple engineers contributing from this domain.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Filip Bozuta <Filip.Bozuta@syrmia.com>
Cc: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index bada5384dd..0b0cd9feee 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -34,6 +34,7 @@ siemens.com     Siemens
 sifive.com      SiFive
 suse.com        SUSE
 suse.de         SUSE
+syrmia.com      Syrmia
 virtuozzo.com   Virtuozzo
 wdc.com         Western Digital
 windriver.com   Wind River
-- 
2.20.1


