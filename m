Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31123C1728
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:37:09 +0200 (CEST)
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1X1Q-0007bY-OI
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1WPN-0000AF-HE
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:57:49 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1WPM-0003sf-4e
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:57:49 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so19953975wmq.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AVBd6spZ7fw4kaVvQG3qsp8Plx9DJjjD5N8xcoUpOxY=;
 b=GbxxSOQlSGV7JGG66/hte8dg3IypUdefZKf5TWUO9vLagrBFr8yio6m/8dY6iHRMUT
 w/MVtn39nNH8qFIhIjg6n5LBrZLgHroP97hEp7jARlj4OZFjrz0ABqHn3iXZc5hzVveZ
 6lNceJSpR3tno7xJ1OTOTp2UcefCPDHqJwX88C0u3Ch5xSDxB7fAyUE8EaAbEJjw2u43
 xa+55iNtnicvNcm8XIvJPDCPFyzzgR5VIDpM9ecCTEWZZWd457jnuIUZJuWkTMZcnL8q
 Wn+lMwI1/KXQLLK3r7IxrcknSUetweBZBDhJx/2rI+71GpijtgAhUhjnM8MmtLiCzBaA
 YifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AVBd6spZ7fw4kaVvQG3qsp8Plx9DJjjD5N8xcoUpOxY=;
 b=DGTupaY8VevC1luHAUVwrgwemOPfTs16P96v8K+mz9Eahggg/t3uPCaiCxNI1srDhl
 BFhEXqoC0KMsf2AErci+FEnXCq4lycGW+CsGDt2DrjFXyAF7SKjT63obYXvxKj6xc4Te
 3xa8l5v+2d6DG9GUhYuePJHOjscQ4Cjsltu4LRPCP19GbmQxxpVbUo8dqRyXy7luUJDN
 kTZAYhahYfGJE+Luu8MyGQ5wMlPEciCT2YO/MN8+AvNjxocxI976PP2yYYDJwQ+FX3tg
 TE21aSm33p0q1UrKLXjEobEWZ+OvgiOYYzwkzFp8aTzjIq0LyLWmVqJda1c19OuBwNpo
 D8Ig==
X-Gm-Message-State: AOAM531oO2Zo1AxtwXZRQlGDrH7NsX+YEzpN2zipuC6jmQ0lcMIXhSFJ
 0ETYF2u8MHMdjNLBohnFdbrZGQqzH+4=
X-Google-Smtp-Source: ABdhPJwDIxz9CqbqPelx4SfrUeRKDr7uSiHD9/ZM+ljKoW4TDuSMV4w6rFBAL2hE2D3ErzYlkpyGjw==
X-Received: by 2002:a7b:c0c1:: with SMTP id s1mr31637553wmh.70.1625759866492; 
 Thu, 08 Jul 2021 08:57:46 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r15sm9247912wmq.15.2021.07.08.08.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:57:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] coverity-scan: Add 'sysemu' component
Date: Thu,  8 Jul 2021 17:57:35 +0200
Message-Id: <20210708155735.1805767-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708155735.1805767-1-f4bug@amsat.org>
References: <20210708155735.1805767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Issues related to system emulation currently appear under the 'tcg'
component. We commonly refer to system emulation as 'sysemu', so
add it as a new Coverity component to cover files that have nothing
to do with TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/coverity-scan/COMPONENTS.md | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index a6f4b9a2fb1..c388b41b421 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -121,7 +121,7 @@ kvm
   ~ (/qemu)?(.*/kvm.*)
 
 tcg
-  ~ (/qemu)?(/accel/tcg/.*|/replay/.*|/(.*/)?softmmu.*)
+  ~ (/qemu)?(/accel/tcg/.*|/replay/.*|tcg/*\.?)
 
 xen
   ~ (/qemu)?(.*/xen.*)
@@ -138,6 +138,9 @@ usb
 user
   ~ (/qemu)?(/linux-user/.*|/bsd-user/.*|/user-exec\.c|/thunk\.c|/include/exec/user/.*)
 
+sysemu
+  ~ (/qemu)?(/softmmu/.*|/accel/.*)
+
 util
   ~ (/qemu)?(/util/.*|/include/qemu/.*)
 
-- 
2.31.1


