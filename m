Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62468300E5A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:58:34 +0100 (CET)
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33Vp-0000qv-Ev
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33J5-0005Ck-3Q
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33J3-0002ko-9d
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yHJ2XuVci3FGNiQY5SlEo5RMP1UZeE27p+2I+95wtjY=;
 b=VW1qnztRSLM4yLrlC/8aKH4n+ttyrl22ZMu9DtxMqZPnflA190YGmXcYerYtk99NlLjzf6
 cU6oNTgntphbcp5vUw9/nKy97ycOQbLtCrAdYIvzpKz2VKg62kB93/dHZjTlPitlk6tl7P
 5O2OAfoC25/UadD6XRFHne9e5BjDteA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-fg7BHoPONh6HaHs8QtfslQ-1; Fri, 22 Jan 2021 15:45:18 -0500
X-MC-Unique: fg7BHoPONh6HaHs8QtfslQ-1
Received: by mail-ed1-f71.google.com with SMTP id dg17so3515712edb.11
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:45:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yHJ2XuVci3FGNiQY5SlEo5RMP1UZeE27p+2I+95wtjY=;
 b=ODxKhxYR+uE/458SVrmq3K2DwjbiPYljM8qny3B5B9huT4VIjNps55PbMyLJ/gvbhr
 whUhQZWQVv1A9HLXAH373pzpqdK3Y18C1c2ogbbhCFC6ZuwGBwy5BYrziPSqugDvRVKM
 jTfYs7Up9fkRuhC38dN91UvK+Xe0fmRzB13qMr52Kxmsf7ECWiKxTIy5KKWkTHAEarK3
 1/nFJ+vtDbqrZD1llmeXgQTYWYm6Qr9nPi/ZZha7CO+EKcfPj2+YQdADNNCIkyTPpJJb
 pEeGubZwAppl+SJBfL1s2aD9mM2r6Y7UJ/h7rKnRutKri7R7C3prwmRdFV4R6Bw01/jo
 RglA==
X-Gm-Message-State: AOAM530hVcvcRpJK8DiC7/7gmcZJaSwph51APpu9lO59+obfkA+GcKxv
 zIbZCvfql6LyWxSLqDSVjLcBP3KTkdsDwxji+t5crGwfO+Pj8QPOpAwgKTyvIyh79ZnRAcjrvoo
 z55cT35NmSzO3hh//BW/+Nx1GWJE7Pxfs8hH/3wR/tJLyA5ERuJqqDvnBfvPd8WIh
X-Received: by 2002:a17:906:97c5:: with SMTP id
 ef5mr51923ejb.347.1611348317113; 
 Fri, 22 Jan 2021 12:45:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzH6IHk7jyHHQV3mNKNbE3OWPCYK0fV1QLoAClzW6rGtGMJMa1BylO9Gdb/NxojsBx+twpZTg==
X-Received: by 2002:a17:906:97c5:: with SMTP id
 ef5mr51907ejb.347.1611348316970; 
 Fri, 22 Jan 2021 12:45:16 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k6sm5171423ejb.84.2021.01.22.12.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:45:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 06/12] meson: Merge trace_events_subdirs array
Date: Fri, 22 Jan 2021 21:44:35 +0100
Message-Id: <20210122204441.2145197-7-philmd@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The trace_events_subdirs array is split in two different
locations, merge it as one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Stefan Hajnoczi <stefanha@redhat.com>
---
 meson.build | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/meson.build b/meson.build
index 181f8795f5a..c43538a1523 100644
--- a/meson.build
+++ b/meson.build
@@ -1686,7 +1686,20 @@
   'accel/kvm',
   'accel/tcg',
   'crypto',
+  'hw/core',
+  'qapi',
+  'qom',
   'monitor',
+  'target/arm',
+  'target/hppa',
+  'target/i386',
+  'target/i386/kvm',
+  'target/mips',
+  'target/ppc',
+  'target/riscv',
+  'target/s390x',
+  'target/sparc',
+  'util',
 ]
 if have_user
   trace_events_subdirs += [ 'linux-user' ]
@@ -1759,21 +1772,6 @@
     'ui',
   ]
 endif
-trace_events_subdirs += [
-  'hw/core',
-  'qapi',
-  'qom',
-  'target/arm',
-  'target/hppa',
-  'target/i386',
-  'target/i386/kvm',
-  'target/mips',
-  'target/ppc',
-  'target/riscv',
-  'target/s390x',
-  'target/sparc',
-  'util',
-]
 
 vhost_user = not_found
 if 'CONFIG_VHOST_USER' in config_host
-- 
2.26.2


