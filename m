Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C02C146C85
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 16:20:47 +0100 (CET)
Received: from localhost ([::1]:59150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iueHl-0000zI-Vf
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 10:20:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iucrK-0004uH-He
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iucrJ-0003HX-Et
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:22 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37952)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iucrJ-0003H7-94
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:21 -0500
Received: by mail-wm1-x32d.google.com with SMTP id u2so2611658wmc.3
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 05:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hpoGYi5O9+KNRZJsn5fTTGDu/AscfeXtzSOUj6qEzek=;
 b=hVcijICKzjqCe6ZhEycjOdNgtjiU9mA344y0TdyHJm06ky9xW57HmDs6BFB7hWRX3p
 mtcf3V0Wo9J7eKiYxC4tw41WGUOGuvPeAHBrQG908Ki7GfHpYfrnZMr5Rq9zniAzAOuK
 Qu5co+se3NMTb7qnNlmaH9Hxuz4HbZm1xFgL0txL6JbL0XkgCB/CFylsKb9AIlusN6Tt
 qvdTzJjSYC603JgrWA4QLsAE06pRwnd66eDipLtsgRz3W0/vF7mYjw6IsZGYjsJpgzFD
 y5tWhx7vmtpqSXba0+tThm9fPxzUOZhZaraNqamMax152NMq4f3EtUOPaQc42REqZynb
 EkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hpoGYi5O9+KNRZJsn5fTTGDu/AscfeXtzSOUj6qEzek=;
 b=IX/pm+QJTAna9XyQF96rR7XOsfKNjr9dygirl+IE4GJzzAPA3k9953xT/L532nU6pH
 BlehCLwlWL8BiLQQ8HA3mr8Vn8kLrNAnz3lQ+SgLBBdahedzHLRTeLR5T3g1I56bhBkE
 oDoEi4GTS33T7VoGymIN4jDsLxFTQGynsnwGmvOkVxZKQYJuSF0GM4DytElk4xEh/Bb/
 65+q7heF+2lCnGl4k3zVObyKlqqsqEGM0Wc99sB7S7Jz3I3zacvD9QxTs7LSDr85FJgP
 BHALQ8DyhxNbAHoWwRnyu9qVJkQzBDXeaV6D9XyldUN4oBinmsoEIXUkPCZZ0pygIqTg
 6Fww==
X-Gm-Message-State: APjAAAVEs2XzD67hyY+60bLjIzNENyOo5ScoDejJbtnUVFjzpg44Bx0t
 nW8e6fTvv5aod/3n2QEEUMl0Tu5q
X-Google-Smtp-Source: APXvYqzpEmuGgAow/N80AGi6PY/Ef9hFHOWm6ctUz8SwFO1Yo3n/hhbpjAwd/z56eMN8SplWx8HYWA==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr3416710wmi.116.1579787360128; 
 Thu, 23 Jan 2020 05:49:20 -0800 (PST)
Received: from 640k.localdomain.com ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id s15sm3073171wrp.4.2020.01.23.05.49.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jan 2020 05:49:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/59] Makefile: Remove unhelpful comment
Date: Thu, 23 Jan 2020 14:48:18 +0100
Message-Id: <1579787342-27146-16-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579787342-27146-1-git-send-email-pbonzini@redhat.com>
References: <1579787342-27146-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32d
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

It is pointless to keep qapi/ object separate from the other
common-objects. Drop the comment.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200118140619.26333-5-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.objs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile.objs b/Makefile.objs
index 395dd1e..c6321d0 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -71,11 +71,9 @@ qemu-seccomp.o-libs := $(SECCOMP_LIBS)
 
 common-obj-$(CONFIG_FDT) += device_tree.o
 
-######################################################################
-# qapi
-
 common-obj-y += qapi/
-endif
+
+endif # CONFIG_SOFTMMU
 
 #######################################################################
 # Target-independent parts used in system and user emulation
-- 
1.8.3.1



