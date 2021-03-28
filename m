Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24CF34BB36
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 07:49:06 +0200 (CEST)
Received: from localhost ([::1]:60018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQOIL-0005kQ-AG
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 01:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQOHR-0005Bo-PZ
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 01:48:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQOHP-0001Mq-01
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 01:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616910485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=69iIRcsVcOUjQj5njqBHETp9yLZPgwQi4cbf7H/ksiU=;
 b=YiuuzuvMkDDgrdMnwV2EVMTt6KV1hT4maJgC4W5YJcM25Ns4uD7v3FQkkwpfHAI5A1AK7I
 3R6H3C5dcyHGMN2Ntj25stMBqHBNYIQceFfUxOmV+g01OwUNlyhVauQ94v9zAKJFpFRsHm
 WqMuc8XXG87fQpI4NfnYars4kjLGpnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-aVOk-u0AMdyZoStfqy-kXg-1; Sun, 28 Mar 2021 01:48:03 -0400
X-MC-Unique: aVOk-u0AMdyZoStfqy-kXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A20910059C5;
 Sun, 28 Mar 2021 05:48:02 +0000 (UTC)
Received: from thuth.com (ovpn-112-12.ams2.redhat.com [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB87110016FC;
 Sun, 28 Mar 2021 05:48:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] Revert "qom: use qemu_printf to print help for user-creatable
 objects"
Date: Sun, 28 Mar 2021 07:47:58 +0200
Message-Id: <20210328054758.2351461-1-thuth@redhat.com>
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 6d9abb6de9cc53a508823db0283061824f2f98a2.

The real code change had already been added by Kevin's commit da0a932bbf
("hmp: QAPIfy object_add") and commit 6d9abb6d just added a duplicated
include statement as a left-over of a rebase.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qom/object_interfaces.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index c3324b0f86..b17aa57de1 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -17,7 +17,6 @@
 #include "qemu/qemu-print.h"
 #include "qapi/opts-visitor.h"
 #include "qemu/config-file.h"
-#include "qemu/qemu-print.h"
 
 bool user_creatable_complete(UserCreatable *uc, Error **errp)
 {
-- 
2.27.0


