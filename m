Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BCD57B234
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 10:00:50 +0200 (CEST)
Received: from localhost ([::1]:55112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE4dV-0003iw-6Q
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 04:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oE4b1-00086a-83
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:58:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oE4ay-0007oZ-Bp
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658303883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=NLtDi5LbH8uVLwPF71I7WOTjUouKv8eDL9GyNjQsn0s=;
 b=gPzXrCu7XiUbx/vkfINLXV9EIIB5o06elQSVxCfiNnoMw60q91QYEr1mWMUgQpt0kiuNZG
 3UrI1O3GB8C832dRC+w4Fc0fRKvxBXx17u/WIwqNqzpotMe+51jlcFbDAMBrC56XuHtr6I
 fJUgC+AibTp+ulzgXnMPra5CaKnTf/0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-oa_ok-KwMB-NVP4UaLyPsg-1; Wed, 20 Jul 2022 03:58:00 -0400
X-MC-Unique: oa_ok-KwMB-NVP4UaLyPsg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8AD7805AF5;
 Wed, 20 Jul 2022 07:57:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 450CC492CA5;
 Wed, 20 Jul 2022 07:57:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/3] s390x fixes
Date: Wed, 20 Jul 2022 09:57:53 +0200
Message-Id: <20220720075756.760404-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

The following changes since commit b8bb9bbf4695b89bbdca702a054db0a7a2c8ff2b:

  Merge tag 'pull-ppc-20220718' of https://gitlab.com/danielhb/qemu into staging (2022-07-18 19:27:25 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-07-20

for you to fetch changes up to 23f13e1986e2ed3a02b65c0bf376c8c61d04ae7a:

  tests/tcg/s390x: test signed vfmin/vfmax (2022-07-19 12:49:56 +0200)

----------------------------------------------------------------
* Fixes for s390x floating point vector instructions

----------------------------------------------------------------
Ilya Leoshkevich (3):
      target/s390x: fix handling of zeroes in vfmin/vfmax
      target/s390x: fix NaN propagation rules
      tests/tcg/s390x: test signed vfmin/vfmax

 target/s390x/tcg/vec_fpu_helper.c |   4 +-
 tests/tcg/s390x/vfminmax.c        | 411 ++++++++++++++++++++++++++++++++++++++
 fpu/softfloat-specialize.c.inc    |   3 +-
 tests/tcg/s390x/Makefile.target   |   7 +
 4 files changed, 422 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/s390x/vfminmax.c


