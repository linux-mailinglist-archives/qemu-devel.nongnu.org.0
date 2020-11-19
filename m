Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CC02B8DD3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 09:47:29 +0100 (CET)
Received: from localhost ([::1]:57150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kffbE-0007Nf-W6
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 03:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kffYs-0005b8-Py
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:45:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kffYq-0002J5-Fe
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605775498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgm9/Wh2v6g9XHdSsnWHg1DIjBCmoO18JttBQTXYSUk=;
 b=Iq5f5SYdWTj+3mi1m45DwdL4nhKk5qjSFMereisI58vI/sEARVCsn8yBgscQ8N+SO9bJyz
 Fpu4KnlEUdvWHelsHGYV7UXwZMU4ZemWbJSALxFhoHSlbdXYgSfztvxioiK88fOKDocbCJ
 8b2O2GRqMF7S7yGCrUrrqCKkQaVUPyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-lXixgMxjNA6usX8O4B7eZA-1; Thu, 19 Nov 2020 03:44:55 -0500
X-MC-Unique: lXixgMxjNA6usX8O4B7eZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E72E61074667
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:44:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BA3419728;
 Thu, 19 Nov 2020 08:44:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 383C09D99; Thu, 19 Nov 2020 09:44:48 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] [broken] meson: try link tracepoints to module
Date: Thu, 19 Nov 2020 09:44:48 +0100
Message-Id: <20201119084448.24397-5-kraxel@redhat.com>
In-Reply-To: <20201119084448.24397-1-kraxel@redhat.com>
References: <20201119084448.24397-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add source set to trace_events_config, use it in trace/meson.build
so the trace objects are linked to the module not core qemu.

Not working as intended.
/me looks puzzled.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/meson.build | 1 +
 trace/meson.build      | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/display/meson.build b/hw/display/meson.build
index c2fc36e19d3e..94e355ac1e81 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -46,6 +46,7 @@ if config_all_devices.has_key('CONFIG_QXL')
   trace_events_config += {
     'file'  : meson.source_root() / 'hw' / 'display' / 'trace-events-qxl',
     'group' : 'hw_display_qxl',
+    'ss'    : qxl_ss,
   }
   hw_display_modules += {'qxl': qxl_ss}
 endif
diff --git a/trace/meson.build b/trace/meson.build
index 66395d3e2ba7..3f0fe7b7b74c 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -18,6 +18,7 @@ foreach c : trace_events_config
   trace_events_files += [ trace_events_file ]
   group = '--group=' + c.get('group')
   fmt = '@0@-' + c.get('group') + '.@1@'
+  module_ss = c.get('ss', trace_ss)
 
   trace_h = custom_target(fmt.format('trace', 'h'),
                           output: fmt.format('trace', 'h'),
@@ -36,10 +37,10 @@ foreach c : trace_events_config
                                 input: trace_events_file,
                                 command: [ tracetool, group, '--format=ust-events-h', '@INPUT@' ],
                                 capture: true)
-    trace_ss.add(trace_ust_h, lttng, urcubp)
+    module_ss.add(trace_ust_h, lttng, urcubp)
     genh += trace_ust_h
   endif
-  trace_ss.add(trace_h, trace_c)
+  module_ss.add(trace_h, trace_c)
   if 'CONFIG_TRACE_DTRACE' in config_host
     trace_dtrace = custom_target(fmt.format('trace-dtrace', 'dtrace'),
                                  output: fmt.format('trace-dtrace', 'dtrace'),
@@ -50,13 +51,13 @@ foreach c : trace_events_config
                                    output: fmt.format('trace-dtrace', 'h'),
                                    input: trace_dtrace,
                                    command: [ 'dtrace', '-o', '@OUTPUT@', '-h', '-s', '@INPUT@' ])
-    trace_ss.add(trace_dtrace_h)
+    module_ss.add(trace_dtrace_h)
     if host_machine.system() != 'darwin'
       trace_dtrace_o = custom_target(fmt.format('trace-dtrace', 'o'),
                                      output: fmt.format('trace-dtrace', 'o'),
                                      input: trace_dtrace,
                                      command: [ 'dtrace', '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])
-      trace_ss.add(trace_dtrace_o)
+      module_ss.add(trace_dtrace_o)
     endif
 
     genh += trace_dtrace_h
-- 
2.27.0


