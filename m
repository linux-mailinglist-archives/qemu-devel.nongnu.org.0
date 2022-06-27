Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8587A55B8FA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:42:08 +0200 (CEST)
Received: from localhost ([::1]:39358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5lFv-0006jJ-6y
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5lEd-0005vV-Oj
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:40:47 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5lEa-0005hW-9N
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:40:45 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so11813799pjl.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eoem14HyIKeEgta9L2NWsRLO0Mx5dugcrbGLdCtuEbo=;
 b=BGGVYXxKCoKy1ZUWE44q/laozZapDu+pfGsrUqJH7AuxV0g0FsE2z5xk4C7RUElIo1
 sZqTXRl9Aca/VzvgR4JlTsDq7n+5l0TGxKAQHe8gfeh4dGM3vc2TSCsDS2xgzoD0SrBO
 A31960IPoXv26beQTI1n40gj3AksKpwu5DMS9Y5twV+qcrFH/NJZseWR+Z6fBEq+lDKK
 PRweKaugMTsKExOYcFYi33NHGcIMY35PEjE3fHAis387Imxl7qWke3BeUR0X5C+nwLxj
 IS5XJxdMD/Tcp9QeAYH3Eix6UkCDt0gutUNPmWq59PjfOpDjEtYNVGOYjF9oH5GvMAi6
 5mAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eoem14HyIKeEgta9L2NWsRLO0Mx5dugcrbGLdCtuEbo=;
 b=ruRDz18gLwf3w7EXHHHG7UuOgR28nZfb8PtfgtcL0mMNHooc8Vg6UOAsEVc78exvZQ
 DudtCvgDD9Z8Rj7JMUhMSIwfemWV8shOv+glbzVJdui6pH19LD9Ah2R5BkQAMp91OVvU
 K0+/oyc/hPddOUJ8abHc9/p4+/yvgr4X8XsCHK8TfcnaHcuBWr1NCAG/VzpFzurbT37R
 RjerZYDl1bD2L/UxH1gH66deNfRPslMgaKUOd99eZYayn57aQ9oKFlnCDI2eJnffnZ9l
 5AqpDccnJIauycW9VjZ0Ei6AoPhhI1XUJHryKBPPY60m0vszyzc0ZXCHzidYRF4h5sYp
 Mezg==
X-Gm-Message-State: AJIora/9Zc1rQ/hoCf4dbsRVxCk3kDEdRVcp+yiRHy1jYWGTx/dJ6wrJ
 YXBJofHAyx0KXGJWiVx3DgsPEQ==
X-Google-Smtp-Source: AGRyM1tTVFpxUss4T8NZ/gdUTyFCz3etYEM853Jx1xpgrPSJMHqvZBAk1eamcc0cEpjX3uGkGHw8XQ==
X-Received: by 2002:a17:90a:4944:b0:1ec:7585:3167 with SMTP id
 c62-20020a17090a494400b001ec75853167mr14448909pjh.35.1656322842437; 
 Mon, 27 Jun 2022 02:40:42 -0700 (PDT)
Received: from rpathak-ThinkPad-T490.dc1.ventanamicro.com
 ([2405:201:1010:106f:39d1:78b4:ede5:f50c])
 by smtp.googlemail.com with ESMTPSA id
 c12-20020a624e0c000000b005258df61ceesm4183667pfb.90.2022.06.27.02.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 02:40:41 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 apatel@ventanamicro.com, rpathak@ventanamicro.com, rpathakmailbox@gmail.com
Subject: [PATCH] target/riscv: fix user-mode build issue because mhartid
Date: Mon, 27 Jun 2022 15:10:29 +0530
Message-Id: <20220627094029.1379700-1-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=rpathak@ventanamicro.com; helo=mail-pj1-x102a.google.com
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

mhartid csr is not available in user-mode code path and
user-mode build fails because of its reference in
riscv_cpu_realize function

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---
 target/riscv/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0a794ef622..03f23d4b6d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -643,9 +643,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
             (env->priv_ver < isa_edata_arr[i].min_version)) {
             isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
+#ifndef CONFIG_USER_ONLY
             warn_report("disabling %s extension for hart 0x%lx because "
                         "privilege spec version does not match",
                         isa_edata_arr[i].name, (unsigned long)env->mhartid);
+#else
+            warn_report("disabling %s extension for hart 0x%lx because "
+                        "privilege spec version does not match",
+                        isa_edata_arr[i].name);
+#endif
         }
     }
 
-- 
2.34.1


