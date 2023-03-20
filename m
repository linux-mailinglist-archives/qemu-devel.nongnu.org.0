Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F56C2424
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 22:56:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peNTc-0005Yc-6I; Mon, 20 Mar 2023 17:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3U9YYZAYKCoo7w7865u22uzs.q204s08-rs9sz121u18.25u@flex--titusr.bounces.google.com>)
 id 1peNTa-0005X0-D5
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:55:34 -0400
Received: from mail-ua1-x949.google.com ([2607:f8b0:4864:20::949])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3U9YYZAYKCoo7w7865u22uzs.q204s08-rs9sz121u18.25u@flex--titusr.bounces.google.com>)
 id 1peNTY-0006ZM-GY
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:55:34 -0400
Received: by mail-ua1-x949.google.com with SMTP id
 a6-20020ab03c86000000b00761dc4d3e30so2900954uax.5
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 14:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679349331;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=i6nuB1IuoNGeIVShStw0JikBLyXc87vR696JX/dK70I=;
 b=mMSVP1Ak1+3zj62Sy548BqNIS0GveTVxemOCYzBE6HvVq7KyH6pObeeb2c5ZDMr3Ba
 PpaKvQytCE4aYfWSYT5SDgu5epDPr9aaQ9vjs4HcW+JZBW8YrWMhC/nHunRSguIdJ2z0
 7bvdpSw6P92yQ16jEwm+aqE3KBWdoIUbiBVM6bmUYjTKbUscxw5slkk/y9klWZm4dja5
 fpxgbbOPjl2bpe4xpWGxs5avcINlSLnsVdyVCo5YBt5LJOBiytmZfhCXTWoJFua7NoCA
 GswDw+E6CJAQU7sKCvrMCNrD/o5cnpPMVn2/K2la85l1xKoxofY6ddSPQ+HutlN/XkgO
 lPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679349331;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=i6nuB1IuoNGeIVShStw0JikBLyXc87vR696JX/dK70I=;
 b=CdPzrD/f/K5Ja+L0TLFa+oXrJZn56wC6EKeopvREKplWc2+rIxvM+V4lT/5DQI5hjA
 07S5I+J5g9yPq1I9q7nDbpnvrkJHLXqusmEO3m4bpRqxv69QN6zQsN9lx8VyTkCMojs2
 0Zut1tVUnIhF4bN21loRrCYhu3TzGVMMI6TUDhX4o1P7SnZf1yM/Qh09TUj0QGtI0Txf
 NXBGaer/+GOEbA9DCLUb8I3vV1QJ1LzusNfp75vWpE9NNrVWaGtXgRndratPzw3nHIe7
 DNY4ZcQk6t0MrXUWfAbDaGdDguram/FArlUTd9R9x18zFCeNl/IOn0NFxEgWt7u0V+A8
 2uWg==
X-Gm-Message-State: AO0yUKWw/BNlTuK0fm+tIZtqHWCOcx1AQgbrZZVcsod2RRvqfoWckhs2
 KELOMQ4E5qypZZaMOiqA3R+OzLiLuzY=
X-Google-Smtp-Source: AK7set+QO0BqXppY61J8ekXjcmdiY7Hy1shW6ztHg5i9Erm1TdixYHhHVFld2K5g/MeBAae1T5eWa3Q+jh0=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a67:e04a:0:b0:425:f836:59ba with SMTP id
 n10-20020a67e04a000000b00425f83659bamr332395vsl.7.1679349331280; Mon, 20 Mar
 2023 14:55:31 -0700 (PDT)
Date: Mon, 20 Mar 2023 21:54:58 +0000
In-Reply-To: <20230320215500.722960-1-titusr@google.com>
Mime-Version: 1.0
References: <20230320215500.722960-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230320215500.722960-5-titusr@google.com>
Subject: [PATCH v3 4/5] hw/i2c: add canonical path to i2c event traces
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::949;
 envelope-from=3U9YYZAYKCoo7w7865u22uzs.q204s08-rs9sz121u18.25u@flex--titusr.bounces.google.com;
 helo=mail-ua1-x949.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/core.c       | 8 +++++---
 hw/i2c/trace-events | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index bed594fe59..896da359f5 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -161,7 +161,8 @@ static int i2c_do_start_transfer(I2CBus *bus, uint8_t a=
ddress,
            start condition.  */
=20
         if (sc->event) {
-            trace_i2c_event(event =3D=3D I2C_START_SEND ? "start" : "start=
_async",
+            trace_i2c_event(DEVICE(s)->canonical_path,
+                            event =3D=3D I2C_START_SEND ? "start" : "start=
_async",
                             s->address);
             rv =3D sc->event(s, event);
             if (rv && !bus->broadcast) {
@@ -244,7 +245,7 @@ void i2c_end_transfer(I2CBus *bus)
         I2CSlave *s =3D node->elt;
         sc =3D I2C_SLAVE_GET_CLASS(s);
         if (sc->event) {
-            trace_i2c_event("finish", s->address);
+            trace_i2c_event(DEVICE(s)->canonical_path, "finish", s->addres=
s);
             sc->event(s, I2C_FINISH);
         }
         QLIST_REMOVE(node, next);
@@ -321,7 +322,8 @@ void i2c_nack(I2CBus *bus)
     QLIST_FOREACH(node, &bus->current_devs, next) {
         sc =3D I2C_SLAVE_GET_CLASS(node->elt);
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
@@ -9,7 +9,7 @@ bitbang_i2c_data(unsigned dat, unsigned clk, unsigned old_o=
ut, unsigned new_out)
=20
 # core.c
=20
-i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
+i2c_event(const char *id, const char *event, uint8_t address) "%s: %s(addr=
:0x%02x)"
 i2c_send(uint8_t address, uint8_t data) "send(addr:0x%02x) data:0x%02x"
 i2c_send_async(uint8_t address, uint8_t data) "send_async(addr:0x%02x) dat=
a:0x%02x"
 i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
--=20
2.40.0.rc1.284.g88254d51c5-goog


