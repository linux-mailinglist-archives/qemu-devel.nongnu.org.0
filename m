Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDA348A192
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:11:27 +0100 (CET)
Received: from localhost ([::1]:41436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n71ws-0002ST-Lk
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:11:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71qf-0007rU-0J
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:05:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71qc-0004Oa-55
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641848697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=nmgwmeo6s0NxyYdbrlnwPMZ/iVAmTSo60HNxrMuG/rU=;
 b=UvwvEI8NzxgNX3YHECnS9ZCqVmxQqg0vr3BFtoceTTWxl549N9cJOhkcdyMImt7L/mainm
 lu8rOVq3O9XGed95QpRIAcGCR2+Ddk9gG7qK731zd6rLi3Sy4+H0PYb/JchDLN5K0p2lnH
 Q0YROi1FkywF8yZU9tWaiIoyjLfSGpg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-7tCGLQH_PKWlAEPK1SdCfA-1; Mon, 10 Jan 2022 16:04:51 -0500
X-MC-Unique: 7tCGLQH_PKWlAEPK1SdCfA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n25-20020a05600c3b9900b00348b83fbd0dso646502wms.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:04:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=nmgwmeo6s0NxyYdbrlnwPMZ/iVAmTSo60HNxrMuG/rU=;
 b=d194savO95Dm41zYg2JMy6fE2FXw7OT/ai/aytzJWTBZdCjhjp8OE0jYV/U+jC+/x5
 yLUek8C4xSe/ygiq+2OGJEbqW/Y2gS1AU2O0PgHu7jTXtKZtArTxPzND5NenVwVLlA/Y
 0ev/KDWzjI19lFezYiezi2oPxr/n4f0i2miV9UOkhGa4NHp4tX/eLoweOfFPNuRQM5VY
 KJqVZoCfW0EDq9ntHOsMhk9W7CgM8W28s9WdY8npNjKVkT/iH67pU9JvIWg14x8Qq5PU
 gXpj+lmY+cdpahb1eCdTxu4znBYgIfiYPk9oQqo9cneoNo8P4eF7+qKIG2Bvk5mVtMWW
 uEzw==
X-Gm-Message-State: AOAM533KT9TOpvpPwtq1WprM8qUIjOvz6jrPHgTV5OcIgXIh/eQBvThP
 laUEvHLmbJlL/oi4UR0xbIZR7DKC92lyMm1x0dFIePXFya7LfwzX3JFmrfyb4CzzZpkHPZnIIPP
 6JOOGIpuCcCo1uG9FbS6PKSvcMASIxToR58gFZuoHckLb0HUtnNtMBPngloD6
X-Received: by 2002:a05:600c:b50:: with SMTP id
 k16mr1040497wmr.85.1641848689783; 
 Mon, 10 Jan 2022 13:04:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwp9/YE/SOBSURRktBjfsOGfHjSgVMKo20dQorIKLjl4K60EjqFHfP8gP6+MgCiZucxA+P2KQ==
X-Received: by 2002:a05:600c:b50:: with SMTP id
 k16mr1040479wmr.85.1641848689510; 
 Mon, 10 Jan 2022 13:04:49 -0800 (PST)
Received: from redhat.com ([2.55.19.241])
 by smtp.gmail.com with ESMTPSA id o1sm7578997wmc.38.2022.01.10.13.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:04:48 -0800 (PST)
Date: Mon, 10 Jan 2022 16:04:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/10] virtio: revert config interrupt changes
Message-ID: <20220110210416.18779-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Changes from v1:
added tags to commit logs.

The following changes since commit ca745d2277496464b54fd832c15c45d0227325bb:

  tests: acpi: Add updated TPM related tables (2022-01-07 19:30:13 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to a882b5712373171d3bd53cd82ddab4453ddef468:

  Revert "virtio: introduce macro IRTIO_CONFIG_IRQ_IDX" (2022-01-10 16:02:54 -0500)

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


