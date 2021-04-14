Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A37635F224
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 13:23:05 +0200 (CEST)
Received: from localhost ([::1]:54512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWdbs-0002Ao-H7
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 07:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWdZN-0000Ol-0X
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:20:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWdZK-0001dC-GC
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618399225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UqWbxRC1VSuFtn1Taf6aQOoDT2aAa3G7zcexv0nXVZ4=;
 b=EnSr6/IVMI0j/FswDHHu5CDHBLJ+SJi5Dg+NLEgiV6rXCjXlB8vfufl6rGe3WuuUmbtJWZ
 hhXsIGMYSARMr1GwDUYpL/OcnMcn4+vXoW3iHRMhbMzq1wc19pA6+qg8vKRdlyqoV0lLnW
 eCYg7Nfj8bWl87zklq4/6sgrrwn57nM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-u7bUFg5EMsezQU39V5T5aQ-1; Wed, 14 Apr 2021 07:20:24 -0400
X-MC-Unique: u7bUFg5EMsezQU39V5T5aQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E325B189C440;
 Wed, 14 Apr 2021 11:20:22 +0000 (UTC)
Received: from thuth.com (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3D4A101E24F;
 Wed, 14 Apr 2021 11:20:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-6.1 3/4] qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in
 common code
Date: Wed, 14 Apr 2021 13:20:03 +0200
Message-Id: <20210414112004.943383-4-thuth@redhat.com>
In-Reply-To: <20210414112004.943383-1-thuth@redhat.com>
References: <20210414112004.943383-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ObjectType enum and ObjectOptions are included from qapi-types-qom.h
into common code. We should not use target-specific config switches like
CONFIG_VIRTIO_CRYPTO here, since this is not defined in common code and
thus the enum will look differently between common and target specific
code. For this case, it's hopefully enough to check for CONFIG_VHOST_CRYPTO
only (which is a host specific config switch, i.e. it's the same on all
targets).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qapi/qom.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index db5ac419b1..cd0e76d564 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -752,7 +752,7 @@
     'cryptodev-backend',
     'cryptodev-backend-builtin',
     { 'name': 'cryptodev-vhost-user',
-      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
+      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
     'dbus-vmstate',
     'filter-buffer',
     'filter-dump',
@@ -809,7 +809,7 @@
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
-                                      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
+                                      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
       'dbus-vmstate':               'DBusVMStateProperties',
       'filter-buffer':              'FilterBufferProperties',
       'filter-dump':                'FilterDumpProperties',
-- 
2.27.0


