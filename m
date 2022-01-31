Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1914A4CF6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:18:08 +0100 (CET)
Received: from localhost ([::1]:53926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEaJb-0007cu-4R
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEa6e-0001Nt-EJ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEa6Z-0007QI-VI
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643648676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hx721CCZS3t1vuJ4TwbDK1CG8hVugJZUacHYTAHQm8I=;
 b=FgYU5goY51JWIag+oOF6nEhj4eaiUJmxZTbZGNAnXvlieqFZFb5wqhl7XoLIRDW1I1eDSj
 dZFkL1KoSaiUlg0NSMMUn2efwlTYZ10PpUjEWnmqeorGWCAaqChK5U1J1ttKCjhBxVeHGX
 EqKtGaV4Vr2SL3vrIB/BY6NOcM3Md/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-lwqcLxy3OC-IrDFwWFq-SA-1; Mon, 31 Jan 2022 12:04:35 -0500
X-MC-Unique: lwqcLxy3OC-IrDFwWFq-SA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C18DD85C872;
 Mon, 31 Jan 2022 17:04:20 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1EEF10A48D5;
 Mon, 31 Jan 2022 17:04:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/5] docs: Pass disabled configure options to sphinx
Date: Mon, 31 Jan 2022 18:04:07 +0100
Message-Id: <20220131170411.125198-2-kwolf@redhat.com>
In-Reply-To: <20220131170411.125198-1-kwolf@redhat.com>
References: <20220131170411.125198-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 timao@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Man pages and other documentation should only contain things that are
actually available in this build. In order to conditionally build
documentation depending on the build configuration, pass the
configuration to sphinx as tags.

The tags are negative so that building documentation from outside of
meson (in particular for things like readthedocs) without any tags set
results in the full documentation rather than disabling everything that
is optional.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/meson.build | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/meson.build b/docs/meson.build
index 57b28a3146..3220da4c15 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -37,6 +37,16 @@ endif
 if build_docs
   SPHINX_ARGS += ['-Dversion=' + meson.project_version(), '-Drelease=' + config_host['PKGVERSION']]
 
+  foreach key: config_host_data.keys()
+    if not key.startswith('CONFIG_')
+      continue
+    endif
+    if '@0@'.format(config_host_data.get(key)) in ['0', 'false']
+      tag = 'DISABLE_' + key.substring(7)
+      SPHINX_ARGS += ['-t', tag]
+    endif
+  endforeach
+
   have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
 
   man_pages = {
-- 
2.31.1


