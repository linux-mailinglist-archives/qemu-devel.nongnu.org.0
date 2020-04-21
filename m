Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1341B279F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Apr 2020 15:24:34 +0200 (CEST)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQst7-0007bE-Er
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 09:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48532)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQsoh-0001Qk-6k
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 09:20:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQsog-0007sB-5I
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 09:19:58 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42063
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jQsoe-0007px-NV
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 09:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587475196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pU9wiDrqb1FbUODn1z0R5OZvX82oaKZlJ+qXZZecY0U=;
 b=UjttNA5JE4WsRwj3ywUDZc2Pz+325cotcMVNFGmrIcTRLL/buJh8OETAPiNMMeXl7PP+Ce
 86uysHToH+nBiZ1cz8PHSg5sRp5O6U+2BBBvqTlcavDKonyyn7yUYi2kWmJ17ZpDbrjb5V
 EviFvPkqa26/70Xo+IRHJDvgBrotEeg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-cv26NbiHMpWrg9RP8jQbmg-1; Tue, 21 Apr 2020 09:19:54 -0400
X-MC-Unique: cv26NbiHMpWrg9RP8jQbmg-1
Received: by mail-wm1-f71.google.com with SMTP id l21so1443584wmh.2
 for <qemu-devel@nongnu.org>; Tue, 21 Apr 2020 06:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zqzb/pshEzW1fPo5MmdJgyS/wpMg+nvvsoa+3p+thQ0=;
 b=ekjQ3M7iKWg4bLD1vzkq6VzqVtWHWqbqBFdA4wZz3391Hg69eG6m8gtbJuFfuVUdbP
 zJpWw6duQY92jLoU5V9ocuQvyQ8woyIAFUzadI2kVQ0Db39HFIc50x67U9us/BQ/gCyX
 CxTQAhhCFAexlTDoi85yCObJHJh/gUYNGOBessePaC6DkGk8roZzDmJblHORP1OzrPhB
 1W48mc4YJbk14gUfRpTYMlmZ6WRhKypw+pQhrT/GEF8zVL6fAw1sFOp6vhSNk+bbSjwJ
 ElhWrdmVc/hguek6I4IDZ35qvIZkP3JWXD3GJ703688JVd7I7hDxwXQX4nnvhouTreMA
 xgJg==
X-Gm-Message-State: AGi0PubipywO28iiZiEORgKXgKlUWhdvcHs7XGFjo1WUBzSCJe6og5mo
 Lcldilcyq8VwM7i+p1qYHDUykz+q7TWl6WTCPfLQvDpDSNDr0fMKjEyilWkHZYetexTdlKYRMV5
 Qkcbqkv9ocDpqSB0=
X-Received: by 2002:adf:e282:: with SMTP id v2mr24137576wri.329.1587475193001; 
 Tue, 21 Apr 2020 06:19:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypJi8RM6ZFcZImP1v+szj5GX0ylJ5Ta9bTGS/vimyu/dAjz0CEoRCbjwXiMnWKdnATOybQwPIQ==
X-Received: by 2002:adf:e282:: with SMTP id v2mr24137559wri.329.1587475192830; 
 Tue, 21 Apr 2020 06:19:52 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id y10sm3395269wma.5.2020.04.21.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:19:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] target/arm/cpu: Update coding style to make checkpatch.pl
 happy
Date: Tue, 21 Apr 2020 15:19:25 +0200
Message-Id: <20200421131926.12116-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200421131926.12116-1-philmd@redhat.com>
References: <20200421131926.12116-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 01:28:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will move this code in the next commit. Clean it up
first to avoid checkpatch.pl errors.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9023d9e2cf..1ddf850f00 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -582,7 +582,8 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, in=
t interrupt_request)
     CPUARMState *env =3D &cpu->env;
     bool ret =3D false;
=20
-    /* ARMv7-M interrupt masking works differently than -A or -R.
+    /*
+     * ARMv7-M interrupt masking works differently than -A or -R.
      * There is no FIQ/IRQ distinction. Instead of I and F bits
      * masking FIQ and IRQ interrupts, an exception is taken only
      * if it is higher priority than the current execution priority
@@ -1902,7 +1903,8 @@ static void arm1026_initfn(Object *obj)
 static void arm1136_r2_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
-    /* What qemu calls "arm1136_r2" is actually the 1136 r0p2, ie an
+    /*
+     * What qemu calls "arm1136_r2" is actually the 1136 r0p2, ie an
      * older core than plain "arm1136". In particular this does not
      * have the v6K features.
      * These ID register values are correct for 1136 but may be wrong
@@ -2688,7 +2690,8 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "arm926",      .initfn =3D arm926_initfn },
     { .name =3D "arm946",      .initfn =3D arm946_initfn },
     { .name =3D "arm1026",     .initfn =3D arm1026_initfn },
-    /* What QEMU calls "arm1136-r2" is actually the 1136 r0p2, i.e. an
+    /*
+     * What QEMU calls "arm1136-r2" is actually the 1136 r0p2, i.e. an
      * older core than plain "arm1136". In particular this does not
      * have the v6K features.
      */
--=20
2.21.1


