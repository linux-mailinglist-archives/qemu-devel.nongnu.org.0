Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8BC1E1D4F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 10:28:34 +0200 (CEST)
Received: from localhost ([::1]:55336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdUwp-0006qU-PN
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 04:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1jdUuJ-00042l-O6
 for qemu-devel@nongnu.org; Tue, 26 May 2020 04:25:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40754
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1jdUuD-00088t-W4
 for qemu-devel@nongnu.org; Tue, 26 May 2020 04:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590481548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gg8u3jfNGlAp6Pm3pR9gWcirTRp9uOmSlHy7B7fFrJI=;
 b=hhRpHjwTKl1CmF8ysQd21IW9xVeqVMNJfGtJu/3ffWiCYIBvbgppmoP215Alcvq3CiZKjG
 G6595t96pmNcOJXsCZpNGj0dr2LfiVYoJZe12O/jfb5/ZrNK9+laxfI0TkNtJX8g/GvGEw
 Y5yKctRXb6kUJY5Np1x59oHKuNQdH/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-UBFkiSNROqaNVTSplV7C7Q-1; Tue, 26 May 2020 04:25:47 -0400
X-MC-Unique: UBFkiSNROqaNVTSplV7C7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 518E080183C
 for <qemu-devel@nongnu.org>; Tue, 26 May 2020 08:25:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41B8710013D2;
 Tue, 26 May 2020 08:25:45 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] qmp: Expose MachineClass::default_ram_id
Date: Tue, 26 May 2020 10:25:35 +0200
Message-Id: <9384422f63fe594a54d801f9cb4539b1d2ce9b67.1590481402.git.mprivozn@redhat.com>
In-Reply-To: <cover.1590481402.git.mprivozn@redhat.com>
References: <cover.1590481402.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 01:19:28
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
Cc: imammedo@redhat.com, ehabkost@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a management application (like Libvirt) want's to preserve
migration ability and switch to '-machine memory-backend' it
needs to set exactly the same RAM id as QEMU would. Since the id
is machine type dependant, expose it under 'query-machines'
result. Some machine types don't have the attribute set (riscv
family for example), therefore the QMP attribute must be
optional.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 4 ++++
 qapi/machine.json          | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 2c5da8413d..3e11a740c9 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -238,6 +238,10 @@ MachineInfoList *qmp_query_machines(Error **errp)
             info->default_cpu_type = g_strdup(mc->default_cpu_type);
             info->has_default_cpu_type = true;
         }
+        if (mc->default_ram_id) {
+            info->default_ram_id = g_strdup(mc->default_ram_id);
+            info->has_default_ram_id = true;
+        }
 
         entry = g_malloc0(sizeof(*entry));
         entry->value = info;
diff --git a/qapi/machine.json b/qapi/machine.json
index 39caa1d914..76c1606390 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -355,13 +355,16 @@
 # @default-cpu-type: default CPU model typename if none is requested via
 #                    the -cpu argument. (since 4.2)
 #
+# @default-ram-id: the default ID of initial RAM memory backend (since 5.1)
+#
 # Since: 1.2.0
 ##
 { 'struct': 'MachineInfo',
   'data': { 'name': 'str', '*alias': 'str',
             '*is-default': 'bool', 'cpu-max': 'int',
             'hotpluggable-cpus': 'bool',  'numa-mem-supported': 'bool',
-            'deprecated': 'bool', '*default-cpu-type': 'str' } }
+            'deprecated': 'bool', '*default-cpu-type': 'str',
+            '*default-ram-id': 'str' } }
 
 ##
 # @query-machines:
-- 
2.26.2


