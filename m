Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4096F7A52
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:05:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujsQ-00037R-4N; Thu, 04 May 2023 21:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsM-0002sk-Nn
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:46 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsK-00076S-TM
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:46 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1aad5245571so8027965ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248683; x=1685840683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+7YqBxhdY5XlbtmH1W7Tkvc8ng1yILScXbFzc80Rkw=;
 b=sNmyeszEGAP+QRUmlYDFIsaNyALZBQfmsXrP4AO0gpyp0eVIisjY//4dVkbM67y6Lh
 59gNk2lSwyyLRTgvqN+2/1J/garGr05X2mNG/xud9sb0XfnXC+0r9wzN3XOCFaPj8jaW
 JP6uXabRqajQXJNu6AsC9Ie72PWBqIkF9FryYYZ3uWi1cbbXl40nY1tMf1GZ9SruwyZY
 jihVRLrHHRmrm3Aqt07dCWvhC2EYFZDenw3X7JnViQRFOgEHIvDgzJZZnCFbbqlbGEc0
 h3uoYVx2nC0RVHZJvOXXFCdicZF4f2ULwPASplIEu3EK8Oq46rDAsbGJzWRVmNqnKI90
 QxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248683; x=1685840683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K+7YqBxhdY5XlbtmH1W7Tkvc8ng1yILScXbFzc80Rkw=;
 b=CxKiq3u6rdC8vVnuIpfCQ+wgR0/boyqnXZwWNTED/FLrXw1Tqh4cGzMsJtRvPd9kiN
 wIulzP0TmpYkxvUMbS4xaQv4Bb7kEkD7rBycsw6VnE4QElf0D/BY5LI3OWm/h+5jWXXV
 4Ma+/tSW7/aGKbINXAGz9Q29WdagXjbTUUXsf4dWgi4OCF9Lso9o+37sK34ht+8trBR1
 0b62y6YBG8FF9Qlb1vXslQfgytDct9aAXjfH2uw0phFhUIOOIEA/Ge89yqs/PXluOjhM
 gbgeRcTl0y9NSk9tg45zDrIYZiV38zsvjrx7oCeUT0bT4NAd7V3DWy4vWgm0k/WyK2yt
 wuww==
X-Gm-Message-State: AC+VfDwPstXUJQUAp7LBuR8fJwkv/S3fNRq3cpACLonv5arzpIFTeL+A
 vg5FW3R5cY19OB/kiF+9oh6e8VfposXNag==
X-Google-Smtp-Source: ACHHUZ7ZCSFhZw4PwJRtSloRSBxKhWnNPZG1gH/WCwF9l2IHqFJCQ2YeAy4+SV6GIa3eEOPFuXlfSQ==
X-Received: by 2002:a17:902:da8c:b0:1a6:3b9c:7fea with SMTP id
 j12-20020a170902da8c00b001a63b9c7feamr7188286plx.36.1683248683089; 
 Thu, 04 May 2023 18:04:43 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:42 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 25/89] target/riscv: Remove redundant parentheses
Date: Fri,  5 May 2023 11:01:37 +1000
Message-Id: <20230505010241.21812-26-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x635.google.com
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

Remove redundant parentheses in get_physical_address.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230327080858.39703-8-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index c7bc3fc553..9e2be29c45 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1051,7 +1051,7 @@ restart:
             if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
                 *prot |= PAGE_READ;
             }
-            if ((pte & PTE_X)) {
+            if (pte & PTE_X) {
                 *prot |= PAGE_EXEC;
             }
             /* add write permission on stores or if the page is already dirty,
-- 
2.40.0


