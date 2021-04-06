Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F693551B2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 13:16:20 +0200 (CEST)
Received: from localhost ([::1]:46254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTjgx-0001cL-34
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 07:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lTjf3-0000TW-OO
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 07:14:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lTjf1-0005tf-1k
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 07:14:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617707657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=nrIhtoFMMzWP/FIin4XNvnIm5Bn/Wi3hs/m4svWqzfo=;
 b=PHZ5hhHEM+OL7XBsO+r1Aoua+5SMg/WDK/Ir+Gjxq8UqbF4GRyuaIHBRGE/CQkIPFK/U1f
 fXh0iVkEkxfW5sGh0L9uimSgR1TFTU3u7jdnVYszu5cMkw2xdrmMHrZXV4PuDhUzx2f/XZ
 ATI/f+UO9i1+0OKRsx476Az/aA0SVwo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-5rtQxknONa-_hHUTffxp2Q-1; Tue, 06 Apr 2021 07:14:16 -0400
X-MC-Unique: 5rtQxknONa-_hHUTffxp2Q-1
Received: by mail-wm1-f72.google.com with SMTP id v8so263956wmg.8
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 04:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=nrIhtoFMMzWP/FIin4XNvnIm5Bn/Wi3hs/m4svWqzfo=;
 b=GgnXejqkxOh6cwPvXRbUcz671xS6RHHFGXC0MH4OzXvUlga4feB8ct1e8FV0XtLIMK
 D7vjqttjNbKp/pVRDuccTE4by5sGTt93wbHYZRFjD50n6KxsbR1iwhH9Wjq7c3yVPSe8
 6BB4qqKgSGdBCWwRPYn/ti8BEIVQWtK2ifJeIbRAxGPalspIezpBFcNUnWPmgiGkSYKg
 dSl8ogiU1WG7RkrA63IE8TYWnPgtPDldM/pqvVDTrEBkenUP0AqvNuxYQvLekas48uJu
 mEySSWYDp38hOrjWtJ+GHfzwWr1HJDn2ZwYdDO6nBPuUjhDonOK13i5gAo09KQWKTKjq
 I09A==
X-Gm-Message-State: AOAM533xmFy6ZS9+RUA/eSMITZeS62D5pbj3FORSFiLUADUAJcToMOUB
 tUyUozSQK1Zf50flAO+C9C1P2aLAHs1FN/UAP1mat4/ZQTkvDYQG2rVMxXNw6VqtIWdfbW3Qjs6
 LUgf4+1QmeRSYwIrQZxCmWVGK1YmvuyrUemm/kFrCsnvoQ/NxT6RO1vNR3m3L
X-Received: by 2002:a05:600c:2cd8:: with SMTP id
 l24mr3582534wmc.88.1617707654636; 
 Tue, 06 Apr 2021 04:14:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6TCcyjMPjtEKy/Zi5GfI7jsVvBQf6IilAzz7G0r7OK36t0BhiI5vgMgi7NpffCtE+g9uNmw==
X-Received: by 2002:a05:600c:2cd8:: with SMTP id
 l24mr3582517wmc.88.1617707654388; 
 Tue, 06 Apr 2021 04:14:14 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id v7sm2486424wme.47.2021.04.06.04.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 04:14:13 -0700 (PDT)
Date: Tue, 6 Apr 2021 07:14:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] pc,virtio: last minute bugfixes
Message-ID: <20210406111359.302193-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 11577d85b1a6939380bd16ed9a861653194de044:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-04-02 11:53:19 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to d83f46d189a26fa32434139954d264326f199a45:

  virtio-pci: compat page aligned ATS (2021-04-06 07:11:36 -0400)

----------------------------------------------------------------
pc,virtio: last minute bugfixes

Two last minute bugfixes. They are both designed to prevent
compatibility headaches down the road.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Jason Wang (1):
      virtio-pci: compat page aligned ATS

Paolo Bonzini (1):
      x86: rename oem-id and oem-table-id properties

 hw/virtio/virtio-pci.h         |  5 +++++
 include/hw/i386/x86.h          |  4 ++--
 include/hw/pci/pcie.h          |  2 +-
 hw/arm/virt.c                  |  8 ++++----
 hw/core/machine.c              |  1 +
 hw/pci/pcie.c                  | 10 ++++++----
 hw/virtio/virtio-pci.c         |  5 ++++-
 tests/qtest/bios-tables-test.c |  2 +-
 8 files changed, 24 insertions(+), 13 deletions(-)


