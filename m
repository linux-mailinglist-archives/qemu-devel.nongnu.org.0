Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020524B7C5A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 02:27:01 +0100 (CET)
Received: from localhost ([::1]:47672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK95w-0001b4-GU
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 20:27:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nK4Pi-0008B1-43; Tue, 15 Feb 2022 15:27:06 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=37549
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nK4Pg-0007a9-AY; Tue, 15 Feb 2022 15:27:05 -0500
Received: by mail-io1-xd2a.google.com with SMTP id x13so694512iop.4;
 Tue, 15 Feb 2022 12:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject
 :content-language:to:cc:content-transfer-encoding;
 bh=Qb3ONtsH9dk9kNRN/Y4Wtl4E3GyX/7DNvyLGVDYwxe8=;
 b=lYw6cxzUjIC2SjeAZXYLldMawkUpmsnktNHb64bldv6ZVucjFbEL3AhFFQYmBoPzmg
 OGz+WnSK/COa5aGjaLucnIcCK4FuXDM9Q5H6/37q+4xescQxofP9o6MkxG7PMrWLIKuW
 hi24i6LgMNsEr/feWU1APLUXio/xA0mC01pbtbPid+RJ1pLSFySptLMXQHO3bLUjENs8
 9lkdbce2kkpJ0dkanwuDuVGeUFRcEzMX//ODrbnVjiTUrbBVBrqk8GttsDxc73ZeoB9z
 TpSyDqvrmlcnnFh4pLm8j+DxKy/q7DxfFOlvMBYjdseCMtDzsPyfWpmI0jlRAlZiqvBS
 fJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:content-language:to:cc:content-transfer-encoding;
 bh=Qb3ONtsH9dk9kNRN/Y4Wtl4E3GyX/7DNvyLGVDYwxe8=;
 b=C0Quk5kfJW5MTNx8uobWx9hULCNn1OcTnCJv2NxTo6bhDZQeBcJkIBpmcMeKzAnZie
 Mp+16EpLGIom4pTw7ljBKLowle5UXBat5rTaOXUsglMtkVDFTr442zJLDm1kXhiF4r5P
 BRBjnqRBD/jCP2lHXCjn2FIp6ALu/wx+NK/PhOljicUCCqeF5k3jpk/VMzWhSbB4Ubfd
 8rROBjYndNi5tTCfk45shaFWqH1quuNfQccjn5la09MxqB1PegvlXSAP35nS0+LseqKA
 3mBmb5dZhv1eBTM6F+ae95tbUE1PFFRIZvfXuNxxVgaRNNVX7NIQoj79kQGK80yHNcLD
 dR/g==
X-Gm-Message-State: AOAM533neeVwcZnEJz5ccyVQQ8bqAIjqv696ZJN8MwkmRBjvmT3JADz4
 M8OkX/YMxZMT2gl4JKBn+Qe1xgB3WOJ/9WLKk5c=
X-Google-Smtp-Source: ABdhPJzUBJ784OuvAcp6p8G2hA71jVotflN0tBa0iwJuhRFwDfbLcTvestdHQLwTBemtJAHsAzCBCg==
X-Received: by 2002:a05:6638:1305:: with SMTP id
 r5mr421344jad.96.1644956822869; 
 Tue, 15 Feb 2022 12:27:02 -0800 (PST)
Received: from [10.10.0.23] (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id r64sm23423019iod.25.2022.02.15.12.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 12:27:02 -0800 (PST)
Message-ID: <9a2bab15-eec8-980b-8fa7-e2a1aae0a172@gmail.com>
Date: Tue, 15 Feb 2022 15:27:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: David Miller <dmiller423@gmail.com>
Subject: [PATCH v3 2/3] s390x/cpumodel: Bump up QEMU model to a stripped-down
 IBM z15 GA1
Content-Language: en-US
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=dmiller423@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 15 Feb 2022 20:21:13 -0500
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TCG implements everything we need to run basic z15 OS+software.

Signed-off-by: David Miller <dmiller423@gmail.com>
---
  hw/s390x/s390-virtio-ccw.c  | 3 +++
  target/s390x/cpu_models.c   | 6 +++---
  target/s390x/gen-features.c | 7 +++++--
  3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 84e3e63c43..90480e7cf9 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -802,7 +802,10 @@ DEFINE_CCW_MACHINE(7_0, "7.0", true);
   static void ccw_machine_6_2_instance_options(MachineState *machine)
  {
+    static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V6_2 };
+
      ccw_machine_7_0_instance_options(machine);
+    s390_set_qemu_cpu_model(0x3906, 14, 2, qemu_cpu_feat);
  }
   static void ccw_machine_6_2_class_options(MachineClass *mc)
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 11e06cc51f..89f83e81d5 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -85,9 +85,9 @@ static S390CPUDef s390_cpu_defs[] = {
      CPUDEF_INIT(0x3932, 16, 1, 47, 0x08000000U, "gen16b", "IBM 3932 GA1"),
  };
  -#define QEMU_MAX_CPU_TYPE 0x3906
-#define QEMU_MAX_CPU_GEN 14
-#define QEMU_MAX_CPU_EC_GA 2
+#define QEMU_MAX_CPU_TYPE 0x8561
+#define QEMU_MAX_CPU_GEN 15
+#define QEMU_MAX_CPU_EC_GA 1
  static const S390FeatInit qemu_max_cpu_feat_init = { 
S390_FEAT_LIST_QEMU_MAX };
  static S390FeatBitmap qemu_max_cpu_feat;
  diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index a3f30f69d9..22846121c4 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -731,16 +731,18 @@ static uint16_t qemu_V6_0[] = {
      S390_FEAT_ESOP,
  };
  -static uint16_t qemu_LATEST[] = {
+static uint16_t qemu_V6_2[] = {
      S390_FEAT_INSTRUCTION_EXEC_PROT,
      S390_FEAT_MISC_INSTRUCTION_EXT2,
      S390_FEAT_MSA_EXT_8,
      S390_FEAT_VECTOR_ENH,
  };
  +static uint16_t qemu_LATEST[] = {
+    S390_FEAT_MISC_INSTRUCTION_EXT3,
+};
  /* add all new definitions before this point */
  static uint16_t qemu_MAX[] = {
-    S390_FEAT_MISC_INSTRUCTION_EXT3,
      /* generates a dependency warning, leave it out for now */
      S390_FEAT_MSA_EXT_5,
  };
@@ -863,6 +865,7 @@ static FeatGroupDefSpec QemuFeatDef[] = {
      QEMU_FEAT_INITIALIZER(V4_0),
      QEMU_FEAT_INITIALIZER(V4_1),
      QEMU_FEAT_INITIALIZER(V6_0),
+    QEMU_FEAT_INITIALIZER(V6_2),
      QEMU_FEAT_INITIALIZER(LATEST),
      QEMU_FEAT_INITIALIZER(MAX),
  };
-- 
2.32.0



