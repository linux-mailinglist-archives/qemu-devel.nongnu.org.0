Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78CB4AB682
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:24:18 +0100 (CET)
Received: from localhost ([::1]:54824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzJp-0007sE-Sg
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:24:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrj-0005qX-GU
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:16 -0500
Received: from [2a00:1450:4864:20::429] (port=40841
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrb-0001vs-MO
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:15 -0500
Received: by mail-wr1-x429.google.com with SMTP id s18so23109616wrv.7
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2OU8P6R8cOV/pc2aoajDgbitoHFkQ19LKVNZC3+dKrk=;
 b=Sa2OPLhTja5GQrY8XgkMuBhxRxLKiCeVPka4L4GzrOMEXSiJH3qgbBg/ddBpW94lDl
 sOTBxtHichL1JYUxushUMvme4QN+2hnOOR7V28F9V7NqlZWDYkDR4Lt5M3mCVByTp1Eh
 MLUQS0C92aYF/Ciig5/HoLrZhbv4Rd2Vgn8VRvT/BSVjumNc08uNzcW5ow6wWXb+Vj9y
 j5IJbJEKpliRsIZtfoGXsFNjIC9Nkf9+oxLMtq8Ax7H95+SiN9bw0i015wgbEDT35bcr
 pjNNyPZxTdSh6Q9OfWiX9WrhUxnkg6mdYiw7c0IiFuK6f2HylmuyDwe5dzrPj8tnqXWU
 X2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2OU8P6R8cOV/pc2aoajDgbitoHFkQ19LKVNZC3+dKrk=;
 b=kzM9/YffpK2KIgiwABWXXZNwSX/VbUf9O+dxFdPF6UbJOw4fDwnvw4qe4lcY8G1iJ9
 ujjJjGL6tuYmLgeMZEg6bQxCiEhpI9QkqyTo1Sy+d1frkcJ5t5wj84cqTKg7OeOl2lR/
 NkNXD/2jD5BUlLTOCAxTwrHFs4q1/orCCx4zNoS0YmjUVDfdK7IoMbCG/JcbUNM9ceTK
 ZvLgmoGf6hgHHCdTaL/88/kIfld0CU0JNT/nb9rL41e7apoN7ITF3NOdDt7Y0nSXtPMw
 sz+29DXDiY4n6/VGDD8baliOTzoUTOZ3oecOD4IZQEKxo+sCrii9kKmaI7DEFqCl7ypY
 ofGQ==
X-Gm-Message-State: AOAM5325z3gfbJ3PDxEl+ot5BDXonFRYdlR27fK/BU4pj9fBmI0r/a1j
 vqlF5OMI2Lk75bqyQkevhhsIZ3zSpl8=
X-Google-Smtp-Source: ABdhPJxhz4m2c9bi/1zImbRegi2R1JTS1IQUBE1xt/JcL8meYZsx4cqWx6NjKNQ9OoJwDOybLHMm7A==
X-Received: by 2002:a05:6000:2a2:: with SMTP id
 l2mr8812364wry.306.1644220500150; 
 Sun, 06 Feb 2022 23:55:00 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i13sm10678548wrf.3.2022.02.06.23.54.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:54:59 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 07/21] accel/kvm: Simplify user-mode #ifdef'ry
Date: Mon,  7 Feb 2022 08:54:12 +0100
Message-Id: <20220207075426.81934-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Now than we only build this stub with system emulation,
remove the user-mode #ifdef'ry.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/stubs/kvm-stub.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5319573e00..7e0fb884b9 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -12,10 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "sysemu/kvm.h"
-
-#ifndef CONFIG_USER_ONLY
 #include "hw/pci/msi.h"
-#endif
 
 KVMState *kvm_state;
 bool kvm_kernel_irqchip;
@@ -80,7 +77,6 @@ int kvm_on_sigbus(int code, void *addr)
     return 1;
 }
 
-#ifndef CONFIG_USER_ONLY
 int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
 {
     return -ENOSYS;
@@ -152,4 +148,3 @@ bool kvm_dirty_ring_enabled(void)
 {
     return false;
 }
-#endif
-- 
2.34.1


