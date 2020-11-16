Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59BD2B43C2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:31:02 +0100 (CET)
Received: from localhost ([::1]:41760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedev-0000ea-PX
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:31:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYc-0001bc-NF
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:30 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYa-00039s-VO
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:30 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s8so18457407wrw.10
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=25kCBizsj7x/H9MBq/7Zh8HdKyedfrYbs0Sj7nFGxRg=;
 b=d5pz22vLeXK1wHTPtF+ZsxVIjXGA8gl6Tp/KPuXBtayrc3ZztGUFqO9NqNNtYCD6S9
 GIqQTWfi7rk11d3aNpYM5Sovu1nZQUg4k78J8N0ovb1RP8rhqjz2ziat2y93gTIR19az
 oIzdPJAEHeOZ+1ho5ixYDxsdnnSTsvLBGvo0C1S/ZpaCfzu60H/ZhbVXIE/Fz6X2rnuz
 bGp+15bJpLSMupv0X7HDh/jbzWyiTXsvLQDjR/xUxuiuAC0BgRnrEMAv7S86N9y/PO/J
 YZ30NYDyOCbsIzdK53/YmkNgrvXL1/EPIj5xyUtm8/JL1r8SstFTI9HT3CYaUmH7ZgB5
 9gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=25kCBizsj7x/H9MBq/7Zh8HdKyedfrYbs0Sj7nFGxRg=;
 b=WgYb77hUljanm44NEFfMj0gewISzPej0M8/Xhy7zWvcINZq2ijCG4WpYCojTf0peYN
 kRh4fLfsFxGnO5LuOBKojEczIhAi6PbEpEnNdACHTd/ZqKb5kxwYI5tk5Ky94+SGB7HJ
 xaAak5bDv2Sxf3vMyUSbgAnY/g+nFEYmbIT57YadDVkngzusNJr46sBggLbQJxW1Qtpj
 QqdhXHi8ERrh2uv7Di2OuN0dzOV/1syWYPRHUVb53e8iMr+DxWSaELajIWZ8Z3vc99Lu
 EWxPZ8pZjsSc6y5CltOFJ7WhRn61C387wYzveeqt1nP3tYWh40BnRuui2uR5EDNhSzMD
 R5hQ==
X-Gm-Message-State: AOAM531BtFiESpHNwU8q9rfAFVzhHPq+N7FSJy5G8ML78Bl3tXRsoZ3e
 IJtJnlUxQlePOO698OI79qLQMw==
X-Google-Smtp-Source: ABdhPJwEtjSnLzfG0Ucc13bL7SYSntZMRHeMdUmK/XWx+GdI3vGIWCG0T5avbmxz2LXh+UgnrJ3RnQ==
X-Received: by 2002:adf:d84b:: with SMTP id k11mr18703530wrl.305.1605529467569; 
 Mon, 16 Nov 2020 04:24:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t5sm19671024wmg.19.2020.11.16.04.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:24:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DD991FF90;
 Mon, 16 Nov 2020 12:24:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 4/9] include/hw/xen.h: drop superfluous struct
Date: Mon, 16 Nov 2020 12:24:12 +0000
Message-Id: <20201116122417.28346-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116122417.28346-1-alex.bennee@linaro.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Chardev is already a typedef'ed struct.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201110192316.26397-5-alex.bennee@linaro.org>

diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 1406648ca5..0f9962b1c1 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -28,7 +28,7 @@ int xen_is_pirq_msi(uint32_t msi_data);
 
 qemu_irq *xen_interrupt_controller_init(void);
 
-void xenstore_store_pv_console_info(int i, struct Chardev *chr);
+void xenstore_store_pv_console_info(int i, Chardev *chr);
 
 void xen_register_framebuffer(struct MemoryRegion *mr);
 
-- 
2.20.1


