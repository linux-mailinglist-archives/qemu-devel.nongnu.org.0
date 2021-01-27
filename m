Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE73064C6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 21:08:47 +0100 (CET)
Received: from localhost ([::1]:47120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4r7O-0003Ug-Cm
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 15:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4qxE-0003Ba-OH
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:58:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4qxD-0007ao-3g
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611777494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bY5HnTF+IqNY0vdDj/nDJ5Y2mO49iPJQXGruQftRCRE=;
 b=dg7BcTM1OPqb30TjJrNiS2oUySdLJOrH+nJMyIythLzZZ4D6S4duzagovvv6rSKVXKKe8O
 S56FdjKdjck6bl9HLf77goCB1Jixrd5aleu+w68d22hGIEFk9n4kq5HNzHHOY6zBF5HnVc
 a2VmCuwctwmO8sLAN+uCU2GmGHlKUSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-zNXl4p_NOBGfauj4oPqTng-1; Wed, 27 Jan 2021 14:58:12 -0500
X-MC-Unique: zNXl4p_NOBGfauj4oPqTng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09614802B42;
 Wed, 27 Jan 2021 19:58:11 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E90610016FA;
 Wed, 27 Jan 2021 19:58:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 8/8] iotests: rename and move 169 and 199 tests
Date: Wed, 27 Jan 2021 20:57:53 +0100
Message-Id: <20210127195753.59773-9-kwolf@redhat.com>
In-Reply-To: <20210127195753.59773-1-kwolf@redhat.com>
References: <20210127195753.59773-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Rename bitmaps migration tests and move them to tests subdirectory to
demonstrate new human-friendly test naming.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210125185056.129513-7-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test}   | 0
 .../{199.out => tests/migrate-bitmaps-postcopy-test.out}          | 0
 tests/qemu-iotests/{169 => tests/migrate-bitmaps-test}            | 0
 tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out}    | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test} (100%)
 rename tests/qemu-iotests/{199.out => tests/migrate-bitmaps-postcopy-test.out} (100%)
 rename tests/qemu-iotests/{169 => tests/migrate-bitmaps-test} (100%)
 rename tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out} (100%)

diff --git a/tests/qemu-iotests/199 b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
similarity index 100%
rename from tests/qemu-iotests/199
rename to tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
diff --git a/tests/qemu-iotests/199.out b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test.out
similarity index 100%
rename from tests/qemu-iotests/199.out
rename to tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test.out
diff --git a/tests/qemu-iotests/169 b/tests/qemu-iotests/tests/migrate-bitmaps-test
similarity index 100%
rename from tests/qemu-iotests/169
rename to tests/qemu-iotests/tests/migrate-bitmaps-test
diff --git a/tests/qemu-iotests/169.out b/tests/qemu-iotests/tests/migrate-bitmaps-test.out
similarity index 100%
rename from tests/qemu-iotests/169.out
rename to tests/qemu-iotests/tests/migrate-bitmaps-test.out
-- 
2.29.2


