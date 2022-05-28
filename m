Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9AD536D06
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 14:57:50 +0200 (CEST)
Received: from localhost ([::1]:49676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuw0q-0006XB-Py
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 08:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkhaike@gmail.com>) id 1nuuyB-0001eU-7P
 for qemu-devel@nongnu.org; Sat, 28 May 2022 07:50:59 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:44972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkhaike@gmail.com>) id 1nuuy9-0003QT-Hb
 for qemu-devel@nongnu.org; Sat, 28 May 2022 07:50:58 -0400
Received: by mail-pg1-x52b.google.com with SMTP id v15so6076561pgk.11
 for <qemu-devel@nongnu.org>; Sat, 28 May 2022 04:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iS6QMH6ibyuVn4buqAKFgVu+vMdfXNHl7SeX0D78BNQ=;
 b=Xx9O58u9K/ZDARKiyS+eTRK1Z0cx2l+cF8tvpUvuWdTXf3yVBw5hRH3qIpqb9U8wXN
 DOpClDtSVyeqcGihdTOHagU86yLWIUvUz1RYH6xQ+QCamlM4nBlAzQmujVzY9RDPUvLQ
 Yy6O171MyGLgDO6qi4WkBw/6A+1eCYLmeJXLPlKT+cOFn/lBS2qF+27QJvYYKxWgXShe
 4hBzuC/AsVHRqlsJQdBqGVUeDBdix4t6mDxY3Imj+YunkBepk3X1i9FGV/ljVCyRGFiu
 S/DgfmwQPwUPvgEtRODkiIm+F666CGTYmJkAXBad3jcHyAENZK98YoseAfHj+etWU34C
 eB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iS6QMH6ibyuVn4buqAKFgVu+vMdfXNHl7SeX0D78BNQ=;
 b=nzOeBTYzaqm31Dft62cprsq2p3hkOHQhkcP3+e0Yd+A8dGTd+dwDX7vNfccbzo2I5p
 BBsU4+E39Nb4j18LHmwOxBTb0+6PqN2ZplXDlm9vNUef1x5PFd7SKXAB2s+ddskuyCzq
 PtaoVNQc9ZjyzmpHqw6XBSk+ZpfXh/+pPUkzcHb3TF8ruaiYolWN6yR87nBaIw2+qyve
 AZP8hIlkIljC1P++k5jYSumIyk4HyzvLZpWnxFccqw+lNSd6SwNokBJpMV6KtwHPdBbm
 +a4QGJwyMG9AP/s9LxyIaobFtXJC8vEX9rnXfqZsLEqlA19XtNNcLmPHhfOh2IQ954Ra
 fSiQ==
X-Gm-Message-State: AOAM530sLt395pfdypF1F/qo34Z5dWKGKLe+NpzoyCflP+cQ0iNJzPRn
 NyRgk+av6Bmy6KQo78/V4/3NKCv4B/cBiMRlpFKSSg==
X-Google-Smtp-Source: ABdhPJwYzcLr37xRYq0YNZc/oxuLAIEFrLP9gs9WhAoy3DQ6WEjqiHrGciIEF3opcclcN+2tyPp6zw==
X-Received: by 2002:a63:e049:0:b0:3fa:bab7:e9b4 with SMTP id
 n9-20020a63e049000000b003fabab7e9b4mr18061586pgj.111.1653738654249; 
 Sat, 28 May 2022 04:50:54 -0700 (PDT)
Received: from doufuhuzuodeMBP.lan (125-230-42-123.dynamic-ip.hinet.net.
 [125.230.42.123]) by smtp.gmail.com with ESMTPSA id
 k3-20020a17090a7f0300b001cd4989feebsm3178094pjl.55.2022.05.28.04.50.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 28 May 2022 04:50:53 -0700 (PDT)
From: kkhaike@gmail.com
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, richard.henderson@linaro.org,
 kkHAIKE <kkhaike@gmail.com>
Subject: [PATCH] linux-user: fix memory leak when threads exit
Date: Sat, 28 May 2022 19:50:44 +0800
Message-Id: <20220528115044.30813-1-kkhaike@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=kkhaike@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 28 May 2022 08:54:52 -0400
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

From: kkHAIKE <kkhaike@gmail.com>

when call do_fork->cpu_copy->cpu_create, the return new cpu was not parent so refby '/unattached', so need add more object_unparent call to unref.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/866
Signed-off-by: kkHAIKE <kkhaike@gmail.com>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f55cdebee5..c653897d32 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8567,6 +8567,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             TaskState *ts = cpu->opaque;
 
             object_property_set_bool(OBJECT(cpu), "realized", false, NULL);
+            object_unparent(OBJECT(cpu));
             object_unref(OBJECT(cpu));
             /*
              * At this point the CPU should be unrealized and removed
-- 
2.32.1 (Apple Git-133)


