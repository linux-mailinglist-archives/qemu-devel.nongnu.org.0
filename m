Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7052B07BE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:46:33 +0100 (CET)
Received: from localhost ([::1]:43008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDrs-000621-GZ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmL-0000Yo-Dc
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:49 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmJ-0003jr-25
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:49 -0500
Received: by mail-wr1-x432.google.com with SMTP id p8so6257160wrx.5
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 06:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=V+stoGXl5pH8LG31JpJmltTs9u1xWs1fd+r4U8owOUA=;
 b=tx4DOkCb4f/Bn0M5xiQFW/e5NcncNJldDC3nJTuhPyu9BlKNBI4nWTwsomEiGlL20a
 uwAOKAqIyVKiXkMSXh084K5kJptPsPRqEu5Of4yJYhhaIURf7sa+u/gIj07NfQH4riZe
 RMSz7rHQrn2/zKm9EdAx6Jm3rqJrj3zU+9Nl6pB78geqc4nUK/wBS/VWLebI4vIcUBXK
 l0N2Q2PjLeRKr/NAq8MQFfDtVFNYw+9F4M479ToAGqWsXkCR6i/RGeB3JzVp6XFvTuJx
 HuB54rLXv7590HLQ9SwowVISLcPF8EhKeA0YPBcDVnwksKHfexMu9PUdeb0tLcyEc/VD
 WVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V+stoGXl5pH8LG31JpJmltTs9u1xWs1fd+r4U8owOUA=;
 b=VZbG7qfotKSTVmorKPp7AE/o+w2xxT1H70AHf4v4kc2SAPxV1xQbLRMOZlFK1d33gf
 wGFsFZaj3hfNIWgszTqrNXcI4hU6dqzS1aHM4DGRLGv/8AqoI0L8i+FMLpLuxpc7ERaN
 HkS5qrGbe+gPBeEC5olmiJ8QNsKWaplG07ubO9M6dJD+xvDjKtzbMYZ0wcDGsNKB5z70
 lkEaGS45+j6+2k8HBfvGQ2uCoqBWtnJH1+aRaEQi+piMilVk2Axk2Hh469NS+RKoAEIm
 ydSwoHgT2bwUeI0VbakgL/4cLlJBcsyW+3UkXbbP4cT+Mx0zjJSKQiHNh5tnV3JcL6db
 2Nlw==
X-Gm-Message-State: AOAM5300bLQ1E9IStrKaEm5zmXUpxXu4K5iHL7pl+A4NWfxV22X1jZbF
 KRCHAJde6asOEF10wfPebo4N2oSkpMJ1gQ==
X-Google-Smtp-Source: ABdhPJyPHzhK094hfLh23NtpDwVyZ2tKQWff+MrrVP0c7f4bh7LsI++hyipVm9JznAcTpBChT+sYlg==
X-Received: by 2002:adf:e544:: with SMTP id z4mr2248617wrm.83.1605192045075;
 Thu, 12 Nov 2020 06:40:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k16sm7410907wrl.65.2020.11.12.06.40.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 06:40:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [for-5.2 1/9] docs: Move virtio-net-failover.rst into the system
 manual
Date: Thu, 12 Nov 2020 14:40:33 +0000
Message-Id: <20201112144041.32278-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201112144041.32278-1-peter.maydell@linaro.org>
References: <20201112144041.32278-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

The virtio-net-failover documentation is currently orphan and
not included in any manual; move it into the system manual,
immediately following the general network emulation section.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/index.rst                     | 1 +
 docs/{ => system}/virtio-net-failover.rst | 0
 2 files changed, 1 insertion(+)
 rename docs/{ => system}/virtio-net-failover.rst (100%)

diff --git a/docs/system/index.rst b/docs/system/index.rst
index c0f685b818e..d0613cd5f72 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -21,6 +21,7 @@ Contents:
    monitor
    images
    net
+   virtio-net-failover
    usb
    ivshmem
    linuxboot
diff --git a/docs/virtio-net-failover.rst b/docs/system/virtio-net-failover.rst
similarity index 100%
rename from docs/virtio-net-failover.rst
rename to docs/system/virtio-net-failover.rst
-- 
2.20.1


