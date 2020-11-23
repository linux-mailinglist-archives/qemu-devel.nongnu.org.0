Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C082C0500
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:55:16 +0100 (CET)
Received: from localhost ([::1]:55638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAR8-00048F-5N
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:55:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFw-0004sB-Vv
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFv-0002mQ-98
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id s13so16920851wmh.4
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vBeG5hMqQ8A4e35u+wUCDgSWbYB93YppCITSD5tCMOs=;
 b=Uv79xM+OiPrkaCtPS7+mePdiHZuX1VT4sNDXlN73mUaYUBfsMM1OOrufvnViteDlu1
 pNdvLN3t4a9q7ZI67jW2JvgQTpbVdXaHd4Eeujnkyh97qo4/dQlTN0IeRFI+qiYtwOrY
 5Gn/Fdm1xk0jr8JlDa00/GLNmccHMDrWIDB/s5wXNz1nm1Psk2wxriXYuNgWDBFZSfxW
 moqAptt2V9Uz9sgj87oH1gs/ATVFJ/01FYndIZvs7I96VIIzXPCuo3vf1DJ0xBxXTwxe
 iEUS2SMqB7wckS5WA9gDomDQSYtk7RsUbVSXshnIwYVt9gl/awgsZ3BrYMpqofFlWVwV
 LABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBeG5hMqQ8A4e35u+wUCDgSWbYB93YppCITSD5tCMOs=;
 b=ibxe4Cq8DZ1q8GR+yxCiQ9ZPbEew0Xdqv9H/4fvbJt4DNpgEVzZxk0AuNH/21PJNps
 dJJAZEe9mTgtATAkNy51qbbkUHpZLav63Q0vDPc61tuJcC7NDub6B9jxcnfpXAAOMr3U
 6QjP36xVKHvptU3NPnNxACLFZmWYIOkMjcRL0D2OnUAWHXmhAEDqfO4cCam7D3lV0x4+
 zk1DH05EFqrUfG0VL0DVpn9SUMVU0z5lYfpo9lsVa12pjsRvTL5tU93kS7MvsFbsoDDS
 iWOu01IAq7f6S/sp+7oLqLdH94WYYxJNGzQ08bZ229tLjwg8YzQ5o/UAL0eXbFE5pfIv
 PDKw==
X-Gm-Message-State: AOAM533pwykJxPPJY+U1ghgYSYH49UPu75YSrLkzq/cJdpOkNeuKD4Fa
 yRPiXoAdrbzsgNBm8mKKU1NVqYybe9ptwA==
X-Google-Smtp-Source: ABdhPJwSBnood3Mt8y+hXA6KvTGX9AS4uhmt3O6QsG+gLwMj5QKDDqLwhLjfKlZp8qnoAVXfOur9Fw==
X-Received: by 2002:a7b:c11a:: with SMTP id w26mr24286088wmi.78.1606131817666; 
 Mon, 23 Nov 2020 03:43:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/24] docs: Move virtio-pmem.rst into the system manual
Date: Mon, 23 Nov 2020 11:43:09 +0000
Message-Id: <20201123114315.13372-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/index.rst             | 1 +
 docs/{ => system}/virtio-pmem.rst | 0
 2 files changed, 1 insertion(+)
 rename docs/{ => system}/virtio-pmem.rst (100%)

diff --git a/docs/system/index.rst b/docs/system/index.rst
index 0f0f6d2e99d..2a5155c67dc 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -30,6 +30,7 @@ Contents:
    gdb
    managed-startup
    cpu-hotplug
+   virtio-pmem
    targets
    security
    deprecated
diff --git a/docs/virtio-pmem.rst b/docs/system/virtio-pmem.rst
similarity index 100%
rename from docs/virtio-pmem.rst
rename to docs/system/virtio-pmem.rst
-- 
2.20.1


