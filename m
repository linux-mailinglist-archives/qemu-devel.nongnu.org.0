Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3607C42ED86
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:24:51 +0200 (CEST)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJSM-0000YT-8L
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbJKI-0002u0-2W
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:16:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbJKG-0001aN-1u
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634289387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6YKaqEWaKrVpHSA77qT3MAAUblZ4puMOEhq2dpls184=;
 b=POCR4yq1AiClrUAgz/fLdjeUZEVnmzTnFgZuKv6F+uMeQ0NGsHm5XRYKTJf41CYffLFT5M
 1etsbgL4hahbBdcQ6DHTzplllLmVy1rwBJrjoPKSRtmDJfSuwkiknsT7EQHie0f28C94K/
 Uh+8IncMrMqnKMF3OBF7sZFKVSrdSG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-M0-WFiMQMjmTdPpaG20Tcw-1; Fri, 15 Oct 2021 05:16:25 -0400
X-MC-Unique: M0-WFiMQMjmTdPpaG20Tcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CBC0A40C5;
 Fri, 15 Oct 2021 09:16:24 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A8847093A;
 Fri, 15 Oct 2021 09:16:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 0/6] s390x patches and dtc update
Date: Fri, 15 Oct 2021 11:16:16 +0200
Message-Id: <20211015091622.1302433-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

The following changes since commit bfd9a76f9c143d450ab5545dedfa74364b39fc56:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-for-6.2-121021-2' into staging (2021-10-12 06:16:25 -0700)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-10-15

for you to fetch changes up to 962fde57b7d573281619cb2b7068d570470ef833:

  dtc: Update to version 1.6.1 (2021-10-14 08:08:11 +0200)

----------------------------------------------------------------
* Check kernel command line size on s390x
* Simplification of one of the SIGP instructions on s390x
* Cornelia stepping down as maintainer in some subsystems
* Update the dtc submodule to a proper release version

----------------------------------------------------------------
Cornelia Huck (3):
      vfio-ccw: step down as maintainer
      s390x/kvm: step down as maintainer
      s390x virtio-ccw machine: step down as maintainer

Eric Farman (1):
      s390x: sigp: Force Set Architecture to return Invalid Parameter

Marc Hartmayer (1):
      s390x/ipl: check kernel command line size

Thomas Huth (1):
      dtc: Update to version 1.6.1

 MAINTAINERS         |  6 ------
 dtc                 |  2 +-
 hw/s390x/ipl.c      | 12 +++++++++++-
 target/s390x/sigp.c | 18 +-----------------
 4 files changed, 13 insertions(+), 25 deletions(-)


