Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85306653144
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:05:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ymC-0004F6-30; Wed, 21 Dec 2022 08:04:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ym9-0004C4-Gb
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ym7-0003wg-K5
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlANOX9JMi83mA8OVFzuJKebnNhfltbLO4qI4F4bqwQ=;
 b=Evk86vth+W0/aa8lMByl2XwqzpTh/zcxTKcpd+lr21Tu4ETnwLkEOOtpwZzbhxxWztUF6M
 V6fjGRep7Td74xywjUTQ5pFqxHhIWI9vokfHWluiNQi4c0Zr6P/jmBb8hRTG+CBrR7oGQC
 lcHyUxeBymRiUsuD79/GIXIuRAhwSa4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315--CsmcQmtPgqVYkF-jiyIGg-1; Wed, 21 Dec 2022 08:04:45 -0500
X-MC-Unique: -CsmcQmtPgqVYkF-jiyIGg-1
Received: by mail-wm1-f72.google.com with SMTP id
 21-20020a05600c021500b003d227b209e1so671813wmi.1
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:04:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SlANOX9JMi83mA8OVFzuJKebnNhfltbLO4qI4F4bqwQ=;
 b=TSbwzQVvhO7KiguhrO6geNYGCfvWjizzvjyMKvj5yOEfdZUhkLg4pnHImORideBTDF
 +MytYpjdM0plaE9GuKR9+WabWry2wBhJVCgbyQH/+gfOnVAXklyqxHYuwHh8gUfgERi8
 ASqiBJxDKJ2Ktdih+UmKfewXpe8I9BTrUv9jsiir5cfjQhXg9/wHtR+qlmWeX2RlNiJg
 tvIzFUXLOZKVgodGuvukRDwMflmFheBZ7TzXmQTqwiNFD8uAaUjNPYgoaEoNFnKpabke
 nf/z6U1J5QMq3d4a8FqUbUa/JnLHM60MBuaM/N+iTCfw6owhfYXu9HvrdkF06QAUx9qj
 rznA==
X-Gm-Message-State: AFqh2krKFnDti3ZnyATjiSil5dI/8VW2386Y/LFvj1D0PA1G8bfCLGID
 TlQzaufIhnvtSooexhGt+T4E8rgLlGYHUCtIvJ6yHr7l7VeNnMx6yotnjwrNHtHuotqYf/jOQ/J
 kQZybASVfTdByjvFPgvHfIeTnLH69VVqR0cmIDiGpaTDW0HDpaaYRY4fVOTrH
X-Received: by 2002:a05:600c:1603:b0:3d1:c895:930c with SMTP id
 m3-20020a05600c160300b003d1c895930cmr1646169wmn.35.1671627883057; 
 Wed, 21 Dec 2022 05:04:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtlcC3cQJDcp9OGiF4QnaE/nt4/CPQK3E2/YAPPwLmB95lI3Bxlwe5FJMQ7vtQwe4x1tQXFYg==
X-Received: by 2002:a05:600c:1603:b0:3d1:c895:930c with SMTP id
 m3-20020a05600c160300b003d1c895930cmr1646145wmn.35.1671627882758; 
 Wed, 21 Dec 2022 05:04:42 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b003c5571c27a1sm3432673wms.32.2022.12.21.05.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:04:41 -0800 (PST)
Date: Wed, 21 Dec 2022 08:04:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 06/41] hw/isa: enable TCO watchdog reboot pin strap by default
Message-ID: <20221221130339.1234592-7-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

The TCO watchdog implementation default behaviour from POV of the
guest OS relies on the initial values for two I/O ports:

  * TCO1_CNT == 0x0

    Since bit 11 (TCO Timer Halt) is clear, the watchdog state
    is considered to be initially running

  * GCS == 0x20

    Since bit 5 (No Reboot) is set, the watchdog will not trigger
    when the timer expires

This is a safe default, because the No Reboot bit will prevent the
watchdog from triggering if the guest OS is unaware of its existance,
or is slow in configuring it. When a Linux guest initializes the TCO
watchdog, it will attempt to clear the "No Reboot" flag, and read the
value back. If the clear was honoured, the driver will treat this as
an indicator that the watchdog is functional and create the guest
watchdog device.

QEMU implements a second "no reboot" flag, however, via pin straps
which overrides the behaviour of the guest controlled "no reboot"
flag:

  commit 5add35bec1e249bb5345a47008c8f298d4760be4
  Author: Paulo Alcantara <pcacjr@gmail.com>
  Date:   Sun Jun 28 14:58:58 2015 -0300

    ich9: implement strap SPKR pin logic

This second 'noreboot' pin was defaulted to high, which also inhibits
triggering of the requested watchdog actions, unless QEMU is launched
with the magic flag "-global ICH9-LPC.noreboot=false".

This is a bad default as we are exposing a watchdog to every guest OS
using the q35 machine type, but preventing it from actually doing what
it is designed to do. What is worse is that the guest OS and its apps
have no way to know that the watchdog is never going to fire, due to
this second 'noreboot' pin.

If a guest OS had no watchdog device at all, then apps whose operation
and/or data integrity relies on a watchdog can refuse to launch, and
alert the administrator of the problematic deployment. With Q35 machines
unconditionally exposing a watchdog though, apps will think their
deployment is correct but in fact have no protection at all.

This patch flips the default of the second 'no reboot' flag, so that
configured watchdog actions will be honoured out of the box for the
7.2 Q35 machine type onwards, if the guest enables use of the watchdog.

See also related bug reports

  https://bugzilla.redhat.com/show_bug.cgi?id=2080207
  https://bugzilla.redhat.com/show_bug.cgi?id=2136889
  https://bugzilla.redhat.com/show_bug.cgi?id=2137346

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221216125749.596075-5-berrange@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c           | 4 +++-
 hw/isa/lpc_ich9.c      | 2 +-
 tests/qtest/tco-test.c | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d6c1d31c28..d489ecc0d1 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -107,7 +107,9 @@
     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
 
-GlobalProperty pc_compat_7_2[] = {};
+GlobalProperty pc_compat_7_2[] = {
+    { "ICH9-LPC", "noreboot", "true" },
+};
 const size_t pc_compat_7_2_len = G_N_ELEMENTS(pc_compat_7_2);
 
 GlobalProperty pc_compat_7_1[] = {};
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index cea73924b4..8d541e2b54 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -792,7 +792,7 @@ static const VMStateDescription vmstate_ich9_lpc = {
 };
 
 static Property ich9_lpc_properties[] = {
-    DEFINE_PROP_BOOL("noreboot", ICH9LPCState, pin_strap.spkr_hi, true),
+    DEFINE_PROP_BOOL("noreboot", ICH9LPCState, pin_strap.spkr_hi, false),
     DEFINE_PROP_BOOL("smm-compat", ICH9LPCState, pm.smm_compat, false),
     DEFINE_PROP_BIT64("x-smi-broadcast", ICH9LPCState, smi_host_features,
                       ICH9_LPC_SMI_F_BROADCAST_BIT, true),
diff --git a/tests/qtest/tco-test.c b/tests/qtest/tco-test.c
index 254f735370..caabcac6e5 100644
--- a/tests/qtest/tco-test.c
+++ b/tests/qtest/tco-test.c
@@ -60,7 +60,7 @@ static void test_init(TestData *d)
     QTestState *qs;
 
     qs = qtest_initf("-machine q35 %s %s",
-                     d->noreboot ? "" : "-global ICH9-LPC.noreboot=false",
+                     d->noreboot ? "-global ICH9-LPC.noreboot=true" : "",
                      !d->args ? "" : d->args);
     qtest_irq_intercept_in(qs, "ioapic");
 
-- 
MST


