Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273B339BC82
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:04:06 +0200 (CEST)
Received: from localhost ([::1]:47704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCIm-0007rZ-NH
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8T-0002TJ-Sr
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8R-0008Rv-9p
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id i94so4753997wri.4
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZW7hi0DfYBrqOjPk2iwpg84qtf2Zw2XIPeU/d/sNq6A=;
 b=kMSlM8i+xPJ54AVpBAAaZTwcB0JEwBVVmLNzpVQl6rNdMmHeKcvvIH548K9xi/zJ5J
 Q+aPyx+yYPnKjAulG6recWcT52MwqoPVt3t/DC+M934wqBsNhIYiziyxcezyaVpdu6PY
 ZGJedqsC6Plzhh0CdFgUQi9QgM2HBkVrltwPEaNpgnVHvQmcN7uO6wzL5ATpEMeYwEQe
 ZZiSe4MAul5npTnLgwOTsGe67H5/P2rsyKVY36WncbAwXJQhMesMZ6hhPdvWEGKyw7dT
 jq3oxc27BsoUfg2GgX/pWg1gGNiJ9ysRsC7F9aX/nwzf+82RN9LrcKChyrRHQDh1+Mjh
 h79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZW7hi0DfYBrqOjPk2iwpg84qtf2Zw2XIPeU/d/sNq6A=;
 b=HYFfBpEWPDlrlhZv6npwbSX8qBwrOkPEWEb2hfUG8QQ9d/XxjaZTsOmaKRdXHyj9Mc
 IToHqQmSrJxCBTztbsFquIIZkV7YY9E4D2vWNHwbvEEW9EWofH18ieZFkWh+2GP/gVTc
 MfGqsbJUQztS0yZDwybEh4wXrASivoa/FpXgSU7bj2u0EvFuo3dFM+O6RTZgEO2+ltQl
 MyEsvqTkzbekSmxAgUHubdrp1MhEBVz6QpBsFoGHA0pXbVXKyyCK2QuQACZ3+Z9Mk2tN
 D3uUJ7CDOktQx5NHbKVlBZo6uhwBW+JFvJkrOH+RoK8HsxQSIiy0z5qYoKEer91SePUI
 Rtqw==
X-Gm-Message-State: AOAM533PVcIMpciTihHbYdlOg456RShD61VXFFEiQhYp0DfRlVAp6hl7
 F2CbKvRDfrEKIpi5Dm9sCFCI1g==
X-Google-Smtp-Source: ABdhPJzUwmIP0bZ6NAPFLERAQ3MUloYQ5So3v77Cf4Kn+0IDq73I1UUk+hu8PlwadEH42rLGnPGwHg==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr4441419wrm.177.1622822001785; 
 Fri, 04 Jun 2021 08:53:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n8sm5892201wmi.16.2021.06.04.08.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C6171FF96;
 Fri,  4 Jun 2021 16:53:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 08/99] qtest/migration-test: Skip tests if KVM not builtin
 on s390x/ppc64
Date: Fri,  4 Jun 2021 16:51:41 +0100
Message-Id: <20210604155312.15902-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We might have a s390x/ppc64 QEMU binary built without the KVM
accelerator (configured with --disable-kvm).
Checking for /dev/kvm accessibility isn't enough, also check for the
accelerator in the binary.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505125806.1263441-9-philmd@redhat.com>
---
 tests/qtest/migration-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 2b028df687..102bc36b91 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1387,7 +1387,7 @@ int main(int argc, char **argv)
      */
     if (g_str_equal(qtest_get_arch(), "ppc64") &&
         (access("/sys/module/kvm_hv", F_OK) ||
-         access("/dev/kvm", R_OK | W_OK))) {
+         access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm"))) {
         g_test_message("Skipping test: kvm_hv not available");
         return g_test_run();
     }
@@ -1398,7 +1398,7 @@ int main(int argc, char **argv)
      */
     if (g_str_equal(qtest_get_arch(), "s390x")) {
 #if defined(HOST_S390X)
-        if (access("/dev/kvm", R_OK | W_OK)) {
+        if (access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm")) {
             g_test_message("Skipping test: kvm not available");
             return g_test_run();
         }
-- 
2.20.1


