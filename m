Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5652C04E3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:50:47 +0100 (CET)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAMm-0005tw-Us
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:50:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFi-0004Et-A4
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:26 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFg-0002gB-P2
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:26 -0500
Received: by mail-wr1-x436.google.com with SMTP id s8so18236573wrw.10
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/85XqsSvKC+oFBpd8FNWpWqgM3t8hXC12/WVfhAx4kc=;
 b=CILux+8emE4JV52j5iDir2zPoOpHaASg7oQpY3MruhcjkjoqkW/wQh0gcnEjbHq3BN
 8kazlJWEkVgrqiRx5lHlasZYK9PZoGIADQtartLp4RBhlGLCNK/104D5H3Hbh2vPq/8U
 i39QyoejpZHBZoMwcgXPIbLM5W+4PRRdV0TzABXNYHo4CRcN6yuiYkvH9lLcqoaM+Ulg
 50S7nJ8Ri3pARjUYobWkXcJ0qjfUaoKjMOW3J5uCAq4MAwSArOPqspfIgHwEkd9XRVc/
 11IQOei5JzOCN38AYsH5lebNxqIiHGgoXyYNHiEyX9n6YOgJdeCYEQfTSn41FoDzpHTl
 L8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/85XqsSvKC+oFBpd8FNWpWqgM3t8hXC12/WVfhAx4kc=;
 b=s2oSnewsDFi0Eqfcm7rQ05sGYiDlgSIyWwT4QUrzlhVswUrXwPFuLXr5ToFlx0nJ62
 LOaxxxdxjE/R2giEYxQPfRjFtS/UlhU9ufU13owZkF+AfseozGQ8IjAWO0JR+QwV4anp
 hfaLBXzdQ+9zZTdqGHxWWlCsh1ZfjMGnrvKYUDsfE+NF6YlWdZ3qnxj4Aqqus9AUY6s1
 PCBpQZU0TLEjsc/xbcymcZAHXMFFBUB/pUzl5+VyrlE8YARcE3xFLnR4r9lIAzQoc+Kr
 ynsId6/GHS0KKRu9zyMxdg+SnRu9YPzHKiT8kXPYWTGnn0F/LuoPVEVfj8+BKEpEZQui
 IPug==
X-Gm-Message-State: AOAM530581swVwWzREv0TBQXPPfhmMYG2P6WRRwGbb02wNnRsyrlhv4y
 VqhEvH92l8jlnho0wATyXfMkckCuYsRK2g==
X-Google-Smtp-Source: ABdhPJyGCgQyi2u8ESmMBAUqh9ajPFvAyKAXVP5TBy5UwRH+Pum9zv16rk23SSuq5kDRcz62MuJnQg==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr30616861wrp.339.1606131803159; 
 Mon, 23 Nov 2020 03:43:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/24] MAINTAINERS: Cover system/arm/aspeed.rst with ASPEED BMC
 machines
Date: Mon, 23 Nov 2020 11:42:56 +0000
Message-Id: <20201123114315.13372-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20201120154545.2504625-3-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a9c74f9aab2..02f8b6f696c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1000,6 +1000,7 @@ F: include/hw/*/*aspeed*
 F: include/hw/misc/pca9552*.h
 F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
+F: docs/system/arm/aspeed.rst
 
 NRF51
 M: Joel Stanley <joel@jms.id.au>
-- 
2.20.1


