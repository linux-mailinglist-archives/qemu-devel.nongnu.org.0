Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2643D33A735
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 18:52:34 +0100 (CET)
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLUun-000677-5a
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 13:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLUsq-0004NB-RV
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:50:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLUso-0006f4-6J
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:50:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso18895354wme.0
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fdnCYcGz/rNz0f0M+8dUoADYZZ+wtTRYedFfAAe2jw=;
 b=EoSlSzUZRKpk0KkUjyGNHY6JwafYasrHT5nE3uhggImxbOcokch/uTAEqYrE8DG4Y8
 oahC++mVY58qPivkUEdwTmbdm8Lj3A1HZdyivA2Y5dKuaOhNwM+5YXUSt3WDCZYZQhI6
 Qp1y/jL+/RkEQVUutIBYS8v7+bz/01qAz1a4+JneEkq/l5KV7OwNMKgijSgqrAmzMf4k
 ZbfaVxzdudXD/SLLP6bYOKcgphB28A/8g2G//tezsZcJx1ZZb0xXFsFcM9nE35tsM1JA
 Vxjpgr3R7iWe5fmLsnxJYIs9FEnMRnKWA8hvPSRSTyj53Zh/WlzBfB0L5C0FW6mamwUa
 XvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2fdnCYcGz/rNz0f0M+8dUoADYZZ+wtTRYedFfAAe2jw=;
 b=o+zTk0FLtjZQzXPU0T8GtDtTNLRhy0gb5yviJ4ktQ19OHJIxpcMqGm9j+GdWGuiEWS
 mbYmf4vRs4KTNAahbGiRq7C/vqXmS1W1zzkbbqopVxUMHVqTrbJL78tLm0ZUSI4/PYKu
 QStAh8g1FK4a+3J2vy+eT55Mzr7XJQTSZn75nGW6wtMbsgPIzW2WXHqUC9E4kPiHhmNe
 d9Io7PNyhnM/6yVdm9tej/t20Ibm16B8n69QFk4NV2V4F3JM85kNw4HdimZpRwNGWVoB
 5RvMp3xxszqFx0tWFNRJ/kTr1I/yHCpSvYtgNL1xW2vVnnr3950zgTwEy0oh+NFLWiEa
 sDaQ==
X-Gm-Message-State: AOAM531J+OOATnG3b65RjLDKAhCDKOxQ2W+ji3h0fbID0lF4uiWUP875
 dkTALjqdk5SRqMcJN1m0CiHJNUxvsRs=
X-Google-Smtp-Source: ABdhPJykB1uj1yAqZbuPXVm6I6loO3r0r3KOXxR8tOgyeiWT27GfWmzSHFT7vvxFKwLusxZEu4e8iA==
X-Received: by 2002:a7b:c087:: with SMTP id r7mr22673119wmh.110.1615744228944; 
 Sun, 14 Mar 2021 10:50:28 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a6sm11442749wmm.0.2021.03.14.10.50.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:50:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] meson: bump submodule to 0.57.1
Date: Sun, 14 Mar 2021 18:50:23 +0100
Message-Id: <20210314175025.114723-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210314175025.114723-1-pbonzini@redhat.com>
References: <20210314175025.114723-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main advantage of 0.57 is that it fixes
https://github.com/mesonbuild/meson/pull/7900, thus avoiding unnecessary
rebuilds after running meson.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson b/meson
index 776acd2a80..7182685b22 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit 776acd2a805c9b42b4f0375150977df42130317f
+Subproject commit 7182685b2241e88340b6c3340afba59a26be213f
-- 
2.29.2



