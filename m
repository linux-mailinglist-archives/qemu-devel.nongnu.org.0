Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABF66412D2
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 01:54:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1Gm6-0002QO-8H; Fri, 02 Dec 2022 19:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1p1Gm2-0002Ps-9S
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 19:52:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1p1Gm0-0004Az-LP
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 19:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670028775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFATf7ibigp5RSQXIRGWTLIz/B772FsFq5ysDx2v490=;
 b=DiSILEjU1jqApbgRFTCaq6ZCRETBqncf3OKTOvQnNOywPU8rNqGOiMUgzu9cxDI+4JDonp
 gImexP6KomYs9QMWTYQm6f6LKpxMW0j5F1T61c1KrSAK2Bgi7VEBgyPRH6ZNhGFo+K/e9D
 btVRxJtOYjQh1NIKLbv9D1YyXRG8N9Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-r0svI6tSOq2oM5xeqUFjYw-1; Fri, 02 Dec 2022 19:52:52 -0500
X-MC-Unique: r0svI6tSOq2oM5xeqUFjYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E050811E87;
 Sat,  3 Dec 2022 00:52:52 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C785B40C94EC;
 Sat,  3 Dec 2022 00:52:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH 1/3] Python: fix flake8 config
Date: Fri,  2 Dec 2022 19:52:32 -0500
Message-Id: <20221203005234.620788-2-jsnow@redhat.com>
In-Reply-To: <20221203005234.620788-1-jsnow@redhat.com>
References: <20221203005234.620788-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Newer flake8 versions are a bit pickier about the config file, and my
in-line comment confuses the parser. Fix it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/python/setup.cfg b/python/setup.cfg
index c2c61c75190..c0d7bab168e 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -71,7 +71,8 @@ console_scripts =
     qmp-tui = qemu.qmp.qmp_tui:main [tui]
 
 [flake8]
-extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
+# Prefer pylint's bare-except checks to flake8's
+extend-ignore = E722
 exclude = __pycache__,
 
 [mypy]
-- 
2.38.1


