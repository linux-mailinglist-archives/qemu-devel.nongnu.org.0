Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487ED4257F3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:27:31 +0200 (CEST)
Received: from localhost ([::1]:34178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWF0-0004xQ-Bj
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5b-0003Yv-Ij
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5Z-0004lF-QB
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWQW4qwuIwVFhirEUS8iXAcoBuFkj6ZGIrq5y79ZQBA=;
 b=ism7fi9AriLQcgWzijaODOlGAwt3zSc/MR6TrcvttBTacU234FgYM0In2CpFIwG+y0f2X5
 Qh+jFLrckfi+8hcuFdI3T8q238q92g6S2ncKxrQ0b5YFiICExu/nXo3lxZIbbk0lFj2Qa0
 5c5bwXfIrXwya3cxEJ72twdDiXZgaOM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-9V5cPOX7PiCg9Ksf7N9lBQ-1; Thu, 07 Oct 2021 12:17:43 -0400
X-MC-Unique: 9V5cPOX7PiCg9Ksf7N9lBQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso5102460wrr.15
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YWQW4qwuIwVFhirEUS8iXAcoBuFkj6ZGIrq5y79ZQBA=;
 b=bqLrntUVLItVAQ+Vt++sQch/9UOV/D6Bfho/UjrHPDYWUC3u5rBr2comSLzWeEHHEX
 teMkldHxeiu1Sw6UCjDJojUnVSbCDet5H1ndCUg3NTErtjGIbD58U7nwq3pvqerhxtSw
 rkgf0oUJbPoYccxM5DEIyZYCmgvLpN5QZzBt/gzwUlUsHkc9K/LYUvXGZLcPH1U5646t
 y7bmuFN9qhuLcOEhmWT3eaOJ4DNZB+Aw+CUnvUEqhK/Bs4TzeYibFicXa/urZPR38Ncv
 Wwo8rUXW070DvbOeYjOEQXr8kgp/m9rv0StX5TSBRp8Y5io6HMjokDYjJ3xwSCd1/UMl
 1hjA==
X-Gm-Message-State: AOAM530HDXsZX/PDLLRimWugbYZ+LGKqyXihePVgQlqtfHnR/WwzTVj8
 GVHEKsmDMviRZcTcBjZxDC8rQELih+7urX4juhPR01nXPoV8m1qDjTo1qRSlQ2HvIPSf2HEm6JO
 nmFUqwyLgmaOyPgl9ImOPkiiOXdYMuZChiPb2x0fknFT3v6jYXFCdGZ9FWwUfjmh6
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr17723318wmq.122.1633623461638; 
 Thu, 07 Oct 2021 09:17:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4KQBsttMSUVTx9ahdzw6VyJFfQYYcVssfVN4N4+Jw4Mj8STX+6QzmCQF2fKgdLkdMPO9omQ==
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr17723282wmq.122.1633623461414; 
 Thu, 07 Oct 2021 09:17:41 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id e5sm88818wrd.1.2021.10.07.09.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:17:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/23] target/i386/sev: Prefix QMP errors with 'SEV'
Date: Thu,  7 Oct 2021 18:16:58 +0200
Message-Id: <20211007161716.453984-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Multiple errors might be reported to the monitor,
better to prefix the SEV ones so we can distinct them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/monitor.c |  2 +-
 target/i386/sev.c     | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 196c1c9e77f..eabbeb9be95 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -717,7 +717,7 @@ SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
 
     data = sev_get_launch_measurement();
     if (!data) {
-        error_setg(errp, "Measurement is not available");
+        error_setg(errp, "SEV launch measurement is not available");
         return NULL;
     }
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index bcd9260fa46..4f1952cd32f 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -440,7 +440,8 @@ sev_get_pdh_info(int fd, guchar **pdh, size_t *pdh_len, guchar **cert_chain,
     r = sev_platform_ioctl(fd, SEV_PDH_CERT_EXPORT, &export, &err);
     if (r < 0) {
         if (err != SEV_RET_INVALID_LEN) {
-            error_setg(errp, "failed to export PDH cert ret=%d fw_err=%d (%s)",
+            error_setg(errp, "SEV: Failed to export PDH cert"
+                             " ret=%d fw_err=%d (%s)",
                        r, err, fw_error_to_str(err));
             return 1;
         }
@@ -453,7 +454,7 @@ sev_get_pdh_info(int fd, guchar **pdh, size_t *pdh_len, guchar **cert_chain,
 
     r = sev_platform_ioctl(fd, SEV_PDH_CERT_EXPORT, &export, &err);
     if (r < 0) {
-        error_setg(errp, "failed to export PDH cert ret=%d fw_err=%d (%s)",
+        error_setg(errp, "SEV: Failed to export PDH cert ret=%d fw_err=%d (%s)",
                    r, err, fw_error_to_str(err));
         goto e_free;
     }
@@ -491,7 +492,7 @@ sev_get_capabilities(Error **errp)
 
     fd = open(DEFAULT_SEV_DEVICE, O_RDWR);
     if (fd < 0) {
-        error_setg_errno(errp, errno, "Failed to open %s",
+        error_setg_errno(errp, errno, "SEV: Failed to open %s",
                          DEFAULT_SEV_DEVICE);
         return NULL;
     }
@@ -557,8 +558,9 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
             &input, &err);
     if (ret < 0) {
         if (err != SEV_RET_INVALID_LEN) {
-            error_setg(errp, "failed to query the attestation report length "
-                    "ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
+            error_setg(errp, "SEV: Failed to query the attestation report"
+                             " length ret=%d fw_err=%d (%s)",
+                       ret, err, fw_error_to_str(err));
             g_free(buf);
             return NULL;
         }
@@ -572,7 +574,7 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
             &input, &err);
     if (ret) {
-        error_setg_errno(errp, errno, "Failed to get attestation report"
+        error_setg_errno(errp, errno, "SEV: Failed to get attestation report"
                 " ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
         goto e_free_data;
     }
@@ -596,7 +598,7 @@ sev_read_file_base64(const char *filename, guchar **data, gsize *len)
     GError *error = NULL;
 
     if (!g_file_get_contents(filename, &base64, &sz, &error)) {
-        error_report("failed to read '%s' (%s)", filename, error->message);
+        error_report("SEV: Failed to read '%s' (%s)", filename, error->message);
         g_error_free(error);
         return -1;
     }
@@ -911,7 +913,7 @@ sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
     if (sev_check_state(sev_guest, SEV_STATE_LAUNCH_UPDATE)) {
         int ret = sev_launch_update_data(sev_guest, ptr, len);
         if (ret < 0) {
-            error_setg(errp, "failed to encrypt pflash rom");
+            error_setg(errp, "SEV: Failed to encrypt pflash rom");
             return ret;
         }
     }
@@ -930,7 +932,7 @@ int sev_inject_launch_secret(const char *packet_hdr, const char *secret,
     MemoryRegion *mr = NULL;
 
     if (!sev_guest) {
-        error_setg(errp, "SEV: SEV not enabled.");
+        error_setg(errp, "SEV not enabled for guest");
         return 1;
     }
 
-- 
2.31.1


