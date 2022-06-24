Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBC7559388
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 08:34:32 +0200 (CEST)
Received: from localhost ([::1]:36002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ctj-0008FV-UY
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 02:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linmq006@gmail.com>)
 id 1o4crT-0007VL-25
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:32:11 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <linmq006@gmail.com>)
 id 1o4crR-0001bc-G1
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:32:10 -0400
Received: by mail-pl1-x62a.google.com with SMTP id q18so1249012pld.13
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 23:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xji3fCx86UpFu+GZKhC0W+HkLhkXd0Q5e2LpmrTD11s=;
 b=d/trCjOV9MqQDLLziG+sTTNMClEtFTMSZmnUbx/0wX+zABAFBE4r3ckocM+Qp72EDF
 7F1UdWhWnu6fibOdOQ3s2cH14R/UsgQ0dAvadMB0SoTnKXnpg5zjUlSVvUae72X47xap
 Iivjnxq1LGkVCpSLGFyuWnneOhq7UYGxbwNl3UyTS5j57nAzvnlghCYJsAB36XNTGVji
 7qbuQWhmUSFbVwRmAZLnGM2b30Hg4u3XOhXe1hzvqo/qnTwIyeO2dS2fnMPs2VGhkc9y
 ZRU6a0jkTBvGpUf3dPmwTxv2gp5pXMBsQoyBmd8IsaGQXdFnGOjoR6egS2GRl7Y16j8U
 RQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xji3fCx86UpFu+GZKhC0W+HkLhkXd0Q5e2LpmrTD11s=;
 b=Ga+rrxhrj3cOXkzAKa7ggMuu74R6njfUzRL4QElEBAAec5Q4g6LxyfE3BYR6Kd1d30
 Bo7y2fw7R8MvV8pW1gAHV5ty2iDrHE98NabuuWXHnDr1YI6SqG4/WNpZDq1HiyI+UYE3
 36CDsCOczcVEQB7RWkgqlFwzUEFrjG1F7Ss0Iy8VvaevtkmhGFW4og842b7u7/cUJLDx
 YvirV/WvlCsJ8vlSCd0z88l4qDMDdubuWJ+H0lXHvWa1gNJ+kHjE0p+Exsf7Oj02MWnb
 xCBg6xTinglEqG2JuHs6JK1X3bCwMPqzOtsuHG24VuSRlPO9ns4/gX9PgDFWDT9AQ9V/
 ZN9Q==
X-Gm-Message-State: AJIora8dT2zlAhIzAFJd4D0VleUX77twFd9KQSHDYKzGSCeCFUuLB3OX
 G6XDFbnuu7702Te30LC3Wjw=
X-Google-Smtp-Source: AGRyM1sFJOn671vfZucZ0uNvBZlBe2HBN+ET5+WFcyelgqRT8bM0GdA0pnkhzFSusdAjlnW/M/5e5A==
X-Received: by 2002:a17:902:c944:b0:16a:3ed0:e60b with SMTP id
 i4-20020a170902c94400b0016a3ed0e60bmr15079113pla.7.1656052327632; 
 Thu, 23 Jun 2022 23:32:07 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 h5-20020a635745000000b003fdcf361df6sm707524pgm.87.2022.06.23.23.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 23:32:06 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Cc: linmq006@gmail.com
Subject: [PATCH] accel: kvm: Fix memory leak in find_stats_descriptors
Date: Fri, 24 Jun 2022 10:31:59 +0400
Message-Id: <20220624063159.57411-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=linmq006@gmail.com; helo=mail-pl1-x62a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function doesn't release descriptors in one error path,
result in memory leak. Call g_free() to release it.

Fixes: cc01a3f4cadd ("kvm: Support for querying fd-based stats")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 accel/kvm/kvm-all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ba3210b1c10d..ed8b6b896ed3 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3891,6 +3891,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
         error_setg(errp, "KVM stats: failed to read stats header: "
                    "expected %zu actual %zu",
                    sizeof(*kvm_stats_header), ret);
+        g_free(descriptors);
         return NULL;
     }
     size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
-- 
2.25.1


