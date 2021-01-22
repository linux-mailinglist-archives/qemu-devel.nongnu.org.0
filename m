Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58B30029D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 13:14:26 +0100 (CET)
Received: from localhost ([::1]:34054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2vKb-0007GL-VD
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 07:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2vEW-0008Tp-Js; Fri, 22 Jan 2021 07:08:08 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2vET-0001vp-RV; Fri, 22 Jan 2021 07:08:08 -0500
Received: by mail-pl1-x633.google.com with SMTP id t6so3091585plq.1;
 Fri, 22 Jan 2021 04:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Lkc05bhxPEaurDuvorYROlMZGsONdTZ57rQZ1y9IAE0=;
 b=peK59r+DyPmQsmELzHNYcddiwPw7jzm4o7xdUohKOuLhPwAOahOMQ6sCM+VEdbr3ie
 X0CmoYbGTaCyGoIaQTulJ2Ds2KDcq1lo1kIL4fROQRMQtdjnHoIWMfnqp8+souXlI5Kw
 5EERzynrFs0kGF1uMY3TpNVlwh7LuWs6z8Hgfic0hkvez7Sw43l9RE/U/6MrXp5BpPjS
 dDekNgBX6jNS8OtYV92DgmohOHw6wu9i9VDF1dO2ZHj1vyZqON3gMgw7XYWu7/2ldW3e
 GaTAi9fpFyWiJqDwDiHjjjtLMtyKm8wyl77hsRzMGYttmyxvw0agEFscwHx7aJgNm0Wg
 jeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Lkc05bhxPEaurDuvorYROlMZGsONdTZ57rQZ1y9IAE0=;
 b=BcNr4PWeL6ETlKoW0hc14PseLJz+a9JCeOGvfkoZGY8kdPSvxJxU9L0BU5jSanvyRU
 w03TrBdheIkmrVJSDJmyYbKTNG6z49Ydh98YBpDVDqh0y09/dxrbxxgOyuknTjFVXk5C
 PLElXX2nTxbW+UVyOc0ItQw0CFN5EanzOk5WKTTqMqlVT1rulND73Z6tyQt7bBqNAqxp
 aPZYp1xRV8uuoxcAZbVBkHFsZ2lVrQi/bnSfaU25udOpWUe2nh4USDXoH6geeQYh3mXd
 eyE57WixE9lYzeT00Ai1IPepPU9V/jUOy5sPmOl9O0sToYKWi1S8SdfgIRjIGQ4p8ti3
 XAYw==
X-Gm-Message-State: AOAM533W6BI+WN1nmqQllIzqNB/rL+8R2LiLRl/+A1TkgzxEnZpDIKWT
 VSW0Hz5jLo53h8lGJktvZsOM9qFtJBc1IQ==
X-Google-Smtp-Source: ABdhPJxxyZfTbAQVk7EWku3FmKPQds6B9G9Z+TfxXygLO2/vJ+Cvj4zboDbWWutT6wTmyxACzjm7ng==
X-Received: by 2002:a17:90b:228f:: with SMTP id
 kx15mr5207817pjb.32.1611317284147; 
 Fri, 22 Jan 2021 04:08:04 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id mv17sm9104440pjb.17.2021.01.22.04.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 04:08:03 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V5 5/6] hw/block/nvme: add NMIC enum value for Identify
 Namespace
Date: Fri, 22 Jan 2021 21:07:35 +0900
Message-Id: <20210122120736.5242-6-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122120736.5242-1-minwoo.im.dev@gmail.com>
References: <20210122120736.5242-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added Namespace Multi-path I/O and Namespace Sharing Capabilities (NMIC)
field to support shared namespace from controller(s).

This field is in Identify Namespace data structure in [30].

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 include/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index d6415a869c1c..ad68cdc2b92d 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1203,6 +1203,10 @@ enum NvmeNsIdentifierType {
     NVME_NIDT_CSI               = 0x04,
 };
 
+enum NvmeIdNsNmic {
+    NVME_NMIC_NS_SHARED         = 1 << 0,
+};
+
 enum NvmeCsi {
     NVME_CSI_NVM                = 0x00,
     NVME_CSI_ZONED              = 0x02,
-- 
2.17.1


