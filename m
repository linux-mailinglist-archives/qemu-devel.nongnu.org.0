Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FE032A264
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:23:30 +0100 (CET)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5vn-0004rk-Qn
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lH5tr-00043j-8u
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:21:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lH5tj-0000D8-Gu
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614694873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pdVn3myZhshxQpHcWOHKi3FVRpL4aQk8ONf/aJbDPYc=;
 b=JYp1nu4geZJW2wnw/ekmbhGNDuP+LdGOdemj9Itgur2+1n+HSaBRRtJnIjRmcVBIFEN8Ip
 jk2JTgH+WAHPP7OGcYOLL+A+C7UUZxzwNe7DEO97oFvO4PlQFhgwQDTWeGg9lGxHg5/LM/
 IE9yMwxNREw+LQJB23pXed0zEFtqYWw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-ghoMSjkcNq-_s634ZFRRZg-1; Tue, 02 Mar 2021 09:21:12 -0500
X-MC-Unique: ghoMSjkcNq-_s634ZFRRZg-1
Received: by mail-ej1-f69.google.com with SMTP id di5so32781ejc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 06:21:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=pdVn3myZhshxQpHcWOHKi3FVRpL4aQk8ONf/aJbDPYc=;
 b=FmXU4DZF6HZtc/8VOReP9ZB/+FRpBkMULrJQ77FBZZHVRR59zAwwMgCIbZRknckBUV
 S9LX1HoYpbcc83/xUbybFeB78HznL7gFvkgr/VckVO3Ao/loZpeJadfp7MjO+bANyTxs
 VCqjTeAWS/EN7sOQ0b/h/K4/ydzUxw+/ol5PplJEhqgXPv1F3zOXS/D6gaN9pf+PLr4F
 3L5SxGIHcpg26wmF7pce/9I5qoF08ox06GN0jQ7SAmlSN68HwrSAZnhLD5qcGi617nRU
 k5G+yeOqitBZq1mRni7Q8NFGUNn2UHW5vOkzpaW4rASL140FRVlxECbyuz9Bd8sy7S6x
 J8dw==
X-Gm-Message-State: AOAM533X+W2JEOiIGP+rM/Ixd0ccH47oF3L/jHyN8vwMtBzd9jBrPtVS
 MHvdupE/oy5AcuMkbIbylVihADq5XpxTSs61jMGNGPhiVFfIOb824F3d4bD13AgFSfeKoTV/MbP
 F4v09j2FI7owdREJNqL8vA2PXClFcxTNXA7iS5QtyKGLK+rsMq/VlxF0ZRul0
X-Received: by 2002:a17:907:9863:: with SMTP id
 ko3mr10920949ejc.543.1614694870766; 
 Tue, 02 Mar 2021 06:21:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKUxlXO7KH3oEvvjAXZo+lJ2Jd08BCoyHXsw7T/Y2MefrZ5ING0DIXlBBT4e9prU863H5xGg==
X-Received: by 2002:a17:907:9863:: with SMTP id
 ko3mr10920927ejc.543.1614694870547; 
 Tue, 02 Mar 2021 06:21:10 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id yk8sm13877632ejb.123.2021.03.02.06.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:21:09 -0800 (PST)
Date: Tue, 2 Mar 2021 09:21:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] pc,virtio,pci: bug fixes
Message-ID: <20210302142014.141135-1-mst@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
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

A very small pull but there are a couple of fixes here for
bugs that have been biting us in the field.

The following changes since commit 51db2d7cf26d05a961ec0ee0eb773594b32cc4a1:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-02-25 14:02:16 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 1d8d014e936a49795de95a35a2a1ab8000ab2e5b:

  vhost: simplify vhost_dev_init() fail_busyloop label (2021-03-02 09:16:18 -0500)

----------------------------------------------------------------
pc,virtio,pci: bug fixes

Fixes all over the place. Specifically this fixes
a bug which made windows guests lose device config
(such as the configured fixed IP) after upgrading
to the new QEMU.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Cindy Lu (1):
      virtio-net: handle zero mac for a vdpa peer

Philippe Mathieu-Daudé (1):
      hw/pci: Have safer pcie_bus_realize() by checking error path

Stefan Hajnoczi (1):
      vhost: simplify vhost_dev_init() fail_busyloop label

Vitaly Cheptsov (1):
      i386/acpi: restore device paths for pre-5.1 vms

 include/hw/i386/pc.h |  1 +
 hw/i386/acpi-build.c |  4 ++--
 hw/i386/pc_piix.c    |  2 ++
 hw/i386/pc_q35.c     |  2 ++
 hw/net/virtio-net.c  | 12 ++++++++++++
 hw/pci/pci.c         |  7 ++++++-
 hw/virtio/vhost.c    | 12 +++++-------
 7 files changed, 30 insertions(+), 10 deletions(-)


