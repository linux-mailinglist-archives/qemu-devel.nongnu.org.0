Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68845300E46
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:55:54 +0100 (CET)
Received: from localhost ([::1]:38064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33TF-0006dh-F9
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33J9-0005GY-Pe
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33J8-0002o2-7D
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BM5TUfzZBhZVJYVYCyN6f9pu4TxdGbS+7Z5pCr1lfwo=;
 b=erljCbauCZZZuGZ2aNyOAa5ILmQ2iSWvMvc3ApRuo4BBb1fkDnnXEEAX4vawlyfPHqvs2h
 o6xbg7gOx3oEPabwLHCVxIhVnNjqBK4Xk4Ie4S+DmWDjNErNjIPPoOUXFlYbMqV1D2HcOn
 DRY+CzuCYO9o7JVp7NvyxdTDxJw/op0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-uK5OqKuzNCio7M1Xbobsdw-1; Fri, 22 Jan 2021 15:45:23 -0500
X-MC-Unique: uK5OqKuzNCio7M1Xbobsdw-1
Received: by mail-ej1-f69.google.com with SMTP id jg11so2685991ejc.23
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:45:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BM5TUfzZBhZVJYVYCyN6f9pu4TxdGbS+7Z5pCr1lfwo=;
 b=eL4lQUZeQdRpvBtsG6pdAeEX55PJezGgWC/QftIaNCuIEhxCkVZj8LU867dSJQOSoC
 zY5CEb+odMGLnkm72Q9OexnbT6TM3GF9Sk/z/EtHtX5yktkIKGib102XgCbxG229IPXu
 m4Xs8MNVHkqZ2lLfDhqRY5FuL9DEapwRgbEeglRtGOZrcqubKnvZ5QYoJ2Wb5cKohsSJ
 qUUiuXCtafGPMQTuUhCux4mAVBlhYTq26WbtEKpy+yaqzUw9Xy3RnQ/pviyaJnPc4vwV
 dbS6ndOYQp+h3espZMCFs1ECgbQCAtaeRGu4GCohuGVhY/+TTzZIz9cEAAJTYlopAExt
 hKSA==
X-Gm-Message-State: AOAM531zxqx7DfTk2i5HYDhBP1I01jMV0BE4IYBdD7Jk0pNLA+NYSyUR
 YzERD1ZZi0TJP2+DqP8bz/a/mHkL4uhKBIkUCRHpyuvAI+zsTinh68IgBVtME3Lz6TGnhnY/Jbk
 sYnsJnUlVFDTMUKcuYPXMOGtklBQ50b48T2PnvquRD2IMWGIlHhU04RuT7WHYQrlv
X-Received: by 2002:a05:6402:c87:: with SMTP id
 cm7mr4656539edb.69.1611348322487; 
 Fri, 22 Jan 2021 12:45:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuAFvNzUzaUzyRhGhuinu8LddMO61Om9+4KpS/GsacCuf65wp6bnoo3nu0IY4xX6cM4IBNjA==
X-Received: by 2002:a05:6402:c87:: with SMTP id
 cm7mr4656518edb.69.1611348322287; 
 Fri, 22 Jan 2021 12:45:22 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v25sm5235145ejw.21.2021.01.22.12.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:45:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 07/12] meson: Restrict some trace event directories to
 user/system emulation
Date: Fri, 22 Jan 2021 21:44:36 +0100
Message-Id: <20210122204441.2145197-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122204441.2145197-1-philmd@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Stefan Hajnoczi <stefanha@redhat.com>
---
 meson.build | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/meson.build b/meson.build
index c43538a1523..396ea3aa19b 100644
--- a/meson.build
+++ b/meson.build
@@ -1683,22 +1683,10 @@
 # TODO: add each directory to the subdirs from its own meson.build, once
 # we have those
 trace_events_subdirs = [
-  'accel/kvm',
-  'accel/tcg',
   'crypto',
-  'hw/core',
   'qapi',
   'qom',
   'monitor',
-  'target/arm',
-  'target/hppa',
-  'target/i386',
-  'target/i386/kvm',
-  'target/mips',
-  'target/ppc',
-  'target/riscv',
-  'target/s390x',
-  'target/sparc',
   'util',
 ]
 if have_user
@@ -1715,6 +1703,7 @@
 endif
 if have_system
   trace_events_subdirs += [
+    'accel/kvm',
     'audio',
     'backends',
     'backends/tpm',
@@ -1772,6 +1761,21 @@
     'ui',
   ]
 endif
+if have_system or have_user
+  trace_events_subdirs += [
+    'accel/tcg',
+    'hw/core',
+    'target/arm',
+    'target/hppa',
+    'target/i386',
+    'target/i386/kvm',
+    'target/mips',
+    'target/ppc',
+    'target/riscv',
+    'target/s390x',
+    'target/sparc',
+  ]
+endif
 
 vhost_user = not_found
 if 'CONFIG_VHOST_USER' in config_host
-- 
2.26.2


