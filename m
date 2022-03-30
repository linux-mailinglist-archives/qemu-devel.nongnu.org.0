Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616FF4ECC88
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:41:12 +0200 (CEST)
Received: from localhost ([::1]:51498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdFn-00019y-GW
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:41:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZczh-0006Uw-RT
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:24:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZczg-0005F4-AB
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648664671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ecEnAytz97GNEaeG1fDU5hRmSKyXcO0LY0ykkInpkrM=;
 b=hIdQGz5CKNguSS1X5vXOOVwB+LWkTTxFQPwcA0goWsgiBoklaXAq22qTpH0vAeZnWyxGlC
 Hbks4/W9mS5QDKYXN4F9BN9XJGJHb7D2zXgsyi7ZFnQGsMQHncY7mUUF6PVn4UoyEwz3S7
 WiC/5+qtMqn6FNRQzkhl1kd37/6sdOw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-8OeYYyJVM_2yP-Spwezhug-1; Wed, 30 Mar 2022 14:24:29 -0400
X-MC-Unique: 8OeYYyJVM_2yP-Spwezhug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F321D80348D
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 18:24:28 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1FA92166B3F;
 Wed, 30 Mar 2022 18:24:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 10/13] docs: add versioning policy to README
Date: Wed, 30 Mar 2022 14:24:21 -0400
Message-Id: <20220330182424.3438872-11-jsnow@redhat.com>
In-Reply-To: <20220330182424.3438872-1-jsnow@redhat.com>
References: <20220330182424.3438872-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The package is in an alpha state, but there's a method to the madness.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 README.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/README.rst b/README.rst
index 8593259..88efe84 100644
--- a/README.rst
+++ b/README.rst
@@ -154,6 +154,27 @@ fail. These checks use their own virtual environments and won't pollute
 your working space.
 
 
+Stability and Versioning
+------------------------
+
+This package uses a major.minor.micro SemVer versioning, with the
+following additional semantics during the alpha/beta period (Major
+version 0):
+
+This package treats 0.0.z versions as "alpha" versions. Each micro
+version update may change the API incompatibly. Early users are advised
+to pin against explicit versions, but check for updates often.
+
+A planned 0.1.z version will introduce the first "beta", whereafter each
+micro update will be backwards compatible, but each minor update will
+not be. The first beta version will be released after legacy.py is
+removed, and the API is tentatively "stable".
+
+Thereafter, normal SemVer/PEP440 rules will apply; micro updates will
+always be bugfixes, and minor updates will be reserved for backwards
+compatible feature changes.
+
+
 Changelog
 ---------
 
-- 
2.34.1


