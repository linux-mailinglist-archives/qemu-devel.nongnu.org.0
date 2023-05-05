Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9F46F7A56
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:05:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujsE-0001ds-FD; Thu, 04 May 2023 21:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsB-0001Ps-TK
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:35 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsA-00074J-04
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:35 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-24e1d272b09so932073a91.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248672; x=1685840672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BIu+1DjWI3CsiFnOxaA3b+UpyBWG0H0jnr/0F2pEbU4=;
 b=idqG9pyl0Ay/Zj+OXiE20yOSkXj0KaaoSNN7T3AuXLiq3Y78HFzJlD/lIKHPfQ0fAb
 jfVOwTShfHVns+l8AsIf0D2lMjjgieoABPInJT3KEI2HbcBd66AqJlo/Rz4xNdRVwN3C
 HEGKuB+Z4l+wRVHfcwcf7ehKYFbdIgzVNtV1WjSyEPqQpoNoRXEWzCps3XURcCpPnEwV
 KDdvvtnoog/VW+1+VjbVfrBs++gQJGxUBJ/GJjbnfAhvQhSKLc8CBXOY7jltk5s7Tj+q
 vGUQKxmm6Oy/xXQMoxeQJtQYykcd6TZRuioPenRXS+cZOsqo2W/Hjp0tDX/NPZiyjdk/
 FcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248672; x=1685840672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIu+1DjWI3CsiFnOxaA3b+UpyBWG0H0jnr/0F2pEbU4=;
 b=AalZflTw4LCsargGvgE/hQSkslMqwzmP5rWpCaU1Wfv8XcoozAnadTDQRJmjDcUvWv
 GwhIjIctxsCCM5GL5NqzXFSiemz5IVUtpt7sg9SLatodb5JdetVk3xD2featkzaKW5PX
 5TahwHxycYCH2sSBf4TtnwPx33TkfSsymmNRFZBUQZouiuSYBUfv/1k7bZ/KHhSsYqMu
 s44BSul6ZnDb5MgQnBIE7zHxRdBnhI064u5dQtirxKpLRjMJT1LLd19YTH6nyjK/pQY6
 XfFLdkc6WTUMIm/HX+jFwzpoi0b19drJX2xvcddpv0OpYRaNEjnYZcZLibfClKR6kTlZ
 5b7A==
X-Gm-Message-State: AC+VfDxZ72L+E8HXNcg/O0sBWHgDSSs0u1GbeullPtE8XRc5we8xnsKF
 xNUfaVgURSLTrOSBtuqXuoXFWHr7mx0u0A==
X-Google-Smtp-Source: ACHHUZ5VIhKitPY+sllVQvpZi4pRG2M52Zt2JSJWnIfBBym2NK2ABjQwKYTGsBWqklba+hOlSz/dWw==
X-Received: by 2002:a17:90b:3685:b0:24e:2248:31c with SMTP id
 mj5-20020a17090b368500b0024e2248031cmr4153589pjb.22.1683248672187; 
 Thu, 04 May 2023 18:04:32 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:31 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 22/89] target/riscv: Remove check on RVH for
 riscv_cpu_virt_enabled
Date: Fri,  5 May 2023 11:01:34 +1000
Message-Id: <20230505010241.21812-23-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102c.google.com
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

Since env->virt.VIRT_ONOFF is initialized as false, and will not be set
to true when RVH is disabled, so we can just return this bit(false) when
RVH is not disabled.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230327080858.39703-4-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e140d6a8d0..62fd2c90f1 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -560,10 +560,6 @@ void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen)
 
 bool riscv_cpu_virt_enabled(CPURISCVState *env)
 {
-    if (!riscv_has_ext(env, RVH)) {
-        return false;
-    }
-
     return get_field(env->virt, VIRT_ONOFF);
 }
 
-- 
2.40.0


