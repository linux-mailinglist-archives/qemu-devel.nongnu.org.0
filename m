Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51154478F70
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:23:18 +0100 (CET)
Received: from localhost ([::1]:45822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myF4n-0003T2-4x
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:23:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1myEVP-00083Q-MH
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:46:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1myEVO-0003iH-6l
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639752400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0vx8NHxd86tgeWTd/oFBP9e/BcnZxBYcD2n7fQQrHfk=;
 b=X4bRYoIff8qxK3LnFdossBkRjJsUA8il/AMly8v9wOEViYLMQ7LacvZHzF8bwBA/OdbRj5
 hQhr348SmJNKSbLJW1FGwtgOqrph7CyxKsb29WXuuWjLBt68j738EZWoK+b2pdRfejGxTj
 d3877r0PqrFYf3EN8NlyBEg/ssXWo/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-rVJSlcT3OgScImlTwSM2fg-1; Fri, 17 Dec 2021 09:46:39 -0500
X-MC-Unique: rVJSlcT3OgScImlTwSM2fg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C2B2192FDA6;
 Fri, 17 Dec 2021 14:46:38 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B5555E490;
 Fri, 17 Dec 2021 14:46:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/7] s390x patches (and one gitlab-CI fix)
Date: Fri, 17 Dec 2021 15:46:34 +0100
Message-Id: <20211217144634.141481-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

The following changes since commit 29eb5c2c86f935b0e9700fad2ecfe8a32b011d57:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2021-12-16 08:39:20 -0800)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/s390x-2021-12-17

for you to fetch changes up to 9f8e6cad65a66b27e797defe639a4a4fd4330f23:

  gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices (2021-12-17 09:12:37 +0100)

----------------------------------------------------------------
* Small fixes for the s390x PCI code
* Fix reset handling of the diag318 data
* Ease timeout problem of the new msys2-64bit job

----------------------------------------------------------------

v2: Dropped the patch that introced the new machine types

Christian Borntraeger (1):
      MAINTAINERS: update email address of Christian Borntraeger

Collin L. Walling (1):
      s390: kvm: adjust diag318 resets to retain data

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
 hw/s390x/s390-pci-bus.c         |  1 +
 hw/s390x/s390-pci-inst.c        | 15 +++++++++------
 hw/s390x/s390-pci-vfio.c        |  1 +
 include/hw/s390x/s390-pci-bus.h |  3 ++-
 include/hw/s390x/s390-pci-clp.h |  3 ++-
 target/s390x/cpu.h              |  4 ++--
 target/s390x/kvm/kvm.c          |  4 ++++
 10 files changed, 26 insertions(+), 14 deletions(-)


