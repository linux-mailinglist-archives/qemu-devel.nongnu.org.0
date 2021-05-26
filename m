Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B14391DF4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:22:04 +0200 (CEST)
Received: from localhost ([::1]:51858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxEJ-00084P-JP
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwyv-0007UX-88
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwyt-0004Tg-A7
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CIcR3Dg8r3/BLZX5s3uJXgxa95m9nxbDQsMDWt+Jqds=;
 b=MDL9NqAnK7WV+FrMr1uZt8dgBJZe/Wo9upRrm5qzq7MDPA5iRofz4tvV+fOqwTM5Z5TAc/
 R1G118GWG0Ru9Djo3y22a/CXK9Zaz9BmEomqBFeb1oyaHVVN2sitrJu8WEyftq4tRvtARL
 wAj6J+E/LKvan3xhh+4RaA4Z5Qymuzs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-E8qi1bWKPo29YVgkLr2VJw-1; Wed, 26 May 2021 13:05:52 -0400
X-MC-Unique: E8qi1bWKPo29YVgkLr2VJw-1
Received: by mail-wr1-f69.google.com with SMTP id
 u20-20020a0560001614b02901115c8f2d89so613300wrb.3
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CIcR3Dg8r3/BLZX5s3uJXgxa95m9nxbDQsMDWt+Jqds=;
 b=WY5wwNzMg+XA+b8LCmiF1mt9K8ufKr8otBJysZ0yEf4Vi4c1IlmoZLX+w+LYIQpeu1
 UBJIMB8b9/Qf3UeOIoJFd1u6LUPWGu2WMWfN8GbjnWIcCQ7ZJGbKBa2O86swMSIbx9Hj
 wIbR+IK04NTZPjD3tWKzczLHygOamDyBSYGwJGoeLYJEzPmjSMwzAOzyN85KrYhCk6BJ
 CVP0sk2Sp88kjDqB2apHECrI7sIiR06pD+GOfWax6kbyJyi1PH1KwQQjvqKNHGv6oxHr
 QlU6IhXTl8t8ang3CaMeoslkr3ETz6WmmqIC4uTBbssuKTUlAtCy9NsYecjnHOmCcfsQ
 6dCQ==
X-Gm-Message-State: AOAM533q8BcEP6AtPvYQkLghjU6FoCawZqYplIvp2O3nQ31PYCJ1U67+
 73XCkh0wEr+VnRzjPHdSYviKv7nRlHZR58YSItExF7q7H3LyvxXDYMZmcJPw4PMMg9y60rwWtLR
 g8s1iadUEswTrei59hQOucUxfPmWjvBvWhAC9AZMNzOwgBkagTt/GbNdJyo5YLLH3
X-Received: by 2002:a1c:e205:: with SMTP id z5mr3177904wmg.70.1622048750863;
 Wed, 26 May 2021 10:05:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj4PizJCrJQJlSo/ySLsvv0tj5e6Z5qV1FcEphaUG4il7OPu6e6vZHZRXx2BjTcNzEqb6cww==
X-Received: by 2002:a1c:e205:: with SMTP id z5mr3177867wmg.70.1622048750606;
 Wed, 26 May 2021 10:05:50 -0700 (PDT)
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id u8sm6728924wmq.29.2021.05.26.10.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:05:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/12] qtest/migration-test: Skip tests if KVM not builtin
 on s390x/ppc64
Date: Wed, 26 May 2021 19:04:28 +0200
Message-Id: <20210526170432.343588-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We might have a s390x/ppc64 QEMU binary built without the KVM
accelerator (configured with --disable-kvm).
Checking for /dev/kvm accessibility isn't enough, also check for the
accelerator in the binary.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/migration-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 2b028df6875..102bc36b91c 100644
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
2.26.3


