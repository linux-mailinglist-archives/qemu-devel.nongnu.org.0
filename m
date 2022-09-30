Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B792C5F061D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 09:56:55 +0200 (CEST)
Received: from localhost ([::1]:49392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeAtC-0005BH-Bm
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 03:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeAq0-0003dO-UD
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeApx-0000KX-Gh
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:53:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664524411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gHHO0DjemfB7RSxNl1glJzR8isMW171LuqjGDSpt6Yk=;
 b=hsAb5DUS3mzLTfo3UPKGuJb4Np2MzFZPXxiXGxrSqj6m05P5fdEeWQq07lzlah11FKj3zG
 gqjNrXdTf3bSSO1xc+3SC2Bfe7g6Ufg2uwQL49+3aOpOlMIJ0UjmI4MjzKhb8iLwkaZKch
 aVYlCeMx+qDoxiqsQZaTsSxmwjAkUtU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-427-ZMSafck2MyCr0pdtypyCTA-1; Fri, 30 Sep 2022 03:53:29 -0400
X-MC-Unique: ZMSafck2MyCr0pdtypyCTA-1
Received: by mail-ej1-f71.google.com with SMTP id
 hr29-20020a1709073f9d00b0078333782c48so1492718ejc.10
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 00:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=gHHO0DjemfB7RSxNl1glJzR8isMW171LuqjGDSpt6Yk=;
 b=bZeyCqSktQiCkRCwHBMuvwqtomOp/wPu08CLvhJ3pZDfVjPxEcW5w0RCQFTy3SIPpE
 GjMb/wcDn219GSdMDJullpv2b0iCVGYqVVyQeZHaPdx680Dqzd6JF8Yxff/V+IKn00P9
 /hgNHD6zG8pFG4nt2669QNC5oRuGQJkzOUn6ZuhJnETYGZujp5GYayGnjjmfk5Yv5pSP
 c6KRRMBGqidsUsU+QU9jKI/h2uN3lw7cqXKb0q2GRWYN3MVRDrsex8laPo+Nh/eg7Peh
 nICyLi8iGnLhdrCZMfB9X7S90KNkJtX2R0s46L2mhdChUzBW+FKWg4nm2iYgFZXd4KDn
 87ig==
X-Gm-Message-State: ACrzQf1mnWgDDnTGCxb2Xh3McsWDCKi/gp2s1UsS8YEgdsgf7zPnI53c
 ko/M2BKquD6VxbaPkllU6A25EMjw9UyBwTSJYzoOR+d8pzErM28f/a/RLPbE2GR2xZf3vXMS2Yy
 uH9hiRThXb3lOFPEo8GahYdSGHQVOuIjRosROnUZmC4lKLmYFPULHF5UVp4ksQvwh9Jw=
X-Received: by 2002:a17:906:9752:b0:783:96ed:2e1d with SMTP id
 o18-20020a170906975200b0078396ed2e1dmr5761683ejy.166.1664524408209; 
 Fri, 30 Sep 2022 00:53:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4+Nv9E1SB9Uvz0S5MyH9S/GpbqHG2akwFmBM9VOiUAxqLwnToOCxF8ym3QoUTx1rnFN7hKnQ==
X-Received: by 2002:a17:906:9752:b0:783:96ed:2e1d with SMTP id
 o18-20020a170906975200b0078396ed2e1dmr5761667ejy.166.1664524407888; 
 Fri, 30 Sep 2022 00:53:27 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a1709063da100b0073a20469f31sm795702ejh.41.2022.09.30.00.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 00:53:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH] meson: -display dbus and CFI are incompatible
Date: Fri, 30 Sep 2022 09:53:24 +0200
Message-Id: <20220930075324.13550-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The generated skeletons for DBus call the finalize method of the parent
type using code like

    G_OBJECT_CLASS (qemu_dbus_display1_chardev_skeleton_parent_class)->finalize (object);

However, the finalize method is defined in a shared library that is not
compiled with CFI.  Do not enable anything that uses gdbus-codegen if
--enable-cfi was specified.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index f6962834a3..6106daf267 100644
--- a/meson.build
+++ b/meson.build
@@ -515,6 +515,7 @@ meson.override_dependency('glib-2.0', glib)
 
 gio = not_found
 gdbus_codegen = not_found
+gdbus_codegen_error = '@0@ requires gdbus-codegen, please install libgio'
 if not get_option('gio').auto() or have_system
   gio = dependency('gio-2.0', required: get_option('gio'),
                    method: 'pkg-config', kwargs: static_kwargs)
@@ -539,6 +540,10 @@ if not get_option('gio').auto() or have_system
                              version: gio.version())
   endif
 endif
+if gdbus_codegen.found() and get_option('cfi')
+  gdbus_codegen = not_found
+  gdbus_codegen_error = '@0@ uses gdbus-codegen, which does not support control flow integrity')
+endif
 
 lttng = not_found
 if 'ust' in get_option('trace_backends')
@@ -1697,7 +1702,7 @@ dbus_display = get_option('dbus_display') \
   .require(gio.version().version_compare('>=2.64'),
            error_message: '-display dbus requires glib>=2.64') \
   .require(gdbus_codegen.found(),
-           error_message: '-display dbus requires gdbus-codegen') \
+           error_message: gdbus_codegen_error.format('-display dbus')) \
   .require(opengl.found() and gbm.found(),
            error_message: '-display dbus requires epoxy/egl and gbm') \
   .allowed()
-- 
2.37.3


