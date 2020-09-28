Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F6027AB88
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 12:10:42 +0200 (CEST)
Received: from localhost ([::1]:36210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMq7F-0002Z5-3G
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 06:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMq65-00025d-5A
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 06:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMq62-0000uz-MQ
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 06:09:28 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601287764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PMpNnk/pXFJkoOhejy4Bbb5Nl/B2407B51lNRhqdXWo=;
 b=bVFpve0D7t57w4U1a4u4F2XFt9Eav1evVCHW8rL0HhE9ywhK4/PcEOStVUn1CfG/nMNAle
 XGigh7YwFAeSzuCQaSZEF/ICTGRfWQ/aL9yIRjLERVgQkOd+UXxVhNnxdKS2go52GeoyIp
 YijBoaufGsq//SpKxZLBt2oxo1FZm+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-1J4vY4vhMhWJYC9ysWqCzw-1; Mon, 28 Sep 2020 06:09:21 -0400
X-MC-Unique: 1J4vY4vhMhWJYC9ysWqCzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F98D18BE185
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 10:09:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD5675C1A3;
 Mon, 28 Sep 2020 10:09:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AAF633642; Mon, 28 Sep 2020 12:09:05 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/venv: force compatible
 avocado-framework-plugin-result-html version
Date: Mon, 28 Sep 2020 12:09:02 +0200
Message-Id: <20200928100902.28638-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:29:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.576,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this avocado doesn't start in case an incompatible
avocado-framework-plugin-result-html version happens to be installed
in system (/usr/lib) or user ($HOME/.local/lib) directory.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/requirements.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/requirements.txt b/tests/requirements.txt
index 036691c92215..a78cc5c19972 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -2,4 +2,5 @@
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
 avocado-framework==81.0
+avocado-framework-plugin-result-html==81.0
 pycdlib==1.9.0
-- 
2.27.0


