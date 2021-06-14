Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3C33A7084
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:33:54 +0200 (CEST)
Received: from localhost ([::1]:44530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lstHN-00018b-VF
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1lstCc-0001oD-By
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:28:58 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1lstCa-0005ka-G7
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:28:58 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso363521pjb.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j1HHKQpv5asbS7zXpA/KWjRl+aND7sfZOUIRchm3QA0=;
 b=cRhWTiWFDsaWm9Mj7pZLkO0jXgi33MRfRjxgAFryiplemV2DyM1CXSYYaRxGTQlSqI
 8b6MiscUKMLlkLaNhcjouWej6JeGSYGKx/Dzn4oSEutilczNS80K3Yzn3IR/hMXI89+b
 qswn/17Fz3+jxoUND0qYFVzEN2BbtpgL86J0UEiErnxND1TPRDYzm/205MFeLu+uOsni
 Fw7mB9sX1Fb+mGrP8oocHQWgzKkK1ZaVl4l/o+PA184EZQcnG22FZ3FGf0dK7uwm8R8E
 yVymH9xeH3YS3IiCHjt2lppD0IUFpuJoKYhxBVUX1NmAoi4WOhgPdcswMg2g9NwZwaNT
 ucVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j1HHKQpv5asbS7zXpA/KWjRl+aND7sfZOUIRchm3QA0=;
 b=B/u3lDGKOrOF1ELkAJjHZHTZ37RDBw1ncDhDjzAaQUBlXfDl24m6OqFHO4ew4Pv/Zn
 V7mQEblIJog2E5nGaeiEo3/p650sT50/szVfEpl2vINDaOOEF/vrLf4TWsAUDe6c7ezq
 5HBie3GAILClSPFMNl3MqVlmnlMRUVaq/d44yXlLuaHF++med0+EaibZPTJ6fku/+7Jz
 BXCXI/Nf4NHQ+ayq+C7exIXS2eI1oWsC6kgeUXduQAXJ5w7BMok2D2UX5VycSK1e5mGx
 Sr2V/elyyckRnYTfx4x/CttKrbFfCYRUGDGHrP+xKm6kv4ROKmUIuhsN7afPdr6XhxnK
 zBqw==
X-Gm-Message-State: AOAM532VSKl/idSUJgkQYpbBP0Ym2xmqUYdzQs9J0MMkrzL6PQFGopcy
 HhFHGxFABJJBC15O4PNWJ6y/rA==
X-Google-Smtp-Source: ABdhPJw6LT62Ze0SAwH/80UgUBgAlhFYK2X9K9MVjWEMhoS4zYd/plA/lVuP4Kw3MuZyL+AqxsbNTA==
X-Received: by 2002:a17:90b:4d8c:: with SMTP id
 oj12mr20619128pjb.188.1623702535323; 
 Mon, 14 Jun 2021 13:28:55 -0700 (PDT)
Received: from p14s.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id fs10sm289029pjb.31.2021.06.14.13.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:28:54 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH v2 5/5] MAINTAINERS: Add maintainer for vhost-user RNG
 implementation
Date: Mon, 14 Jun 2021 14:28:42 -0600
Message-Id: <20210614202842.581640-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614202842.581640-1-mathieu.poirier@linaro.org>
References: <20210614202842.581640-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: qemu-devel@nongnu.org, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds entry for the vhost-user-rng related files.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c594..4fedca72c183 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1951,6 +1951,15 @@ F: include/sysemu/rng*.h
 F: backends/rng*.c
 F: tests/qtest/virtio-rng-test.c
 
+vhost-user-rng
+M: Mathieu Poirier <mathieu.poirier@linaro.org>
+S: Supported
+F: docs/tools/vhost-user-rng.rst
+F: hw/virtio/vhost-user-rng.c
+F: hw/virtio/vhost-user-rng-pci.c
+F: include/hw/virtio/vhost-user-rng.h
+F: tools/vhost-user-rng/*
+
 virtio-crypto
 M: Gonglei <arei.gonglei@huawei.com>
 S: Supported
-- 
2.25.1


