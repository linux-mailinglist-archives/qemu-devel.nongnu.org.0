Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCFB5974FC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 19:23:48 +0200 (CEST)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOMle-0002Sf-Ch
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 13:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOMk6-0000uE-58
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 13:22:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOMk2-00065c-MV
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 13:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660756913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RD/BHfXMld6fouiHxrbT3ODXAj4qnJIY7GNzWj1DU2I=;
 b=BAxMXy89b85plkq9U2rnEqQEAzrqzHYmLDzm73BDsd8PZuBHLzLbMuOk4m0ly07UeO7hDa
 er5db+uxgMNvcd0qMJwW6k8fJbI9zBoqR9oE3kqw3agvwqJMUup1AqSg2aXgCCU6QMonpk
 PE9j9VfKFK5zakc/GnK61IRBAv+u35M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-150-g5_Lzn3SMqWvFF-pfmk95Q-1; Wed, 17 Aug 2022 13:21:52 -0400
X-MC-Unique: g5_Lzn3SMqWvFF-pfmk95Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 r67-20020a1c4446000000b003a5fa79008bso1344238wma.5
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 10:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=RD/BHfXMld6fouiHxrbT3ODXAj4qnJIY7GNzWj1DU2I=;
 b=Uo6LNcRIkO2vBUQx8M/e3HDZ2SXFFaQgdwlCQuch+JgQaHs9XrbMrRKx01EXOHMzoI
 ebz28t4jdvfTdc/ZygocPAUUa2dOCtS8+vpnCD7iKRnbzBps2tEKMpkplIKhJIS8y4j/
 0GrY9b0EKg1Bo/wycn9ivdRJdGwasE+FrXANfxUCnu52fMAs6KP8C6j6hPRimnSHwhC6
 sYNkYQ+T6anvKbWp+ct/yfwMs1U/TT/tN0BLabCjcJEJYTS05rSA0K/w2icNJVe8SKA1
 gUquiGgmwB9AsgI3f0R0k8J6tXHvHlMUyYRcJU4240s1qaAziNx6rslfHujpnHikDc4O
 My/w==
X-Gm-Message-State: ACgBeo23Ng+DqTN9BUSZrDnNCQEO1vMgzE7L/u1ir+mpGh2S9aseOvPl
 hzRyZ4pcPCLhtE0gzPfj5Z7Gzue7Pxnvwb7FT3AmXL6Bvl3UTik9J0hEVKR/hXEFRbmlMgBJb4f
 1Jg+3YZ8vYu1CUYUq5Hc2d4EwLvc7kFVGwcqrKaU6mtCLyJrl1W4Eyqr9Zt0B
X-Received: by 2002:a05:6000:790:b0:220:732c:9ee0 with SMTP id
 bu16-20020a056000079000b00220732c9ee0mr14510581wrb.183.1660756910832; 
 Wed, 17 Aug 2022 10:21:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR678oMVOrIyLns2WsiQwSoQhS7rqP9K7IxIbjRJbi9k3EokUqvPgnJPeS5Pw0nPhdhNWVeV2w==
X-Received: by 2002:a05:6000:790:b0:220:732c:9ee0 with SMTP id
 bu16-20020a056000079000b00220732c9ee0mr14510565wrb.183.1660756910465; 
 Wed, 17 Aug 2022 10:21:50 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b0021e74ef5ae8sm14447059wra.21.2022.08.17.10.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 10:21:49 -0700 (PDT)
Date: Wed, 17 Aug 2022 13:21:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/9] pc,virtio: fixes
Message-ID: <20220817132122-mutt-send-email-mst@kernel.org>
References: <20220817161212.240506-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817161212.240506-1-mst@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Aug 17, 2022 at 12:12:03PM -0400, Michael S. Tsirkin wrote:
> The following changes since commit c7208a6e0d049f9e8af15df908168a79b1f99685:
> 
>   Update version for v7.1.0-rc3 release (2022-08-16 20:45:19 -0500)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to ae1f6ccc9dd42981fb26ac3839751d450a85a838:
> 
>   tests: acpi: silence applesmc warning about invalid key (2022-08-17 12:11:05 -0400)


Oops fat fingers. Sorry. Will send a fixed v2 asap.

> ----------------------------------------------------------------
> pc,virtio: fixes
> 
> Several bugfixes, they all look very safe to me. Revert
> seed support since we aren't any closer to a proper fix.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> Alex Bennée (3):
>       hw/virtio: gracefully handle unset vhost_dev vdev
>       hw/virtio: handle un-configured shutdown in virtio-pci
>       hw/virtio: fix vhost_user_read tracepoint
> 
> Gerd Hoffmann (1):
>       x86: disable rng seeding via setup_data
> 
> Igor Mammedov (1):
>       tests: acpi: silence applesmc warning about invalid key
> 
> Jonathan Cameron (3):
>       hw/cxl: Add stub write function for RO MemoryRegionOps entries.
>       hw/cxl: Fix Get LSA input payload size which should be 8 bytes.
>       hw/cxl: Correctly handle variable sized mailbox input payloads.
> 
> Stefan Hajnoczi (1):
>       virtio-scsi: fix race in virtio_scsi_dataplane_start()
> 
>  hw/block/dataplane/virtio-blk.c |  5 +++++
>  hw/cxl/cxl-device-utils.c       | 12 +++++++++---
>  hw/cxl/cxl-mailbox-utils.c      |  4 ++--
>  hw/i386/microvm.c               |  2 +-
>  hw/i386/pc_piix.c               |  2 +-
>  hw/i386/pc_q35.c                |  2 +-
>  hw/scsi/virtio-scsi-dataplane.c | 11 ++++++++---
>  hw/virtio/vhost-user.c          |  4 ++--
>  hw/virtio/vhost.c               | 10 +++++++---
>  hw/virtio/virtio-pci.c          |  9 +++++++--
>  tests/qtest/bios-tables-test.c  |  4 +++-
>  11 files changed, 46 insertions(+), 19 deletions(-)


