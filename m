Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8396A638D97
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 16:42:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyaoq-0001gu-D8; Fri, 25 Nov 2022 10:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyaoo-0001gm-Ip
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 10:40:46 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyaom-0005rp-MR
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 10:40:45 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bs21so7317901wrb.4
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 07:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vuC2Vc1/RmRd2o01cfm9ZesNvyFbkIRS/scjQ5wTRCY=;
 b=I/9SQuXyN+iIGqpReDcRx2sFMzrF8TmVJWLrD00x/QDUTp1bRuJF6sr8M0wW1Q6gbZ
 Wla2WHSrGyfgTbc1Oy7X2cBtrqsodJoFgMqR5iYE+AxsZ8Whyg9IrQOSeMAcmgI6606C
 d89d4f1U/6DI9tbU35CXp6Re3JV8gwWc75fZGpRKJF48K/bcRt7kPGPYBCKe5NSsDCAW
 AIP2LkyQ3lYlWY5V+1Hoi+fY5itrMtJ1Y4XlPDPYnaB0twOuSEHc7s6Go1CbXmaJEimz
 4XvNXWtQHQsw6t9DYqP40xYK2rFVy7rdtf3EBglnPbFZdlolSu9i4ciwRRY8LuPdtE2U
 G/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vuC2Vc1/RmRd2o01cfm9ZesNvyFbkIRS/scjQ5wTRCY=;
 b=3rZiohcnfSddd5TX7b9DHAdVmPnyjzL0kiysUsza7uDei3b7q0PcjdIx8y2CiPS70/
 hb16KAXxt6JlybBUkPaeXPkXFkBqnRgdFuKRdHI5bKb5Jo6kDSGzdDWf1tNHXy7/ob+z
 Bpu3G2Z1UTgv0YfVDaEiW9xL+4mpdUkm7EdoxdPjNmliqnNKhuz8a2XCKruvEzWQsh18
 tbCQUlqPQWLZUt5zxCQgA2MeXG+aJhoZagWCCLkjvbw3gzcZYJmkm74lB8OM7B2Axz/8
 iDhTsXcSWlmJHpITh0kGZi71yNwrJVUtMclM5Eplh4PJaocCIfVi1i6B5xgvGUmAv5dW
 1eLw==
X-Gm-Message-State: ANoB5pkcHZ9cCoiPtpRrrgajzMIWpXknAOepNTGmZNov+8nKGyUBPJTq
 GJezm3UFwZVq8eTpJ4wgD3WcUZdypQsgVw==
X-Google-Smtp-Source: AA0mqf5xZLWa+qhlZLDhGflwwBrr/+2qNbwBvv0kourPF2u3ACLWpxrvC+0p71+Y6UMfFu3hKkcw3Q==
X-Received: by 2002:a5d:6b0e:0:b0:236:7439:61e7 with SMTP id
 v14-20020a5d6b0e000000b00236743961e7mr15787301wrw.611.1669390842989; 
 Fri, 25 Nov 2022 07:40:42 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003cfd4a50d5asm9933010wmo.34.2022.11.25.07.40.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Nov 2022 07:40:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-7.2 2/4] hw/display/qxl: Document qxl_phys2virt()
Date: Fri, 25 Nov 2022 16:40:28 +0100
Message-Id: <20221125154030.42108-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125154030.42108-1-philmd@linaro.org>
References: <20221125154030.42108-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/qxl.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index e74de9579d..78b3a6c9ba 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -147,6 +147,25 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
 #define QXL_DEFAULT_REVISION (QXL_REVISION_STABLE_V12 + 1)
 
 /* qxl.c */
+/**
+ * qxl_phys2virt: Get a pointer within a PCI VRAM memory region.
+ *
+ * @qxl: QXL device
+ * @phys: physical offset of buffer within the VRAM
+ * @group_id: memory slot group
+ *
+ * Returns a host pointer to a buffer placed at offset @phys within the
+ * active slot @group_id of the PCI VGA RAM memory region associated with
+ * the @qxl device. If the slot is inactive, or the offset is out
+ * of the memory region, returns NULL.
+ *
+ * Use with care; by the time this function returns, the returned pointer is
+ * not protected by RCU anymore.  If the caller is not within an RCU critical
+ * section and does not hold the iothread lock, it must have other means of
+ * protecting the pointer, such as a reference to the region that includes
+ * the incoming ram_addr_t.
+ *
+ */
 void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
 void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
     G_GNUC_PRINTF(2, 3);
-- 
2.38.1


