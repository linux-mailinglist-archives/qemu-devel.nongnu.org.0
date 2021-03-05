Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AF932EF75
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:57:39 +0100 (CET)
Received: from localhost ([::1]:60396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICpe-00050F-2o
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICnZ-0003fp-9l
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICnX-0003H9-Fy
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614959726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0vvdjR4/Y3ROCDRmo2NAClbJe7hl/2rDezGnaxYxMao=;
 b=KzGiro65tSOlXDXxOvMM7RCVevJrH/btG+aitaF0WbsgksceH1uvPzfkst+CzLCTuG3scC
 vSmUCKtqJnc2DQEMyHFH0AJw5D9IeZmQ8p7GIPc5o6uNdC7ligEkEvmDPt65GWkSAZo+bh
 up1RvLHo+j0SDFffLVM6P6YfA3Biidw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-YE6aqLbmOV2DHyU5m0H1HQ-1; Fri, 05 Mar 2021 10:55:22 -0500
X-MC-Unique: YE6aqLbmOV2DHyU5m0H1HQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1DA71005D4C;
 Fri,  5 Mar 2021 15:55:20 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA9C36A046;
 Fri,  5 Mar 2021 15:55:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/8] s390x update
Date: Fri,  5 Mar 2021 16:55:09 +0100
Message-Id: <20210305155517.1604547-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The following changes since commit c40ae5a3ee387b13116948cbfe7824f03311db7e:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-03-03 16:55:15 +0000)

are available in the Git repository at:

  https://gitlab.com/cohuck/qemu.git tags/s390x-20210305

for you to fetch changes up to 39d5d1404ed695f4a1cd2b117a6cf2d92dd8e8b9:

  target/s390x/kvm: Simplify debug code (2021-03-04 14:19:08 +0100)

----------------------------------------------------------------
some accumulated s390x fixes

----------------------------------------------------------------

Christian Borntraeger (1):
  s390x/cpu_model: disallow unpack for --only-migratable

Cornelia Huck (1):
  virtio-ccw: commands on revision-less devices

Eric Farman (1):
  vfio-ccw: Do not read region ret_code after write

Halil Pasic (1):
  hw/s390x: fix build for virtio-9p-ccw

Matthew Rosato (1):
  s390x/pci: restore missing Query PCI Function CLP data

Philippe Mathieu-Daudé (1):
  target/s390x/kvm: Simplify debug code

Pierre Morel (1):
  css: SCHIB measurement block origin must be aligned

Thomas Huth (1):
  target/s390x/arch_dump: Fix warning for the name field in the PT_NOTE
    section

 hw/s390x/meson.build      |  4 +++-
 hw/s390x/s390-pci-inst.c  |  5 +++++
 hw/s390x/virtio-ccw.c     | 21 ++++++++++++++-------
 hw/vfio/ccw.c             | 12 ++++++------
 target/s390x/arch_dump.c  |  4 +++-
 target/s390x/cpu_models.c | 10 ++++++++++
 target/s390x/ioinst.c     |  6 ++++++
 target/s390x/kvm.c        |  3 +--
 8 files changed, 48 insertions(+), 17 deletions(-)

-- 
2.26.2


