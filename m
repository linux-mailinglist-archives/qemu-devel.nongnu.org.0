Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454E34823D2
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 12:51:47 +0100 (CET)
Received: from localhost ([::1]:60682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3GRl-0004Zd-LB
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 06:51:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPK-0002Zb-Jp
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPE-0000GT-V5
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640951347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rFyVJE4gTOP15lGajLn8WMTszxGejpTJhmwHXKmaY10=;
 b=WEHkMsmwRauydUyc3800Nx0GpbUV1OGTk7ObFOOpkBkOnh6DxW0XwVHe1AxndN8SX8ysJR
 bZqBCr8yx4Ol5aZpVD/Zbj8Zuoio6JlREH5pphoUAijQ9h7jbLbXHEdcXHK1MjBv94vfJj
 Z/jjlvb4cgdrVVSInTDyEELQykkRwVk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-zu8Ra4y1MViyZX_RGHtxow-1; Fri, 31 Dec 2021 06:49:05 -0500
X-MC-Unique: zu8Ra4y1MViyZX_RGHtxow-1
Received: by mail-wm1-f72.google.com with SMTP id
 a203-20020a1c7fd4000000b0034574187420so14208359wmd.5
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 03:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3UmQHPwQzcRW8b11sIsO9kSWzsUn+afXttlr1YCuqVE=;
 b=hHkVXhhSsfNd41zD6oltf6xO7mbb8xzbjPPa2MIApI/0iXWXyVUbZd2ROj6FugP4vb
 CAoSuJwwrJwnzSUeMai+U+3DDA+kKJGEOYzaawbkaxznNt45hFnlGVRfMAzoZxF45ihg
 EoERonAfQ04LrbHLlSJ/zG8VY2ZZ1Fq3LHnlx9JZQYzKNj1W05zRQXqpTt8AajWba6w9
 4upSpTZhPXXZqNwhP0Pq5DEi0OPlS9AQoE1UO/5KrYHyttFGliEOjWP853Icp0lIrYJz
 BLZ4aUU5I1G/AwaeFXBjG0LidzSGi0CFkjtpL73oh3XOMvSS+ijaOoZHeVr6xtE6lOZK
 /rkA==
X-Gm-Message-State: AOAM530/kSdd3jG+G4aglIWeGSwsXLTXyzFsgoUEejWoJ6OZKykNkOA3
 MnfvYL5tEFhkMvyd1b/+GNxhx10JrnJAoKDOB7s28ibTzPoQP31DFEdeGovd51IRVs2L2/BBvwj
 dT7yOSH6ZMBNSXU8vlMfQEcymZKHoZZkUn/vhALil36VHMplbkHl/hxGfp7DsMKB7
X-Received: by 2002:a05:6000:2cc:: with SMTP id
 o12mr29971487wry.285.1640951343782; 
 Fri, 31 Dec 2021 03:49:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgCm1ZUnDdIKKj+xxH/cRm0feS3A/CfwYmGmxg/mr5l/8DBho0eRPY+Bu0A4SjxEFexmSUWQ==
X-Received: by 2002:a05:6000:2cc:: with SMTP id
 o12mr29971460wry.285.1640951343452; 
 Fri, 31 Dec 2021 03:49:03 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id s22sm29614666wmc.1.2021.12.31.03.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 03:49:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] hw/dma: Introduce dma_size_t type definition
Date: Fri, 31 Dec 2021 12:48:53 +0100
Message-Id: <20211231114901.976937-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series aims to clarify a bit the DMA API, in particular the=0D
'size' argument which is not clear enough (as we use multiple types=0D
for it). The clarification is trivial: add a dma_size_t typedef,=0D
similar to the dma_addr_t one. This helps avoiding build failures=0D
on 32-bit host [*] (and likely overflows calculation too IMO).=0D
=0D
Some units using the DMA API are first removed from user-mode=0D
emulation to avoid build failure (they shouldn't be there in=0D
the first place).=0D
=0D
Then some variables are renamed for clarity (no functional change).=0D
=0D
Finally the dma_size_t typedef is added, and the previous patch=0D
which failed on 32-bit host applied on top (not failing anymore).=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg858825.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  hw/nvram: Restrict stub to sysemu and tools=0D
  hw/pci: Restrict pci-bus stub to sysemu=0D
  hw/pci: Document pci_dma_map()=0D
  hw/dma: Remove CONFIG_USER_ONLY check=0D
  hw/rdma/rdma_utils: Rename rdma_pci_dma_map 'len' argument=0D
  hw/scsi: Rename SCSIRequest::resid as 'residual'=0D
  hw/dma: Introduce dma_size_t type definition=0D
  hw/dma: Let dma_buf_read() / dma_buf_write() propagate MemTxResult=0D
=0D
 hw/rdma/rdma_utils.h      |  4 +-=0D
 include/hw/pci/pci.h      | 22 +++++++---=0D
 include/hw/scsi/scsi.h    |  4 +-=0D
 include/sysemu/dma.h      | 59 ++++++++++++++-------------=0D
 hw/ide/ahci.c             | 10 ++---=0D
 hw/nvme/ctrl.c            |  6 +--=0D
 hw/nvram/fw_cfg.c         |  2 +-=0D
 hw/rdma/rdma_utils.c      | 16 ++++----=0D
 hw/rdma/vmw/pvrdma_main.c |  2 +-=0D
 hw/scsi/lsi53c895a.c      |  4 +-=0D
 hw/scsi/megasas.c         | 85 +++++++++++++++++++++++++++------------=0D
 hw/scsi/scsi-bus.c        | 12 +++---=0D
 hw/scsi/scsi-disk.c       |  4 +-=0D
 hw/usb/libhw.c            |  4 +-=0D
 softmmu/dma-helpers.c     | 38 ++++++++---------=0D
 hw/nvram/meson.build      |  6 ++-=0D
 hw/rdma/trace-events      |  2 +-=0D
 stubs/meson.build         |  4 +-=0D
 18 files changed, 164 insertions(+), 120 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


