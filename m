Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A168B3DF6A2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 22:54:14 +0200 (CEST)
Received: from localhost ([::1]:57474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB1QT-0001rk-5q
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 16:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mB1OV-0000Hn-Lz
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mB1OS-0007v4-NR
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628023926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=cUs0GPFJj79mSSrjdOebGR2DQI3qCXI0nS1LQxZhm/U=;
 b=YAPOddM52aZ4Bo1o1UfG7Zyv6RjjV7NkGlXM5tpJUJ5VrMD6H7o0NVVgQCmK+j90Cvxy0t
 ppzUda+DYxTE0d1p2DUoun4xeNgyf6u7cdHQCupYmU3aPrJTTHAZZcqD7/X7AIhVXDQc7j
 k6KtCfHZiV5BsyDQ9/cl7pRjK6KB7os=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-xLUEvQMYOsyCg-udrL5_cQ-1; Tue, 03 Aug 2021 16:52:05 -0400
X-MC-Unique: xLUEvQMYOsyCg-udrL5_cQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 ay20-20020a0564022034b02903bc515b673dso283050edb.3
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 13:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=cUs0GPFJj79mSSrjdOebGR2DQI3qCXI0nS1LQxZhm/U=;
 b=qOjqw/4yBJ2Jj9wdBGpveLAAfXCx5lehkQxmsFmZfnLm9a+6cpGJ4twtg7z3JNSJ/u
 MDgTGeQDdHnpZnn+2dGZPXlrM2ceENuLnPmLwwKw0KQXoHv9hBhgG8OgRaum8FWmbklJ
 vy6KvR829ujgQWW6UojKWBfWU7TXKsPjcPua9YsVqo7qCfX/OCkKCaNjNZiFr/oz6BOZ
 lQ46FnDjoaR+gzHOZf/Mmo7YLhUH/RlEQnSF1qoTnDBK9cB1bJ9KnT6HEQRACjb6FvyT
 vqg0wZ2z/cInBaID57pNJTjosac9WVTpCNckfqKyDpCHE/Bq0JdbamWNOlXQchljKHXs
 rQ5g==
X-Gm-Message-State: AOAM532WbDp6iMnzRQXsSJrNnTJtKPgzrITVHJZSciKywI7WPJhtuggJ
 pocyiOTkG7UkT9GdRwwl9j3bZiyptaRrUum2N/b4x2FvAo3hyLNg7PUR9BLehp//l95A3CZuDtt
 j6vGvvaKrul3Gdo5knqg7C797EYEDfLMRb8CpzUKwKHcpd6saJ/6juYx3UQ7z
X-Received: by 2002:a50:954c:: with SMTP id v12mr27620864eda.313.1628023923595; 
 Tue, 03 Aug 2021 13:52:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZAGVZxxMia0Hp/jIF1aFDBhr4D1/Um6y4o/DYbEkPeUXFyMNWgDUKeLJwQPbx3qrvOFs9mA==
X-Received: by 2002:a50:954c:: with SMTP id v12mr27620848eda.313.1628023923331; 
 Tue, 03 Aug 2021 13:52:03 -0700 (PDT)
Received: from redhat.com ([2.55.141.248])
 by smtp.gmail.com with ESMTPSA id s12sm6657573ejz.36.2021.08.03.13.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 13:52:02 -0700 (PDT)
Date: Tue, 3 Aug 2021 16:52:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] pc,pci: bugfixes
Message-ID: <20210803205043.165034-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f2da205cb4142259d9bc6b9d4596ebbe2426fe49:

  Update version for v6.1.0-rc1 release (2021-07-27 18:07:52 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 62a4db5522cbbd8b5309a2949c22f00e5b0138e3:

  Drop _DSM 5 from expected DSDTs on ARM (2021-08-03 16:32:35 -0400)

----------------------------------------------------------------
pc,pci: bugfixes

Small bugfixes all over the place.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Igor Mammedov (1):
      acpi: x86: pcihp: add support hotplug on multifunction bridges

Marcel Apfelbaum (1):
      hw/pcie-root-port: Fix hotplug for PCI devices requiring IO

Michael S. Tsirkin (3):
      arm/acpi: allow DSDT changes
      Revert "acpi/gpex: Inform os to keep firmware resource map"
      Drop _DSM 5 from expected DSDTs on ARM

 hw/i386/acpi-build.c               |  44 +++++++++++++++++++++++++------------
 hw/pci-bridge/gen_pcie_root_port.c |   5 +++++
 hw/pci-host/gpex-acpi.c            |  20 ++---------------
 tests/data/acpi/microvm/DSDT.pcie  | Bin 3031 -> 3023 bytes
 tests/data/acpi/virt/DSDT          | Bin 5204 -> 5196 bytes
 tests/data/acpi/virt/DSDT.memhp    | Bin 6565 -> 6557 bytes
 tests/data/acpi/virt/DSDT.numamem  | Bin 5204 -> 5196 bytes
 tests/data/acpi/virt/DSDT.pxb      | Bin 7695 -> 7679 bytes
 8 files changed, 37 insertions(+), 32 deletions(-)


