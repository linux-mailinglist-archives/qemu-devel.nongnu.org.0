Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5E06A8236
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:31:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi5P-0007bB-OT; Thu, 02 Mar 2023 07:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi59-0007Qs-Cb
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:30:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi57-0002qN-JF
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:30:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndiK+SzdHeJFyFqN5ZG4ctGk8GsV7Usk2MgFFknjXts=;
 b=WkRr2C0WGhSMH7ep55NIcBS6v3mUsKV9GmXwxEDYuZ71P92d1SNOcGmLb4GrU/CJCOSni2
 ILkCFRWqYmL94GFS2cNvdPs1T/0z1OnyHB/Krw48eYmeFWsn9067S+sHoaQi+0XyTcQ9kd
 aVE1xNjrmSyMqSBJ/u9F5EZeNp3kwqk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344-JcCZ7JD0PKmXNOT7AwcooQ-1; Thu, 02 Mar 2023 07:30:42 -0500
X-MC-Unique: JcCZ7JD0PKmXNOT7AwcooQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m31-20020a05600c3b1f00b003e9de8c95easo5696541wms.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ndiK+SzdHeJFyFqN5ZG4ctGk8GsV7Usk2MgFFknjXts=;
 b=2ulX2l528jCnABDFugG72QMeFdBy20xH8yMJf2jPC9T1iZUYRbP+u9Fj/dfoqgMqCF
 k+fXc4IK9rm8qm5btJOoudIbTn1sbexZ76xWxvNcQvct6c2Y8KAiqCUZT/eNxZwslQFJ
 TIf3z5m3u9gDWk+bt7wTcUadlMSL73ZVgAdBYWRm3/89SaKkhC7YtRxe/cij4I9AoXbV
 EtTZm0caf4ELQ+5YeOKcbFRf5lANLH48J50JlLplHaQIUloZBs0QdhtNh+q6+gpb9L63
 wTkbhQX80/jrrdFG0Zr7ECCZLQeK/6ui6phlwS4+Dw1r2Jw9aoHEui0DtN+5XQSetBek
 Kt7g==
X-Gm-Message-State: AO0yUKVBSa7qXe3GJyonthDgNupJFZUqZFpQ1PMM/+gOLb6bguDxiqDy
 ozurbglwXbmcWglCejbUoS46NQiuKjGeG9U7WbKZh7iX8EFfACQIo20l2CMzE2EonEMJi6IglgX
 HOynIDtWRY84WUEAb0pvTUmQANIrAbUtYpc/eDJKFI/78Sfs25Ghrt5H7APp6iUWm3iDz3D9L3e
 I=
X-Received: by 2002:adf:e790:0:b0:2ca:d5dc:aec5 with SMTP id
 n16-20020adfe790000000b002cad5dcaec5mr7077053wrm.61.1677760240417; 
 Thu, 02 Mar 2023 04:30:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+Iyn4lQpH+kDjBph3oZo3Ht3Y70TbXqIKYCoAqwkDX9ro3wQaGsvhpN5hJD4IP2BUpU6XO+Q==
X-Received: by 2002:adf:e790:0:b0:2ca:d5dc:aec5 with SMTP id
 n16-20020adfe790000000b002cad5dcaec5mr7077032wrm.61.1677760240001; 
 Thu, 02 Mar 2023 04:30:40 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 f6-20020adff586000000b002c56179d39esm15017595wro.44.2023.03.02.04.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:30:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 02/62] xen: add CONFIG_XEN_BUS and CONFIG_XEN_EMU options for
 Xen emulation
Date: Thu,  2 Mar 2023 13:29:29 +0100
Message-Id: <20230302123029.153265-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

From: David Woodhouse <dwmw@amazon.co.uk>

The XEN_EMU option will cover core Xen support in target/, which exists
only for x86 with KVM today but could theoretically also be implemented
on Arm/Aarch64 and with TCG or other accelerators (if anyone wants to
run the gauntlet of struct layout compatibility, errno mapping, and the
rest of that fui).

It will also cover the support for architecture-independent grant table
and event channel support which will be added in hw/i386/kvm/ (on the
basis that the non-KVM support is very theoretical and making it not use
KVM directly seems like gratuitous overengineering at this point).

The XEN_BUS option is for the xenfv platform support, which will now be
used both by XEN_EMU and by real Xen.

The XEN option remains dependent on the Xen runtime libraries, and covers
support for real Xen. Some code which currently resides under CONFIG_XEN
will be moving to CONFIG_XEN_BUS over time as the direct dependencies on
Xen runtime libraries are eliminated. The Xen PCI platform device will
also reside under CONFIG_XEN_BUS.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/Kconfig      | 1 +
 hw/i386/Kconfig | 5 +++++
 hw/xen/Kconfig  | 3 +++
 meson.build     | 1 +
 4 files changed, 10 insertions(+)
 create mode 100644 hw/xen/Kconfig

diff --git a/hw/Kconfig b/hw/Kconfig
index 38233bbb0f13..ba62ff6417c9 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -41,6 +41,7 @@ source tpm/Kconfig
 source usb/Kconfig
 source virtio/Kconfig
 source vfio/Kconfig
+source xen/Kconfig
 source watchdog/Kconfig
 
 # arch Kconfig
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 9fbfe748b57d..d40802d83f19 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -136,3 +136,8 @@ config VMPORT
 config VMMOUSE
     bool
     depends on VMPORT
+
+config XEN_EMU
+    bool
+    default y
+    depends on KVM && (I386 || X86_64)
diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
new file mode 100644
index 000000000000..3467efb98674
--- /dev/null
+++ b/hw/xen/Kconfig
@@ -0,0 +1,3 @@
+config XEN_BUS
+    bool
+    default y if (XEN || XEN_EMU)
diff --git a/meson.build b/meson.build
index 77d2ae87e4c5..71a14e6b3da1 100644
--- a/meson.build
+++ b/meson.build
@@ -3881,6 +3881,7 @@ if have_system
   if xen.found()
     summary_info += {'xen ctrl version':  xen.version()}
   endif
+  summary_info += {'Xen emulation':     config_all.has_key('CONFIG_XEN_EMU')}
 endif
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
-- 
2.39.1


