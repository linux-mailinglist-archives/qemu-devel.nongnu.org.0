Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8613C8265
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:06:22 +0200 (CEST)
Received: from localhost ([::1]:51338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bmX-0002l4-SM
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQ9-00052q-KR
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:13 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQ5-00006W-2e
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:13 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m2so2434123wrq.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mkveh20OoO1fJ2jJIzs+75pAwAXlywpfOsc7TNI4PTQ=;
 b=qyI1RywfgP2HgQuQKBHOjQOIsaSgSEltr2q2p2tc2rUg/HaNBGgqiv1KV5tmNS3TvD
 JEMGN1UuRya0CwKlI+LHVJ+Sgd+cKqOK4nEdLllk5ZmXNv122hs1oADkCnASUYr/Qo55
 2RxpNCdo9TO0WrR7XFrn0ArTfpUbEbVAagqhdFxybfSfrhCW05+osFtklBD5wqKVy41L
 vkamLxcW8nlb9OfH5VTbhaLSEnti0Is/81T8AfhliX5sqDdFq2gMV7cklHPWbiP+Lsc4
 1qPSxAQJegBEiW+4KfQjcCV+xR28VQE7QNfqM/ZoYeBfy2V5XI0+LHBJSMdQKfQyfFRI
 /R6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mkveh20OoO1fJ2jJIzs+75pAwAXlywpfOsc7TNI4PTQ=;
 b=kxUC24miuYMvrjdloO0qJJ8Ve6Pvwh/G/4fkESCJTUsBYnGQ+pz8Q5AG0tqwavID/N
 2W7ED2bvjaS35bmY0B0sHLgnfO3sicWpyyOMC/hCHGt57FwAoWIkU2DxdYy9FxwipMT7
 5XYDCjrmFf4K/kCf/NYfq9k7y6ggAvAotwbr7iz/M5WHt4Zt9h+vb3UeLabh0b6goa9Y
 eTu6AbegxIgSVy0WigrvfySj/7Eay7xspLSkdYw9k7G8UY7/BjP6P08Du/hnrPrpIX56
 474eZ5XmPq5PXS2ubN8swzhuWg4S9z+nMj3ZE8BP03//70qLzB2Q7AsE8fTrpEzURAxT
 pPWA==
X-Gm-Message-State: AOAM530BSb6P5Qwbt7B0dNkFMTBPHVCfpV6SJtGr+Ex2wkA4O2Jco+u6
 WR83+WT39EYDnhCONdsfRoz3lQ==
X-Google-Smtp-Source: ABdhPJwL4tCXoC6nW8kOwANl8dlXtnZamY3imOlCXDo9MS0d57UWkkDAwUicjshJDYPXcjLz7TX9Fg==
X-Received: by 2002:a5d:6850:: with SMTP id o16mr11369858wrw.319.1626255787657; 
 Wed, 14 Jul 2021 02:43:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y66sm1563100wmy.39.2021.07.14.02.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:43:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3541C1FF9D;
 Wed, 14 Jul 2021 10:36:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 14/21] contrib/gitdm: add domain-map for Crudebyte
Date: Wed, 14 Jul 2021 10:36:31 +0100
Message-Id: <20210714093638.21077-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let me know if you want to be moved to individual contributor or you
want to keep with the work domain mapping.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 5ac8288716..e42861cd11 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -9,6 +9,7 @@ baidu.com       Baidu
 bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
+crudebyte.com   Crudebyte
 eldorado.org.br Instituto de Pesquisas Eldorado
 fujitsu.com     Fujitsu
 google.com      Google
-- 
2.20.1


