Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F32526387
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:14:50 +0200 (CEST)
Received: from localhost ([::1]:46904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npW49-0006SE-No
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1npVzu-00028L-DW
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:10:26 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1npVzs-00017o-HH
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:10:26 -0400
Received: by mail-pf1-x42b.google.com with SMTP id v11so7793313pff.6
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f2sVgSgj8yscqEs72Zhtu4LpgKQTQm9FAA2+eHIkgZM=;
 b=PHCYIVbsr0B1O5bN+PmaLOSYfOJwrgD5i4InOZuqpgksK1aFXL6Ym92Ei/HEIsXlE3
 BOa3GLKVou5iEBdtNYyxJlGoWszmeBczjor2W/1VvxFZ2d5U6xBzQnbk3ehAFNZusUAP
 WjhSppgbxhYyjbV/ZdZP5jgStYXlkEejchF4AYRWTBqPuVuVWcMS52EWeuQQVk50hcmv
 BJKSyDb3LIuyQycPghtXJ/R5KalGGet/4GgEsDXJnYi/XgAnlOpy6nYfsYsxf7k3R8xf
 R/VmYOjrsl7EqvttyT6aUQ4d+PAI5abYAPTDkBOzdWjplwV5Kvgoaro9CMIRJeiDaL9I
 HRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f2sVgSgj8yscqEs72Zhtu4LpgKQTQm9FAA2+eHIkgZM=;
 b=MNwcLfkbg3EHMwun0OYO6wZwV4pgnXDFbhiZOSQpbjBDVzVzYvp0D3RjPbDksA0nL5
 QnJIrIxyN3vRAyusyPh1FN4qEytXCWh5SLAsVxZGN5TI0ioQjZPjVG9EQhxuyfT8saPB
 SvdJzaEp2HixccPbGApkVQLIKOtXAVXbzZrdSVsMkoGvF586lTVzA/fLiJLTbSoPJAjp
 AzwhljDSfaQ+evY01b1PFYFYwPdf1YUVwEZYu/qrJhc4PeGsOfRK+YyGklB9k2dQECtL
 ++0ou6huptc4wpHLV8XjAafLDNYoGfP1sNIznHg+fdmQ2q4b46VWxKAtr1EfUNzuqyz4
 FTNQ==
X-Gm-Message-State: AOAM530d7+6BkSpRnr2S6CvSpq0Wn/rddloC2SMJ0CKSCJxBclxqfBM+
 S74jMs6Q4sYkCIMzOR7Q16+44Q==
X-Google-Smtp-Source: ABdhPJwYN4QxC6yfM2bNXRe4pgebxu3tyqT0IJHRkL8Yj9YmBTy3YR1Hr6tLTIY9zldr1zWw70r8pw==
X-Received: by 2002:a63:ce4d:0:b0:3db:40ef:fad4 with SMTP id
 r13-20020a63ce4d000000b003db40effad4mr4291841pgi.16.1652451022029; 
 Fri, 13 May 2022 07:10:22 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([49.207.206.241])
 by smtp.googlemail.com with ESMTPSA id
 n26-20020a056a00213a00b0050dc7628167sm1815823pfj.65.2022.05.13.07.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 07:10:21 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric DeVolder <eric.devolder@oracle.com>, qemu-devel@nongnu.org
Subject: [PATCH] acpi/erst: fix fallthrough code upon validation failure
Date: Fri, 13 May 2022 19:40:05 +0530
Message-Id: <20220513141005.1929422-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At any step when any validation fail in check_erst_backend_storage(), there is
no need to continue further through other validation checks. Further, by
continuing even when record_size is 0, we run the risk of triggering a divide
by zero error if we continued with other validation checks. Hence, we should
simply return from this function upon validation failure.

CC: Peter Maydell <peter.maydell@linaro.org>
CC: Eric DeVolder <eric.devolder@oracle.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/erst.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index de509c2b48..df856b2669 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -440,6 +440,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
         (record_size >= 4096) /* PAGE_SIZE */
         )) {
         error_setg(errp, "ERST record_size %u is invalid", record_size);
+        return;
     }
 
     /* Validity check header */
@@ -450,6 +451,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
         (le16_to_cpu(header->reserved) == 0)
         )) {
         error_setg(errp, "ERST backend storage header is invalid");
+        return;
     }
 
     /* Check storage_size against record_size */
@@ -457,6 +459,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
          (record_size > s->storage_size)) {
         error_setg(errp, "ACPI ERST requires storage size be multiple of "
             "record size (%uKiB)", record_size);
+        return;
     }
 
     /* Compute offset of first and last record storage slot */
-- 
2.25.1


