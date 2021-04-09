Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B3A35A7D0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 22:27:03 +0200 (CEST)
Received: from localhost ([::1]:50278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUxiY-00038Z-1c
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 16:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lUxec-0008WO-UK
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:22:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lUxeb-0004BM-8u
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:22:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617999776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A831zHdvpuQd0VH2Tp3eQkFBYyVatf0BAWnK+8L2BNA=;
 b=AuTBFNk+/PHhQodcMwrrQ1VlvMv4FQsTwcOYA6wSp7nTBq9KAv1NPuVuLBlG7RojV18L/7
 cU+hsrQnpd6OH0kJH4J/VNVDqAejVaEA4W9//iO1j0CABC8x8pbXj/1D53dGcrQpWwgqwe
 S5T24MCWGo2Wq/7p+YzH/5HYNdv6sXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-BjolE5WMMvuo7ykW875xQA-1; Fri, 09 Apr 2021 16:22:54 -0400
X-MC-Unique: BjolE5WMMvuo7ykW875xQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A83018B614E;
 Fri,  9 Apr 2021 20:22:53 +0000 (UTC)
Received: from localhost (ovpn-118-57.rdu2.redhat.com [10.10.118.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24C2E60916;
 Fri,  9 Apr 2021 20:22:53 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/2] cpu/core: Fix "help" of CPU core device types
Date: Fri,  9 Apr 2021 16:22:46 -0400
Message-Id: <20210409202246.1857179-3-ehabkost@redhat.com>
In-Reply-To: <20210409202246.1857179-1-ehabkost@redhat.com>
References: <20210409202246.1857179-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Calling qdev_get_machine() from a QOM instance_init function is
fragile because we can't be sure the machine object actually
exists. And this happens to break when passing ",help" on the
command line to get the list of properties for a CPU core
device types :

$ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
qemu-system-ppc64: ../../hw/core/machine.c:1290:
 qdev_get_machine: Assertion `machine != NULL' failed.
Aborted (core dumped)

This used to work before QEMU 5.0, but commit 3df261b6676b
unwillingly introduced a subtle regression : the above command
line needs to create an instance but the instance_init function
of the base class calls qdev_get_machine() before
qemu_create_machine() has been called, which is a programming bug.

Use current_machine instead. It is okay to skip the setting of
nr_thread in this case since only its type is displayed.

Fixes: 3df261b6676b ("softmmu/vl.c: Handle '-cpu help' and '-device help' before 'no default machine'")
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
Cc: peter.maydell@linaro.org
Message-Id: <20210409160339.500167-3-groug@kaod.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/cpu/core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/cpu/core.c b/hw/cpu/core.c
index 92d3b2fbad6..98760751557 100644
--- a/hw/cpu/core.c
+++ b/hw/cpu/core.c
@@ -66,10 +66,16 @@ static void core_prop_set_nr_threads(Object *obj, Visitor *v, const char *name,
 
 static void cpu_core_instance_init(Object *obj)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
     CPUCore *core = CPU_CORE(obj);
 
-    core->nr_threads = ms->smp.threads;
+    /*
+     * Only '-device something-cpu-core,help' can get us there before
+     * the machine has been created. We don't care to set nr_threads
+     * in this case since it isn't used afterwards.
+     */
+    if (current_machine) {
+        core->nr_threads = current_machine->smp.threads;
+    }
 }
 
 static void cpu_core_class_init(ObjectClass *oc, void *data)
-- 
2.30.2


