Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74F7303C1F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:52:40 +0100 (CET)
Received: from localhost ([::1]:33958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Mtj-0001tc-VD
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4Men-0005TY-VK
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:37:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4Meg-0006dk-KU
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611661025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E38cyp6Bi6++eJlIUNADQOcBEV81bpht+gJ1kfM5MO4=;
 b=CGGL8b+IK0RpY5zQKnqQbRKHeTg/phxy3J0Fj6Yc9f5Gh6dLOv1UVm5eZ0+n5xlu3fBkNH
 +mLJxcZ0w5hkz5yGzhowBGkc96kH/tfROq6oqw+P1Uamy8tDaLAP/La53qo5VroRePXxaH
 xD+uET3kw7mo3q174nSgoo4uPCT7XNc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-7LD_kwMXM2G2hCbWNtGhUg-1; Tue, 26 Jan 2021 06:37:04 -0500
X-MC-Unique: 7LD_kwMXM2G2hCbWNtGhUg-1
Received: by mail-ed1-f70.google.com with SMTP id j11so8467848edy.20
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E38cyp6Bi6++eJlIUNADQOcBEV81bpht+gJ1kfM5MO4=;
 b=gx38kkrhJq8ZI1ekxDQT3f37Pu1k94N9z5siOY67oEszttU/Lx+QHtfvtE2RQ6TxFV
 C6mSpm6pb34/9b/W5BMFdj4xMc1eDU0NfJ4KEKl8eAJTshNArVPQ8KSWjzJxta/broHK
 9auXXI1pXFp+/FPPtM8Lsn7yISlRhCxzB6vvUdScUxzcPnsdSubvtEiX7OBxEc9iwnqe
 2wr2zLhi5lWSRsTo/kNw3jZw568qVrznWU6VplWyZpdFCoE1Qa9faURlX7vk1/MIDZNH
 +zEknhSdkfRfPifzES52O1tY5TCWHne+DGRTwCWVgYbwNYTwE62GFybwvMtam461FcNa
 IB2g==
X-Gm-Message-State: AOAM533tBMRAbMRGaEF10jJ0in+rd2kRgCHE4UqBGaUv6K2HFV8KifIe
 QSqGYQSgmFZBtLszE30dggQUMN2Kb9Wz38YMI4FAWD+gI/6z6V7/dTcGj86wLMtuJYiGiF3Jemb
 oiKaqbsnbvGAgtLBQS+kv6/O0occrk0fEMkkJ0qQz8G1rUOWqdKoN+9bGDVMvPvBs
X-Received: by 2002:a17:906:c410:: with SMTP id
 u16mr3063034ejz.159.1611661022625; 
 Tue, 26 Jan 2021 03:37:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn4q4ia2K2+OVQW19wX+P6Yj8vYPmyinMnCGHzcM+eNCAHDp2QtCrs4uYkp1buasUJzlvrig==
X-Received: by 2002:a17:906:c410:: with SMTP id
 u16mr3063017ejz.159.1611661022379; 
 Tue, 26 Jan 2021 03:37:02 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id qq23sm4629226ejb.5.2021.01.26.03.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 03:37:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] gitlab-ci: Test Fedora capstone package
Date: Tue, 26 Jan 2021 12:36:49 +0100
Message-Id: <20210126113649.3148417-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126113649.3148417-1-philmd@redhat.com>
References: <20210126113649.3148417-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test building the 4 targets using the capstone disassembler
with the capstone package provided on Fedora.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index de3a3d25b58..913940656de 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -493,6 +493,13 @@ build-tci:
     - QTEST_QEMU_BINARY="./qemu-system-x86_64" ./tests/qtest/pxe-test
     - QTEST_QEMU_BINARY="./qemu-system-s390x" ./tests/qtest/pxe-test -m slow
 
+build-capstone-distrib:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: fedora
+    CONFIGURE_ARGS: --enable-capstone=system --disable-tools --disable-docs
+    TARGETS: arm-softmmu ppc-softmmu x86_64-linux-user s390x-linux-user
+
 # Alternate coroutines implementations are only really of interest to KVM users
 # However we can't test against KVM on Gitlab-CI so we can only run unit tests
 build-coroutine-ucontext:
-- 
2.26.2


