Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0952FC021
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:39:11 +0100 (CET)
Received: from localhost ([::1]:46966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wqM-0005PK-EZ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5P-0003VT-A0
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5H-0003UA-SR
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611082231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypYZXDalFsLp4Ci2jXSwCqLWJ8jN/CVwaf2R/zxPOJE=;
 b=VN+G5hL03828YB6YL+f22oiAvWTGc4Wq9yjYUZS7lYnObOc+illNXSusHQZGZU/FFrBWhR
 Ukf8RMnKhnMnxuu2AH0sDBhdL7Z5N3njMUOCXOD+UYbvMNskJXnZAr/WQDHMzzA2lcYX5H
 BOb0lGIUz/UkvLalhl8gfFfD4D/zE6g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-4IOVRFQmP1yFjlsksAgXew-1; Tue, 19 Jan 2021 13:50:29 -0500
X-MC-Unique: 4IOVRFQmP1yFjlsksAgXew-1
Received: by mail-ej1-f70.google.com with SMTP id f1so3264334ejq.20
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:50:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ypYZXDalFsLp4Ci2jXSwCqLWJ8jN/CVwaf2R/zxPOJE=;
 b=U2McOqToOJk3ep+VsPVmtcszcqFVOLXWGtKj6vy3G15b3Qgys8PebeJ2emUDYxuPVP
 XTjFFjLtfHVSc3b+/Mq+6l4r/gK49V0riguqaYbvKe1goY1hQYnT39A/lgOZhY7fX7SD
 gnvTOd1gj3AQ5n3K5A5xhad9Bw0PQ8ryxkE6dEmXWwH45MWPrZevWS66CEoqJvWh4jLI
 FXV8oO6nq+7ZFXAmYT0nAmJ/KYnpGyesRf7YxmSsflsAzvT1qZQ7/0VA1mwNqa0rhbyO
 fZtZLXefzrGBy/xS73ARudnVzRdzoLJ0FPhHw1HlS5dwH4sKmFIsSe9XHnPYaS6wgbW7
 O9Qw==
X-Gm-Message-State: AOAM530OhzKJM69yIMzCcrJsrE0aX/jA2wEWDcUcT0S3HX/ePzyxHl7L
 uf9GZS0jGLn5IOBDM7epEjABVByo/lVlLI2MLZTIVqqf+tfidaIlIZOUlEmaaSBGou36o6LdJzD
 EpOzAKFdkUPXssYbO2kBs6rEp/gBupveCNkJ+bfHlOdvbGrP/ZZhPh4my6eKpYcQv
X-Received: by 2002:a05:6402:26c9:: with SMTP id
 x9mr4534864edd.365.1611082228237; 
 Tue, 19 Jan 2021 10:50:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMPSWqsbZq4IjHcDicN2dSPc5v8LX9Y8O49I3vLMiBX0DG0FANKnH/VHSei3pvnGYlBFgisg==
X-Received: by 2002:a05:6402:26c9:: with SMTP id
 x9mr4534853edd.365.1611082228080; 
 Tue, 19 Jan 2021 10:50:28 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r23sm10990435ejd.56.2021.01.19.10.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:50:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] meson: Summarize accelerators altogether
Date: Tue, 19 Jan 2021 19:50:00 +0100
Message-Id: <20210119185005.880322-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119185005.880322-1-philmd@redhat.com>
References: <20210119185005.880322-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Display accelerators altogether in Meson summary information.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/meson.build b/meson.build
index 73c8d04bbf0..d89eeb8c5ce 100644
--- a/meson.build
+++ b/meson.build
@@ -2375,6 +2375,21 @@
   summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
 endif
 summary_info += {'target list':       ' '.join(target_dirs)}
+
+summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
+summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
+summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
+summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
+summary_info += {'Xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
+if config_host.has_key('CONFIG_XEN_BACKEND')
+  summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
+endif
+summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
+if config_all.has_key('CONFIG_TCG')
+  summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
+  summary_info += {'TCG interpreter':   config_host.has_key('CONFIG_TCG_INTERPRETER')}
+endif
+
 summary_info += {'sparse enabled':    sparse.found()}
 if targetos == 'darwin'
   summary_info += {'Cocoa support':   cocoa.found()}
@@ -2419,25 +2434,12 @@
   summary_info += {'VNC JPEG support':  jpeg.found()}
   summary_info += {'VNC PNG support':   png.found()}
 endif
-summary_info += {'xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
-if config_host.has_key('CONFIG_XEN_BACKEND')
-  summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
-endif
 summary_info += {'brlapi support':    brlapi.found()}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
 summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
 summary_info += {'Linux io_uring support': config_host.has_key('CONFIG_LINUX_IO_URING')}
 summary_info += {'ATTR/XATTR support': libattr.found()}
-summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
-summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
-summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
-summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
-summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
-if config_all.has_key('CONFIG_TCG')
-  summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
-  summary_info += {'TCG interpreter':   config_host.has_key('CONFIG_TCG_INTERPRETER')}
-endif
 summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
 summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
 summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
-- 
2.26.2


