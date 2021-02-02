Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE930CD8A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:04:25 +0100 (CET)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72qW-0006eh-3z
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72l0-0001u8-Fs
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:58:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72ky-0006kS-ME
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZPBR0BclVqF/rPEj/0RS+FyJc1foHcMXsjRFpfwuw0=;
 b=TAbf1CG5XPkvTn5HduL1TMY02RcQsCZzS6xMZkOsXEwM5yJK+sixe0+KN7oYRx2hX/GjKV
 farQ9gP7bqkTzsRHplwhve5nWymRj0Esc6b0+Von/Wax2D/ORrqvUPT1lUtg/c8viTTljH
 DCT10nz8znwlLfD5AKs8m/4AI/l8aGY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-s-brvUr7NXKxTb2CevJaYg-1; Tue, 02 Feb 2021 15:58:37 -0500
X-MC-Unique: s-brvUr7NXKxTb2CevJaYg-1
Received: by mail-ej1-f71.google.com with SMTP id hx26so4266253ejc.3
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PZPBR0BclVqF/rPEj/0RS+FyJc1foHcMXsjRFpfwuw0=;
 b=uYgcsRRtmrQWyMoL/EvpLJOQ3s+sjwlmtbweV9a7k6ecIbqupkWJrmtS5LCU2UCUHX
 NgdlntLQILvBhjPXzomHzr6cv+3+nsJHFYbmIVyOTt90Gp4oPIGhh9EqhQyluhI3UHqZ
 JXDgJFQu2PiwunJGzP9SvcD5LOtxkOPEpee+19kX8W1pqDVRRCgKaU0G6CgZM5FwEjyI
 tefOOYSky0QwjesHMglX2NUj6HvDoAYBV0uPocw9t2ULvuC1eQLOTtHo3TOMoAN1SLfH
 IwNLcGdhEtguC+G3fgraBugoBoF61jEtW3hKo+dG6cV8Zk4v/HyrtFfMpS62EjfP1WoA
 TktA==
X-Gm-Message-State: AOAM533VO9z9+q4Pqj1bqs8m08yUez1kJy+efP5CKEjuUBGiQgyWmEC+
 jQgZdbE0bovBN4CR/UGwQrU2UDpdyGVbxjZ4oG7NeQ/JXCAiyWpZqL0LRjJNN718IIL8leauYpk
 h1bkJKm/vVdr/5WRTH4w04D5a4rLJ/V1Z1b+O2gLdgVZLpFTU4besUShvaF2ccB4j
X-Received: by 2002:a17:907:1119:: with SMTP id
 qu25mr24016373ejb.268.1612299513691; 
 Tue, 02 Feb 2021 12:58:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymbmDOo6GPWGb/jU5IhVlxX6hUuAck3+KKDqahjKh8eC/XKSQkS73/g5CdNQVsl0N+em9GIw==
X-Received: by 2002:a17:907:1119:: with SMTP id
 qu25mr24016343ejb.268.1612299513347; 
 Tue, 02 Feb 2021 12:58:33 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id m20sm11070885edj.43.2021.02.02.12.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:58:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/12] ui: Replace the word 'whitelist'
Date: Tue,  2 Feb 2021 21:58:13 +0100
Message-Id: <20210202205824.1085853-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210202205824.1085853-1-philmd@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/console.c       | 2 +-
 ui/vnc-auth-sasl.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index d80ce7037c3..9e13bf9020f 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1661,7 +1661,7 @@ bool dpy_gfx_check_format(QemuConsole *con,
                 return false;
             }
         } else {
-            /* default is to whitelist native 32 bpp only */
+            /* default is to allow native 32 bpp only */
             if (format != qemu_default_pixman_format(32, true)) {
                 return false;
             }
diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
index f67111a3662..dde4b8d4144 100644
--- a/ui/vnc-auth-sasl.c
+++ b/ui/vnc-auth-sasl.c
@@ -288,7 +288,7 @@ static int protocol_client_auth_sasl_step(VncState *vs, uint8_t *data, size_t le
             goto authreject;
         }
 
-        /* Check username whitelist ACL */
+        /* Check username allowlist ACL */
         if (vnc_auth_sasl_check_access(vs) < 0) {
             goto authreject;
         }
@@ -409,7 +409,7 @@ static int protocol_client_auth_sasl_start(VncState *vs, uint8_t *data, size_t l
             goto authreject;
         }
 
-        /* Check username whitelist ACL */
+        /* Check username allowlist ACL */
         if (vnc_auth_sasl_check_access(vs) < 0) {
             goto authreject;
         }
-- 
2.26.2


