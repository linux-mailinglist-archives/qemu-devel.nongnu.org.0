Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0C2B5BA4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:20:25 +0100 (CET)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexA0-0003HG-Ea
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:20:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex8m-0001rg-3M
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:19:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex8k-0006NZ-9T
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605604745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FtXLrrb9P94MIkcCa233nWGcfBTHMf4X3dMQ3uU4Czg=;
 b=FFxXHfHax3o7aDo03WbCAgq1W8hvs4TlC50r9oisslK8fPA7FWqgp65CskKTyPVTTI9LCX
 Xz6LI8Yw2ftCvaDYy+halRqhloOtKxtyDySoE7VYgA/+F1Univx1EsvAtwHA2mjDjoYiIu
 mhZ3zOVyVqmQCNOwwQTSXpz7+Wc8SAk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-1tDeDT35NYqMuqZ618s-Jg-1; Tue, 17 Nov 2020 04:19:01 -0500
X-MC-Unique: 1tDeDT35NYqMuqZ618s-Jg-1
Received: by mail-wr1-f70.google.com with SMTP id h13so7307642wrr.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 01:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=FtXLrrb9P94MIkcCa233nWGcfBTHMf4X3dMQ3uU4Czg=;
 b=ceZGbhcLXXYKnrC26jE+PFzFA6aKx0AeyUWduvS3w9ZVqjz01nUQtTpfdcWaSSAqmP
 8kPqIEm+I8kHyY38E5zR8PXkFoET04+OuX0g+0llPllxDSZ8FnOCWFfBJiLumEtSMhSj
 IwACX+t0t5H0zPpuyxV2W+diVZfY5jzm1DBxlwjB1OiwyIlSM9g8nJ1n9MwP27OYYhR3
 g9HxFqAiSjkvSJGK2U4vQKbTr7clX3ShWBl6LiC9u9Ai9k2HBTNUYypIBxFRemSoyj3p
 8pcJVdLMzKI7StGGJTgfdkQSm9lbGxMZzkRjMgZeyb+fOo/dyXomf15EJrwFa1Q5gysa
 7D5w==
X-Gm-Message-State: AOAM532v/gLCl5+s3LuJYo4nqdpFXMqmm2515rRB1VnU/Xa4stch3Nnw
 k1fWc/ArkFd9tRRgL3/lcSB0dNZxD+DMJo9+WjmeJZaGYJQTALYn3ApFnngvveZvqHsKsOfhxaS
 ogRnrNhkCmtyTta/5I28zSyDY42ZSUJk2d0Ahoxt5I7Rkggu6GPvLnkto2b94
X-Received: by 2002:adf:9124:: with SMTP id j33mr23061043wrj.376.1605604740112; 
 Tue, 17 Nov 2020 01:19:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyH9cnicGVYLngqQjlV6ZC23JZS8P10Y2faxTvGDPxbs5Ql71ngrfz2vNjdRzOa6KyyC1t+GA==
X-Received: by 2002:adf:9124:: with SMTP id j33mr23061016wrj.376.1605604739790; 
 Tue, 17 Nov 2020 01:18:59 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id i10sm26768006wrs.22.2020.11.17.01.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 01:18:59 -0800 (PST)
Date: Tue, 17 Nov 2020 04:18:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/7] pc,vhost: fixes
Message-ID: <20201117091848.695370-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c6f28ed5075df79fef39c500362a3f4089256c9c:

  Update version for v5.2.0-rc1 release (2020-11-10 22:29:57 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 91010f0407a07caeacb11037bb5b493bab7ce203:

  vhost-user-blk/scsi: Fix broken error handling for socket call (2020-11-17 04:16:55 -0500)

----------------------------------------------------------------
pc,vhost: fixes

Fixes all over the place.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
AlexChen (2):
      contrib/libvhost-user: Fix bad printf format specifiers
      vhost-user-blk/scsi: Fix broken error handling for socket call

Philippe Mathieu-Daudé (1):
      hw/i386/acpi-build: Fix maybe-uninitialized error when ACPI hotplug off

Stefan Hajnoczi (4):
      vhost-user: fix VHOST_USER_ADD/REM_MEM_REG truncation
      meson: move vhost_user_blk_server to meson.build
      vhost-user-blk-server: depend on CONFIG_VHOST_USER
      configure: mark vhost-user Linux-only

 meson_options.txt                         |  2 ++
 configure                                 | 25 ++++++-----------
 contrib/libvhost-user/libvhost-user.h     |  2 +-
 contrib/libvhost-user/libvhost-user.c     | 24 ++++++++---------
 contrib/vhost-user-blk/vhost-user-blk.c   |  2 +-
 contrib/vhost-user-scsi/vhost-user-scsi.c |  2 +-
 hw/i386/acpi-build.c                      | 45 +++++++++++++++----------------
 hw/virtio/vhost-user.c                    |  5 ++--
 block/export/meson.build                  |  5 +++-
 docs/interop/vhost-user.rst               | 21 +++++++++++++--
 meson.build                               | 15 +++++++++++
 11 files changed, 86 insertions(+), 62 deletions(-)


