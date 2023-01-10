Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D228D6646E0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:59:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6g-0003db-Pr; Tue, 10 Jan 2023 11:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6P-0003QT-NF
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6N-00057Q-FJ
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XbOaISPlploGt1778joFsAZkH0/JisRO5CprslAGWp4=;
 b=EJH6XVNegWE4zLUlNChaZSsITgzKmOTrdGIEhLRoCI8rxubW53zCd5OVyINNMm1hfa3YPd
 44L3MTYxegX/0VIvARyPb7zdbLORA7+Rm3su5EpjiKfV16X2WnJ7Cz48Y9HEO1hbcvya9e
 jQ7Zgfh6L471wYI0RANP7+YS13e1b6M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-16-Vn4qQFbpPyOjVtFFuaRsWg-1; Tue, 10 Jan 2023 11:03:48 -0500
X-MC-Unique: Vn4qQFbpPyOjVtFFuaRsWg-1
Received: by mail-wr1-f69.google.com with SMTP id
 u15-20020adfa18f000000b002b129dc55bfso2132577wru.11
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbOaISPlploGt1778joFsAZkH0/JisRO5CprslAGWp4=;
 b=zFhYP64lj4z2kTfRJ+XWLjEv/dZoqYxMsXIadDy7HYMSOuvZg+2XxBWw2bQXPTh7aS
 medrGCAiL/SCEFsly2Ek+a8Q9YllPmR0T984L/xco6b1FqXcOkkhpizSp2wcLU+nwfj1
 f928Dxm/wsv7yS119yfSfOc8F1Ato3kdxRdVU2rio+qydOaKa72OOVoj0v5/R5emGC8t
 wGPL6voa/Q0zW2U+1L9Xwx59pYOhiuP4onN26L4Klzc9r7A6YiwR9JezDIecdsqKZJJL
 IdUqAraJqDeTxtJ5a6+lnRBQB1KhyXupcwykhmWN2+0ZP9THlKga6hSAYpeSUfwc5V6N
 lHgg==
X-Gm-Message-State: AFqh2koIIs7wPoTf49TYQ0jynbNwSG+WMfUtC8NL+liVg1zINZ5XbrA+
 F9dxo5dhA3zeoZNV4+z4uly5DABG2+GSJofUdYd/la/Jhm09qGsCe324MVgW+PpTwRTHo5sJ3o/
 Hm1L+3ZTrAlUjlC7P8TvMzcIKASp50k+ltHp3THLhzUICGmp2vJWnb5uHhR596FKIoQo=
X-Received: by 2002:a7b:cd99:0:b0:3d3:5506:1bac with SMTP id
 y25-20020a7bcd99000000b003d355061bacmr50481763wmj.30.1673366626596; 
 Tue, 10 Jan 2023 08:03:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXurB21YXVE/NWG4XCe/m2DVfhKVsSJwjEVdFqJN0TpCrBGmH9P0BB2SzTkIMS4gMvKEnamjmA==
X-Received: by 2002:a7b:cd99:0:b0:3d3:5506:1bac with SMTP id
 y25-20020a7bcd99000000b003d355061bacmr50481737wmj.30.1673366626317; 
 Tue, 10 Jan 2023 08:03:46 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a05600c491c00b003d9bd56e9c1sm14494316wmp.11.2023.01.10.08.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Holtmann <marcel@holtmann.org>
Subject: [PULL 26/29] libvhost-user: Add extra compiler warnings
Date: Tue, 10 Jan 2023 17:02:30 +0100
Message-Id: <20230110160233.339771-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
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

From: Marcel Holtmann <marcel@holtmann.org>

In case libvhost-user is used externally, that projects compiler
warnings might be more strict. Enforce an extra set of compiler warnings
to catch issues early on.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <737ebf2e697f8640558e6f73d96a692711f548f6.1671741278.git.marcel@holtmann.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/meson.build | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index 39825d9404ae..a18014e7f26f 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -1,6 +1,12 @@
 project('libvhost-user', 'c',
         license: 'GPL-2.0-or-later',
-        default_options: ['c_std=gnu99'])
+        default_options: ['warning_level=1', 'c_std=gnu99'])
+
+cc = meson.get_compiler('c')
+add_project_arguments(cc.get_supported_arguments('-Wsign-compare',
+                                                 '-Wdeclaration-after-statement',
+                                                 '-Wstrict-aliasing'),
+                      native: false, language: 'c')
 
 threads = dependency('threads')
 glib = dependency('glib-2.0')
-- 
2.38.1


