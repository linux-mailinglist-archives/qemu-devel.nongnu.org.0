Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D15346633
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:22:59 +0100 (CET)
Received: from localhost ([::1]:38922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkk6-0004P4-Og
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkMu-00074Q-Ve
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:59:00 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkMq-0005xj-8J
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:58:59 -0400
Received: by mail-ed1-x52c.google.com with SMTP id h10so24234787edt.13
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T09JXAieuC5lCz4KQSw0Px8wxRw9/FqpVz/R+u05gxY=;
 b=z1MpINiRSk4AwL/JUncs8zimG1TLpfINyPnFiuKvEoZzVAY5DvR60wn2pQ9Qdp99Z5
 3Km3C9JLVChul/6dmC7dVRPpf5fogzeYG+OBVLeJrHo+DAgsypuBb7k6nE57iwvVS5La
 96FfoDnRZ2ZNf3WBJId+SBZud1I0KS2vKoAu9/UuNz+VS0izL56mNMVNza2FH1hWFTmb
 p3IE7OaSfiomh4P4zbKO/g/TW5wvaB+MiPRJs1LSOweLMUUK1giufVI/Cd37v0XIo7HX
 2tLKrFWKS5vxRQ8F6pEtkiHs+wqYgOB+srrwBuh8zM62gUvEos+aZbFs5CqSSEbRGrlB
 IsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T09JXAieuC5lCz4KQSw0Px8wxRw9/FqpVz/R+u05gxY=;
 b=AoavR/6aa95bE/tmfGch21E6Fy6wJ1FA3tnDJMVQYLWiY0vJi53mKyWzckrM8/CFZD
 OI6M7nJOxg5mcPH3EfPkr5XRqklXIueU+AbVIbu6mDkx3PmAIpplPbBl0TH1v9V3yGRw
 enuHfYrPtE43sBaSjqScC0vNqDBBx0pEEZBy7osFeyG+4ok5OixIRXm9EE4KP5ZPAWUS
 atb5UuwguZp0KR63CuyYRdOnGDUwxQWMiNPmkqhhfkrUjTmjGsO2tM4tex3h7BfMRWev
 hozGLH/y5T77WEOxn1W2VFDOFwaA/eEi0hnhY/cQZu7mimo3rANe6PtotGoHd/fJ9LVJ
 nl6A==
X-Gm-Message-State: AOAM533OrTWg+Ud5OyezkDP2s7Ye0wnFSfrM+haasa68JeIvKFgJgTEd
 OYWqrWEcvV5Th4qXrJwrcHPlqw==
X-Google-Smtp-Source: ABdhPJx30o/ooB5BJXgBH6aaJjsS3E03zG2a74gIMCZertpcMTsjNBY9TEG3MkElY5uDAQNZ97V05Q==
X-Received: by 2002:aa7:c550:: with SMTP id s16mr5550235edr.98.1616518734541; 
 Tue, 23 Mar 2021 09:58:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u15sm13340888eds.6.2021.03.23.09.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:58:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1A0BC1FF9F;
 Tue, 23 Mar 2021 16:53:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 18/22] blockdev: with -drive if=virtio,
 use generic virtio-blk
Date: Tue, 23 Mar 2021 16:53:04 +0000
Message-Id: <20210323165308.15244-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

Rather than checking if the machine is an s390x to use virtio-blk-ccw
instead of virtio-blk-pci, use the alias virtio-blk that is set to
the expected target.

This also enables the use of virtio-blk-device for targets without
PCI or CCW.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210319202335.2397060-4-laurent@vivier.eu>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 blockdev.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index cf70bb4e43..413aacf604 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -962,11 +962,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
         QemuOpts *devopts;
         devopts = qemu_opts_create(qemu_find_opts("device"), NULL, 0,
                                    &error_abort);
-        if (arch_type == QEMU_ARCH_S390X) {
-            qemu_opt_set(devopts, "driver", "virtio-blk-ccw", &error_abort);
-        } else {
-            qemu_opt_set(devopts, "driver", "virtio-blk-pci", &error_abort);
-        }
+        qemu_opt_set(devopts, "driver", "virtio-blk", &error_abort);
         qemu_opt_set(devopts, "drive", qdict_get_str(bs_opts, "id"),
                      &error_abort);
     }
-- 
2.20.1


