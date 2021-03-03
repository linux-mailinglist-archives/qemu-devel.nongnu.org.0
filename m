Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE46F32B564
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 08:11:02 +0100 (CET)
Received: from localhost ([::1]:51186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHLew-00005F-15
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 02:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHLcE-0007DV-Kp
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 02:08:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHLcA-0000ij-9j
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 02:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614755288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1iuLKGlke/9lFojcdEYu+8HySqQIErw8L76NyDDYZjk=;
 b=H07sWFnyYleF70FMvGk3u3G3x0HKnjn22WOO41+E32yzCb+4OZs858Hc3ROywZ9IQIB8R6
 3xdzrhU/LUSjmNR4h+X2OVDByf+Myq0Ivq9AsJLrtllEUa1OHchiJXxxBiPfeQK8NwlgE1
 puIEFPW1GyY/az3myfDmoaFYzDkU9eM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-385tRujPMOKbgBempZb4uw-1; Wed, 03 Mar 2021 02:08:05 -0500
X-MC-Unique: 385tRujPMOKbgBempZb4uw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E03880196E;
 Wed,  3 Mar 2021 07:08:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-154.ams2.redhat.com
 [10.36.112.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A83FD5D9D7;
 Wed,  3 Mar 2021 07:07:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0515D18000A7; Wed,  3 Mar 2021 08:07:51 +0100 (CET)
Date: Wed, 3 Mar 2021 08:07:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210303070750.etddrd7duu5ep77l@sirius.home.kraxel.org>
References: <20210222125548.346166-1-pasic@linux.ibm.com>
 <20210224113617.6v42bfxyzvw6733h@sirius.home.kraxel.org>
 <20210224174634.58a1ecda.pasic@linux.ibm.com>
 <20210225221451.5c20c42d.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210225221451.5c20c42d.pasic@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> The only approaches I can think of to make type_register_mayfail()
> "work" involve adding a dependency check in type_register_internal()
> before the call to type_table_add() is made. This can "work" for modules,
> because for types loaded from we can hope, that all dependencies are
> already, as modules are loaded relatively late.

Yes, for modules the lazy binding should not be needed and we should be
able to check for the parent at registration time.  module.c keeps track
of whenever phase1 init for builtin qom objects did happen already, so
we can use that instead of passing mayfail through a bunch of function
calls.  Quick & dirty test hack below.

BTW: "qemu-system-x86_64 -device help" tries to load all modules and is
a nice test case ;)

HTH,
  Gerd

commit 75ca3012e626318b562bcb51ecdc34400e25f2d0
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Tue Mar 2 16:26:39 2021 +0100

    [hack] modular type init check

diff --git a/qom/object.c b/qom/object.c
index 491823db4a2d..01785e73f495 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -135,11 +135,22 @@ static TypeImpl *type_new(const TypeInfo *info)
     return ti;
 }
 
+/* HACK: util/module.c */
+extern bool modules_init_done[MODULE_INIT_MAX];
+static TypeImpl *type_get_by_name(const char *name);
+
 static TypeImpl *type_register_internal(const TypeInfo *info)
 {
     TypeImpl *ti;
     ti = type_new(info);
 
+    if (modules_init_done[MODULE_INIT_QOM]) {
+        if (ti->parent && !type_get_by_name(ti->parent)) {
+            g_free(ti);
+            return NULL;
+        }
+    }
+
     type_table_add(ti);
     return ti;
 }
diff --git a/util/module.c b/util/module.c
index cbe89fede628..b7b519eed62c 100644
--- a/util/module.c
+++ b/util/module.c
@@ -34,7 +34,7 @@ typedef struct ModuleEntry
 typedef QTAILQ_HEAD(, ModuleEntry) ModuleTypeList;
 
 static ModuleTypeList init_type_list[MODULE_INIT_MAX];
-static bool modules_init_done[MODULE_INIT_MAX];
+bool modules_init_done[MODULE_INIT_MAX];
 
 static ModuleTypeList dso_init_list;
 


