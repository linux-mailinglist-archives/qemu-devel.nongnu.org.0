Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C132A4A52
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 16:49:22 +0100 (CET)
Received: from localhost ([::1]:40340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZyYj-0006MN-Fb
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 10:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kZyDP-0000gq-Gi
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:27:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kZyDN-0007NN-Ji
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604417236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qb/cfZt+z9g9DlL3dBWL+6aqDNMnPXMsS3T2000AVt8=;
 b=QkXIQtsWmdGFu52Ajnz/eMAzJDc4JbZ7ajXfqaTPcT0OcJyT6UUAANAGvrNeylIh9vgKt6
 NFEJNgMUsetQceQFu7Ca5J0VBeUW2dcyA2RLts9D4YoFjlCoRh42p752wplgr73V0t/sUa
 fT0PJnv+AfX1Sfj0vhSleGLFasAH9JM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-N3cTvQUjNK6mR0JaaVea2w-1; Tue, 03 Nov 2020 10:27:12 -0500
X-MC-Unique: N3cTvQUjNK6mR0JaaVea2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8A3357057;
 Tue,  3 Nov 2020 15:27:11 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-164.ams2.redhat.com [10.36.113.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D352D6EF70;
 Tue,  3 Nov 2020 15:27:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 4/6] iotests: Disable unsubscriptable-object in pylint
Date: Tue,  3 Nov 2020 16:26:56 +0100
Message-Id: <20201103152658.119563-5-kwolf@redhat.com>
In-Reply-To: <20201103152658.119563-1-kwolf@redhat.com>
References: <20201103152658.119563-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When run with Python 3.9, pylint incorrectly warns about things like
Optional[foo] because it doesn't recognise Optional as unsubscriptable.
This is a known pylint bug:

    https://github.com/PyCQA/pylint/issues/3882

Just disable this check to get rid of the warnings.

Disabling this shouldn't make us miss any real bug because mypy also
has a similar check ("... is not indexable").

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201027163806.290960-3-kwolf@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/pylintrc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
index 5481afe528..cd3702e23c 100644
--- a/tests/qemu-iotests/pylintrc
+++ b/tests/qemu-iotests/pylintrc
@@ -17,6 +17,8 @@ disable=invalid-name,
         too-many-lines,
         too-many-locals,
         too-many-public-methods,
+        # pylint warns about Optional[] etc. as unsubscriptable in 3.9
+        unsubscriptable-object,
         # These are temporary, and should be removed:
         missing-docstring,
 
-- 
2.28.0


