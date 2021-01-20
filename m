Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD82C2FDA8D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 21:15:19 +0100 (CET)
Received: from localhost ([::1]:44114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Jss-0003O8-PO
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 15:15:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l2JqY-0002Pj-TF
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:12:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l2JqV-0000wQ-B7
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611173569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=opTe7ftw+kxB/ZHsLOePBOGCIyzHgYv/WmOszTfPBkE=;
 b=dK137Gp8N8/x+KyQc6/NVoVzHB88Jd7kMKrFvQh/CKHmASDBx65nXX4iItcv5Wpwz3e9kT
 I+r/wiDHSmKTw+b/OY2TeSc0xkBe6nLCp2VpZSyGdDarLE53VHgPhbjdfvBtOr0a9kHYVf
 6n5g11UF7JhGpGieBlQ/VNiwCIUPUVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-F8hHA1UKNT6VGgOXsW10SA-1; Wed, 20 Jan 2021 15:12:47 -0500
X-MC-Unique: F8hHA1UKNT6VGgOXsW10SA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D025D806675;
 Wed, 20 Jan 2021 20:12:45 +0000 (UTC)
Received: from localhost (ovpn-118-239.rdu2.redhat.com [10.10.118.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 853B92C166;
 Wed, 20 Jan 2021 20:12:41 +0000 (UTC)
Date: Wed, 20 Jan 2021 15:12:41 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/system: Deprecate `-cpu ...,+feature,-feature` syntax
Message-ID: <20210120201241.GR1227584@habkost.net>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119142207.3443123-2-david.edmondson@oracle.com>
 <20210119152056.GE1227584@habkost.net> <cuna6t499ir.fsf@dme.org>
 <20210119163052.GG1227584@habkost.net>
 <20210120100803.GF3015589@redhat.com> <cuny2gn7vzz.fsf@dme.org>
 <20210120161801.GP1227584@habkost.net>
 <20210120202134.4e0c4523@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210120202134.4e0c4523@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Edmondson <dme@dme.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ordering semantics of +feature/-feature is tricky and not
obvious, and it requires a custom option parser.  Deprecate that
syntax so we can eventually remove the custom -cpu option parser
and plus_features/minus_features global variables in i386.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/system/deprecated.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index e20bfcb17a4..2c4b8d4b78b 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -127,6 +127,20 @@ Drives with interface types other than ``if=none`` are for onboard
 devices.  It is possible to use drives the board doesn't pick up with
 -device.  This usage is now deprecated.  Use ``if=none`` instead.
 
+``-cpu`` ``+feature`` and ``-feature`` syntax (since 6.0.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``-cpu ...,+feature`` and ``-cpu ...,-feature`` syntax for
+enabling and disabling CPU features is deprecated.  The ``-cpu
+...,feature=on`` or ``-cpu ...,feature=off`` should be used
+instead.
+
+Note that the ordering semantics of ``-cpu ...,-feature,+feature``
+is different from ``-cpu ...,feature=off,feature=on``.  With the
+former, the feature got disabled because ``-feature`` had
+precedence, but with the latter the feature will be enabled
+because options are applied in the order they appear.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
-- 
2.28.0


