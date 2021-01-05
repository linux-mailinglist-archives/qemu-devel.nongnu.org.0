Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75DE2EAB20
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 13:46:25 +0100 (CET)
Received: from localhost ([::1]:41678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwljE-0005Zr-8Z
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 07:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwlhM-0004r7-JG
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:44:28 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwlhJ-0001j4-LM
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:44:28 -0500
Received: by mail-wr1-x434.google.com with SMTP id c5so36034731wrp.6
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 04:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zWEWFFc4X2fxBvBqJacNlo3Q5pteGX6BPRwZ/IL4MaQ=;
 b=VwW3zjExyAPVHda5XMQ0Yxx/bDWrBADy8CPuVaw/iQOIfq1jlJUJ2tDedxnwzxneGb
 QcrfuEdjC/0bDjabZ521RaINvV2Xob0+9kmdrt7kisip3UL/ZjhUfN3FUkT7LywOjb+Z
 GVn+IwbdJ+Zh/WqNq40mcBMGsnxuqfJfPyCqSeQZPsPK2wBlxe0Xm+ULDGXwMEY6d6dL
 R4d/9XwpKt1ZgSBibhVYKhR7nW+9tGi06utYfCP4SLaFIC0Rk/arnsrgXLPvycQ1g6v4
 rPW0aAr8ZTeNQxm1Rdn5dmMRbw/ky2pPMeB5INWLKqgxlymEkUcWNz0iEu/2Yp5z1eZq
 vWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zWEWFFc4X2fxBvBqJacNlo3Q5pteGX6BPRwZ/IL4MaQ=;
 b=LnNowckS1wclUdcDhBCENmzdmkV6YKCHU73WQqE6YmYOhcRxfPfLpBlr/cmqfF7I8Y
 bOYz1IUJMI9b9O/P6e641RXqOZi7sev1rXOGsksoR9X15UwWfAwhk5ktYsnhPEO1gESA
 F9h/TKLPxm1Vak4wgAmHudARqku8YGtb649o0ZeDUlx+V9xdRuKbwwTvDB33/P/wI56l
 wLLeG3lmwdPYeG8KwiAYpPO/6IGb7dc7idNf1xOI6uV3h2bA19xqcnftXb0vbW8KHRz7
 T9ZpoUs1ViH8sW9zT+HtnfGrkUcte9+oXGKMYo2bUuQe1vWCZQjQFD9T8SqYBAOk7qys
 wzDg==
X-Gm-Message-State: AOAM530o9yD5pU2MQ2P2uREh/h3sRhPsiXxFtz0FymPtbP+Fq45vIgs2
 hqpbHq/KCXm6w2Jn9laD7jbGHw==
X-Google-Smtp-Source: ABdhPJwr+l2qC3kY2CpjViY4CVAdAyan1e8toUi0F1Mx+8LpWqOsftLs3EoGd3fcz9p2os0ihrA5dg==
X-Received: by 2002:adf:ea04:: with SMTP id q4mr64763736wrm.195.1609850663938; 
 Tue, 05 Jan 2021 04:44:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k10sm90724725wrq.38.2021.01.05.04.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 04:44:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F06541FF7E;
 Tue,  5 Jan 2021 12:44:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance: bound the size of readline in
 s390_ccw_virtio
Date: Tue,  5 Jan 2021 12:44:05 +0000
Message-Id: <20210105124405.15424-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The read binary data as text via a PPM export of the frame buffer
seems a bit sketchy and it did blow up in the real world when the
assertion failed:

  https://gitlab.com/qemu-project/qemu/-/jobs/943183183

However short of cleaning up the test to be more binary focused at
least limit the attempt to dump the whole file as hexified zeros in
the logs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/acceptance/machine_s390_ccw_virtio.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index 0f81af9950..5141d6abb2 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -241,7 +241,7 @@ class S390CCWVirtioMachine(Test):
             self.assertEqual(line, b"1024 768\n")
             line = ppmfile.readline()
             self.assertEqual(line, b"255\n")
-            line = ppmfile.readline()
+            line = ppmfile.readline(size=256)
             self.assertEqual(line, b"The quick fox jumps over a lazy dog\n")
 
         # Hot-plug a virtio-crypto device and see whether it gets accepted
-- 
2.20.1


