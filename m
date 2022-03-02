Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9F34C9AD0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 02:59:22 +0100 (CET)
Received: from localhost ([::1]:52618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPEGv-0000DT-F0
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 20:59:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ic0eYgYKCrYpepqonckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--titusr.bounces.google.com>)
 id 1nPEEI-0006tZ-2f
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:56:38 -0500
Received: from [2607:f8b0:4864:20::114a] (port=49593
 helo=mail-yw1-x114a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ic0eYgYKCrYpepqonckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--titusr.bounces.google.com>)
 id 1nPEEG-00071l-If
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:56:37 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-2d7b96d74f8so1601827b3.16
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 17:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Y2EUdWJWmuYng2riwpVs90eiRzjJjFCIkE+E1jmTD+Y=;
 b=qEl+OFcT9yLNf7Mf4ZBx0+iKJjmHzm1punbcHsKE3Fe7aiFV5geWkEG69ADOph1W56
 9govhiEtUvun7rCaJ9mdMfxi/u5XTX6ThAic9HabYDHl9KMICSMhHE34Rrj/tt180wWm
 wlvo1//imQ8NqsiPfhVy+9QuM+D7grqMgPe+9xRhSRkDhM6fSBE2raixHCJ/SZx7EmaT
 HXw1rf81m1C5doG3AjrZXLQnlrEowppQ4jl8k/ppttmCMBKju68hU6vWuWbtZ3Q58fBL
 9bL/7G7kAXwrE2YkgGhSfSlyfKG146l7AuTqBFai5WJaKXxo+MInjSaVRyBgmXIaSOCv
 yp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Y2EUdWJWmuYng2riwpVs90eiRzjJjFCIkE+E1jmTD+Y=;
 b=1mccq0AQ3jrpyDaFVROb8T/nYj3lQ4zI8nW234HR/Ga1xJLEVofnkobTx5DqzNdRKv
 ussIU2RhPhLdSzlq0pb9LaT6J2vN98/XsxRCNYptZKH1YTrZ/jHPBRYSo9VndaovitUw
 IlBHI4ugo5t2EwFNsvDnZrU5YpE1PO8BXQ6tSokaTXkWaUn9imZRxjhyLQTNj8D6Aru8
 IzyOgV5gDop3IglUMmH5PKII1l/brAfVNrLDP5kcOt49isQPeaPX4fhpNdHk8eFYLbxQ
 gG2qTni4nFNQSbKquDsADCzklGRKBF9k9NIQXfRLBqnFWYrdyBrrBYLObqEozPD7aojx
 niBw==
X-Gm-Message-State: AOAM530g9P/cJxoU9Dq3Agld5goSdxPA4lsJkah468HP/qd0wrcMketf
 +yA/dIXbXhj+Ipd4LAHd2jO+N0G5t5s=
X-Google-Smtp-Source: ABdhPJx/pQGSg/+LZ29MTtHE/N1NzNx5y8viPa2IBFNK7VBoQz5W40W3dcu0LbDFx3EBjAgrWXGnLCqTGfk=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:8886:0:b0:624:50e0:3428 with SMTP id
 d6-20020a258886000000b0062450e03428mr26995177ybl.552.1646185865540; Tue, 01
 Mar 2022 17:51:05 -0800 (PST)
Date: Tue,  1 Mar 2022 17:50:46 -0800
In-Reply-To: <20220302015053.1984165-1-titusr@google.com>
Message-Id: <20220302015053.1984165-3-titusr@google.com>
Mime-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v3 2/9] hw/i2c: pmbus: guard against out of range accesses
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::114a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3ic0eYgYKCrYpepqonckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--titusr.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 07a45c99f9..93c746bab3 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -243,18 +243,47 @@ void pmbus_check_limits(PMBusDevice *pmdev)
     }
 }
 
+/* assert the status_cml error upon receipt of malformed command */
+static void pmbus_cml_error(PMBusDevice *pmdev)
+{
+    for (int i = 0; i < pmdev->num_pages; i++) {
+        pmdev->pages[i].status_word |= PMBUS_STATUS_CML;
+        pmdev->pages[i].status_cml |= PB_CML_FAULT_INVALID_CMD;
+    }
+}
+
 static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 {
     PMBusDevice *pmdev = PMBUS_DEVICE(smd);
     PMBusDeviceClass *pmdc = PMBUS_DEVICE_GET_CLASS(pmdev);
     uint8_t ret = 0xFF;
-    uint8_t index = pmdev->page;
+    uint8_t index;
 
     if (pmdev->out_buf_len != 0) {
         ret = pmbus_out_buf_pop(pmdev);
         return ret;
     }
 
+    /*
+     * Reading from all pages will return the value from page 0,
+     * this is unspecified behaviour in general.
+     */
+    if (pmdev->page == PB_ALL_PAGES) {
+        index = 0;
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: tried to read from all pages\n",
+                      __func__);
+        pmbus_cml_error(pmdev);
+    } else if (pmdev->page > pmdev->num_pages - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: page %d is out of range\n",
+                      __func__, pmdev->page);
+        pmbus_cml_error(pmdev);
+        return -1;
+    } else {
+        index = pmdev->page;
+    }
+
     switch (pmdev->code) {
     case PMBUS_PAGE:
         pmbus_send8(pmdev, pmdev->page);
@@ -1038,6 +1067,7 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         pmdev->page = pmbus_receive8(pmdev);
         return 0;
     }
+
     /* loop through all the pages when 0xFF is received */
     if (pmdev->page == PB_ALL_PAGES) {
         for (int i = 0; i < pmdev->num_pages; i++) {
@@ -1048,6 +1078,15 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         return 0;
     }
 
+    if (pmdev->page > pmdev->num_pages - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: page %u is out of range\n",
+                        __func__, pmdev->page);
+        pmdev->page = 0; /* undefined behaviour - reset to page 0 */
+        pmbus_cml_error(pmdev);
+        return -1;
+    }
+
     index = pmdev->page;
 
     switch (pmdev->code) {
-- 
2.35.1.616.g0bdcbb4464-goog


