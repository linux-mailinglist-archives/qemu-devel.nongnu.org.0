Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161F259514D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 06:56:18 +0200 (CEST)
Received: from localhost ([::1]:51540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNoci-0003Bc-PN
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 00:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1oNob4-0000vP-TC
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 00:54:35 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1oNob2-0006Qj-N0
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 00:54:33 -0400
Received: by mail-pj1-x1035.google.com with SMTP id t22so8766546pjy.1
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 21:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=XClOkMYp4meiZVZn9OyxrTE/25f1RnPYRz3qYkkgnfs=;
 b=GG1xCqudSUn7z0M4PlPS1PrXURcu1F59LdPpMrN5ZbF0nmt2pck+8M41U8t/Iq0Cx2
 1x8AhFf7AvDlegv1o2e3zPlAxe1k3KRw7r6QUrGy20K1O8QnHUeQG9HsA1BKoaV57PFC
 vASFi9fApivG2mqaZraEYcEoQ79PkSdjlh0fPU3l9aB69HLX19mwK5z65TtX/0L+A5gV
 xvGUa6UqGDjsWqu4barFV39BAN4EjWsC2VlOsuzw25PHBp2tSmNqRhS3rEGNJf+eRND7
 aPBSlNm85IKOB/nWz9HXIHJBdYTzCvcI9LtS9BpTkHz2XEpAf0U0QIUYh6SoMDA9e5/D
 tqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=XClOkMYp4meiZVZn9OyxrTE/25f1RnPYRz3qYkkgnfs=;
 b=NF+S7jim7GXpVaXqftUX/YMfNIbXAxaPMTGzLDO7hYBRHe5VsnCG5So3o1w9vJs0Y5
 Brcuq+H7dmbLQP4XTMg+NrM/hrlC90Mfw8f3J0NR9kEzeJ13XAvUJYXxkVADeKUDaHbl
 xJL/ZADYOy/OYW5em/Kyf8myObtA5m4BBkdRDtiTsxKpS97GX4IEzb0OiwwjMRqGqWbx
 fm9KVLEnaOH2HqODhRtuIR6J5G6J/zvQKPUcNDc2Kkd5viNACIPS9B95SqEMLnWgT3Xs
 L5EcAvxxzzEwXj8J7x6VBC8WFxUykpexfMDFzXZzWOazSSwtDCXkU6NNp+shZFFbNmxM
 tDFw==
X-Gm-Message-State: ACgBeo0gHP5qy0SQN08hMpXmztqZ+0hXf2JF9ugXzb0DGl0V05VIMozT
 bmgDcHZww5tNmqEwEw6L7jl1kg==
X-Google-Smtp-Source: AA6agR4pUoqiysJjttXUdGDh1eyCIQ2iuYtpty/JMw4aKkpVUXw3kCAiu8hUvVNlHV7+7BSIFfcvCg==
X-Received: by 2002:a17:903:124f:b0:171:4c36:a6ab with SMTP id
 u15-20020a170903124f00b001714c36a6abmr20288608plh.141.1660625669718; 
 Mon, 15 Aug 2022 21:54:29 -0700 (PDT)
Received: from rpathak-ThinkPad-T490.dc1.ventanamicro.com
 ([2405:201:1010:106f:421f:cf5e:cdcb:f0c8])
 by smtp.googlemail.com with ESMTPSA id
 g132-20020a62528a000000b0052dd9dbe291sm7350417pfb.105.2022.08.15.21.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 21:54:29 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: rpathak@ventanamicro.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 anup@brainfault.org
Subject: [PATCH v1] target/riscv: Add xicondops in ISA entry
Date: Tue, 16 Aug 2022 10:24:08 +0530
Message-Id: <20220816045408.1231135-1-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=rpathak@ventanamicro.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

XVentanaCondOps is Ventana custom extension. Add
its extension entry in the ISA Ext array

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---

This patch is based on branch riscv-to-apply.next (Alistair qemu tree)
Based on top commit: f2a91d8b78

 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2498b93105..27d10bd6a6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -104,6 +104,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
 
 static bool isa_ext_is_enabled(RISCVCPU *cpu,
-- 
2.34.1


