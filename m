Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D22678F48
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:34:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAzl-0003wA-3Z; Mon, 23 Jan 2023 23:33:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAzi-0003vB-NR
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:33:14 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAzh-0002ZK-6K
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:33:14 -0500
Received: by mail-pj1-x1029.google.com with SMTP id m11so1831324pji.0
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/BNZZO3nQWU75JUJdd7G9yhzR1Cl/QQbtT2FKQab3nE=;
 b=Wes1cEbol0ihWPvd1jwBNK0/ga6/f/jf2lIpeLKB5iuY9Ek3ZwUNvlCWKNhOnuCsky
 E8for3lvevZa/LRnTD907eDvhfvfHTUQPUcfJnkOsBOHIUXMj254liCpGYRp9X/ZsvW5
 EdM10C79rB7NKXdaPOLCSOpoVlvnhLWuHnBuecAKJppY7MDkSOFNQu/yADdCTumKGAfY
 Fw4YBTWvyU39736p7vVpHciD96+FaJYCro66M1xsP1qjbLsvvBaZA0nVP2f8gNaY4FCP
 d9X6uCVomwjBhlaUISCqHCZe58OfyGuO39x0eH83F7o3up3uvNxHitnYDHrlwl1/Ch3x
 VQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/BNZZO3nQWU75JUJdd7G9yhzR1Cl/QQbtT2FKQab3nE=;
 b=5V9N4NI2874A0CeQhpKA9DYSnDT7H+UtUL8waQgJ5a6KkXpNlWHbx0qp5xgVoc7lE8
 Ggmm3OYlWchqnkTmimsVlTu5s1fg7K1biIuAGiYVppbLGPWaJ46ZZ9KDE7Lqx0I3+s78
 v4+wyQGk3KmEmiKZubuhr5qRJDXGCChdr1kfL7c/nsvZL/1Xu5u1dOwC+aQ06unkGGCI
 Dnlv4ZgB3slpVekihX5eiV4SRG3unU5U3HjkEAENtvoDnBdGuU/NRpmXt/meB31nzIy/
 tj7CdbYmw1hZ6HbW+D9e23JgAH+BpoeE1xxd4FoEk6dAESnK4n8xtG0ZXH6YXm+thivO
 NlHg==
X-Gm-Message-State: AFqh2kp7cp/eKX2kJZ85d8A3yvC/MG91YsIVqw8aJ7oE/5MmNnIYvkLC
 q02rKvFk0UgOdF9VI4t3Yb2EXA==
X-Google-Smtp-Source: AMrXdXsCG0CO0RQ/p4PkL4vEF/4n0Lq6y+m4BfPXdDHbwPiQmA/koFWu8tFflU37ojtvEa3wn8wbGw==
X-Received: by 2002:a17:902:d543:b0:189:ea22:6d6a with SMTP id
 z3-20020a170902d54300b00189ea226d6amr29680300plf.60.1674534791869; 
 Mon, 23 Jan 2023 20:33:11 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:33:11 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 26/26] MAINTAINERS: Add e1000e test files
Date: Tue, 24 Jan 2023 13:31:43 +0900
Message-Id: <20230124043143.5515-27-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 958915f227..3b648a89d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2218,6 +2218,8 @@ R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/e1000e*
 F: tests/qtest/fuzz-e1000e-test.c
+F: tests/qtest/e1000e-test.c
+F: tests/qtest/libqos/e1000e.c
 
 eepro100
 M: Stefan Weil <sw@weilnetz.de>
-- 
2.39.0


