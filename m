Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4E12C14E8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:59:05 +0100 (CET)
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHzM-000750-Sg
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpW-0006N6-5m
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpS-0007ny-F0
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7FX+kbypWV85WL1O4M25fwvWVVf918hZWSfr+1B+IvU=;
 b=PX2Ty27hdlbdsuXoPVB22PhKKLzfzmp6/UOVqY0mxbgJysacc0ZNwxSiVgZU7ZuCqVEaMu
 FGmdePF6jzagbZj+nWRtmv7SjNSD8mlOPdhx7EGfEuZ6ZLXLm7HFaG+9NY9iaGJSdVYCKk
 Dj7XJM9jR/X5tj9RmXn33mufrAJ8eJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-a_0i2zC1PuS_8TM_LaHdLg-1; Mon, 23 Nov 2020 14:48:46 -0500
X-MC-Unique: a_0i2zC1PuS_8TM_LaHdLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99039802B76
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:48:45 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ED515C1BB;
 Mon, 23 Nov 2020 19:48:45 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/19] qlit: Add more test literals to qlit_equal_qobject()
 test case
Date: Mon, 23 Nov 2020 14:48:08 -0500
Message-Id: <20201123194818.2773508-10-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a few examples of each qlit type, to make sure each one
compare as equal to itself, but not equal to the other values.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v3 of this series.
---
 tests/check-qlit.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/check-qlit.c b/tests/check-qlit.c
index b1cfbddb17..5a9260b93f 100644
--- a/tests/check-qlit.c
+++ b/tests/check-qlit.c
@@ -50,11 +50,27 @@ static void qlit_equal_qobject_test(void)
 {
     /* Each entry in the values[] array should be different from the others */
     QLitObject values[] = {
+        QLIT_QNULL,
+        QLIT_QBOOL(false),
+        QLIT_QBOOL(true),
+        QLIT_QNUM_INT(-1),
+        QLIT_QNUM_INT(0),
+        QLIT_QNUM_INT(1),
+        QLIT_QNUM_INT(INT64_MIN),
+        QLIT_QNUM_INT(INT64_MAX),
+        QLIT_QSTR(""),
+        QLIT_QSTR("foo"),
         qlit,
         QLIT_QDICT(((QLitDictEntry[]) {
             { "foo", QLIT_QNUM_INT(42) },
             { },
         })),
+        QLIT_QLIST(((QLitObject[]){
+            QLIT_QNUM_INT(-1),
+            QLIT_QNUM_INT(0),
+            QLIT_QNUM_INT(1),
+            { },
+        })),
     };
     int i;
     QObject *qobj = make_qobject();
-- 
2.28.0


