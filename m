Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB4D3F742A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:13:02 +0200 (CEST)
Received: from localhost ([::1]:57094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqq5-00020t-5J
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIqe0-0007in-Hm
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 07:00:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIqdy-0004gq-HK
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 07:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629889229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j0RTV8Hh0iBDy5JnMmpyX+BUoYiQG9rI1hcFrgfzs/Y=;
 b=Or+dp8eXbvhEgDyXCQ3DpS/0nSMOLH4JiVv3N2RRO0tCCD3c7IGhieSQi4sky92M+5jr84
 lfrQVMabvZo6caU8n1hlgshh4vTZbK6P6TP+SoqEWpr8g0qQWv563QCBdzW3epq6grJcxE
 JV0wkN/PMoNDfQNwnwU9N6paGLr+u2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-4NjA_cYzNEi-xR2vkp7nVQ-1; Wed, 25 Aug 2021 07:00:28 -0400
X-MC-Unique: 4NjA_cYzNEi-xR2vkp7nVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02A66108292A;
 Wed, 25 Aug 2021 11:00:27 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26EC83AC1;
 Wed, 25 Aug 2021 11:00:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/6] documentation updates
Date: Wed, 25 Aug 2021 13:00:12 +0200
Message-Id: <20210825110018.100913-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter!

The following changes since commit f9baca549e44791be0dd98de15add3d8452a8af0:

  Update version for v6.1.0 release (2021-08-24 17:59:52 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-08-25

for you to fetch changes up to 2e8801988282bf3a45b495efa8438509ff68056d:

  docs: make sphinx-build be quiet by default (2021-08-25 12:19:18 +0200)

----------------------------------------------------------------
* Various updates for the documentation

----------------------------------------------------------------
Daniel P. Berrangé (2):
      docs: split the CI docs into two files
      docs: make sphinx-build be quiet by default

Thomas Huth (1):
      docs/about/removed-features: Move some CLI options to the right location

Yanan Wang (3):
      docs/about: Remove the duplicated doc
      docs/about: Unify the subject format
      docs/about: Add the missing release record in the subject

 docs/about/deprecated.rst       |  56 +++++++-------
 docs/about/removed-features.rst | 157 ++++++++++++++++++---------------------
 docs/devel/ci-jobs.rst          |  40 ++++++++++
 docs/devel/ci-runners.rst       | 117 +++++++++++++++++++++++++++++
 docs/devel/ci.rst               | 159 +---------------------------------------
 docs/meson.build                |   2 +-
 6 files changed, 259 insertions(+), 272 deletions(-)
 create mode 100644 docs/devel/ci-jobs.rst
 create mode 100644 docs/devel/ci-runners.rst


