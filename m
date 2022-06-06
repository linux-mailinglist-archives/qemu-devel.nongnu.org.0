Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EDB53E527
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:50:00 +0200 (CEST)
Received: from localhost ([::1]:45302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyE3L-0000AK-KB
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr7-00025Z-Pm
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr4-0000Xj-I2
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GFkVwteKGaTzycRQEQZ+I1GrqbQDodeFp5/XE96lH98=;
 b=W/kPJmQNn/CxUk2kHc7tewYpIZh3WnS3QTNf9GsKS0q+Fn6ESu7l2e3PQptajSzy3sBWmy
 AXXAsJPNUvNUzkQHRGnKnJdUohyY4chDEG3qkO0uxe8hYJmCtq+XDdwyrVBAjX1ysH4gWf
 cy4pOUYaLOAU8f1VhdcYO6bON6nDnp0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-RE04WKSVMW-iO9FNIeVYjw-1; Mon, 06 Jun 2022 10:37:08 -0400
X-MC-Unique: RE04WKSVMW-iO9FNIeVYjw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg13-20020a05600c3c8d00b003974d0ff917so7804831wmb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GFkVwteKGaTzycRQEQZ+I1GrqbQDodeFp5/XE96lH98=;
 b=QyKH//G1EtJZ/07HqG4EY3Vc8yxWOb7QtnNjYIizDTTJmw0uj0vkZMK0iE46fWNUg3
 9kCOzb8LekrbUROzNnpbYpTJzf0pXyo8YFRRx1dIvv8WsX8cY19aagc/ZB7fSvhqq9gW
 kIbq/Jtz611FQsT8NkVIDFVz2UH5VNIqZUhEAo0pFeIclyKGJidkFXw2fR5UIsZCFKV+
 ap4ydC/uXViI9sofz2zq1Tm9tQJg0aK1iIpA/snLqq1LEb7KiWcdj8XGzs40FcCx+3i+
 qiU7SC98AyMUX5JlJI69rj6ZQcgmSGt6lpCakvrdc9GwPAK8XckniAm0A0VzX1YxJsmq
 O6FA==
X-Gm-Message-State: AOAM533ngtt4QUIayHo9JMGMURdpVCLQ0xX8LQzW9qS/OXWXIMzRr0hZ
 sKqkuALJJroA6zZa8xcts8CJu3h57vkNGFV83toUISx4birKcKWhUOc6GeWIgH5G/2BxXBf2yrf
 vXsQ42CpJAZSB+GirvVsIpzQnpmnuPvQgAx47gvLIakwDpjOf8uQ9Je618dnLa/NfDuc=
X-Received: by 2002:a1c:3b56:0:b0:39c:472a:4aff with SMTP id
 i83-20020a1c3b56000000b0039c472a4affmr12421136wma.23.1654526226568; 
 Mon, 06 Jun 2022 07:37:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6VAkbYgTNbw7/qi1kIVDgm58akEsOMuwpoWEe1ol3Fd2/6Q/og/bSlNCO3cJ5o7WCm1oZXw==
X-Received: by 2002:a1c:3b56:0:b0:39c:472a:4aff with SMTP id
 i83-20020a1c3b56000000b0039c472a4affmr12421088wma.23.1654526226123; 
 Mon, 06 Jun 2022 07:37:06 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 t17-20020adfeb91000000b0021031c894d3sm16359452wrn.94.2022.06.06.07.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/29] docs: convert docs/devel/replay page to rst
Date: Mon,  6 Jun 2022 16:36:25 +0200
Message-Id: <20220606143644.1151112-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch converts prior .txt replay devel documentation to .rst.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <165364839013.688121.11935249420738873044.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/index-tcg.rst              |  1 +
 docs/devel/{replay.txt => replay.rst} | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)
 rename docs/devel/{replay.txt => replay.rst} (90%)

diff --git a/docs/devel/index-tcg.rst b/docs/devel/index-tcg.rst
index 0b0ad12c22..7b9760b26f 100644
--- a/docs/devel/index-tcg.rst
+++ b/docs/devel/index-tcg.rst
@@ -13,3 +13,4 @@ are only implementing things for HW accelerated hypervisors.
    multi-thread-tcg
    tcg-icount
    tcg-plugins
+   replay
diff --git a/docs/devel/replay.txt b/docs/devel/replay.rst
similarity index 90%
rename from docs/devel/replay.txt
rename to docs/devel/replay.rst
index e641c35add..dd8bf3b195 100644
--- a/docs/devel/replay.txt
+++ b/docs/devel/replay.rst
@@ -1,3 +1,11 @@
+..
+   Copyright (c) 2022, ISP RAS
+   Written by Pavel Dovgalyuk
+
+=======================
+Execution Record/Replay
+=======================
+
 Record/replay mechanism, that could be enabled through icount mode, expects
 the virtual devices to satisfy the following requirements.
 
@@ -5,7 +13,7 @@ The main idea behind this document is that everything that affects
 the guest state during execution in icount mode should be deterministic.
 
 Timers
-======
+------
 
 All virtual devices should use virtual clock for timers that change the guest
 state. Virtual clock is deterministic, therefore such timers are deterministic
@@ -19,7 +27,7 @@ the virtual devices (e.g., slirp routing device) that lie outside the
 replayed guest.
 
 Bottom halves
-=============
+-------------
 
 Bottom half callbacks, that affect the guest state, should be invoked through
 replay_bh_schedule_event or replay_bh_schedule_oneshot_event functions.
@@ -27,7 +35,7 @@ Their invocations are saved in record mode and synchronized with the existing
 log in replay mode.
 
 Saving/restoring the VM state
-=============================
+-----------------------------
 
 All fields in the device state structure (including virtual timers)
 should be restored by loadvm to the same values they had before savevm.
@@ -38,7 +46,7 @@ is not defined. It means that you should not call functions like
 the dependencies that may make restoring the VM state non-deterministic.
 
 Stopping the VM
-===============
+---------------
 
 Stopping the guest should not interfere with its state (with the exception
 of the network connections, that could be broken by the remote timeouts).
-- 
2.36.1



