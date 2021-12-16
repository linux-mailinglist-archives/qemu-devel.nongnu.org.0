Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9490B476E37
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:51:00 +0100 (CET)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnPf-0003cK-Ln
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:50:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxnJs-0004Gu-Cl
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:45:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxnJo-0001KK-PE
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639647894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2mXzSBK1g0yJedi+/RbJp0o0xMM8kJtBFzYSs0nLvKE=;
 b=WLxNF1Twgg/XJpqRHe9W4BqN8NLjmTUshWnY2oMVOV36hREfzaYEkSn3VQT2RK/z3zet7z
 mwR4tkVJxNw5zG/4fcsLxj49XGR8DEOf9KhYz0TGH9l+J/SSepG5j6wl9vqjqVHead2AZa
 L2XB2OY4iLfwl/fzu3WI3szB9Go7Npo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-fIjyIHXNPT6MMQdT2jS3Bw-1; Thu, 16 Dec 2021 04:44:51 -0500
X-MC-Unique: fIjyIHXNPT6MMQdT2jS3Bw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E7581934104;
 Thu, 16 Dec 2021 09:44:50 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87A0D10A48A5;
 Thu, 16 Dec 2021 09:44:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] s390x patches (and one gitlab-CI fix)
Date: Thu, 16 Dec 2021 10:44:39 +0100
Message-Id: <20211216094447.58496-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

The following changes since commit e630bc7ec9dda656a452ed28cac4d1e9ed605d71:

  Merge tag 'pull-block-2021-12-15' of git://repo.or.cz/qemu/armbru into staging (2021-12-15 12:14:44 -0800)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/s390x-2021-12-16

for you to fetch changes up to 79e42726050b7be6c2104a9af678ce911897dfaa:

  gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices (2021-12-16 10:22:39 +0100)

----------------------------------------------------------------
* Small fixes for the s390x PCI code
* Fix reset handling of the diag318 data
* Add compat machines for 7.0 (all architectures)
* Ease timeout problem of the new msys2-64bit job

----------------------------------------------------------------
Christian Borntraeger (1):
      MAINTAINERS: update email address of Christian Borntraeger

Collin L. Walling (1):
      s390: kvm: adjust diag318 resets to retain data

Cornelia Huck (1):
      hw: Add compat machines for 7.0

Matthew Rosato (4):
      s390x/pci: use a reserved ID for the default PCI group
      s390x/pci: don't use hard-coded dma range in reg_ioat
      s390x/pci: use the passthrough measurement update interval
      s390x/pci: add supported DT information to clp response

Thomas Huth (1):
      gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices

 .gitlab-ci.d/windows.yml        |  2 +-
 .mailmap                        |  1 +
 MAINTAINERS                     |  6 +++---
 hw/arm/virt.c                   |  9 ++++++++-
 hw/core/machine.c               |  3 +++
 hw/i386/pc.c                    |  3 +++
 hw/i386/pc_piix.c               | 14 +++++++++++++-
 hw/i386/pc_q35.c                | 13 ++++++++++++-
 hw/ppc/spapr.c                  | 15 +++++++++++++--
 hw/s390x/s390-pci-bus.c         |  1 +
 hw/s390x/s390-pci-inst.c        | 15 +++++++++------
 hw/s390x/s390-pci-vfio.c        |  1 +
 hw/s390x/s390-virtio-ccw.c      | 14 +++++++++++++-
 include/hw/boards.h             |  3 +++
 include/hw/i386/pc.h            |  3 +++
 include/hw/s390x/s390-pci-bus.h |  3 ++-
 include/hw/s390x/s390-pci-clp.h |  3 ++-
 target/s390x/cpu.h              |  4 ++--
 target/s390x/kvm/kvm.c          |  4 ++++
 19 files changed, 97 insertions(+), 20 deletions(-)


