Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD3955BE72
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:27:21 +0200 (CEST)
Received: from localhost ([::1]:59450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63kt-0004lc-Rq
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633k-0007fh-RJ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633b-0006nV-Oy
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656391353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LPl7lI2j0cg+C6vTvDkYsE8soFRBDS+9GDlQP4/scWM=;
 b=TrwfKQTjHkafs8+YMKnqS+Jod6m/cjt6/HrhJFPCgioXKVqA7nhEv3XalI2eWakPp2dzUe
 5MmrZTrtDOYNBKr/Fx8hqQEO3JBnY8RdINeVpO1VwlZdjhscXkVblREA1uq0ZKOHNyByCY
 1tiSIpWCWsc1ErV51e2VCpZMLjxHYvE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-gBvhax9VPim8e6ILxfTZQA-1; Tue, 28 Jun 2022 00:42:28 -0400
X-MC-Unique: gBvhax9VPim8e6ILxfTZQA-1
Received: by mail-wr1-f71.google.com with SMTP id
 n5-20020adf8b05000000b00219ece7272bso1436684wra.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=LPl7lI2j0cg+C6vTvDkYsE8soFRBDS+9GDlQP4/scWM=;
 b=VtZkDRXesKfXmVYCUUv9/W6AcfJPwbmANxmbXU8snfCX32EwGpLhHfd6xyWqDnm5ZH
 JCNpEFzm+Kdda+WJ70Dzuw86qq7nOhmlLcIwJ0+fEcuKlT0Ti+2I+eAr2lQChsq5Rpud
 K6fMOlMMl0zweoa2K7kuXkuivNbgUz7iTi/P/xT1n5rZsf84cdIrXeQA8GWsW0NZLWI3
 +2nnOWgA82tew/BU8wckboP+QZDGLFKWiOez4HT9JtKfIarq4OjGrEAsWYRV5ZrQ/Oq0
 ZqihW7nCHduWxdo85f57bnnBq9e41C78iu3iuUQwCPvqEr89vXKB7G1ZlUy/qr0FYEak
 fhkA==
X-Gm-Message-State: AJIora9VtY194SQfADmB3kdDGoHnSX1g7HZ9fES7Md9qzpyVPN1JqPfX
 fmua0ZnvTWNda84sadv6q2APLGkExQJhi5UGd0eb7yDQWq8tP14vTtQ+tomBs3YoVMT4y9Q1lMM
 nl+TQoiW6ez4sfLMRXOXy2dLb0E6f/vtOtvvaB6UY+rSv6w3EynhyfxDmmXy5
X-Received: by 2002:a05:6000:2a4:b0:21d:1896:763e with SMTP id
 l4-20020a05600002a400b0021d1896763emr3469717wry.248.1656391347345; 
 Mon, 27 Jun 2022 21:42:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uaprtVmDTw/seneY0EDrLa1UEt8bdpfZOHwox/5+UF4xNhdJEjoZxjW3aL5DmVSamgcwI4rQ==
X-Received: by 2002:a05:6000:2a4:b0:21d:1896:763e with SMTP id
 l4-20020a05600002a400b0021d1896763emr3469703wry.248.1656391347074; 
 Mon, 27 Jun 2022 21:42:27 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm11956206wrz.103.2022.06.27.21.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:42:26 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:42:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/12] virtio: fixes
Message-ID: <20220628044201.217173-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 097ccbbbaf2681df1e65542e5b7d2b2d0c66e2bc:

  Merge tag 'qemu-sparc-20220626' of https://github.com/mcayland/qemu into staging (2022-06-27 05:21:05 +0530)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 81cf38f3ff3c7db8fcd2f46df9a294fdf6f4a910:

  include/hw/virtio: document vhost_ack_features (2022-06-27 18:53:18 -0400)

----------------------------------------------------------------
virtio: fixes

fixes all over the place

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Alex Bennée (3):
      contrib/vhost-user-blk: fix 32 bit build and enable
      include/hw/virtio: document vhost_get_features
      include/hw/virtio: document vhost_ack_features

David Hildenbrand (1):
      MAINTAINERS: Collect memory device files in "Memory devices"

Jagannathan Raman (1):
      msi: fix MSI vector limit check in msi_set_mask()

Kevin Wolf (3):
      docs/vhost-user: Fix mismerge
      libvhost-user: Fix VHOST_USER_GET_MAX_MEM_SLOTS reply
      libvhost-user: Fix VHOST_USER_ADD_MEM_REG reply

Konstantin Khlebnikov (2):
      vhost: add method vhost_set_vring_err
      vhost: setup error eventfd and dump errors

Zhenzhong Duan (2):
      virtio-iommu: Fix the partial copy of probe request
      virtio-iommu: Fix migration regression

 include/hw/virtio/vhost-backend.h         |  3 +++
 include/hw/virtio/vhost.h                 | 22 ++++++++++++++++++
 contrib/vhost-user-blk/vhost-user-blk.c   |  6 ++---
 hw/pci/msi.c                              |  4 ++--
 hw/virtio/vhost-backend.c                 |  7 ++++++
 hw/virtio/vhost-user.c                    |  6 +++++
 hw/virtio/vhost.c                         | 37 +++++++++++++++++++++++++++++++
 hw/virtio/virtio-iommu.c                  | 16 +++++++++----
 subprojects/libvhost-user/libvhost-user.c | 19 +++-------------
 MAINTAINERS                               | 25 ++++++++++++---------
 contrib/vhost-user-blk/meson.build        |  3 +--
 docs/interop/vhost-user.rst               | 16 -------------
 meson.build                               |  2 +-
 13 files changed, 112 insertions(+), 54 deletions(-)


