Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5A86F40F9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:19:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptn61-0004jv-RL; Tue, 02 May 2023 06:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptn5z-0004ji-Pi
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:18:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptn5y-0000KL-Ap
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683022733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E3ouHYDt8h+e4C4Q/9DdOWbhDEa1ulgfHnFppSgNB2Y=;
 b=MbFpjI+rWBjBj6rGPl5GOVetyB0Hf2oaQEuOW+2sXFpZWQy0T09WiIRe3Hl8iSPiZO47R6
 a1zxgUVh9bx1QRVlrdevl+TM+c8cV54gvv/7Qhv8hnsWcShv1yKeHxdF7wWM8QuP78TYN7
 df7WBoVSQ6X/d4rMcQj3VUDn0Iu6Mr8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-sk2W6h-fMdOabYKQovx-jQ-1; Tue, 02 May 2023 06:18:52 -0400
X-MC-Unique: sk2W6h-fMdOabYKQovx-jQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0175811E7E;
 Tue,  2 May 2023 10:18:51 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AA57C15BAD;
 Tue,  2 May 2023 10:18:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 0/3] Various fixes
Date: Tue,  2 May 2023 12:18:46 +0200
Message-Id: <20230502101849.1655453-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

 Hi Richard!

The following changes since commit 7c18f2d663521f1b31b821a13358ce38075eaf7d:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-04-29 23:07:17 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-05-02

for you to fetch changes up to 7915bd06f25e1803778081161bf6fa10c42dc7cd:

  async: avoid use-after-free on re-entrancy guard (2023-05-02 10:03:26 +0200)

----------------------------------------------------------------
* Fix the failing FreeBSD job in our CI
* Run the tpm-tis-i2c-test only if TCG is enabled
* Fix a use-after-free problem in the new reentracy checking code

----------------------------------------------------------------
Alexander Bulekov (1):
      async: avoid use-after-free on re-entrancy guard

Fabiano Rosas (1):
      tests/qtest: Restrict tpm-tis-i2c-test to CONFIG_TCG

Thomas Huth (1):
      tests/qtest: Disable the spice test of readconfig-test on FreeBSD

 tests/qtest/readconfig-test.c |  6 +++---
 util/async.c                  | 14 ++++++++------
 tests/qtest/meson.build       |  3 ++-
 3 files changed, 13 insertions(+), 10 deletions(-)


