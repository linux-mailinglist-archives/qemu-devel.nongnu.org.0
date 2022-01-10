Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDFC4890A9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 08:21:15 +0100 (CET)
Received: from localhost ([::1]:56570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ozS-0001Vg-4X
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 02:21:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6oub-00076v-7o
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6ouY-0001hd-6V
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641798969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=U75jUbHa712p5JqOXdgcRCo7K6mANqLs1R7gzfODmss=;
 b=VAcfalOAS368sWW40zndV8ffD5rtL2stV2yRvl0yxwu6vyo9iKdoEf+co7pzi3HD2uOtfJ
 8gZrYUWwzTuVcbhtZwIBFFIsbEHEB3VvWqVeDAEChb8Lk4Sv9xsdX3SvOjKGmMxcsxLDle
 mWqIz6EHEUzugomwT7l4Ln38P0S6SOk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-cjiUscDTNj-aNVE9Owuaag-1; Mon, 10 Jan 2022 02:16:06 -0500
X-MC-Unique: cjiUscDTNj-aNVE9Owuaag-1
Received: by mail-wm1-f71.google.com with SMTP id
 n14-20020a7bcbce000000b003488820f0d9so1013971wmi.8
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 23:16:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=U75jUbHa712p5JqOXdgcRCo7K6mANqLs1R7gzfODmss=;
 b=VTA2MqGs67x7pJpdtNp+mMEUN5jvGsVLvns8lG3QDQlJ3G4sNi0FEtpAViT3KGmjoS
 qa6rsz9p8szkgoH10Xebmt1OwavseKD7NqRdASIUZ31vQvnmrCm1UBbmMNL5KwUAcX6+
 uWSl23Gk/hK0jK6FTC+eWQ9L67DUB7W9dyyZyHRoVftt89uKZE67rFum4YtOtTu7TMyR
 dSdLvqkaWclyzJdAmciErvyykqM2YC3DNmFY6F3H/ATWKa6fWAq7eI8J3YlpMeVwjKL5
 XQETsjqidtLQL+jnOnDPfSRzwUqJ9unb3UXZ699MRGVhl4/AKZuUyr501BMLogydGWh+
 mPqw==
X-Gm-Message-State: AOAM531CtyojlXyCI4LF7r8fAfFeDsWr4tBDPcYKuN36PmH7Xx61+CPW
 MO/O+bJlLt9BKu7SydmJmNrmJd2LMU9D0spbFh9SMXMnjBcqs8xi4HI/gvpjGXd+3WevYA1HjaU
 A4jZ/9YllR/mB2XBUIW/nBS0aIbiY5V9EEKshYfoxHLxpLmMcdxm80OMh+8iO
X-Received: by 2002:a05:6000:389:: with SMTP id
 u9mr61748357wrf.22.1641798964932; 
 Sun, 09 Jan 2022 23:16:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTyQ2YLoZA2V/gRpbvyscori3KwcXm+DPNIMShkUjde6kctpFQ04blO3lnR8gpHyLKS2KyQA==
X-Received: by 2002:a05:6000:389:: with SMTP id
 u9mr61748339wrf.22.1641798964632; 
 Sun, 09 Jan 2022 23:16:04 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
 by smtp.gmail.com with ESMTPSA id p21sm6096708wmq.20.2022.01.09.23.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:16:04 -0800 (PST)
Date: Mon, 10 Jan 2022 02:16:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] virtio: revert config interrupt changes
Message-ID: <20220110071547.195669-1-mst@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ca745d2277496464b54fd832c15c45d0227325bb:

  tests: acpi: Add updated TPM related tables (2022-01-07 19:30:13 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to ab9f51a29ca84cfcecc2d18574794b650ce4bb28:

  Revert "virtio: introduce macro IRTIO_CONFIG_IRQ_IDX" (2022-01-10 00:47:56 -0500)

----------------------------------------------------------------
virtio: revert config interrupt changes

Lots of fallout from config interrupt changes. Author wants to rework
the patches. Let's revert quickly so others don't suffer meanwhile.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Michael S. Tsirkin (10):
      Revert "virtio-pci: add support for configure interrupt"
      Revert "virtio-mmio: add support for configure interrupt"
      Revert "virtio-net: add support for configure interrupt"
      Revert "vhost: add support for configure interrupt"
      Revert "virtio: add support for configure interrupt"
      Revert "vhost-vdpa: add support for config interrupt"
      Revert "vhost: introduce new VhostOps vhost_set_config_call"
      Revert "virtio-pci: decouple the single vector from the interrupt process"
      Revert "virtio-pci: decouple notifier from interrupt process"
      Revert "virtio: introduce macro IRTIO_CONFIG_IRQ_IDX"

 hw/virtio/virtio-pci.h            |   4 +-
 include/hw/virtio/vhost-backend.h |   3 -
 include/hw/virtio/vhost.h         |   4 -
 include/hw/virtio/virtio.h        |   7 -
 include/net/vhost_net.h           |   2 -
 hw/display/vhost-user-gpu.c       |   6 -
 hw/net/vhost_net-stub.c           |   9 --
 hw/net/vhost_net.c                |   9 --
 hw/net/virtio-net.c               |  10 +-
 hw/virtio/vhost-user-fs.c         |   6 -
 hw/virtio/vhost-vdpa.c            |   7 -
 hw/virtio/vhost-vsock-common.c    |   6 -
 hw/virtio/vhost.c                 |  76 ----------
 hw/virtio/virtio-crypto.c         |   6 -
 hw/virtio/virtio-mmio.c           |  27 ----
 hw/virtio/virtio-pci.c            | 303 ++++++++++++--------------------------
 hw/virtio/virtio.c                |  29 ----
 hw/virtio/trace-events            |   1 -
 18 files changed, 100 insertions(+), 415 deletions(-)


