Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F753FFEDF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:21:07 +0200 (CEST)
Received: from localhost ([::1]:54680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7Fp-0001m2-Sg
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73I-000699-Hv
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73F-0000nR-R2
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TAjmPmjyX5Sum8VvmviC+qTvvfAZSwR9odfcOrS4BTU=;
 b=fGWajPIQC9tuAdXAIqx+ktyRe3mBJ/NE7UDXeJOzEV2W7oTOcP3DN2u7mQlmwAtDEoMGoy
 C2shAeNZjmVfKhBt0khh1v6PaGc7EKtYyp4IMkrI3DSoSXVjBAV57sDh2W/bvNu00P4joG
 kh2pZcDdqHKRUCoGmq8bbqyFPreDm+g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-GzbssvOLNye_azlku01kfA-1; Fri, 03 Sep 2021 07:08:04 -0400
X-MC-Unique: GzbssvOLNye_azlku01kfA-1
Received: by mail-wr1-f71.google.com with SMTP id
 j1-20020adff541000000b001593715d384so1464089wrp.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TAjmPmjyX5Sum8VvmviC+qTvvfAZSwR9odfcOrS4BTU=;
 b=B5Ka6QMEJwApc2f6gBlynK//e+zrzCT1Ni7ND9r5rMNR2DcywQJvVaSGJEWpiR/yIQ
 Md5wdRWZibEo6U7v/SsYUI395KJmF2bFI9bdD2kbeLqEjGghNfin4D1eOdJ64cSAq5uh
 +M+ANkczdCZWOBJTCw+wx88g5DH6hSWWAahKlNSMcp+PD+3s8nfwNeFa5jVHAnBTvitk
 bmBODyaSJFog0zYKd8QYgs2hj2StULvAY2/d2YKabgO2HJkfaF6Qi0lua5dzg0VKhVNg
 SjxxpjR1okHYs9NBun139PB2LOjYV7MyhU1pnZ6RIAOK//iaqgHrKCJgels8K5cYXFjp
 FqZA==
X-Gm-Message-State: AOAM532T53V99BjjAu4Is3u1TvXgHKkqUH0i/8pzH5ItEJqY8hEAG4DC
 X1mvTtlwbHcFTL4stYpiELTJ4tuDCwX5SO7OEhmMcCfht7QLEJ51PB699KSY4mij/Mjh1qIvNue
 pQ5YKJ7yG3Bi/LBBjxC6ufCTZYuzP/1EVB2a8RnxyTQhMtfi8vv53dlliA6c+0djd
X-Received: by 2002:adf:e809:: with SMTP id o9mr3379850wrm.425.1630667282777; 
 Fri, 03 Sep 2021 04:08:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsmF09EK4NrKvycxeBcaS8cKieqRtT6B1h254T7rl6pFmdlrTvZWeo11IMse515sDwDeakbw==
X-Received: by 2002:adf:e809:: with SMTP id o9mr3379776wrm.425.1630667282465; 
 Fri, 03 Sep 2021 04:08:02 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 m1sm3842996wmq.10.2021.09.03.04.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:08:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/28] hw/core/machine: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:44 +0200
Message-Id: <20210903110702.588291-11-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/machine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 067f42b528f..0808a681360 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -615,8 +615,8 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
 
         cpu_item->type = g_strdup(machine->possible_cpus->cpus[i].type);
         cpu_item->vcpus_count = machine->possible_cpus->cpus[i].vcpus_count;
-        cpu_item->props = g_memdup(&machine->possible_cpus->cpus[i].props,
-                                   sizeof(*cpu_item->props));
+        cpu_item->props = g_memdup2_qemu(&machine->possible_cpus->cpus[i].props,
+                                         sizeof(*cpu_item->props));
 
         cpu = machine->possible_cpus->cpus[i].cpu;
         if (cpu) {
-- 
2.31.1


