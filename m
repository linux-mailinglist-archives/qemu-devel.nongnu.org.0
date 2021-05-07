Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73717376978
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:23:16 +0200 (CEST)
Received: from localhost ([::1]:55134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf4C3-0005N2-HD
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf48x-0003is-Cw
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf48v-0006BW-Oh
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620408000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOFcyNIJjuiw01s2VBdGQ50UDrGE+IFT929JvHJBSgU=;
 b=QV1FKTqj1W14XJOBqxjr+6gNbZjXaEvJG9NnRtnCvE0YVe5etOt9/Kdmj6Zpy1l6mQt1L5
 pxGT3Mw0xtgEGa42yayur0RQt4Q5lxmoGb0UT3zD7Y3Giq2pVp0pmB9GVcz17VItwbSxfy
 xQ3LbGVx3I90O2ofjR1WSZtDy1PUerA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-6BBUGffTPDWlLZQIloiv5g-1; Fri, 07 May 2021 13:19:58 -0400
X-MC-Unique: 6BBUGffTPDWlLZQIloiv5g-1
Received: by mail-wm1-f71.google.com with SMTP id
 y193-20020a1c32ca0000b029014cbf30c3f2so4095183wmy.1
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 10:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wOFcyNIJjuiw01s2VBdGQ50UDrGE+IFT929JvHJBSgU=;
 b=phxVyYc4lL3cV77IKDSv3iUZP+lZedJeFyY5lFMnrIQP6VXYU0IzyfYvUP8zGg/pkh
 5jmBL693FHjDhg0lRMBAy/HQ5EfJqsFeIkkVoe1QIFIBQbHdT4ltwW9fzH5Tv1QlsGsl
 1UCzNMj99LybWo2NyiF3OoS5BMI3R1APRUo8LrsTcsDGlFxG1qS3f2z/k+UDoNV9gQ2v
 1I6giDhaf5XyazmAkNA4ZMbDVdQbwiznIb3Dleyt6NyQEC4uRdaCJrH0R70AFFFmg22o
 YXZa1oS1xPW3MkYRj8zPCKtEtL6taA06hqdGDOmsJcOMr9mz1hBjVa2dIB2oY/HMe9xN
 DeeA==
X-Gm-Message-State: AOAM533sqIR+W5ax3EBoRAqOfv5BWT2I6mlnnTd0N8UlOEM6pP/2K3D6
 c8AIaaLw1zGBwjJYq5Dwr85GVJnM97GhfA3FdRttWSZ3jrNA90Ak38Nkhg6fUWK3kxPVQXsA0BP
 8+GAMIy6GQscfbaY=
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr13680522wrf.315.1620407997132; 
 Fri, 07 May 2021 10:19:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg84xHcRqOfwXcWS/7YUAZoCtC8jV/rXCCK4OED+w2zkmovp5Als6sBpwh/F9cPaEN8+yiqQ==
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr13680500wrf.315.1620407996964; 
 Fri, 07 May 2021 10:19:56 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id z14sm10304337wrt.54.2021.05.07.10.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 10:19:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: 
Subject: [PATCH v3 18/17] tests/unit/test-char: Replace g_alloca() by buffer
 on the stack
Date: Fri,  7 May 2021 19:19:48 +0200
Message-Id: <20210507171948.2062076-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Directly reserve the CharBackend on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-char.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
index 5b3b48ebacd..54ce26226b3 100644
--- a/tests/unit/test-char.c
+++ b/tests/unit/test-char.c
@@ -574,7 +574,7 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
     struct sockaddr_in other;
     SocketIdleData d = { 0, };
     Chardev *chr;
-    CharBackend *be;
+    CharBackend tmpbe, *be = &tmpbe;
     socklen_t alen = sizeof(other);
     int ret;
     char buf[10];
@@ -590,7 +590,6 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
         chr = qemu_chr_new("client", tmp, NULL);
         g_assert_nonnull(chr);
 
-        be = g_alloca(sizeof(CharBackend));
         qemu_chr_fe_init(be, chr, &error_abort);
     }
 
-- 
2.26.3


