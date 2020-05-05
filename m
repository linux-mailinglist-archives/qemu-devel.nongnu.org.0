Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38261C567E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 15:14:20 +0200 (CEST)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVxOt-00040a-S0
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 09:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jVxAG-0001v4-MP
 for qemu-devel@nongnu.org; Tue, 05 May 2020 08:59:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23699
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jVxAE-0001Fo-Lf
 for qemu-devel@nongnu.org; Tue, 05 May 2020 08:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588683550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iBJc/5fhV3AkeEoXdifV7nDHIfYCiL4PhzT8qrtsjdQ=;
 b=Ffvheymo9gDtHnl15u8iAzc5VkKsI1yMs5gelXftZ+w51gWZsc/8tC7R0WMrJyGulYYcp5
 3CnZdCpO7DBlul/rui3JZIuAaUb6p/q3UiYj5GKNW3MccvK4XYRdHjkXq/5oMVwjimOemn
 +kwqo6MM5GDom4gsPvPgF1K9YBSWrAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-byxQWoV6OGSpL3iLnDdU_A-1; Tue, 05 May 2020 08:59:07 -0400
X-MC-Unique: byxQWoV6OGSpL3iLnDdU_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82654107ACF4;
 Tue,  5 May 2020 12:59:06 +0000 (UTC)
Received: from localhost (ovpn-113-206.ams2.redhat.com [10.36.113.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 254662DE9C;
 Tue,  5 May 2020 12:59:05 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 17/24] qcow2: Tweak comment about bitmaps vs. resize
Date: Tue,  5 May 2020 14:58:19 +0200
Message-Id: <20200505125826.1001451-18-mreitz@redhat.com>
In-Reply-To: <20200505125826.1001451-1-mreitz@redhat.com>
References: <20200505125826.1001451-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 03:48:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

Our comment did not actually match the code.  Rewrite the comment to
be less sensitive to any future changes to qcow2-bitmap.c that might
implement scenarios that we currently reject.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200428192648.749066-4-eblake@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 3e8b3d022b..ad934109a8 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3999,7 +3999,7 @@ static int coroutine_fn qcow2_co_truncate(BlockDriver=
State *bs, int64_t offset,
         goto fail;
     }
=20
-    /* cannot proceed if image has bitmaps */
+    /* See qcow2-bitmap.c for which bitmap scenarios prevent a resize. */
     if (qcow2_truncate_bitmaps_check(bs, errp)) {
         ret =3D -ENOTSUP;
         goto fail;
--=20
2.26.2


