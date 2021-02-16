Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E7831D0E4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:23:11 +0100 (CET)
Received: from localhost ([::1]:57356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5wE-0003EZ-Ev
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kS-0002qF-0t
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:11:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kN-0004Rk-CJ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613502654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+qfql7FG2SX7yHDSS/GvN5uDCqNUizWaV9ofIpjAa0=;
 b=NXEg1feDJt+fNQnCt8vDYnIcHhRo9nmK7xVwUXQnGqNQVAdXqaCMTeJFn0nwgDoQ9nDWXH
 8WNtpmqo/L0AoihJLSC7FEq78SkdZb5LA1qIWye+HrCpWtZ5DnZMTEY2Zi54whojDzC/ob
 yMXT8SrfxCiXJusAb7XbiwQ9ZnjKMfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-vhvK7uoNMgW9ZFA-X4DKbQ-1; Tue, 16 Feb 2021 14:10:51 -0500
X-MC-Unique: vhvK7uoNMgW9ZFA-X4DKbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B66C801965;
 Tue, 16 Feb 2021 19:10:50 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-215.ams2.redhat.com
 [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68CB25C1B4;
 Tue, 16 Feb 2021 19:10:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/10] docs: update to show preferred boolean syntax for -cpu
Date: Tue, 16 Feb 2021 19:10:26 +0000
Message-Id: <20210216191027.595031-10-berrange@redhat.com>
In-Reply-To: <20210216191027.595031-1-berrange@redhat.com>
References: <20210216191027.595031-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The preferred syntax is to use "foo=on|off", rather than a bare
"+foo" or "-foo"

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/COLO-FT.txt                   | 4 ++--
 docs/interop/firmware.json         | 2 +-
 docs/system/cpu-models-x86.rst.inc | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index 8874690e83..8d6d53a5a2 100644
--- a/docs/COLO-FT.txt
+++ b/docs/COLO-FT.txt
@@ -158,7 +158,7 @@ instance.
 
 # imagefolder="/mnt/vms/colo-test-primary"
 
-# qemu-system-x86_64 -enable-kvm -cpu qemu64,+kvmclock -m 512 -smp 1 -qmp stdio \
+# qemu-system-x86_64 -enable-kvm -cpu qemu64,kvmclock=on -m 512 -smp 1 -qmp stdio \
    -device piix3-usb-uhci -device usb-tablet -name primary \
    -netdev tap,id=hn0,vhost=off,helper=/usr/lib/qemu/qemu-bridge-helper \
    -device rtl8139,id=e0,netdev=hn0 \
@@ -189,7 +189,7 @@ any IP's here, except for the $primary_ip variable.
 
 # qemu-img create -f qcow2 $imagefolder/secondary-hidden.qcow2 10G
 
-# qemu-system-x86_64 -enable-kvm -cpu qemu64,+kvmclock -m 512 -smp 1 -qmp stdio \
+# qemu-system-x86_64 -enable-kvm -cpu qemu64,kvmclock=on -m 512 -smp 1 -qmp stdio \
    -device piix3-usb-uhci -device usb-tablet -name secondary \
    -netdev tap,id=hn0,vhost=off,helper=/usr/lib/qemu/qemu-bridge-helper \
    -device rtl8139,id=e0,netdev=hn0 \
diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index 989f10b626..9d94ccafa9 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -129,7 +129,7 @@
 #                "-machine smm=on". (On the "pc-q35-*" machine types of
 #                the @i386 emulation target, @requires-smm presents
 #                further CPU requirements; one combination known to work
-#                is "-cpu coreduo,-nx".) If the firmware is marked as
+#                is "-cpu coreduo,nx=off".) If the firmware is marked as
 #                both @secure-boot and @requires-smm, then write
 #                accesses to the pflash chip (NVRAM) that holds the UEFI
 #                variable store must be restricted to code that executes
diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
index 9a2327828e..867c8216b5 100644
--- a/docs/system/cpu-models-x86.rst.inc
+++ b/docs/system/cpu-models-x86.rst.inc
@@ -364,7 +364,7 @@ Host passthrough with feature customization:
 
 .. parsed-literal::
 
-  |qemu_system| -cpu host,-vmx,...
+  |qemu_system| -cpu host,vmx=off,...
 
 Named CPU models:
 
@@ -376,7 +376,7 @@ Named CPU models with feature customization:
 
 .. parsed-literal::
 
-  |qemu_system| -cpu Westmere,+pcid,...
+  |qemu_system| -cpu Westmere,pcid=on,...
 
 Libvirt guest XML
 ^^^^^^^^^^^^^^^^^
-- 
2.29.2


