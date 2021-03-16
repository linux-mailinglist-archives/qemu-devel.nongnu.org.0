Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2A833D195
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:14:23 +0100 (CET)
Received: from localhost ([::1]:40974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM6iU-0006zF-Ux
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lM6go-0005TZ-Ja
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lM6gn-0004cO-1O
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615889556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YPJD1cUmlma3A9AnsIAop6HzkGJSpz8jyIUQ7mlofZk=;
 b=KMu2vL6XaOsVo446ccu3BTTiv28QjBI1gEk72GOu6xL9eyq/zbkCP5fgeT4XmlbO1d07n7
 PvSToJy+CNP1ykxqwrnKPzmbg+B45rVzqiJHP1m0F7JprY1Y4CjUiaBk2UEJJcIiHEAQMM
 RZ5SR/WPe2/SvVCzcOOCeltfkYfUCLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595--SYi42_SN1WoskBZ_mYN1w-1; Tue, 16 Mar 2021 06:12:34 -0400
X-MC-Unique: -SYi42_SN1WoskBZ_mYN1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C0B593920;
 Tue, 16 Mar 2021 10:12:32 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-185.ams2.redhat.com
 [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 995826C32F;
 Tue, 16 Mar 2021 10:12:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/6] s390x patches for 6.0 softfreeze
Date: Tue, 16 Mar 2021 11:12:15 +0100
Message-Id: <20210316101221.1890034-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-03-14 17:47:49 +0000)

are available in the Git repository at:

  https://gitlab.com/cohuck/qemu.git tags/s390x-20210316

for you to fetch changes up to 5793f5aafb05dae30e9dcb57d0d1c8f1a9633f6d:

  s390x/pci: Add missing initialization for g_autofree variables (2021-03-15 15:47:18 +0100)

----------------------------------------------------------------
s390x updates:
- get rid of legacy_s390_alloc() and phys_mem_set_alloc()
- tcg: implement the MVPG condition-code-option bit
- fix g_autofree variable handing in the pci vfio code
- use official z15 names in the cpu model definitions

----------------------------------------------------------------

Cornelia Huck (1):
  s390x/cpu_model: use official name for 8562

David Hildenbrand (3):
  s390x/kvm: Get rid of legacy_s390_alloc()
  exec: Get rid of phys_mem_set_alloc()
  target/s390x: Store r1/r2 for page-translation exceptions during MVPG

Miroslav Rezanina (1):
  s390x/pci: Add missing initialization for g_autofree variables

Richard Henderson (1):
  target/s390x: Implement the MVPG condition-code-option bit

 hw/s390x/s390-pci-vfio.c   |   9 +--
 include/sysemu/kvm.h       |   4 -
 softmmu/physmem.c          |  36 +--------
 target/s390x/cpu.h         |   5 ++
 target/s390x/cpu_models.c  |   4 +-
 target/s390x/excp_helper.c |   3 +
 target/s390x/helper.h      |   2 +-
 target/s390x/insn-data.def |   2 +-
 target/s390x/kvm.c         |  43 ++--------
 target/s390x/mem_helper.c  | 160 ++++++++++++++++++++++++++++++-------
 target/s390x/translate.c   |   7 +-
 11 files changed, 159 insertions(+), 116 deletions(-)

-- 
2.26.3


