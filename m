Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA01A47D56A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 17:53:49 +0100 (CET)
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n04s8-0008Dy-Px
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 11:53:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n04qi-0006BR-AC
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:52:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n04qg-00069t-Nk
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640191938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7kpVMt4g0mgC1wokoDEYgjoBYgyyKNvMzldsKKZxGvo=;
 b=eB8SfgLMVLEvQbjiUnD4urXeoSgFsGT+E+WUzLt4k5JdQ9iq12tEbKBRl08Ipy590x1yMs
 BWmj/uVelxQW8NIRyeG4Wta/9ao8GWf4agMaN+loWlf5qU7Se0Gb0O2oBDZXt50jJy0gJ1
 GBtVuK7Tnoa5qfFCgQvmAET7X90nNPQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300--F_xATOnPYiJU5k0LEETsA-1; Wed, 22 Dec 2021 11:52:14 -0500
X-MC-Unique: -F_xATOnPYiJU5k0LEETsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07F14801B2A;
 Wed, 22 Dec 2021 16:52:14 +0000 (UTC)
Received: from localhost (unknown [10.39.194.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C98084A2B;
 Wed, 22 Dec 2021 16:52:09 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/3] Block patches
Date: Wed, 22 Dec 2021 17:52:05 +0100
Message-Id: <20211222165208.693159-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8c5f94cd4182753959c8be8de415120dc879d8f0:

  Merge tag 'pull-loong-20211221-2' of https://gitlab.com/rth7680/qemu into staging (2021-12-21 13:30:35 -0800)

are available in the Git repository at:

  https://gitlab.com/hreitz/qemu.git tags/pull-block-2021-12-22

for you to fetch changes up to 722f87df2545b308aec49b459b028f0802b4fd9e:

  iotests: check: multiprocessing support (2021-12-22 16:29:48 +0100)

----------------------------------------------------------------
Block patches:
- Added support to the iotests for running tests in several parallel
  jobs (using the new -j parameter)

----------------------------------------------------------------
Vladimir Sementsov-Ogievskiy (3):
  iotests/testrunner.py: add doc string for run_test()
  iotests/testrunner.py: move updating last_elapsed to run_tests
  iotests: check: multiprocessing support

 tests/qemu-iotests/check         |  4 +-
 tests/qemu-iotests/testrunner.py | 86 ++++++++++++++++++++++++++++----
 2 files changed, 80 insertions(+), 10 deletions(-)

-- 
2.33.1


