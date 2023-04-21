Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2F46EA703
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:33:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn8w-00083N-Lr; Fri, 21 Apr 2023 05:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn8u-0007zZ-E1
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn8s-00030t-Bi
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAI9peY/y5p9dVc6W035jPsyHtbIsgLa8iFPkn3MNGg=;
 b=DCBc4IKd67zTis5ChkgsQtCqCBu8PNOamoSqo1hhztxEWxd3/EGjMsdv3cBlS5hZUotE07
 azs8FdjDZ/02tEk+Uz4HOoDGA9RzzdpfazPestTKjpEQdFnKy7QK8mlccfEFuAmXbIPnM8
 LQqfn2Is17L7m4v5u72LTuZroPu1cpI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-3GW4wyW3M5iH7zQKmAslGw-1; Fri, 21 Apr 2023 05:33:20 -0400
X-MC-Unique: 3GW4wyW3M5iH7zQKmAslGw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50692ecb3c5so1612841a12.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069599; x=1684661599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xAI9peY/y5p9dVc6W035jPsyHtbIsgLa8iFPkn3MNGg=;
 b=aBJZXYQJpby/nSd7PVPQ6jntha8TRXeTYH2OMRbZpI1f3JGq553utY2NYp6BdJV0NV
 G6rIcawq1UaokEi8vj8+ORgs0y8y1Ojh5gxeI7aCJwWSMnWVfcEliWu76WpJq9QstNsK
 SBxStbA7eRx1lKCwYBU0JoLl6t5P6mPQ+iCoLJblMvE2AtEsCplBdhoAmCEPFkzCjqUw
 7MKyq5MT+lpk26pIJpXzMiMbpT285/XJ+DU7yGFVAaQi4I7T9xhkux393P5M5ngS7gla
 pYjDQmit22G3NTvVb40ZJdvCrkaXpx+hRB90fNaIqSXe59bm7ambyow2aNDVEBvRgpyJ
 c3Ag==
X-Gm-Message-State: AAQBX9d1JHr6OiaZibCcFLFvMmBeV7FXMe6hPlY0rSvVp0dXxJo+Vc3O
 gn+OPKVFwqusOLip3DIvKVtyqythVj3alMv/BWDWy4ZT4f+qWI161f+IHFXdrSjTqD0qJbPVxw0
 e9HC/sksvw01FJ5pBpnPjWFmVu4mTqtvyU/AMbL1SnUsNF9b9kee1XkLnsf6n+6Bv4aEAx7Q8G6
 Tfaw==
X-Received: by 2002:a17:906:cb94:b0:94a:4ce3:8043 with SMTP id
 mf20-20020a170906cb9400b0094a4ce38043mr1757108ejb.52.1682069598880; 
 Fri, 21 Apr 2023 02:33:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350YsP9TSjZDYKyeKtrkMbGeEKUf4R54tP76N9VuSAO8CzOwl3jzxwrF7b8vIBTTTdXMZDkvH2g==
X-Received: by 2002:a17:906:cb94:b0:94a:4ce3:8043 with SMTP id
 mf20-20020a170906cb9400b0094a4ce38043mr1757091ejb.52.1682069598449; 
 Fri, 21 Apr 2023 02:33:18 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a1709062c0600b0094ef2003581sm1821937ejh.153.2023.04.21.02.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 01/25] mtest2make.py: teach suite name that are just "PROJECT"
Date: Fri, 21 Apr 2023 11:32:52 +0200
Message-Id: <20230421093316.17941-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

A subproject test may be simply in the "PROJECT" suite (such as
"qemu-common" with the following patches)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230302131848.1527460-2-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/mtest2make.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 0fe81efbbcec..179dd5487182 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -51,10 +51,11 @@ def process_tests(test, targets, suites):
 
     test_suites = test['suite'] or ['default']
     for s in test_suites:
-        # The suite name in the introspection info is "PROJECT:SUITE"
-        s = s.split(':')[1]
-        if s == 'slow' or s == 'thorough':
-            continue
+        # The suite name in the introspection info is "PROJECT" or "PROJECT:SUITE"
+        if ':' in s:
+            s = s.split(':')[1]
+            if s == 'slow' or s == 'thorough':
+                continue
         if s.endswith('-slow'):
             s = s[:-5]
             suites[s].speeds.append('slow')
-- 
2.40.0


