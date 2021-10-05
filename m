Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F680423027
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 20:41:06 +0200 (CEST)
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXpN5-0002Ev-Gn
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 14:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXp7X-0003aS-Cq
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:24:56 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXp7V-00029J-OU
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:24:55 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so4111691wmc.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q5fQGiY++cLu4Z5iM93f5bjjyZZNCiZiglC82xP6Hgo=;
 b=Yd5HOdaHMX66YcTSRLlsZaCIwwbyUIkm8J6aH/PU9FylZZYbsJ6WT+w4djijpST/O4
 zcvYQ8MB48i9BAwX5tESuYrs5Y0idx1UgyE5yn788YAOkp6Wzpje+piTVdFpl3ehfb9X
 lW+0uDXXZnFWYWxXAkt+FdqNMIgBqJgP91xy/9FDxk9fD6IMVg6Loid8rJu3+bLAzVQC
 x13ogVMTb9ir0ftx9nKH9O6zrdqXeKStkOL1O3J1kHvtnCuEgD0SQFsDguoCaImFOhoF
 1BABy/3fr83kZXxEStjoXRGgjVuYRGnr+tGpkDo5i/9trRqT1ByVr7og5LxPNOemyMfo
 0wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q5fQGiY++cLu4Z5iM93f5bjjyZZNCiZiglC82xP6Hgo=;
 b=e0hzn6vdhrYBIb9a9krh/CSKp3Lbk8JVsAgmtdwC3FqumbUZGGCxuA9POkLrPEAegh
 PyfEuyAeQANmASmwqzYIzDGgyObe9tTGMGtXw/IOgvP+NwQC7K6QtkWWbiqhOmao3nwA
 W3EibhOOnz+MkpRK0uiVrOpdfnyFNnd9JpanpzXVYQ7nBSmG4zm14wkGmuvi+yf07E2R
 Au+ybFeb/eGbfGJ+27ami6TfcuCRmlfL3Cq0uYtEyLun1Ay9FIewr3G+cs427FFLBeUH
 AGCC+RK4ytqs04tUrRY/bXCxWEsE8MNZdq7RL7djE5i/qazgDTYI77pgo2llQU48qpMe
 6glA==
X-Gm-Message-State: AOAM5312BDT33DYV5Qa+z4vVrWig2Z1UwtaESYKDOx8su4C73oSvvzDF
 Wn8MiR3g28yzm8FMfhNh2lOZdg==
X-Google-Smtp-Source: ABdhPJzeCNbK52pcK+p2G6OYudliNZE/qBf8PLKTKvhZOFIh0pR1loTzYSMh4CqlFJOzTR0RNeqz8g==
X-Received: by 2002:a1c:7d91:: with SMTP id y139mr5326228wmc.57.1633458291007; 
 Tue, 05 Oct 2021 11:24:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g188sm3013025wmg.46.2021.10.05.11.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 11:24:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27A5E1FF96;
 Tue,  5 Oct 2021 19:24:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] meson.build: don't include libbpf in the common source set
Date: Tue,  5 Oct 2021 19:24:43 +0100
Message-Id: <20211005182443.2954499-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This library is only needed for the softmmu targets and as such
break static *-user builds where libbpf is detected and it tries to
link it into the user binaries.

Fixes: 46627f41b6 ("ebpf: Added eBPF RSS loader.")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 60f4f45165..d8bcf13b21 100644
--- a/meson.build
+++ b/meson.build
@@ -2307,7 +2307,7 @@ subdir('bsd-user')
 subdir('linux-user')
 subdir('ebpf')
 
-common_ss.add(libbpf)
+softmmu_ss.add(libbpf)
 
 bsd_user_ss.add(files('gdbstub.c'))
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
-- 
2.30.2


