Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F381A285A0E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 10:05:39 +0200 (CEST)
Received: from localhost ([::1]:48570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ4SA-0002uD-P2
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 04:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ4Qe-00027V-EE
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 04:04:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ4Qc-0006M0-Cb
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 04:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602057840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ooDpHdi/zvpw0/qU0WVmY+LizHQA59RAizudT5Z9T1k=;
 b=CK8YK2EHV9V45+fcG6qFlAqOh9YyMWyPtW/33BBXdIAg388lKrMlC+uV+8l7RFKb53EUSE
 8JmxjxwxvI1DHoOGrEX9i6MCELIuAm5DQnXHTea/3UjVEOVEjMd03JE+ZtvV9h/nRn3MCs
 9ZrcRH4GOv8bvsOZQpTPjvP2x8QdZLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-g4ZWE_i_OQyHwf4SbVquvQ-1; Wed, 07 Oct 2020 04:03:59 -0400
X-MC-Unique: g4ZWE_i_OQyHwf4SbVquvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C14EC805F1E
 for <qemu-devel@nongnu.org>; Wed,  7 Oct 2020 08:03:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CE5355786
 for <qemu-devel@nongnu.org>; Wed,  7 Oct 2020 08:03:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] simplify tests/qtest/meson.build and update docs
Date: Wed,  7 Oct 2020 04:03:10 -0400
Message-Id: <20201007080312.566464-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:54:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The instructions for adding new unit tests were not in
build-system.rst and therefore I missed them in the Meson
conversion.  Patch 2 updates them; before that, however,
patch 1 applies the same trick to qtests that was used to
simplify the unit tests conversion.

Paolo Bonzini (2):
  qtest: unify extra_qtest_srcs and extra_qtest_deps
  docs/devel: update instruction on how to add new unit tests

 docs/devel/qtest.rst    | 30 +++++++++++++++-------
 docs/devel/testing.rst  | 19 +++++++-------
 tests/qtest/meson.build | 55 +++++++++++++++++++----------------------
 3 files changed, 57 insertions(+), 47 deletions(-)

-- 
2.26.2


