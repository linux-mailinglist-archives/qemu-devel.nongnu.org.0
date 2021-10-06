Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B32423E6B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:07:40 +0200 (CEST)
Received: from localhost ([::1]:56394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6e2-0003NS-3T
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mY6YX-0004pF-7p
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mY6YP-000581-Ve
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633525307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3sqe6yJLE8geIAIscq/OslgNGw5Mo6jge7+rKQifjsg=;
 b=BBao+aHzGw7qzqvT6LADjQtN01kB7gYBxe3RBMw88b3oShzX7MeQVdqpEzfSOBL77FB7CD
 ktVmuF4upw4hAP2GmtzptuRPPRn8JvPkjRJEGh/Ifj+ZQz80H0rlh3gKybDpBMs44zDqZE
 FatvMXsRZTFxAyw5rbGhgylCieV0cyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-MhWr4Z5CPa69KG1q7uQCOg-1; Wed, 06 Oct 2021 09:01:45 -0400
X-MC-Unique: MhWr4Z5CPa69KG1q7uQCOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79EB5802C99;
 Wed,  6 Oct 2021 13:01:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B25CC60C13;
 Wed,  6 Oct 2021 13:01:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] pylint: fix new errors and warnings
Date: Wed,  6 Oct 2021 09:00:58 -0400
Message-Id: <20211006130100.389521-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some warnings and errors that we either miss or
are new in pylint. Anyways, test 297 of qemu-iotests fails
because of that, so we need to fix it.

All these fixes involve just indentation or additional spaces
added.

Emanuele Giuseppe Esposito (2):
  pylint: fix errors and warnings from qemu-tests test 297
  qemu-iotests: fix image-fleecing pylint errors

 tests/qemu-iotests/129                  |  9 ++---
 tests/qemu-iotests/310                  | 16 ++++-----
 tests/qemu-iotests/check                | 11 +++---
 tests/qemu-iotests/iotests.py           |  7 ++--
 tests/qemu-iotests/tests/image-fleecing | 47 +++++++++++++++----------
 5 files changed, 51 insertions(+), 39 deletions(-)

-- 
2.27.0


