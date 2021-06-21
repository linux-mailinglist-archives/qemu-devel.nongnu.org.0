Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2393AE987
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:58:44 +0200 (CEST)
Received: from localhost ([::1]:54236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJVj-00069u-TZ
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvJQ8-0007em-HK
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:52:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvJQ4-0004nL-SQ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624279971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cvId34HO/+QevfT9tSw4wcLZctWwMI+KHmiUpbDY+h4=;
 b=fxZ6UAHnS+6hJ/cWnLegEDxsSE895tBlwVH87tCjosvr2aDgN89hZB5dvoQGXDjDFab9CQ
 7NQei2DYwjaq01ORBHbGYXgCwH1AX/ThKJ4PzK3d3q29SemCRehH8QeaRhoH2vsqKUP2BI
 AXapwW596AvQhlnnVRVeTwdGC3T6WZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-G_H4sLn9PrOEOavdR_5nsg-1; Mon, 21 Jun 2021 08:52:49 -0400
X-MC-Unique: G_H4sLn9PrOEOavdR_5nsg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F2361922025;
 Mon, 21 Jun 2021 12:52:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ABD0179B3;
 Mon, 21 Jun 2021 12:52:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 29C5618000B4; Mon, 21 Jun 2021 14:52:34 +0200 (CEST)
Date: Mon, 21 Jun 2021 14:52:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 02/24] modules: collect module meta-data
Message-ID: <20210621125234.v5a2g3o2fft5nkcg@sirius.home.kraxel.org>
References: <20210618045353.2510174-1-kraxel@redhat.com>
 <20210618045353.2510174-3-kraxel@redhat.com>
 <919b1ff3-914b-a9a2-781f-d8ae244d71cf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <919b1ff3-914b-a9a2-781f-d8ae244d71cf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18, 2021 at 06:09:55PM +0200, Paolo Bonzini wrote:
> On 18/06/21 06:53, Gerd Hoffmann wrote:
> > +def find_command(src, target, compile_commands):
> > +    for command in compile_commands:
> > +        if command['file'] != src:
> > +            continue
> > +        if target != '' and command['command'].find(target) == -1:
> > +            continue
> 
> 
> Did you look into using extract_objects for this instead of looking for the
> target (which works, but yuck :))?

ninja: error: 'libui-curses.a.p/meson-generated_.._config-host.h.o', needed by 'ui-curses.modinfo.test', missing and no known rule to make it

Hmm, not sure where this comes from.  meson doesn't try to link
config-host.h.o into libui-curses.a, so why does extract_all_objects()
return it?

Test patch (incremental to this series) below.

take care,
  Gerd

From 5453683429d7b08b959e2cd63ee00fdccfb0c7b7 Mon Sep 17 00:00:00 2001
From: Gerd Hoffmann <kraxel@redhat.com>
Date: Mon, 21 Jun 2021 14:45:14 +0200
Subject: [PATCH] [wip] extract_all_objects experiments

---
 meson.build             | 7 +++++++
 scripts/modinfo-test.sh | 8 ++++++++
 2 files changed, 15 insertions(+)
 create mode 100755 scripts/modinfo-test.sh

diff --git a/meson.build b/meson.build
index 03bacca7cddb..8e7ccccf176c 100644
--- a/meson.build
+++ b/meson.build
@@ -2042,6 +2042,7 @@ target_modules += { 'accel' : { 'qtest': qtest_module_ss,
 
 modinfo_collect = find_program('scripts/modinfo-collect.py')
 modinfo_generate = find_program('scripts/modinfo-generate.py')
+modinfo_test = find_program('scripts/modinfo-test.sh')
 modinfo_files = []
 
 block_mods = []
@@ -2063,6 +2064,12 @@ foreach d, list : modules
                                        input: module_ss.sources(),
                                        capture: true,
                                        command: [modinfo_collect, '@INPUT@'])
+        custom_target(d + '-' + m + '.modinfo.test',
+                      output: d + '-' + m + '.modinfo.test',
+                      input: sl.extract_all_objects(recursive: true),
+                      capture: true,
+                      build_by_default: true, # to be removed when added to a target
+                      command: [modinfo_test, '@INPUT@'])
       endif
     else
       if d == 'block'
diff --git a/scripts/modinfo-test.sh b/scripts/modinfo-test.sh
new file mode 100755
index 000000000000..979c9cc9aeef
--- /dev/null
+++ b/scripts/modinfo-test.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+if test "$1" = "--target"; then
+    echo "# target $2"
+    shift;shift
+fi
+for item in "$@"; do
+    echo "# input $item"
+done
-- 
2.31.1


