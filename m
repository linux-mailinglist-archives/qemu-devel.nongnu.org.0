Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE31E347B21
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:50:49 +0100 (CET)
Received: from localhost ([::1]:44074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4qO-0004Hz-NF
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4ey-0008RV-Vf
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:00 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4ex-0003MZ-7p
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x13so24684538wrs.9
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MGgvFyxsPVyUauSOkbs2e+OMiesteGJSjt/ekiCpmdg=;
 b=aCWZ8ZLL1iUerulpZzY/6LCPja/CmOgTTCg3Z5KaKX+vovtghj07T+D/BHiBwQUKB1
 GH+F0THMa38wpF9KlnpJLB23S8pMGE9mZoOth706UwdhZvI+oy/ew7FWlJmWiCN1rsz6
 O/O9sMluitdJs3mAhAvvehx3vt2wltzaHvTQfYi9qIwHH9D9l6vMZifKI8TxFMAcZIEw
 Xt8rrSmTPXPdTNsebk4NhdG87ZIBVfq2PrYg9PDGULPcFxfXDc/h6hpO5UHoB49WlY+A
 f16KLUhwTnP1ERv3cgyPfh68Az3xtamaWO1n5Ei1CJb4WtgfqFgjQbeCJeNgvq3Q8QTK
 fdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MGgvFyxsPVyUauSOkbs2e+OMiesteGJSjt/ekiCpmdg=;
 b=Q6tHcqhangm69BU41X+PjwB1k+1pi3TzY7lVm1K0c9knEj+N3waRhJh8iaIPJ0Olg7
 75cr4Cf04NNj3wSkYtuKd43Q8Ieqt7RjuOatuNChAPqxYK4S8SQs/17ERMoM91f0gzMQ
 ainqB8muX/1Vj7XNX7oQ3qEPpuYmfhIIVSh6m0wRCQJ5WU+VJcmxtyLk/Vdv62L5sHCY
 SHEaTZhOyF6GTKdXDaPcfdfPA1YFOLOeLF3KmkoDwir/DgmTHJmIPe2NIs8EpKJqSFIW
 UcAp4GERxNUk3EV6Toyuk5+4qti6PHVwwQvpSdnN+fHDw6licVwqO1/hT1QR+AMPKU1m
 dEaQ==
X-Gm-Message-State: AOAM531gJdnnzy3WJyg+widXyWtV7v+Wul6x7mrwIxYpddOdGvhlTiSk
 ZmxYwIPIyXqMUwBEXLrZXclcuA==
X-Google-Smtp-Source: ABdhPJzHUK22H5jOD5mqA6k58dLQ+uAxfur0psqb/VmpG/5aFqGeBA2fDpLolHgVPX7JzLIPCZ0ODg==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr3810165wrq.278.1616596737470; 
 Wed, 24 Mar 2021 07:38:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s9sm3080311wmh.31.2021.03.24.07.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:38:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D9621FFA5;
 Wed, 24 Mar 2021 14:30:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 18/22] blockdev: with -drive if=virtio, use generic virtio-blk
Date: Wed, 24 Mar 2021 14:30:17 +0000
Message-Id: <20210324143021.8560-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

Rather than checking if the machine is an s390x to use virtio-blk-ccw
instead of virtio-blk-pci, use the alias virtio-blk that is set to
the expected target.

This also enables the use of virtio-blk-device for targets without
PCI or CCW.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210319202335.2397060-4-laurent@vivier.eu>
Message-Id: <20210323165308.15244-19-alex.bennee@linaro.org>

diff --git a/blockdev.c b/blockdev.c
index 621cc3b7c4..a57590aae4 100644
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


