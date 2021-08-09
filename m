Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CEB3E4A78
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 19:05:02 +0200 (CEST)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD8hx-000355-9j
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 13:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD8gU-000177-PT
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:03:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD8gQ-0005x8-4d
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628528603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BRlEOzq3lyQz7+dRah5T7Z1OHydG5XinnZbG9eVhnF8=;
 b=ZuLIuA5YoBYlHmfxkt8S/VgMIQUCjkWox33yjrqhrlHxSnLrBt6bPvTPZIWXLETRu3y/Gy
 A2hBn/9tzpa31dtMdQDTTWHctpOTBtLUWReO1pI8be4HATNkmVg3tDQZ6GAV6EATF6GBKd
 p3zRXz2cajsExYOOc4aSaCCerIbgK5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-zNKkJKKxO_2DPasaMwRqYw-1; Mon, 09 Aug 2021 13:03:22 -0400
X-MC-Unique: zNKkJKKxO_2DPasaMwRqYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB0D8185302D;
 Mon,  9 Aug 2021 17:03:21 +0000 (UTC)
Received: from localhost (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83862992E;
 Mon,  9 Aug 2021 17:03:21 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/2] Block patches for 6.1-rc3
Date: Mon,  9 Aug 2021 19:03:17 +0200
Message-Id: <20210809170319.740284-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.702, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=unavailable autolearn_force=no
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
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

Let me prefix this by saying that it's me, Max.  I've changed my name
and email address.  I understand freeze may not be the best of times for
this, but it looks like I can no longer send mails from the mreitz@
address for now (only receive them).

I've tried to create and sign the tag as Max, so I hope this pull
request won't run into any issues from that perspective.

(For the future, I'll create a new key and hope signing it with my old
key will make it sufficiently trustworthy...)


The following changes since commit 632eda54043d6f26ff87dac16233e14b4708b967:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-08-09 11:04:27 +0100)

are available in the Git repository at:

  https://github.com/XanClic/qemu.git tags/pull-block-2021-08-09

for you to fetch changes up to a6d2bb25cf945cd16f29a575055c6f1a1f9cf6c9:

  tests: filter out TLS distinguished name in certificate checks (2021-08-09 17:32:43 +0200)

----------------------------------------------------------------
Block patches for 6.1-rc3:
- Build fix for FUSE block exports
- iotest 233 fix

----------------------------------------------------------------
Daniel P. Berrangé (1):
  tests: filter out TLS distinguished name in certificate checks

Fabrice Fontaine (1):
  block/export/fuse.c: fix musl build

 block/export/fuse.c              | 8 ++++++--
 tests/qemu-iotests/233           | 2 +-
 tests/qemu-iotests/233.out       | 4 ++--
 tests/qemu-iotests/common.filter | 5 +++++
 4 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.31.1


