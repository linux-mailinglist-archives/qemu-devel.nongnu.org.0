Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438ED5289E3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:12:00 +0200 (CEST)
Received: from localhost ([::1]:53896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdKB-0003Jj-8V
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5M-0002kV-Cd
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5K-0003Pc-Ka
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vYBZ2pGgl072Dbisxb+IUm2/PVM1Ev/7jyccpSog5Kc=;
 b=B02aywNvoTZnEthe3WyGtH4o+tGoT8Fl0Kp81Ulv8JM8Bqd5VpNSkijvrqOaCMJ+cNKDxf
 OIruh352Wcv1qTu8hJ0SB9cu1O9kRI/UdMFztzGerEIucT14Aif7Z9lYIZ3qL2oPlZgVWb
 v6+87JSXKuRusrSBx9YBzC+LT5aNLfE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-HJnVwfzCMXK_oxqgkVoxDg-1; Mon, 16 May 2022 11:56:36 -0400
X-MC-Unique: HJnVwfzCMXK_oxqgkVoxDg-1
Received: by mail-ej1-f69.google.com with SMTP id
 bk16-20020a170906b0d000b006fe34a2e598so1077116ejb.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vYBZ2pGgl072Dbisxb+IUm2/PVM1Ev/7jyccpSog5Kc=;
 b=ZZXpRRzNI6S4DZPmGSGlQbJHHLC0OiwLx/MG0JQAxxbDjiBZDVTxPCgVHT5r+U2hGm
 ZU6WaeCHKbb4GeLnySRbX5CO7JwagMzuPv3deNVir4M1uQQiACqWIXYljpbRCIa1DUuy
 r/4asMRwAk3KXXKzVbTpsoA4HXjX705nY6PHibgfBQlwu7aZdepH8cPuiVNgnJBa25UU
 rrPZZi6Au3gb79gCFrmJY4tO0yGhgZEoLmInpYIHVqU7Y5NxPxr6v8waAdaovWFCpl9l
 OjVxme/JNzhYGpWjgeRU2zSPd8UFuQuOXZI/66GbtX5N3uEQEBixbB1kFCPG9cw/1HBG
 UmNw==
X-Gm-Message-State: AOAM533B9/CdTpl2AVShkqAjyiXxYSz5Ule2VZcJzftk188KoRnJOxJM
 54DaQD4ke0m5NQPFQkG/MyEbrpD64IgR3F7031ENLpav80vXsqwcSkJ1gjZ0tPiiOn3t9aTAptJ
 iVD3R6pG/nTDz8ob2TSyIOj8RQO19cpUJak3yNuOvO2bguM9l3duzidjr8s3VXU3Q7zQ=
X-Received: by 2002:a05:6402:388d:b0:42a:ba9f:f85c with SMTP id
 fd13-20020a056402388d00b0042aba9ff85cmr3026375edb.292.1652716595140; 
 Mon, 16 May 2022 08:56:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjrgV3ClDLYqjhwlpGye4Q7MoEaX4CO2/d1DgnRiWdCTxB4WxNga2YhwS3ZpI4CGZ6CxfpLw==
X-Received: by 2002:a05:6402:388d:b0:42a:ba9f:f85c with SMTP id
 fd13-20020a056402388d00b0042aba9ff85cmr3026351edb.292.1652716594780; 
 Mon, 16 May 2022 08:56:34 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 jx1-20020a170907760100b006f3ef214da1sm60758ejc.7.2022.05.16.08.56.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/23] rng: make opened property read-only
Date: Mon, 16 May 2022 17:55:55 +0200
Message-Id: <20220516155603.1234712-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

The ``opened=on`` option in the command line or QMP ``object-add`` either had
no effect (if ``opened`` was the last option) or caused errors.  The property
is therefore useless and was deprecated in 6.0; make it read-only now.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/rng.c                  | 18 ++----------------
 docs/about/deprecated.rst       |  9 ---------
 docs/about/removed-features.rst |  6 ++++++
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/backends/rng.c b/backends/rng.c
index 3757b04485..6c7bf64426 100644
--- a/backends/rng.c
+++ b/backends/rng.c
@@ -48,24 +48,10 @@ static bool rng_backend_prop_get_opened(Object *obj, Error **errp)
 
 static void rng_backend_complete(UserCreatable *uc, Error **errp)
 {
-    object_property_set_bool(OBJECT(uc), "opened", true, errp);
-}
-
-static void rng_backend_prop_set_opened(Object *obj, bool value, Error **errp)
-{
-    RngBackend *s = RNG_BACKEND(obj);
+    RngBackend *s = RNG_BACKEND(uc);
     RngBackendClass *k = RNG_BACKEND_GET_CLASS(s);
     Error *local_err = NULL;
 
-    if (value == s->opened) {
-        return;
-    }
-
-    if (!value && s->opened) {
-        error_setg(errp, QERR_PERMISSION_DENIED);
-        return;
-    }
-
     if (k->opened) {
         k->opened(s, &local_err);
         if (local_err) {
@@ -122,7 +108,7 @@ static void rng_backend_class_init(ObjectClass *oc, void *data)
 
     object_class_property_add_bool(oc, "opened",
                                    rng_backend_prop_get_opened,
-                                   rng_backend_prop_set_opened);
+                                   NULL);
 }
 
 static const TypeInfo rng_backend_info = {
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 2a022f2300..1f961b9e6e 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -90,15 +90,6 @@ the process listing. This is replaced by the new ``password-secret``
 option which lets the password be securely provided on the command
 line using a ``secret`` object instance.
 
-``opened`` property of ``rng-*`` objects (since 6.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The only effect of specifying ``opened=on`` in the command line or QMP
-``object-add`` is that the device is opened immediately, possibly before all
-other options have been processed.  This will either have no effect (if
-``opened`` was the last option) or cause errors.  The property is therefore
-useless and should not be specified.
-
 ``-display sdl,window_close=...`` (since 6.1)
 '''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 81ceeb9000..69498efd51 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -363,6 +363,12 @@ no effect (if ``loaded`` was the last option) or caused options to be
 effectively ignored as if they were not given.  The property is therefore
 useless and should simply be removed.
 
+``opened`` property of ``rng-*`` objects (removed in 7.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``opened=on`` option in the command line or QMP ``object-add`` either had
+no effect (if ``opened`` was the last option) or caused errors.  The property
+is therefore useless and should simply be removed.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
-- 
2.36.0


