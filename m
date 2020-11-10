Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467D12AD487
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:16:17 +0100 (CET)
Received: from localhost ([::1]:33590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRdI-0003oL-8i
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZG-000765-NB
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZ8-0004b1-SQ
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=oVra6Nbx0dw8jybaz+sWMbUO1oNKcnYd7F8YQ5zX0gg=;
 b=h9Kfeob15diumSoP18wogSZW2Dg/jRa+kU39u0eY3k9AyJSavgPsOaHSRXmGuwTg3Hvuo7
 OiAvJO77i5MJRoqXdyGTXjHxIrZ3Rj7TiYgViCSw/J1bzSfiUaFCvdcM+7pYcpE/cgdXzV
 RMhcffiryqdfzMty2yxa7RQYpUVA7Yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-K71OOD-_OMG89kXbduWdcQ-1; Tue, 10 Nov 2020 06:11:55 -0500
X-MC-Unique: K71OOD-_OMG89kXbduWdcQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D144980364D;
 Tue, 10 Nov 2020 11:11:53 +0000 (UTC)
Received: from thuth.com (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80D4A1002C11;
 Tue, 10 Nov 2020 11:11:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/19] docs/fuzz: update fuzzing documentation post-meson
Date: Tue, 10 Nov 2020 12:11:22 +0100
Message-Id: <20201110111132.559399-10-thuth@redhat.com>
In-Reply-To: <20201110111132.559399-1-thuth@redhat.com>
References: <20201110111132.559399-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20201106180600.360110-3-alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/fuzzing.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index f19d75ceff..6096242d99 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -34,16 +34,16 @@ such as out-of-bounds accesses, use-after-frees, double-frees etc.::
 
 Fuzz targets are built similarly to system targets::
 
-    make i386-softmmu/fuzz
+    make qemu-fuzz-i386
 
-This builds ``./i386-softmmu/qemu-fuzz-i386``
+This builds ``./qemu-fuzz-i386``
 
 The first option to this command is: ``--fuzz-target=FUZZ_NAME``
 To list all of the available fuzzers run ``qemu-fuzz-i386`` with no arguments.
 
 For example::
 
-    ./i386-softmmu/qemu-fuzz-i386 --fuzz-target=virtio-scsi-fuzz
+    ./qemu-fuzz-i386 --fuzz-target=virtio-scsi-fuzz
 
 Internally, libfuzzer parses all arguments that do not begin with ``"--"``.
 Information about these is available by passing ``-help=1``
-- 
2.18.4


