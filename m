Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A542ADFBA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:34:12 +0100 (CET)
Received: from localhost ([::1]:58580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZP9-0000Sc-Hp
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEo-0002S8-6w
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:31 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEl-0007a4-Sq
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:29 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b6so2645292wrt.4
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 11:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gBkEgjV7awvtEg/RUlUyLYVtc42f18uJSH1j4TZVeBA=;
 b=eiSuFCpkFUCvuaKxPzO1vnOi1gud/W7G7GTv6WfIN6CALMklhYzvmAaHZGhY9HIZf5
 WqKRHudZ8IL+U8FIve9wdULV/KdmA1+R64lV9664NK5ozYDA3vYtGs8eBmpJm0u6D1Zr
 E841WUtTp0iCQNT0qvBF+bVffGVzntKBWuWdM05af4wouBq0nvSPL7rR76rYmsVQU8Rk
 KqrZGfdDQcegSk4rz/jnXjh+dcwIYVznj0IKuKwYwDgLN1dhNVZTiTCKFNeFnByFGfec
 ESHxG7w8B1UAdhKgGRN56Dh4C61M3dcDUFBuWsiDvOK6+AeCdnlxAVOwaBuPrGl99mvW
 SxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gBkEgjV7awvtEg/RUlUyLYVtc42f18uJSH1j4TZVeBA=;
 b=YicJURTEM04KiwwJv+0t8itnSKFf3NnzdrG3U/9ATgxyChQRcEhlG3d6F5PFj9GMPX
 9WDY/SzbYtoBEWBkZ+m4xCD3n5eUxtORu1lluplIMcZvIMSy8GBfd47Yv6eC//ixZi64
 DXH63jSGqNMo4l9HZ86Korz0IwFeeXwtN1nc1ie0lApqLrUDROBQt18xCGBfkZyAfVu+
 ZkhK8yG/YJvLdOGBS2ZPVQw6x78+SsCmTTzA1FGu5S/Q8rRdrO9JcvbuAdvVcZjeSmqc
 j2byTASr/K9ed5kAPds7PN+9262rs9sjYMRQkPLfGGxIRf8bUqtHgO1I+Scy9Lv1Je3w
 5ACg==
X-Gm-Message-State: AOAM532cbNUAI0g+IPmY2LexOp+CMjLmshUnLgdUSMHiIBu9gVuC4Q5q
 iLFAvX+ti1oo/38qT4TNLlErXQ==
X-Google-Smtp-Source: ABdhPJxa3cy975GPrMS66E+XZOpqdG7rl0e9DLYbMS13M4jWqT5KLVU3E0q/DBVsCPGl9Li+10Sakw==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr24752225wrs.377.1605036206523; 
 Tue, 10 Nov 2020 11:23:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c62sm3929964wme.22.2020.11.10.11.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:23:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A08201FF90;
 Tue, 10 Nov 2020 19:23:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 04/10] include/hw/xen.h: drop superfluous struct
Date: Tue, 10 Nov 2020 19:23:10 +0000
Message-Id: <20201110192316.26397-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110192316.26397-1-alex.bennee@linaro.org>
References: <20201110192316.26397-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Chardev is already a typedef'ed struct.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201105175153.30489-12-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/xen/xen.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


