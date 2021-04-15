Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0473610AE
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:03:08 +0200 (CEST)
Received: from localhost ([::1]:54374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5OV-0000Ko-FQ
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4wY-0003TU-8w
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:34:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4wO-0006Ik-FZ
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Z4+nmTFRYy19cLHZMOV8ZDTm2cOXzGsPlBiJeSnJ14=;
 b=GQkFQUHXkdCy6elNwNk+PvA2O+bYEM0NV7SWP4FNJUZUjvzUOQRO0auaNl62OiACA5o5Ly
 zHv7zfvYeKlydsimHBIhakkJRkVDGngF9fkzcv8H2HPJDXLZmzRlNH6g22vqE3GC+WUHcL
 sMwYKqFcRJIKsIgFKNKizp+UAEJOpqE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-mhM9OaOKOGmUxXhuzgrdbA-1; Thu, 15 Apr 2021 12:34:00 -0400
X-MC-Unique: mhM9OaOKOGmUxXhuzgrdbA-1
Received: by mail-wr1-f69.google.com with SMTP id
 j4-20020adfe5040000b0290102bb319b87so3000346wrm.23
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Z4+nmTFRYy19cLHZMOV8ZDTm2cOXzGsPlBiJeSnJ14=;
 b=c40IPPYmITUYTUEpJgipadQrkHUwX/1l6BwADul/902ZL2b9KRddbumURFuwv5gzeB
 2TZ/sZD21FSLIRYSzWI0WFc2VWzWtu6WjCk/GnCNIkLGiSmr8nde+Pr223rgCrAcChsJ
 mEbcp4S7mQKsz7YxIDhs1UjNF9t4CD4pWO/5Hg13u8DfpGpYZjzG917n3C2PvP1cBY9c
 y/U2cFbyXfDgWnODc2i1zdCf2LIsa7uDjE9NgG6lSY3UiN6vcuLjklEo5dpHCTBw1sgQ
 S5Mhf9/PcQBNChupcpg+27xiwrtv4lo4bhil66aHG63Jjo7oYfl+hrMkj4Sfl4PfK8LE
 b7nA==
X-Gm-Message-State: AOAM530VdvOfxG2hhPwvOgnYL2NuNBIcYQelsEKmD0wlJoaSsiB9fZt4
 jv+l4XSjMwkZaMJT08n8Nf2NKOLgT3dGugUGuj4OjavDEFlwuKHlnZZwaB9Yvh9Sja7CS7zk7Py
 D5yXVtaZITwfEGINK19g4gQbTWvc4rWJHmpa/ROWwwYRhLfmMnOjHCziDPFFzTciv
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr4459661wrq.418.1618504438668; 
 Thu, 15 Apr 2021 09:33:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpuyhglUlPvakTWpHy21mJ0764Sj2G96xf+4G1NOtTlj39STYofLf6NYmV6s9CWnEhM+fUpw==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr4459620wrq.418.1618504438472; 
 Thu, 15 Apr 2021 09:33:58 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p14sm4199376wrn.49.2021.04.15.09.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:33:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/12] qtest/migration-test: Skip tests if KVM not builtin
 on s390x/ppc64
Date: Thu, 15 Apr 2021 18:33:01 +0200
Message-Id: <20210415163304.4120052-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415163304.4120052-1-philmd@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We might have a s390x/ppc64 QEMU binary built without the KVM
accelerator (configured with --disable-kvm).
Checking for /dev/kvm accessibility isn't enough, also check for the
accelerator in the binary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: qemu-ppc@nongnu.org
Cc: qemu-s390x@nongnu.org
---
 tests/qtest/migration-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 3a711bb4929..c32a2aa30a2 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1408,7 +1408,7 @@ int main(int argc, char **argv)
      */
     if (g_str_equal(qtest_get_arch(), "ppc64") &&
         (access("/sys/module/kvm_hv", F_OK) ||
-         access("/dev/kvm", R_OK | W_OK))) {
+         access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm"))) {
         g_test_message("Skipping test: kvm_hv not available");
         return g_test_run();
     }
@@ -1419,7 +1419,7 @@ int main(int argc, char **argv)
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


