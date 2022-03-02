Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A44C99DA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 01:26:41 +0100 (CET)
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPCpE-00021f-1U
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 19:26:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ALkeYgYKCgUynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com>)
 id 1nPCmD-0008Iu-6u
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:23:33 -0500
Received: from [2607:f8b0:4864:20::b49] (port=46638
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ALkeYgYKCgUynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com>)
 id 1nPCmA-000368-Un
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:23:32 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 11-20020a25030b000000b00628660166e7so4773ybd.13
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 16:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=GlIJF2b8Drq45++1hxBTKoEZIPJ8E+QjOj/1FgeYUhM=;
 b=sn1nKXYaHzsRMxB1TWRuNZo3V+b3m3c5sqABtfOcwgHgmYMYoruKixCjWKdJ8MhvD1
 qflGtQbnXthz7Qv2A9r2uGrD/AhDTjFvxqRau02kv+vwD5wRiG+MCdGK1sVx7ZleH9Sn
 6qPn19pPXzBO7fOpG/VYKF580j95KYtA3Q+A/j6U3lZJ6/+9YtwWJ6oJ2yUtowEKLozv
 hzLYE1d5sj8tc2VSVhGB349cHVtgCl17V+PhJddZpE5yrYt+kC4Ay5m3h+UIGH2AI3tL
 s/6Ewbl96Cl2abf7nhuKcYupa/gw30W/nBPybfGcwEuMN/4k2sRLSKGYqTsl8ldpwX/B
 SyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GlIJF2b8Drq45++1hxBTKoEZIPJ8E+QjOj/1FgeYUhM=;
 b=uDmRI3ctwYocGGEA9ukpC01/AaRxy4XgM5zcbmhsi1YUGiLI/micwZdu//X9FcHme/
 gEkVbeolKTuQNXY0H1BGI+Ctz/vZsjntRuYwh8jH0AyVw8bwBb1bZuf9tLBNbwHrBcde
 Uvfa2p/1FYW27wAtoqNiU66qlPK6f+I5QRzuX2yIxD21wsZcDFRwAK2J7dJmniV4YRZF
 1HTrZhWN3M3UPAf6ma8HobaijsID/3SY1wZT7/2Ugbvcjb7A9R1LI/Uf1Pwb1f9K1s4m
 BmqCX6UuHAaPm3/nAIUgFoarSI8OLBtvFgaTVOP7Ov3ygJODznzl5Yn61Q2f/R29xDVp
 j7tA==
X-Gm-Message-State: AOAM532AGuT4XFiz6TpFQank94hREm8ffRJ3JfhtvNnsFUUJkLG//rfe
 6xQea0CQmK7pKiyTFWdKLjYkDDpP/Gg=
X-Google-Smtp-Source: ABdhPJzD+eBhOgOrSrwWoP859a9fFOALAmLPpxt78fOsgG1WB8xBIt+DAq8DD4fVPw2Sjlhs6Y5ya7OL/dY=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a0d:cac2:0:b0:2db:fc7f:7dfa with SMTP id
 m185-20020a0dcac2000000b002dbfc7f7dfamr3562025ywd.362.1646180608119; Tue, 01
 Mar 2022 16:23:28 -0800 (PST)
Date: Tue,  1 Mar 2022 16:23:01 -0800
In-Reply-To: <20220302002307.1895616-1-titusr@google.com>
Message-Id: <20220302002307.1895616-4-titusr@google.com>
Mime-Version: 1.0
References: <20220302002307.1895616-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 3/9] hw/i2c: pmbus: add PEC unsupported warning
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ALkeYgYKCgUynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
 hw/i2c/pmbus_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 93c746bab3..6eeb0731d7 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -307,6 +307,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 
     case PMBUS_CAPABILITY:
         pmbus_send8(pmdev, pmdev->capability);
+        if (pmdev->capability & BIT(7)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: PEC is enabled but not yet supported.\n",
+                          __func__);
+        }
         break;
 
     case PMBUS_VOUT_MODE:                 /* R/W byte */
-- 
2.35.1.616.g0bdcbb4464-goog


