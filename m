Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B114D1DCC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 17:54:05 +0100 (CET)
Received: from localhost ([::1]:55700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRd64-00053M-C3
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 11:54:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRcyw-0004xX-Iu
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:46:42 -0500
Received: from [2607:f8b0:4864:20::1034] (port=34535
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRcyv-0003Ye-1W
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:46:42 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 k5-20020a17090a3cc500b001befa0d3102so2176233pjd.1
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 08:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhUb0m7JM0V0xTd3aBx4ee5Cd+FgAF3NJLlXxzlLHNM=;
 b=aRFPVucakXcU/QLKd9CanXRsxMOl5ByBgxoIUvo4FzC3nTozLEgC1Py6bYP87ZYEQL
 v7dAlIwN4+9b4EOtZcaAo4llR8hGMlbhGQV37QWtJOwFy7/yuqknzTXMEgd9rX5L1Mko
 fRVoQqEY9LWqEpDkmo2818qR5hbmyEe7jX8YPjLF6yUv2+XDHHfAj4eGfdaZXXIgHbMK
 psfLh6XFpSIaVYYonG2SVdb3y5xFKCzLCBkMuQZAxBMKG+q6PNdzQywrZM7mFZOQj519
 5+0Tq+EiPYwTWowAd6DhXPTHDurAqXzDdq3tQCi/fclQ772lq0ysdfzdj6U0FDHc9GKM
 DPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhUb0m7JM0V0xTd3aBx4ee5Cd+FgAF3NJLlXxzlLHNM=;
 b=8LhTxhkXPpxjI/+9dM5zcpvQbS3PaeBLZOmt5cCK5tzwJDIbyXDnzeWY3/Li+55xPx
 qD9E3iQnQItNGIrT7zGOp5kYdgmlQXYj0/6PgQRkLbqXKCVj5SfvXWaz/PYLeRNIjLaJ
 bQjaDjt/OlMGJb1nnBlLK4hkc0PEC1KrHA6q5WBBfVxM1gJMAwpphF+KwfpQ6Xk40dTZ
 8fxiEsMgV40UNQZjZNPZ3XSIZzpsFUr1YbGRuM/K+Yq6FZK/gG7nVQVTzgtxj9cUh3LO
 pCryiFJGPqggTSi7RSluUJdW3QBUSLlPCgi8orF2hLFPBgSJE+4NjK0Rb1MS26kZ1j0d
 bA9A==
X-Gm-Message-State: AOAM531VdMUEhNn0ysYHRslMgLuL/wZPUU773DfTenFrruBQxnWpsoQs
 8RXKwvt8A8YZVt+FiU777rhH5Q==
X-Google-Smtp-Source: ABdhPJyTmFvGdcSoHkN9yQ7/cHlpNUXLs7gl4o45K9ZW+/ksUjhMuC+IphPU1a+X55tR5fvxTKtFIg==
X-Received: by 2002:a17:90a:ab93:b0:1b8:831d:2ee4 with SMTP id
 n19-20020a17090aab9300b001b8831d2ee4mr5587742pjq.123.1646757999794; 
 Tue, 08 Mar 2022 08:46:39 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.121.168])
 by smtp.googlemail.com with ESMTPSA id
 pi16-20020a17090b1e5000b001bd1ffaf2basm3566459pjb.0.2022.03.08.08.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 08:46:39 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: libvir-list@redhat.com
Subject: [libvirt] [PATCH RESEND v2 4/4] NEWS: document new acpi pci hotplug
 config option
Date: Tue,  8 Mar 2022 22:15:53 +0530
Message-Id: <20220308164553.2312425-5-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164553.2312425-1-ani@anisinha.ca>
References: <20220308164553.2312425-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mst@redhat.com, jusual@redhat.com, qemu-devel@nongnu.org, laine@redhat.com,
 Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added the following new libvirt conf option to the release note to
indicate their availability with the next release:

<feature>
  <pci>
    <acpi-bridge-hotplug state='off|on'/>
  </pci>
</feature>

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 NEWS.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/NEWS.rst b/NEWS.rst
index a5b6106bc2..e474b32e69 100644
--- a/NEWS.rst
+++ b/NEWS.rst
@@ -17,6 +17,14 @@ v8.2.0 (unreleased)
 
 * **New features**
 
+ * qemu: Add a new global feature for controlling ACPI PCI hotplug on bridges
+
+    A new ``<feature>`` config option ``<acpi-bridge-hotplug>`` under ``<pci>``
+    sub-element have been added to allow users enable/disable ACPI based PCI
+    hotplug for cold plugged bridges (that is, bridges that were present in the
+    domain definition when the guest was first started).This setting is only
+    applicable for x86 guests using qemu driver.
+
 * **Improvements**
 
 * **Bug fixes**
-- 
2.25.1


