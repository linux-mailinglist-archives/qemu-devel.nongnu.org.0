Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE6E1F1D3B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 18:26:25 +0200 (CEST)
Received: from localhost ([::1]:38058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiKbQ-0005sF-I1
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 12:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFJ-0007SB-2E
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:03:33 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53610
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFG-0008AO-Gf
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
 b=O+2xDPsPJH1jiXin8V8D0SXVvB/V0YB5Tyh/FbitQfqIr9Y+KMe6lcW0pwpKcteAPVonF9
 qGOuMcRtZ/AzgkUi1C8StCUvlusTtGqkHBGffu1yZQf9EKrIlPFm4jjQCn3VQgvPMOK7X4
 nvWazC4pCzVgcrXCLSZF2rp0hQ6Cmvg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-g7CCi_N7NGSTYj8JEToMxQ-1; Mon, 08 Jun 2020 12:03:19 -0400
X-MC-Unique: g7CCi_N7NGSTYj8JEToMxQ-1
Received: by mail-wm1-f72.google.com with SMTP id y15so13925wmi.0
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 09:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
 b=T41OFDKKJKnCpmjZYe4WlHbehetqxPRhNxj556uSGIaju3Tb79oxcQPPMwEVeohweM
 QC+JWyofHNpSXCieKLTqv1wcyP56Izw0T4U0aRcrP6U9ZV0DQaaLEd2/kGw3PN59/kRe
 tewFRksbezymFuRhvvJ4Ck+AuVPVqSWgDl4bscD5WSyAobtBtMmRqnDCoS3qIBV7zzUn
 gc9E0Wh+65OitZVbi8ZZf6/FXL+HozQCr7oCGiTg1Etzs505IU4hO4prb0xjnfQgfAo1
 WG5NzKOtgCKZmWp/40o5z6sZ6BKbY08f+4wBrIA5cO35GAzpefNEm9ToGawO4qcMPGiQ
 TjiQ==
X-Gm-Message-State: AOAM5322GzqAao1Eq0afzgZUfz2a2Lg/DxaU1UJEmrCFluPi+fB2ovVU
 H0HxzJfafYqANYWkplJWtWwMwcE8AFwTRNkS950V950gFxxnX1c7ZJB5nPK8rWwVkiyqG8JLEg8
 6tdRWYnljVeFkvLw=
X-Received: by 2002:a05:600c:4410:: with SMTP id
 u16mr73274wmn.88.1591632196837; 
 Mon, 08 Jun 2020 09:03:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3xkvh2Vk+4PYCBSKCv2fZwGK7MNY+4FcnyFPW+oUbVotWO8gdASoKL+nfN+0YxJIIGJ7I2g==
X-Received: by 2002:a05:600c:4410:: with SMTP id
 u16mr73234wmn.88.1591632196640; 
 Mon, 08 Jun 2020 09:03:16 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id l17sm32396wmi.16.2020.06.08.09.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 26/35] hw/openrisc/cputimer: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:35 +0200
Message-Id: <20200608160044.15531-27-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/openrisc/cputimer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
index 93268815d8..60f2c9667f 100644
--- a/hw/openrisc/cputimer.c
+++ b/hw/openrisc/cputimer.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
+#include "hw/qdev-deprecated.h"
 
 #define TIMER_PERIOD 50 /* 50 ns period for 20 MHz timer */
 
@@ -135,6 +136,8 @@ static const VMStateDescription vmstate_or1k_timer = {
 
 void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
 {
+    qdev_warn_deprecated_function_used();
+
     cpu->env.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &openrisc_timer_cb, cpu);
     cpu->env.ttmr = 0x00000000;
 
-- 
2.21.3


