Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5FE68FA5C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 23:44:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPtAZ-0008Tm-4M; Wed, 08 Feb 2023 17:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3rSXkYwYKCq4hWhigfUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--titusr.bounces.google.com>)
 id 1pPtAW-0008Rt-JQ
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:44:00 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3rSXkYwYKCq4hWhigfUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--titusr.bounces.google.com>)
 id 1pPtAU-0002gH-Nb
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:44:00 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-4c8e781bc0aso1001737b3.22
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5UFfBkWtPly3D46k7dHIejYftzXsZfBmIicoEqFODNo=;
 b=mhilAg844OaP8JJZyWEIa4TDBgn8UmDvR0haKn7TwmONpn5vs4vZJ/ZFcgTqsc87w3
 YsjkTrO75FL+eYUuY2MeK6qDrPop9JFO84MMRxsZviQ2If25g3uxQl9B8zlVLmsdlLRI
 +orh2SfH/TNhZB8+xUt21voK3F6vQ/c7IoAetCEU62O1y1gUtK8X+vn4qYAvdg7ugTf8
 LVyVXCs2oPEbPRK6oCYsFo+amlYcqXO1i9M5is3Bz4JGwYH6HJWh43NZDQ4bwlVeYxpB
 1GZoZM5AfPXRbzMxKje/1b+bA5AWkgqtqECQRF6yN/ahEVkGb6i3gCPjmrhh3uIK7f5Z
 loFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5UFfBkWtPly3D46k7dHIejYftzXsZfBmIicoEqFODNo=;
 b=qY1Nq+/GxNz+fEXHIgFe1XF15Hm/mCQjgFEcyrpkn6n6Jts9wkI/61q6Sf6W/qlOYt
 5NJSpQS3/6cy7lacl3QOhadB6I8oPv+WCrcFa7MfmGMfdY3vNoY7lOD1FlWX1lJff70H
 IG6THI7qamrxnADKFMaNNTIJuMrEc0kUGlVf3PsO9lu+77YpmC+5DG540TM6y9RHU2Rq
 eh7IsgC5NOoggiFHmxONl4wM7IlMjJA5KnhxKfhPsiD66sPPfFiFDhCSPnCugsfatthl
 AD/cn+FiwPczOKR2XLocxChtCnkpOw5vpiO0UbsBWBa8/8eOSxL8hxCVHwSvHDB0QObA
 +pnw==
X-Gm-Message-State: AO0yUKVThnYuvOJ7ylncXM326HrFwf8VHoaqSt8TisHEWtt9svOYMvgA
 hyHIyRMnSXr5K8LSoT7MAaO/DnJR1Og=
X-Google-Smtp-Source: AK7set+Tl+w3rpjxqA6tG65DAPVCEoj27/uaB8xN7dhwzYkCqZHGJcAweYjlBXq3JSPkBIdqedpwc3FPwnw=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a25:60c2:0:b0:80b:83b0:c87e with SMTP id
 u185-20020a2560c2000000b0080b83b0c87emr913821ybb.360.1675896237491; Wed, 08
 Feb 2023 14:43:57 -0800 (PST)
Date: Wed,  8 Feb 2023 22:43:39 +0000
In-Reply-To: <20230208224339.270589-1-titusr@google.com>
Mime-Version: 1.0
References: <20230208224339.270589-1-titusr@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230208224339.270589-5-titusr@google.com>
Subject: [PATCH v2 4/4] hw/i2c: add canonical path to i2c event traces
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org, eddie.dong@intel.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, joel@jms.id.au, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3rSXkYwYKCq4hWhigfUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--titusr.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/core.c       | 8 +++++---
 hw/i2c/trace-events | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index d4ba8146bf..c583c1497a 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -161,7 +161,8 @@ static int i2c_do_start_transfer(I2CBus *bus, uint8_t address,
            start condition.  */
 
         if (sc->event) {
-            trace_i2c_event(event == I2C_START_SEND ? "start" : "start_async",
+            trace_i2c_event(DEVICE(s)->canonical_path,
+                            event == I2C_START_SEND ? "start" : "start_async",
                             s->address);
             rv = sc->event(s, event);
             if (rv && !bus->broadcast) {
@@ -227,7 +228,7 @@ void i2c_end_transfer(I2CBus *bus)
         I2CSlave *s = node->elt;
         sc = I2C_SLAVE_GET_CLASS(s);
         if (sc->event) {
-            trace_i2c_event("finish", s->address);
+            trace_i2c_event(DEVICE(s)->canonical_path, "finish", s->address);
             sc->event(s, I2C_FINISH);
         }
         QLIST_REMOVE(node, next);
@@ -314,7 +315,8 @@ void i2c_nack(I2CBus *bus)
     QLIST_FOREACH(node, &bus->current_devs, next) {
         sc = I2C_SLAVE_GET_CLASS(node->elt);
         if (sc->event) {
-            trace_i2c_event("nack", node->elt->address);
+            trace_i2c_event(DEVICE(node->elt)->canonical_path,
+                            "nack", node->elt->address);
             sc->event(node->elt, I2C_NACK);
         }
     }
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 8e88aa24c1..f42a1ff539 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -9,7 +9,7 @@ bitbang_i2c_data(unsigned dat, unsigned clk, unsigned old_out, unsigned new_out)
 
 # core.c
 
-i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
+i2c_event(const char *id, const char *event, uint8_t address) "%s: %s(addr:0x%02x)"
 i2c_send(uint8_t address, uint8_t data) "send(addr:0x%02x) data:0x%02x"
 i2c_send_async(uint8_t address, uint8_t data) "send_async(addr:0x%02x) data:0x%02x"
 i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
-- 
2.39.1.581.gbfd45094c4-goog


