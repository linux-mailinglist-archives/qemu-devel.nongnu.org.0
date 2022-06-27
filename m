Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0941255B855
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:49:19 +0200 (CEST)
Received: from localhost ([::1]:58394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jUj-0004M1-Ne
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jD7-0005jj-RH
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:31:05 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jD6-00066r-6h
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:31:05 -0400
Received: by mail-pl1-x62e.google.com with SMTP id q18so7376181pld.13
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 00:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=20lVU+EpbDxJuAdyQsiOYYC0OZmHffv28Q74qBm9xiE=;
 b=Yf1PvkZmq0TU2/3xY9QUCMjYKbm02JHmX5cQRbkXGYCHooVhBSvYBLNXtKCzkbKXTQ
 jZvxgoG5Ml8wsXyF1aCJVv+/UXXzP8NIBW2euNd9Qx09K3HA5d2mE7RK1dsPI5UvyqD9
 jz0zrRyLIBDbWnVdbw6Mzcb/HBBQdowEe2keFSUXhS5+jRCbdC0n/eVqx/h7f0PPEDT5
 NkyUxfRRhajuFtw9fAFzwLeBhuTJzdFBH4PflHBAB4LOrCpLk3Vwj/mngAzfxNPUoorr
 DxCohq37Zg9YRsFMeVXpYZG+eE+lvSv+KEWBqVAxQkvb+r/m6A+IdmTqIFyabVKdjCS7
 lTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=20lVU+EpbDxJuAdyQsiOYYC0OZmHffv28Q74qBm9xiE=;
 b=fZhM9HMftxTEFIVaQ0wrNYVlFcO0ZYUcWWnfbxoaef56loB7exQl4bh5hHuNikksgC
 1Tpii7vmxJW4ugyQrGX3mwYRAVLcFuHsX0HZagt1gtSnafDiFQiVlRhcj62NjDQJqwgO
 J2OJe1Wg/tw13bpgIF0jgJwFtj0LytTG9IfL5aelLNGWNI/bxbI5swDnjLVrdGQwddyT
 6Amol+h9YTJayrkWec0a1xdAqf0rsWFgG/NiGRD7f3kfPvCfN6M631vBXpAD7s4EeA7j
 kf0+eKWHZX8kW5c2b245G5QmlYfhtiN3NCpKo+sdURKTMp7IbXOBjeWLOcgYcrfSPi2E
 5hJQ==
X-Gm-Message-State: AJIora9N97mGF9rt99/QpVtq/dq/Am3a4DgwrGoenwcfAjTO+m0Mhm0i
 nZQj18dCGTTxGJQf4+drSL4lysbEO7YDeJj5FFs=
X-Google-Smtp-Source: AGRyM1vYDm36l0GUWNcEtidYle3tHDupoWbhcpn8rRwkYukDf/lCEQ7FB0XyquAicfFJHyEBJW20UQ==
X-Received: by 2002:a17:90b:1d04:b0:1ec:f898:d863 with SMTP id
 on4-20020a17090b1d0400b001ecf898d863mr19558587pjb.79.1656315062636; 
 Mon, 27 Jun 2022 00:31:02 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.136.66])
 by smtp.googlemail.com with ESMTPSA id
 h6-20020a170902680600b00163ffe73300sm6420928plk.137.2022.06.27.00.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:31:02 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: imammedo@redhat.com,
	mst@redhat.com,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 12/12] MAINTAINERS: add myself as the maintainer for acpi
 biosbits qtests
Date: Mon, 27 Jun 2022 12:58:56 +0530
Message-Id: <20220627072856.1529357-13-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627072856.1529357-1-ani@anisinha.ca>
References: <20220627072856.1529357-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I wrote the biosbits test framework, the qtest for testing QEMU with biosbits
and all the related changes. Making myself as the maintainer for biosbits
related files and test scripts.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aaa649a50d..f5358a1f96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1860,6 +1860,11 @@ S: Supported
 F: hw/acpi/viot.c
 F: hw/acpi/viot.h
 
+ACPI/QTEST/BIOSBITS
+M: Ani Sinha <ani@anisinha.ca>
+S: Supported
+F: tests/qtest/acpi-bits/*
+
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
 L: qemu-arm@nongnu.org
-- 
2.25.1


