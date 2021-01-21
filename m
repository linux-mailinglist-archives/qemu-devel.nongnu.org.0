Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E642FDFAD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 03:46:48 +0100 (CET)
Received: from localhost ([::1]:49396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Pzj-0004UP-TQ
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 21:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Pqi-0001gW-8m
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Pqb-0003ko-S0
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611196641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N5YLT0k9DaZvqzsexzzvyqxJLb1hS/gY2dYrABdX+rI=;
 b=ZjRxKBAYSdzXXoMYkwqNvZQk/XWxnDs+iF5/Udx9S8ZRl0Md8mMqqCA94fV5cxSqFvsL43
 FXXXGXCKMBO7Wl2Aa7OwdHloK7KPQXLLeMfcHSLj1qJDCxeDgrKvJ3BYcrjpNLTVdG5GuR
 TsE+nYv5SVVIsc/pLzz8QjFgQxZ8rXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-NzKbIQfJNGuqgtleOB2B0w-1; Wed, 20 Jan 2021 21:37:18 -0500
X-MC-Unique: NzKbIQfJNGuqgtleOB2B0w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C69FB180A093;
 Thu, 21 Jan 2021 02:37:17 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83C97629DB;
 Thu, 21 Jan 2021 02:37:17 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/13] iotests: make tests executable
Date: Wed, 20 Jan 2021 20:36:52 -0600
Message-Id: <20210121023657.1186241-9-eblake@redhat.com>
In-Reply-To: <20210121023657.1186241-1-eblake@redhat.com>
References: <20210121023657.1186241-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

All other test files are executable. Fix these.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210116134424.82867-5-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/283 | 0
 tests/qemu-iotests/298 | 0
 tests/qemu-iotests/299 | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 tests/qemu-iotests/283
 mode change 100644 => 100755 tests/qemu-iotests/298
 mode change 100644 => 100755 tests/qemu-iotests/299

diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
old mode 100644
new mode 100755
diff --git a/tests/qemu-iotests/298 b/tests/qemu-iotests/298
old mode 100644
new mode 100755
diff --git a/tests/qemu-iotests/299 b/tests/qemu-iotests/299
old mode 100644
new mode 100755
-- 
2.30.0


