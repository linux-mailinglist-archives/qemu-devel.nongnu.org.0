Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380975FA30C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:57:40 +0200 (CEST)
Received: from localhost ([::1]:50666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohx23-0001U3-B4
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbB-0001YP-D8
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwb4-0006bz-I3
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BsOC0ZeJk0TSOpxBXS/s5koTGeCNaE/TuTHTvbRH+I=;
 b=RBoqLtekE+vW2Xa6u6HL5lcLyRx2+g1pwvIFohNELkGVyjIdhV98tNW+Xb6K0Fst8lmhB2
 8qSlPWgKN8vsudD3WtkxM5ISx99ium4JZVoboI8I1vWYOpg65SsGV7/LjT7r0+YJTEI7YY
 uSUgrdIH+DHctksvYxsxxdGc2/Jdp+M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-529-d-5MlkNKPNGlJdMkddBxpg-1; Mon, 10 Oct 2022 13:29:44 -0400
X-MC-Unique: d-5MlkNKPNGlJdMkddBxpg-1
Received: by mail-wm1-f69.google.com with SMTP id
 i5-20020a1c3b05000000b003c47c8569easo4142986wma.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2BsOC0ZeJk0TSOpxBXS/s5koTGeCNaE/TuTHTvbRH+I=;
 b=z7UYo4pF/tx2bCL9Btawbat5R5pwXeKfxlQ4c+MELMkn3031Jt4ye8LIifCOWJIifI
 NRDDM3oLWKtBW990Nr0ugv/wiXdJLpT+zTCo8xQO2cgiEicfV/DMlr3dF41JdLSU3H4w
 dobieW6KFi3EI+me5iYIHlD4ttFDOfMPa2hIjIATyAYtSTUVczcs/OwBtuv74bs8NWxf
 o8xjgdSUzdlC60GUOfUXIwjrY62Tx4d+0+k9dZTNd5onPRr6dh5acnwkjbheI8WkbDZM
 COVUF8GRDgnn918/Yywd9w4s9y19zf0E+eYVocqXKU4hKK6N49GJunZVPKH/WPgvfHpT
 R7kQ==
X-Gm-Message-State: ACrzQf24mEcNhpTGaJDq6xZ8bRWHS/R4BcoYXrwqMofAbWe1BLjKP8R2
 yIbZZqFMyO6a7bJSU4Vf7tKU0oJ+bRA9edS3TI8fogMN1y050i80k2dSQu45geRVRNJpHagTwhA
 r7B/LtrNElwucZTyEWMNvovXOZhb0vYzek0qBMrLcSscgZfURy/3GJdnlvtii
X-Received: by 2002:a05:600c:3c84:b0:3b4:eff4:ab69 with SMTP id
 bg4-20020a05600c3c8400b003b4eff4ab69mr20440321wmb.104.1665422983140; 
 Mon, 10 Oct 2022 10:29:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4BaqfI52ASPMHK1ZW3bOidcgDrq3D8+WMegEfES29MExKHfaN+LxMdwN7Lx7OZZWNRA5GwQw==
X-Received: by 2002:a05:600c:3c84:b0:3b4:eff4:ab69 with SMTP id
 bg4-20020a05600c3c8400b003b4eff4ab69mr20440304wmb.104.1665422982851; 
 Mon, 10 Oct 2022 10:29:42 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 a13-20020adff7cd000000b0022a403954c3sm9368022wrq.42.2022.10.10.10.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:29:42 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:29:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 14/55] tests/qtest: catch unhandled vhost-user messages
Message-ID: <20221010172813.204597-15-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

We don't need to action every message but lets document the ones we
are expecting to consume so future tests don't get confused about
unhandled bits.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20220802095010.3330793-18-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/vhost-user-test.c | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 99dc6080e5..8d2d4ba535 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -358,12 +358,44 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         }
         break;
 
+    case VHOST_USER_SET_OWNER:
+        /*
+         * We don't need to do anything here, the remote is just
+         * letting us know it is in charge. Just log it.
+         */
+        qos_printf("set_owner: start of session\n");
+        break;
+
     case VHOST_USER_GET_PROTOCOL_FEATURES:
         if (s->vu_ops->get_protocol_features) {
             s->vu_ops->get_protocol_features(s, chr, &msg);
         }
         break;
 
+    case VHOST_USER_SET_PROTOCOL_FEATURES:
+        /*
+         * We did set VHOST_USER_F_PROTOCOL_FEATURES so its valid for
+         * the remote end to send this. There is no handshake reply so
+         * just log the details for debugging.
+         */
+        qos_printf("set_protocol_features: 0x%"PRIx64 "\n", msg.payload.u64);
+        break;
+
+        /*
+         * A real vhost-user backend would actually set the size and
+         * address of the vrings but we can simply report them.
+         */
+    case VHOST_USER_SET_VRING_NUM:
+        qos_printf("set_vring_num: %d/%d\n",
+                   msg.payload.state.index, msg.payload.state.num);
+        break;
+    case VHOST_USER_SET_VRING_ADDR:
+        qos_printf("set_vring_addr: 0x%"PRIx64"/0x%"PRIx64"/0x%"PRIx64"\n",
+                   msg.payload.addr.avail_user_addr,
+                   msg.payload.addr.desc_user_addr,
+                   msg.payload.addr.used_user_addr);
+        break;
+
     case VHOST_USER_GET_VRING_BASE:
         /* send back vring base to qemu */
         msg.flags |= VHOST_USER_REPLY_MASK;
@@ -428,7 +460,18 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         qemu_chr_fe_write_all(chr, p, VHOST_USER_HDR_SIZE + msg.size);
         break;
 
+    case VHOST_USER_SET_VRING_ENABLE:
+        /*
+         * Another case we ignore as we don't need to respond. With a
+         * fully functioning vhost-user we would enable/disable the
+         * vring monitoring.
+         */
+        qos_printf("set_vring(%d)=%s\n", msg.payload.state.index,
+                   msg.payload.state.num ? "enabled" : "disabled");
+        break;
+
     default:
+        qos_printf("vhost-user: un-handled message: %d\n", msg.request);
         break;
     }
 
-- 
MST


