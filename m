Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549BF400160
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 16:42:21 +0200 (CEST)
Received: from localhost ([::1]:48302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAOa-0003as-E4
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 10:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFM-0004Os-Sp
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:52 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFL-0005j6-CK
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:48 -0400
Received: by mail-wm1-x329.google.com with SMTP id u15so3652842wmj.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 07:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fY5SdPSeZ+nzP/hRNCu8jlFl6ZP6Y10Sub0ilphjxgs=;
 b=eyDOK78gtwil10Bk1rn1CGTdZwVLTfjjB4us3m1an2HQcZW/OeAEWM6Tm34Z0RwpIf
 Dl6PuHM1qpKQWDL5Q8BHHqd7XQzUw/3Kx6OtjhOJ8fAFOwh7VUg1FbUxB43B1Tnnk0vi
 IeSqP2KN6553JREKkD0w8BSVPNqZUZr6smTmUOoQqCAaBHP2uhScV0w3c4caiAnkhFwG
 iKXYSA2V/v2NivcxJBbmpR9eCct2AxelZt88ShgTdtewrwadFCSSBuqlmBZdohI9ci0s
 eWt++nbdfexM6y3miHsqdp+6wpF08PSYfaO1sR5bVnAfG53xg5rSmDFhgpoyi/OspbMi
 UY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fY5SdPSeZ+nzP/hRNCu8jlFl6ZP6Y10Sub0ilphjxgs=;
 b=Uawb6V4nnPwSCxmrCA/13Tk7q34UxfkvoaOzQaNXVXXxHCgAOeSR7nw3dx78F6U8ZD
 hQ6Vo2TYIFb+aOa4M18W5UfOFnp99OQpRx5fuePBKuxDzzb0gxqDB+VjOfhkD5T/j3IO
 Xg3K/DBjUkVDTeip+HWn2PI8wKFbmyFFY01a04LkCd9+++daYy4Cvwc+pkhDmL/Jm/GX
 5Tmw47XX5r+bvICJ4u7FzvV+epU96P4yQOK7dkxltVSxfg5MJNDQBmtTOuj/RrqkoU+7
 sqpeR8AkDb4+D5FkgGlxaKtSp5GgkzoxvDak23A19hoFrKEJd+8Mzorxt8F97FhqtJLh
 7drw==
X-Gm-Message-State: AOAM530RRKjWlDMr1O35eT7Q9VsrIMbS05fmmKpNy+jVWLeIbhyoxAOY
 ji89nsXDShDn/aiFtdsabD6l2w==
X-Google-Smtp-Source: ABdhPJxgrFg5rYzOvaLpVzk047FXn6ycaJ/KfqJpYe+noodOmTPNPigvJM7vXpvJD7eTP0ksJz317g==
X-Received: by 2002:a1c:3b8a:: with SMTP id i132mr682400wma.145.1630679564993; 
 Fri, 03 Sep 2021 07:32:44 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:44 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 8/8] docs: Add '-device virtio-iommu' entry
Date: Fri,  3 Sep 2021 16:32:09 +0200
Message-Id: <20210903143208.2434284-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document the virtio-iommu device for qemu-system-x86_64. In particular
note the lack of interrupt remapping, which may be an important
limitation on x86.

Suggested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 qemu-options.hx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 83aa59a920..9a1906a748 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -976,6 +976,9 @@ SRST
     Please also refer to the wiki page for general scenarios of VT-d
     emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
 
+``-device virtio-iommu``
+    Enable a paravirtual IOMMU, that manages DMA isolation and remapping
+    for all PCI devices, but does not support interrupt remapping.
 ERST
 
 DEF("name", HAS_ARG, QEMU_OPTION_name,
-- 
2.33.0


