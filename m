Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C7051B011
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:06:01 +0200 (CEST)
Received: from localhost ([::1]:37460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMC8-0004cC-F2
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmM6j-0006p8-BQ
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:00:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmM6h-0006Do-LJ
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651698022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=md1jglYd6z9CUp+wyyryd9+VqjBQdVs9CtFhknqbrD0=;
 b=UQxmpsZL1oMh76GYTGpv29Ipc5ZjUXoCOpUTmOX1NU/EGL3VdUKZ/b9CgXccnehhc4jigL
 d/wIMQSinpWPxnEPnry16in3+EUCe42MeDoUNWHQCpYbRf0Ic1YXjwKQvdPOwFg7W2NXv5
 Np3qniJOSjRkyzn+1kMRCv+OUgRlfCg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-W9E8elBxN9OL1d3ucHSO6g-1; Wed, 04 May 2022 17:00:19 -0400
X-MC-Unique: W9E8elBxN9OL1d3ucHSO6g-1
Received: by mail-ed1-f70.google.com with SMTP id
 eg38-20020a05640228a600b00425d61d0302so1392870edb.17
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 14:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=md1jglYd6z9CUp+wyyryd9+VqjBQdVs9CtFhknqbrD0=;
 b=hNukFHnvfJSAaJFP6HDfcA00i25gOt//BqVW4FGQaXeHImA5An0gggFY6HlAERpWIW
 U6oxQFozyLQ+o/L/10ZVwikVgWjqTMX2nd7dfxwfAyUH/Eus+7r+x2mrbk09lN2R3FFP
 tYEP6JTQE+b/b2tzh/EE4EwqhB1iSYijVLpx4zFHRN315mSbuD/9OROyF1O9ZoKz1rpG
 NT4QvewGWL9o88lQaDQT6TuQ9i/7Xsdcs6nnuIdB4mh3WFtIw7azopgIbDem2lIET7wk
 yJT+DW/NJeQq3lAdZyyEP7Y5MHt3FJJ1qJV163X/++Lxim3nizu9ptW0KXz/J3lbX3bL
 2o8w==
X-Gm-Message-State: AOAM533NwU1RGWKHnOKhgJp0x28P9x39iNqSpbaNeSzEFPbT1aWtpXmO
 np4wfPqNtbcEd+szdMkugLZ5SO6xjmcjaHr6mMbNQiCN0b5kIfikGFE0T7q2oEfcKOxlGCsMVZl
 j0bwS8FyKhlrv1mCmIQnLb9YiZBd8z5/40boS9ktxiVDtHWPK5FsLrnbuXj5zlUgRv+8=
X-Received: by 2002:a05:6402:3590:b0:427:ba05:6f19 with SMTP id
 y16-20020a056402359000b00427ba056f19mr20399267edc.334.1651698013469; 
 Wed, 04 May 2022 14:00:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyiyfjRE5HEaSPhx1nokpdhhb6EvCLQAhjdEQLMN0zKtXPWAvynArPUvNQ5XbywDtvfGxVLQ==
X-Received: by 2002:a05:6402:3590:b0:427:ba05:6f19 with SMTP id
 y16-20020a056402359000b00427ba056f19mr20399241edc.334.1651698013228; 
 Wed, 04 May 2022 14:00:13 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a056402150c00b0042617ba638esm9550516edw.24.2022.05.04.14.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:00:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: [PATCH 5/5] net: slirp: allow CFI with libslirp >= 4.7
Date: Wed,  4 May 2022 23:00:01 +0200
Message-Id: <20220504210001.678419-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504210001.678419-1-pbonzini@redhat.com>
References: <20220504210001.678419-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

slirp 4.7 introduces a new CFI-friendly timer callback that does
not pass function pointers within libslirp as callbacks for timers.
Check the version number and, if it is new enough, allow using CFI
even with a system libslirp.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/meson.build b/meson.build
index c26aa442d4..defe604065 100644
--- a/meson.build
+++ b/meson.build
@@ -2509,10 +2509,25 @@ if have_system
   slirp_opt = get_option('slirp')
   if slirp_opt in ['enabled', 'auto', 'system']
     have_internal = fs.exists(meson.current_source_dir() / 'slirp/meson.build')
+    slirp_dep_required = (slirp_opt == 'system' or
+                          slirp_opt == 'enabled' and not have_internal)
     slirp = dependency('slirp', kwargs: static_kwargs,
                        method: 'pkg-config',
-                       required: slirp_opt == 'system' or
-                                 slirp_opt == 'enabled' and not have_internal)
+                       required: slirp_dep_required)
+    # slirp <4.7 is incompatible with CFI support in QEMU.  This is because
+    # it passes function pointers within libslirp as callbacks for timers.
+    # When using a system-wide shared libslirp, the type information for the
+    # callback is missing and the timer call produces a false positive with CFI.
+    # Do not use the "version" keyword argument to produce a better error.
+    # with control-flow integrity.
+    if get_option('cfi') and slirp.found() and slirp.version().version_compare('<4.7')
+      if slirp_dep_required
+        error('Control-Flow Integrity requires libslirp 4.7.')
+      else
+        warning('Control-Flow Integrity requires libslirp 4.7, not using system-wide libslirp.')
+        slirp = not_found
+      endif
+    endif
     if slirp.found()
       slirp_opt = 'system'
     elif have_internal
@@ -2585,18 +2600,6 @@ if have_system
   endif
 endif
 
-# For CFI, we need to compile slirp as a static library together with qemu.
-# This is because we register slirp functions as callbacks for QEMU Timers.
-# When using a system-wide shared libslirp, the type information for the
-# callback is missing and the timer call produces a false positive with CFI.
-#
-# Now that slirp_opt has been defined, check if the selected slirp is compatible
-# with control-flow integrity.
-if get_option('cfi') and slirp_opt == 'system'
-  error('Control-Flow Integrity is not compatible with system-wide slirp.' \
-         + ' Please configure with --enable-slirp=git')
-endif
-
 fdt = not_found
 if have_system
   fdt_opt = get_option('fdt')
-- 
2.35.1


