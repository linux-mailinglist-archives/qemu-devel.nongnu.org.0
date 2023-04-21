Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245276EA705
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:34:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn8y-00084M-0W; Fri, 21 Apr 2023 05:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn8w-00083M-57
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn8u-00031B-KF
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Xx/pVvAIRfBuk5iIu8CGp8nTrUflufmiH8BoDTBF0c=;
 b=G8Ooq8GrRlxG6mZURORfBiKf1yaGA32azGGHGskwzYB000uMcl0bKveR6o0PIjgeczDhny
 AH0eN0/YU8xbvZNEfHPJHbte9etqlQEh1G2eE/Zdz7dnCyHZmEr1+ISlTEq1t6j4a687VS
 Ej2yzezv+2vO/yQUv8meqrLXllDtpF8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-LU2jgpaBPhemLyStef21-Q-1; Fri, 21 Apr 2023 05:33:21 -0400
X-MC-Unique: LU2jgpaBPhemLyStef21-Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50489ad5860so1367924a12.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069600; x=1684661600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Xx/pVvAIRfBuk5iIu8CGp8nTrUflufmiH8BoDTBF0c=;
 b=IwkFl0IGUhPMy9OxtaAat/JE6idHX4HDgEfzWx/ilJtAZBID3mmt9XMGv/GgTuteMj
 rNrXSK0sMxlBHMFdJZs3hO4zbkT2Bth1T38zZbmHLB34I2Kc9HZ2Da23DJzj7lbr77Bx
 bUXEeuiVm5m4WxlkV9S4Pwm9XoH4BNikWZuS7wTEAtoDdcCIMoUWps3RZ8/n83klWg6F
 Y+isy784FTnT0IzjR4bxOtLKOIqhGKgk3k0t9hci2Qfi/tEykZjpi7aIYDcAnJAqEpRz
 gxdGoQcQFYbGJiKtT5uS+vOqt6Nh14wAUNed9xlFdjkxqSJ3nb64pNt8ba4dEdgjJKpe
 SO3A==
X-Gm-Message-State: AAQBX9etkje6hyQtxjL19AgAhtYImQohVLeIbHXbqhlgntTXbe7WuE72
 2iL7w20LgpQdgw9TsFZ0xQEcIifJRgcJXkxhonlToIlcqdTkb5aZz4i4FgYJI0t6cx2JR7zyKtG
 urAuxOPw/kb7KmyHcXC5fYp+YRPUkvyCMt+pSVdQPwBBurFAHU/Vk8il7ID6vji9wzJyvucnG2t
 xPXQ==
X-Received: by 2002:a05:6402:b34:b0:506:6008:995f with SMTP id
 bo20-20020a0564020b3400b005066008995fmr4303750edb.39.1682069600125; 
 Fri, 21 Apr 2023 02:33:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y8RJj0zlrNH1V776baByRX+hB/7cgLF1x4nTjkDpsYf7dS+nfWI2YRUHTkVd8ZyqzstxIFJA==
X-Received: by 2002:a05:6402:b34:b0:506:6008:995f with SMTP id
 bo20-20020a0564020b3400b005066008995fmr4303735edb.39.1682069599744; 
 Fri, 21 Apr 2023 02:33:19 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l22-20020aa7c3d6000000b00506be898998sm1650332edr.29.2023.04.21.02.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 02/25] build-sys: prevent meson from downloading wrapped
 subprojects
Date: Fri, 21 Apr 2023 11:32:53 +0200
Message-Id: <20230421093316.17941-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following patches are going to introduce meson wrap dependencies,
which is a solution to download and build missing dependencies.

The QEMU build-system would do network access with no way to avoid the
fallback. As a start, hardcode "--wrap-mode=nodownload" in configure, so
that wraps would be used only after a conscious decision of the user to
use "meson subprojects download" (before running configure).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230302131848.1527460-3-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 800b5850f402..6ed66ec6abda 100755
--- a/configure
+++ b/configure
@@ -2615,6 +2615,10 @@ if test "$skip_meson" = no; then
 
   rm -rf meson-private meson-info meson-logs
 
+  # Prevent meson from automatically downloading wrapped subprojects when missing.
+  # You can use 'meson subprojects download' before running configure.
+  meson_option_add "--wrap-mode=nodownload"
+
   # Built-in options
   test "$bindir" != "bin" && meson_option_add "-Dbindir=$bindir"
   test "$default_feature" = no && meson_option_add -Dauto_features=disabled
-- 
2.40.0


