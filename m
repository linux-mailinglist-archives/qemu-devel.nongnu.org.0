Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9115B543E33
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 23:07:03 +0200 (CEST)
Received: from localhost ([::1]:59756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz2tK-0003GZ-Kw
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 17:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nz2ql-0001mi-Ks
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:04:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nz2qk-00048T-6U
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654722261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NWOcKXALzYETQDPwBBeoZE/GQdWJfvnn2yDZFDnjDr0=;
 b=C1K9CNo1uF8wms8x50D79or7A0I/X7U/1Sn9gqSYsHKgwbooOOTbMfk0uL6FAn3QwnZ3IU
 epJjAOKjc1oHDX6iHSzyCQY2uPnLeXvQMGrwg8/sXKXyAjQhQGV8PQknLGNjYGujHcKUd/
 KHjFKgSLm9o7AenzFRidcGNQ8/vR6t0=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-pjK6Rc-oOBux6agkkVqVuw-1; Wed, 08 Jun 2022 17:04:20 -0400
X-MC-Unique: pjK6Rc-oOBux6agkkVqVuw-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-f344ea88d9so12921876fac.11
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 14:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NWOcKXALzYETQDPwBBeoZE/GQdWJfvnn2yDZFDnjDr0=;
 b=TOLy72myHyurD5hymcm9EhdLz6bUrwhglvAQQr31C5lWC6XcR1w8Ykmu5nHSA7AFqE
 l6svXpRQ7ighP1YUPSiwyhIYFMecqHuuOW240R0AuHBX+kRIkNm2Ek6A2fAncoGTwJia
 NLz7Af4e+hPMHYNU9VlaoQBlYRoCW9DtZeWRxEW6xXG38yLB5gBtcOWeFInavY4N1GY6
 8hpp02PCVKrL6T/DRIACAlnLJ6o4YRjqAlmycJlIIqI+0F0RwbiNqWG2qpGZqdNqQjj4
 HTkJedyBi08m4LpXdboeKqzO+IRJpckYY9iTW+6Gy4qXUKB2aFbQ4zUg9MxU7IqqrEqz
 JLrQ==
X-Gm-Message-State: AOAM532QtGi+OmxBTzyg9oaRtJxBXrC8LaOoMArv+RkmgHCgk6/d9ejG
 xzGpt2yiXe3knc7l4weB+mHGLMyYv822wFdE7GCXkGRFdVa4Oie/uvWvAKzuusz+9YfvDRwa9UT
 z2xHfEFy/LKud2XI=
X-Received: by 2002:a05:6808:e8d:b0:32e:1e76:a60b with SMTP id
 k13-20020a0568080e8d00b0032e1e76a60bmr3624958oil.21.1654722259742; 
 Wed, 08 Jun 2022 14:04:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ3+H+5wvUXc1bHnGjmfkAGin6JwcmpzMr4nX2M7aCR53gI3lB3tgN0ty5zpF9a34WbjPb4A==
X-Received: by 2002:a05:6808:e8d:b0:32e:1e76:a60b with SMTP id
 k13-20020a0568080e8d00b0032e1e76a60bmr3624946oil.21.1654722259592; 
 Wed, 08 Jun 2022 14:04:19 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f1:d1b1:8b15:218b:6b0e:5260])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a0568302b0e00b0060b66e2eaaesm11382384otv.38.2022.06.08.14.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 14:04:19 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?=E5=BE=90=E9=97=AF?= <xuchuangxclwt@bytedance.com>,
 David Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] QIOChannelSocket: Fix zero-copy send so socket flush
 works
Date: Wed,  8 Jun 2022 18:04:03 -0300
Message-Id: <20220608210403.84006-2-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220608210403.84006-1-leobras@redhat.com>
References: <20220608210403.84006-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
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

Somewhere between v6 and v7 the of the zero-copy-send patchset a crucial
part of the flushing mechanism got missing: incrementing zero_copy_queued.

Without that, the flushing interface becomes a no-op, and there is no
guarantee the buffer is really sent.

This can go as bad as causing a corruption in RAM during migration.

Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
Reported-by: 徐闯 <xuchuangxclwt@bytedance.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 io/channel-socket.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index ef7c7cfbac..ca4cae930f 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -607,6 +607,11 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
                          "Unable to write to socket");
         return -1;
     }
+
+    if (zero_copy_enabled) {
+        sioc->zero_copy_queued++;
+    }
+
     return ret;
 }
 #else /* WIN32 */
-- 
2.36.1


