Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA55EBF3A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:07:02 +0200 (CEST)
Received: from localhost ([::1]:53276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7UT-0005lS-85
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1od7NK-0007ro-0D
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1od7NI-0008UX-ID
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664272776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aPj5z8G4LaRdkqvctjZSXNLzzOgJI5HGdpKUs4UaT0U=;
 b=LpHCpO5u/ssV40MG7BwtYh7+1lHmEsmIyVvwHYZwTAd46X+y8zGlZXYePq7zIaSVv7qTfz
 egFdMz4d+8phyBK7+G9WPRsWrFJg4rkW3HwYmpcEnApVO1hcrmJd6OLDT4y4QhBs1LtS6r
 b13SZNzipq5Tvvx+ZiK2MJsK3XHYQtI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-ME220EZyOaiC4hISw3pU1Q-1; Tue, 27 Sep 2022 05:59:34 -0400
X-MC-Unique: ME220EZyOaiC4hISw3pU1Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 sd4-20020a1709076e0400b00781e6ba94e1so3562189ejc.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 02:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aPj5z8G4LaRdkqvctjZSXNLzzOgJI5HGdpKUs4UaT0U=;
 b=RtmIIZ9ktyGzw/fdq0hY4uSu3PEayciM6kx7nQOahgAm4V2Aj7Rh77f3tdsq5mU8uV
 DeG2ZBTgFmFn8rrWJ9KDxbRkElELlAWrEPpZ4b/M77Uf3vyQfMuXRIN98U0vXQzN0Zlp
 J/BzRqBC1Pg2ZvKSQewh0tq8xkuztRhatlIKiPTOnotuvxNnxWSckYtZcyeoOxxLy5e0
 +Xz/LJ5krhbe9cyK23L3SsCIZiwNViOl347KUGd4Tp8JYOg1TE5pSzkxBOabCvVRXA2U
 FjNB/ZhkTaHx9R8TuL9ztxzVqNfh71I1zgDvO8vFGISJmgeSMdZOJDSYEb3VT+jHlM2l
 8Bpw==
X-Gm-Message-State: ACrzQf1LFhNXFvFz/R/HdFZYkG0gSI3gWkJAqVc1oGxsyBI4k3Z5z17B
 Da9P1sebJlXy15wqe2ukR6RnyB2Gr5zp2xKNqn/SvsqEtaNXcVkQ4qDj+jhpKMrEZs+xwD4J+bT
 5Bv3gTyjEGSykpVDf5aw4ZSsKvIWr1nnyXzf9bPHCgY5/tbfuHSX/AcC+TqnrnAs9frM=
X-Received: by 2002:a17:907:2c75:b0:77c:2b6a:6b63 with SMTP id
 ib21-20020a1709072c7500b0077c2b6a6b63mr22653777ejc.702.1664272773183; 
 Tue, 27 Sep 2022 02:59:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7x1iG2UMddzE95OUGkND3iYEyrlGvjQmgP2UMr0RAabFDAhORi3uS0otSe+Bt4jaFBkoGTFg==
X-Received: by 2002:a17:907:2c75:b0:77c:2b6a:6b63 with SMTP id
 ib21-20020a1709072c7500b0077c2b6a6b63mr22653763ejc.702.1664272772919; 
 Tue, 27 Sep 2022 02:59:32 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 26-20020a170906309a00b00781b589a1afsm531675ejv.159.2022.09.27.02.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 02:59:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
Subject: [PATCH 3/5] meson: multiple names can be passed to dependency()
Date: Tue, 27 Sep 2022 11:59:19 +0200
Message-Id: <20220927095921.261760-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927095921.261760-1-pbonzini@redhat.com>
References: <20220927095921.261760-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This is new in Meson 0.60.0.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index 8be01ba1c3..e1700d1d55 100644
--- a/meson.build
+++ b/meson.build
@@ -825,14 +825,10 @@ if have_system and get_option('curses').allowed()
     }'''
 
   curses_dep_list = targetos == 'windows' ? ['ncurses', 'ncursesw'] : ['ncursesw']
-  foreach curses_dep : curses_dep_list
-    if not curses.found()
-      curses = dependency(curses_dep,
-                          required: false,
-                          method: 'pkg-config',
-                          kwargs: static_kwargs)
-    endif
-  endforeach
+  curses = dependency(curses_dep_list,
+                      required: false,
+                      method: 'pkg-config',
+                      kwargs: static_kwargs)
   msg = get_option('curses').enabled() ? 'curses library not found' : ''
   curses_compile_args = ['-DNCURSES_WIDECHAR=1']
   if curses.found()
-- 
2.37.3


