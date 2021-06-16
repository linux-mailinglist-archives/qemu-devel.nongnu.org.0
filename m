Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB03AA5D2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:59:36 +0200 (CEST)
Received: from localhost ([::1]:47394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcdL-0000Xq-F9
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPP-0003Pt-Cd
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPL-0001IP-9h
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3bGf8QhwYTyqtZDoJsvakD6t0hbGYHq/YSQMhMqEONQ=;
 b=h2FNSbBKV3DvecB3kPaO+lyQTidI8OrnHFJbXMYg78QPCPpn08k1RvcVOtrOxGhEI7fF03
 Y+f5uLkAxeSeRPJiEVV7IBaXn1G0Qlzo3o1OVtnEOjeB0+8c0t7X9uvRBixiwYYcXyqLYq
 Ys7KEhVVOI3dvozwltClQ3hc4OK46+8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-UV-P0bgHM4uu_fic0UbFRw-1; Wed, 16 Jun 2021 16:45:05 -0400
X-MC-Unique: UV-P0bgHM4uu_fic0UbFRw-1
Received: by mail-wr1-f70.google.com with SMTP id
 y12-20020adffa4c0000b0290119c11bd29eso1880533wrr.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3bGf8QhwYTyqtZDoJsvakD6t0hbGYHq/YSQMhMqEONQ=;
 b=AwcPfaNCuam9NkOtvSOQ1gaA+XOsYGV+9/dY6DgKcpT8kqxDs4rbBVITUxaKFVNBlx
 iQLHd44l8YjTHoaa4lSRYV6bo6KuY9bA5fkUOT8If3BKYofVA3aHs8BszXz2MdoOMBBk
 eqUmTecP6vkW56FDgDjehZEiyhI+dBT+alGC3itIIUJsKxHj3PnPjbgWr2F+cdONC0Pp
 TOrhrFvUc94rYpCgaNQskNvNA08c0LdK2HS28Lse0U1sb6k1GYIjgcjhMNREumVW8pjn
 tuoHNFyzFjc1FQJi09TdKg9ETsYjsc+GthlOcTTfEi8pqfTwb76LNiGV4bWWZ7g7omSV
 P0nA==
X-Gm-Message-State: AOAM531lRAC4Ehv6XcfIsqfB20DnoGsqeSBpUqpZJwt1Db6KOWQT86Xx
 dy+MRJ+GsHByEqCnqz2x6AHFsytZlXzMk/ZIOJIUHTC6II7T1GTk1QVWZWdOZu1CsMIQejQfgCz
 AhP9bEm6KaYT46fJMO77hatrnZ2JB+fh54rVL3TE/sEcxoP8AhE6RA9N2qHGwLg1F
X-Received: by 2002:a5d:6409:: with SMTP id z9mr1113397wru.279.1623876303622; 
 Wed, 16 Jun 2021 13:45:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynwZXpcVLlZib7B8sx/BV0PpHR0qDK53qhbU9+sYtzFjcVbaZzc4WW1jr+vva0jaTmh1HbvQ==
X-Received: by 2002:a5d:6409:: with SMTP id z9mr1113354wru.279.1623876303416; 
 Wed, 16 Jun 2021 13:45:03 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x7sm3370919wre.8.2021.06.16.13.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:45:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/23] monitor: Restrict 'info sev' to x86 targets
Date: Wed, 16 Jun 2021 22:43:21 +0200
Message-Id: <20210616204328.2611406-17-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/monitor/hmp-target.h  | 1 +
 include/monitor/hmp.h         | 1 -
 target/i386/sev-sysemu-stub.c | 2 +-
 target/i386/sev.c             | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index 60fc92722ae..20adbea5154 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -49,5 +49,6 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict);
 void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
 void hmp_info_io_apic(Monitor *mon, const QDict *qdict);
+void hmp_info_sev(Monitor *mon, const QDict *qdict);
 
 #endif /* MONITOR_HMP_TARGET_H */
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 3baa1058e2c..6bc27639e01 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -124,7 +124,6 @@ void hmp_info_ramblock(Monitor *mon, const QDict *qdict);
 void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict);
 void hmp_info_vm_generation_id(Monitor *mon, const QDict *qdict);
 void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict);
-void hmp_info_sev(Monitor *mon, const QDict *qdict);
 void hmp_info_replay(Monitor *mon, const QDict *qdict);
 void hmp_replay_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index 7a35f0432b2..aba02f3c332 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "monitor/monitor.h"
-#include "monitor/hmp.h"
+#include "monitor/hmp-target.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/error.h"
diff --git a/target/i386/sev.c b/target/i386/sev.c
index faa3a4015c4..339564ad2c8 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -32,7 +32,7 @@
 #include "migration/blocker.h"
 #include "qom/object.h"
 #include "monitor/monitor.h"
-#include "monitor/hmp.h"
+#include "monitor/hmp-target.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qmp/qerror.h"
 #include "exec/confidential-guest-support.h"
-- 
2.31.1


