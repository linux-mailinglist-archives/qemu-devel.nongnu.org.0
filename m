Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8803A8984
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 21:31:39 +0200 (CEST)
Received: from localhost ([::1]:60040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltEmg-0005uT-Dt
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 15:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ff_IYAcKCqwhQZfgdQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--venture.bounces.google.com>)
 id 1ltEkC-00033L-Mw
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:29:04 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:37565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ff_IYAcKCqwhQZfgdQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--venture.bounces.google.com>)
 id 1ltEkB-0003Lr-4s
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:29:04 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 g9-20020a25ae490000b029052f9e5b7d3fso21390685ybe.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 12:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=VjHcyKz7IcO3+lfizDLewpT9r55V7U5GRVD9+yON5LY=;
 b=VWauZ7EMD4kRAFF6ZqEqU1kW4RSoOabFdnPU0fuZQzo6QVYvVouH2T+b5eGwn6KWj6
 NVrurf3kH02NvXx6padWFvWEj0Mf2kqlX9T0MyXIJIXtsI6ULdluq3p5cxlgO0Bq2jXF
 /5OZBNWTWvS+aF9MlnWE74pttUOK8++M592PD8an0vVdxJrIfP9TdVA48MfV5ul063s6
 9kh0wdc0UT1eTnhJOWMISJR4yxWgsRje5bVii7OJPYPWz576dR82airB3a9O6v+tqYoj
 1XftV+sDmQr2c4/4PpsbdQ2oai9MojcvITF/y3Do0i1amONK2Xn9bAhmEWE3RxeUdCkJ
 GVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VjHcyKz7IcO3+lfizDLewpT9r55V7U5GRVD9+yON5LY=;
 b=kS4FabJDoYd5A2JFnoFc368h7fgcRR/3vm15sUzwIPyMg6UCi09IxUMOCl3dygco3J
 K4CpCmNR/A/d4+kBewGfxsGXUHQp8LSpfOsLzB9PArzuHnICk9QwuoYasjzeenM/dOA2
 W1OdUgTYxeckZsFjd7khZ7T3mwEe0PDkq+xpAEkmU6G+v6rt78+rmM9ohbjME/KCtfcu
 ZTyLVjn2kFFBJ0v5m3VcwHL9+VVI7WAUfwMm/82Phk5Q+8bbJHxxZSZONaTOutmAJXxK
 XxMXYAX1xF1lK5FAqHWlmKO0P6eRsjFOu9pRWW41SbiCNXLeqCBDbL8C5gZ1ligahmVm
 1IDw==
X-Gm-Message-State: AOAM533P/JyFo89sqUhtag8R0nVhDCnujQmc7yLvnSK1JPHDjwY52eCF
 CoLWxwNvavK6lXU1qyWQGPPO5DlL75HM
X-Google-Smtp-Source: ABdhPJx4bJFZpxxKnYxXD6BFde70Y8Jb+Qa8aGlQLUDDwYF0gWmGLoObh+Z0TYfuswYeKt9lqIHtfVkCAvO7
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:abe8:110a:b827:ef39])
 (user=venture job=sendgmr) by 2002:a25:d913:: with SMTP id
 q19mr980039ybg.397.1623785341225; Tue, 15 Jun 2021 12:29:01 -0700 (PDT)
Date: Tue, 15 Jun 2021 12:28:47 -0700
In-Reply-To: <20210615192848.1065297-1-venture@google.com>
Message-Id: <20210615192848.1065297-2-venture@google.com>
Mime-Version: 1.0
References: <20210615192848.1065297-1-venture@google.com>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
Subject: [PATCH 1/2] docs/system/arm: Add quanta-q7l1-bmc reference
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org, 
 clg@kaod.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ff_IYAcKCqwhQZfgdQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Adds a line-item reference to the supported quanta-q71l-bmc aspeed
entry.

Signed-off-by: Patrick Venture <venture@google.com>
---
 docs/system/arm/aspeed.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 57ee2bd94f..cec87e3743 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -13,6 +13,7 @@ etc.
 AST2400 SoC based machines :
 
 - ``palmetto-bmc``         OpenPOWER Palmetto POWER8 BMC
+- ``quanta-q71l-bmc``      OpenBMC Quanta BMC
 
 AST2500 SoC based machines :
 
-- 
2.32.0.272.g935e593368-goog


