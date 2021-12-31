Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6F74823DC
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 12:58:41 +0100 (CET)
Received: from localhost ([::1]:47230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3GYR-0006J8-Jk
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 06:58:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPR-0002Zy-9R
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPL-0000IP-Np
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640951354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3SyegUav7Y4rfG22z5S0cm0XRrlspgF1hM8sq9A6HmQ=;
 b=X/8hKWl4RdBR95amu7mCwIJCxlAbFiVvSuwyE6g5dly1alGB5wFI5ze/59XBgS+bapda9B
 OTdjnPo1d0IVToKhV+jN9wnqqy2lYO69XRssTjlIwB2PN/AdOSuXsxvVeixDUsRV9v/oiT
 uOldwiDSMqF2GEsw4GoIodqmoWPoqYQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-jVOvh2RRPD64G1ppJbcc2g-1; Fri, 31 Dec 2021 06:49:13 -0500
X-MC-Unique: jVOvh2RRPD64G1ppJbcc2g-1
Received: by mail-wr1-f72.google.com with SMTP id
 r7-20020adfbb07000000b001a254645f13so7528939wrg.7
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 03:49:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3SyegUav7Y4rfG22z5S0cm0XRrlspgF1hM8sq9A6HmQ=;
 b=oQVKCmHRA+Wub3tG+GYkRNN/A0iupEwYtOOSzareFBjLJV1Z241w54omfssYPBoY1F
 GfZ6ll0V1pQ/0t5nWfyhqf4HQKcS117Txm75yEhifgz481Z8KkPTUvF1JRTl495BZZwl
 HSYxi6FxS/ykWj3M1QW9E7nwFekncjzcpcvIMQuhEpVDLrrJ5ouBfLd0I3+eWpyBkiVY
 eP5He2JdyzIOPCaA4c8EQ0WCTqUD8tupx5e2kKtucaFy+OTnJVlj1ZwoKYFPa2K7/HJt
 duwRwBfGxEDShK5xSnLe96CqIpEVrR6HpHAVan5rrbb3fQ3FlMJejSCw2bLyoStwc5Iw
 /Azg==
X-Gm-Message-State: AOAM530MWXuEgpI9xw6QZfQWGVNd/xaDxHiSnaqgPbFiNGlQ/zLf9CAf
 TsEyzAQW7cFlzJyqv79h9UtLIx/NAAOzLH8JO+W3AHF0+gg0t+aGyk1A3drNvds83h2E+6DJw1b
 t+MideRPQ7WE2danSqS4weotYYLT40cnsZpTTtZ+mPGOV3GmUshi+dBFAO+dH9l84
X-Received: by 2002:adf:d1e5:: with SMTP id g5mr28819452wrd.94.1640951352411; 
 Fri, 31 Dec 2021 03:49:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZuvmwQBmcyP5Iini/Kdf7lPa55OIBxKp8Z4wbQBcBNLjJNM2vSXfxFZbF8YsVxbsifrcAZQ==
X-Received: by 2002:adf:d1e5:: with SMTP id g5mr28819430wrd.94.1640951352192; 
 Fri, 31 Dec 2021 03:49:12 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id m21sm25219027wrb.2.2021.12.31.03.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 03:49:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] hw/pci: Restrict pci-bus stub to sysemu
Date: Fri, 31 Dec 2021 12:48:55 +0100
Message-Id: <20211231114901.976937-3-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231114901.976937-1-philmd@redhat.com>
References: <20211231114901.976937-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Neither tools nor user-mode emulation require the PCI bus stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 stubs/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/meson.build b/stubs/meson.build
index 363f6fa785d..d359cbe1ad7 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -26,7 +26,6 @@
 stub_ss.add(files('module-opts.c'))
 stub_ss.add(files('monitor.c'))
 stub_ss.add(files('monitor-core.c'))
-stub_ss.add(files('pci-bus.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
 stub_ss.add(files('qmp_memory_device.c'))
 stub_ss.add(files('qmp-command-available.c'))
@@ -51,6 +50,7 @@
 endif
 if have_system
   stub_ss.add(files('fw_cfg.c'))
+  stub_ss.add(files('pci-bus.c'))
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('usb-dev-stub.c'))
   stub_ss.add(files('xen-hw-stub.c'))
-- 
2.33.1


