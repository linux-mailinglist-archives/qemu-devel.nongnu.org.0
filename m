Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB62BB8C1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 23:18:05 +0100 (CET)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgEjD-0007ts-Ma
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 17:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kgEhv-0006ks-6V
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 17:16:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kgEht-000263-1V
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 17:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605910599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GUHFEn1AqrtMQSqNK8O2czbxn/YhEx+Nf4OgQ2JywfI=;
 b=Aj6+4jz7ExGis/Z8Q5GmoyTM/IfQChblt/9deqIlwcbppY7OGuClJtgChMG6b7VGsiYvVy
 i0JKPpmLNEq32DPqBunRChZvn6QF8OuPUYV3CLAtkO859EJapcA9JpyUzQR0v2dQkjh8l5
 SRjGfCWLtS4ZH8zkNBPe3rOdedknkKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-jOmGZL_bMuy7F6rY5uj_1w-1; Fri, 20 Nov 2020 17:16:37 -0500
X-MC-Unique: jOmGZL_bMuy7F6rY5uj_1w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 483DC106F6E9
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 22:16:36 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D872B10016F7
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 22:16:35 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Kconfig, qboot changes for 2020-11-20
Date: Fri, 20 Nov 2020 17:16:32 -0500
Message-Id: <20201120221634.2504254-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The following changes since commit 7fbd7e710323c8f4c5f6a38a8ae0e6726b5a4599:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2020-11-19 17:08:42 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 5983021eb6cd0fb8dfbac5211892f5231758d60b:

  qboot: update to latest upstream (2020-11-20 10:48:53 -0500)

----------------------------------------------------------------
Bug fixes

----------------------------------------------------------------
Paolo Bonzini (2):
      usb: fix kconfig for usb-xhci-sysbus
      qboot: update to latest upstream

 hw/usb/Kconfig    |   1 -
 pc-bios/qboot.rom | Bin 65536 -> 65536 bytes
 roms/Makefile     |   8 ++++++--
 roms/qboot        |   2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)
-- 
2.26.2


