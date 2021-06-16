Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8E03AA5E0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:03:50 +0200 (CEST)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltchR-0008Ol-UQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcP7-0002q2-Ce
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcP4-00018X-Mw
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTw6coySU0nJcHmY2S2py9HmFIvO1l0fChn4YRCOlgU=;
 b=WbO122IBGPSlIMKjGBYpwfqlxy8EoIIDF0i4+YbBBwOqPng7G6Dx2F890/yhFldTJKiahf
 yLz1KIezTlidzEYmPyYC/G05hr1f63xJddg7JuKZCMFYF2umzFgTun7JgaO0nXpLQ2MCtK
 U6gUyURn7WkRIWc/MgAhSc5go5D4Epw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-Q7eICvoDMnekqVI49tUvOg-1; Wed, 16 Jun 2021 16:44:49 -0400
X-MC-Unique: Q7eICvoDMnekqVI49tUvOg-1
Received: by mail-wr1-f69.google.com with SMTP id
 y12-20020adffa4c0000b0290119c11bd29eso1880212wrr.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mTw6coySU0nJcHmY2S2py9HmFIvO1l0fChn4YRCOlgU=;
 b=ePCS7AeSI87DbLT7tM/CpLIwPhrgOD7c6qgAv6tXEbswGNYK0TeM++Kwe54WJifKKw
 klzhH9eoSppiHlXFBaBi/dpAL7qEu30kGPGOjAw4a8u5lpeyR9Rj64Jxr/ABSM5DpOsx
 9NdOh2rKWIEKJ1W97UTayEqV1BRnyPGJgSqVR8OHJhAtaBOoW2WYNeUvVyw22W5ZgaJV
 +Kc4CLJp4nmBW9twnfcaVB5UMIrtearDRxAG9gNB58RZoO8h6t9R9SKHv2Iqvp/u1ZqD
 OFb6DthxroK3u/HU9BFwXKHM+hYFznGWjlGCC74alb/Zav/Xg+yKcNq7QnmvlYdlGmCi
 e8/g==
X-Gm-Message-State: AOAM530xZrO2lItilAT0YHdSRA6yp8lEqqB5vXcSDZsdnIegI4pMQj4J
 T6EiDBQA+LQSQGQxA53+5BcliVHDV3ZDPjyTFDl5CTTG/E077Pi6ibQ+PWsdS7+t7Yy1JtfLqKK
 qxoO0ZYj9p1VQOyIxatIihlY5+7MBfVvQrphjrs8xx10VLNeNgvXynraYi7eJmWQO
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr873142wmh.127.1623876287570;
 Wed, 16 Jun 2021 13:44:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSo8Vje44Byvcni5YZ1Gy6T4dbU1s/gAfyqgBltfLzVwVkSAn7fAd1HH4psiTiXypj7W0VrQ==
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr873111wmh.127.1623876287327;
 Wed, 16 Jun 2021 13:44:47 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c12sm3204088wrw.46.2021.06.16.13.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:44:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/23] target/i386/sev: Move qmp_query_sev_capabilities()
 to sev.c
Date: Wed, 16 Jun 2021 22:43:18 +0200
Message-Id: <20210616204328.2611406-14-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qmp_query_sev_capabilities() from monitor.c to sev.c
and make sev_get_capabilities() static. We don't need the
stub anymore, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h        | 1 -
 target/i386/monitor.c         | 5 -----
 target/i386/sev-sysemu-stub.c | 4 ++--
 target/i386/sev.c             | 8 ++++++--
 4 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index cb5702a2397..62ee2e1b16a 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -29,6 +29,5 @@ extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
 extern char *sev_get_launch_measurement(void);
-extern SevCapability *sev_get_capabilities(Error **errp);
 
 #endif
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 95b9ada189e..6c6d0b5d707 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -726,8 +726,3 @@ SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
 
     return info;
 }
-
-SevCapability *qmp_query_sev_capabilities(Error **errp)
-{
-    return sev_get_capabilities(errp);
-}
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index a66ae4f5efb..e62ac5edd83 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -27,9 +27,9 @@ char *sev_get_launch_measurement(void)
     return NULL;
 }
 
-SevCapability *sev_get_capabilities(Error **errp)
+SevCapability *qmp_query_sev_capabilities(Error **errp)
 {
-    error_setg(errp, "SEV is not available in this QEMU");
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 7cdf8d857c8..23295d74c8b 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -438,8 +438,7 @@ e_free:
     return 1;
 }
 
-SevCapability *
-sev_get_capabilities(Error **errp)
+static SevCapability *sev_get_capabilities(Error **errp)
 {
     SevCapability *cap = NULL;
     guchar *pdh_data = NULL;
@@ -489,6 +488,11 @@ out:
     return cap;
 }
 
+SevCapability *qmp_query_sev_capabilities(Error **errp)
+{
+    return sev_get_capabilities(errp);
+}
+
 static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
                                                         Error **errp)
 {
-- 
2.31.1


