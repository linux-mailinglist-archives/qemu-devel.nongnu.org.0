Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8271E6F7A4B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:04:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujsB-0001Dn-CC; Thu, 04 May 2023 21:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujs8-0000xF-Jy
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:32 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujs6-00073U-Bs
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:32 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-64115eef620so16297693b3a.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248668; x=1685840668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RBxSXudG5zQ++9UGGLr3DqQBdQ9CGYyS1kJRqGjUyQg=;
 b=KOnVwhKNTJvV3kF/1Gumf+NnSbRWpzFejnCkSDwj5I7pZJJHYgGSQ8aQgL33gjFlV0
 Vezu8vNNe16ygErvtBwbEtkDqev+ouwbKCuMOfLDkfz07dfVJ8TvSy6fMfInq62OJwi3
 gEXXyuawU5FXRC0DHVDCb1Lckq4qMjgvGvzmWDtCgRtL7rBZKG3kNN7Gq7mgB5tVSlWo
 ZcoO84ycu5gAnavxS08MxOFrP52DfyFWGHQZcJvn2LMXS+WgMduqlJ6eZZdfg7l2dmOz
 AFAVk+xMu6/AfmK3Xx4cQaBGlnmSzzQtXzX7Ddsk/l17OHNZSMfGLwjQGFGSq41VEPZh
 /8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248668; x=1685840668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RBxSXudG5zQ++9UGGLr3DqQBdQ9CGYyS1kJRqGjUyQg=;
 b=ex7MOelk/qOL5Zd3Oyt4qdQ2GIa0DZ2Kd5NQty8Eg1TikKam1HaxLeqUJcQvW7BJ8A
 stm5NM3x8xSSMW8CLiwudVrSWaAHREK8btA/7pKuPuV3vDh1pjNgzkSRtgbur7S17JdK
 LlW5GBdNX4CCgF8PVOwySPFcgSWQ5SwEE6BVGfXHrwIlGNUkQ6p0Z7yweT8vtvUS76a2
 Gf657nuZV9y/wVRnSwLm5Ov6x28xHf2isz4XyNFOXsaJteMkbZH8kiXyKu0rs5GNCnwG
 /Y4EEtdG/sCkfCVpXcJ0a2+qntlM9xkrl4u/mmwZjAVmaPN8AXUa0TVWxOYOPUSUUoZZ
 /1dg==
X-Gm-Message-State: AC+VfDyNT/GBaHhXs16mycwyrKE0g3Gj8vEU7KPn3cji0MOLwdWIAq1k
 ohJxttug4pnlmjh6zxYnEeZCKnhEyTJvsA==
X-Google-Smtp-Source: ACHHUZ5toR7TSvlH4tg9PQudTfDErpcRSKXDRmSB0MX3MgMfQaBfYRt6L0n35foz9NXNsMN8y0peTA==
X-Received: by 2002:a17:902:db08:b0:1a6:7b71:e64b with SMTP id
 m8-20020a170902db0800b001a67b71e64bmr6708918plx.15.1683248668585; 
 Thu, 04 May 2023 18:04:28 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:28 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/89] target/riscv: Remove redundant check on RVH
Date: Fri,  5 May 2023 11:01:33 +1000
Message-Id: <20230505010241.21812-22-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

Check on riscv_cpu_virt_enabled contains the check on RVH.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230327080858.39703-3-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 84ee018f7d..1eecae9547 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -278,8 +278,7 @@ target_ulong helper_sret(CPURISCVState *env)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     }
 
-    if (riscv_has_ext(env, RVH) && riscv_cpu_virt_enabled(env) &&
-        get_field(env->hstatus, HSTATUS_VTSR)) {
+    if (riscv_cpu_virt_enabled(env) && get_field(env->hstatus, HSTATUS_VTSR)) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     }
 
-- 
2.40.0


