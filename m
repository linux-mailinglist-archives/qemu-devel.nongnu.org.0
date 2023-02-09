Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1A16903ED
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 10:36:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ3Ky-0005cT-6Y; Thu, 09 Feb 2023 04:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQ3Kv-0005bU-Qd
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:35:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQ3Ku-00079R-5L
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675935323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MD91nQCap0erfKBVCRVsfUWRtauNZEts6pTWqmUAhMM=;
 b=fProSyca0n9WYAjbeCZaIQq7an2r1nGTXHrX8k5ICrLsgTLBzcPXDvjDYWE3tag8j2WYn4
 eax56ggxn488wnkCwevBz6bhlQH+2C83DQsho+o64X/fp+7af/2NdmzyR2vNHXG0G4cDdz
 9p1UkIG/0rRKbg3DdtXsZX5FFCwDhz8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-15-Tb6ZM-9KPN-_p-5Mho1cIw-1; Thu, 09 Feb 2023 04:35:21 -0500
X-MC-Unique: Tb6ZM-9KPN-_p-5Mho1cIw-1
Received: by mail-ej1-f69.google.com with SMTP id
 d14-20020a170906c20e00b00889f989d8deso1147096ejz.15
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 01:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MD91nQCap0erfKBVCRVsfUWRtauNZEts6pTWqmUAhMM=;
 b=lg0SWEqVRU9pIJwepz4hYUKAn0uqRkHdkU3Q5+8oN7/LsDBssbR3arh788SxJAN/vt
 b6hpo6yaqV2a9UJJpDWpTOGt2pBFMer76hqDP4OhL0mv7HIftXHXr7iI7xCDsM98VxQ/
 ElSbyO+5Q84r97V4B/MsyYrCsZmot4fJmKQzkuxakU5uMm7M0OmX1yg3HAdlFsDuragj
 KsonTsmoqD8OPD3mLFzXh923JwvycC6axJcylJOz37rhKD5qiDqu/DinVwqq3DV0Ds0Q
 EpVjEz/YUbxGZ6rFyrXUIzgyrfgSVKtDQf+Py4fat50+LK02k7TBjNFb6LclKFepJ8H1
 z1Jg==
X-Gm-Message-State: AO0yUKVoAnFk5XR0kTRfrJQpJdJALtv+yi/TgM7fN4Qy+HQ5OTgIRKSS
 tbN7op5An/NvL+V7oLramJCUd8QC2Y+sfwvZIeqxR5M6BTJcfTjpaFKF5C9Pu16CpckrR8D0Z6Q
 3KBZSDaaKljz3DLOej3dpLMpT+KHcdLIhrbECq+Bn8GV6UUWNWbBAJk3yrRHzyVYxjYcJxqy/
X-Received: by 2002:a17:907:2d94:b0:8aa:6edf:2a9 with SMTP id
 gt20-20020a1709072d9400b008aa6edf02a9mr10641870ejc.69.1675935320288; 
 Thu, 09 Feb 2023 01:35:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+HrJaYsnvwDkYKX1DPSk/YN0Dxhov8RW87j44uUDTCMGU+Brn8Ggju/upHMMRVR9LJfPC2hw==
X-Received: by 2002:a17:907:2d94:b0:8aa:6edf:2a9 with SMTP id
 gt20-20020a1709072d9400b008aa6edf02a9mr10641853ejc.69.1675935319953; 
 Thu, 09 Feb 2023 01:35:19 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a50d5da000000b004aac3fd90fbsm505222edj.17.2023.02.09.01.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 01:35:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PULL v2 04/11] vl: catch [accel] entry without accelerator
Date: Thu,  9 Feb 2023 10:35:13 +0100
Message-Id: <20230209093514.177999-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209093514.177999-1-pbonzini@redhat.com>
References: <20230209093514.177999-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avoid a SIGSEGV and return an error instead.

Reported-by: Thomas Huth <thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1439
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index b2ee3fee3f06..459588aa7d14 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2204,14 +2204,18 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
     int ret;
     bool qtest_with_kvm;
 
+    if (!acc) {
+        error_setg(errp, QERR_MISSING_PARAMETER, "accel");
+        goto bad;
+    }
+
     qtest_with_kvm = g_str_equal(acc, "kvm") && qtest_chrdev != NULL;
 
     if (!ac) {
-        *p_init_failed = true;
         if (!qtest_with_kvm) {
             error_report("invalid accelerator %s", acc);
         }
-        return 0;
+        goto bad;
     }
     accel = ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
     object_apply_compat_props(OBJECT(accel));
@@ -2221,14 +2225,17 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
 
     ret = accel_init_machine(accel, current_machine);
     if (ret < 0) {
-        *p_init_failed = true;
         if (!qtest_with_kvm || ret != -ENOENT) {
             error_report("failed to initialize %s: %s", acc, strerror(-ret));
         }
-        return 0;
+        goto bad;
     }
 
     return 1;
+
+bad:
+    *p_init_failed = true;
+    return 0;
 }
 
 static void configure_accelerators(const char *progname)
-- 
2.39.1


