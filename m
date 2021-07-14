Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27693C8230
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:56:54 +0200 (CEST)
Received: from localhost ([::1]:54616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bdN-0002zD-LL
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKf-0003Dk-LB
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:37 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKe-0004kF-1M
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:33 -0400
Received: by mail-wr1-x42f.google.com with SMTP id f9so2356438wrq.11
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iypXcdw5mlwuIysZPQWovjCubqXhpHUzMF180LrBYeI=;
 b=T7VplJvnZTlYI5YWYaIwcCq+JUZfICHIdBJ0GGAH4KGMy2qbyoiJAmsv3tL56wnfa+
 S6emLWNcBpGBj0d3X6+JfUpHLS9DySLKHbdvcS+FFNssyLEhHvoKMcTFD1Z3vYkyqo+H
 1Vlzu68ggoPIjyDPyV+F/OWt0rt3g7x0YeSJhZS3Jafuk5F5eWitGVlGnvp+bygpSRXK
 ScEVE992DauXkO+mWsBFJ6tQtO22gC+nx3X61PbU7X+6DlyTzYl3Rk0Kh6VhRno2Ggxg
 Q21bhzTcSEi8pbqd/en3D0/x3VfO4g/Pi//v2iGgQAJnUS6v2WsHPLGSN8war+urKy5m
 Y5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iypXcdw5mlwuIysZPQWovjCubqXhpHUzMF180LrBYeI=;
 b=FUmiOUZdBgWwDHQA/iWesf7xvQgwsV5on5nhyqh5uIC/tQbB/NRwfn+SX47SKjdac0
 X1TxduWbUjUEyOtOXQOHQUq+sMt2gX6q2XM55JPQTpCKRaWR3dss1M4ahvS+6jo3h3cc
 tTAky/2WqmnUltX6xrC1RFV4MJhEDruF2AONzfif/h4k2tl2htHwpB5qlR95KE0GqGBc
 ewrI9eQ7HDccERP65zyjZ0MvEFi0bKOnAldbDXnh1KF3zWvpqssNTVumZujWKrPkQbvf
 AcvLIlBTF8xT6RE49teQwhC70OgqDRwoGH0yAfahJaY+kfzoamHJlpHx2mwJiNlOIUdP
 wWJA==
X-Gm-Message-State: AOAM533LEF4978Nk0aDfhJxJ4YKO47J4/NGv/cTVxWwQQmFWF16qiiq9
 ZMvZeG1kwLfomv6WBuTT15Y0KQ==
X-Google-Smtp-Source: ABdhPJxtqUaF6VtKlGLIPgZMfdRhLB0sIlPZZ4VkfJXgJn8TcMetqO+JUQFvWomxim8XWvc9t57Ggg==
X-Received: by 2002:a05:6000:11cf:: with SMTP id
 i15mr11645514wrx.212.1626255450735; 
 Wed, 14 Jul 2021 02:37:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e3sm1946764wra.15.2021.07.14.02.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:37:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 480B91FF9C;
 Wed, 14 Jul 2021 10:37:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 07/21] contrib/gitdm: add domain-map for MontaVista
Date: Wed, 14 Jul 2021 10:37:05 +0100
Message-Id: <20210714093719.21429-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
 Corey Minyard <minyard@mvista.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Corey Minyard <minyard@mvista.com>
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
2.20.1


