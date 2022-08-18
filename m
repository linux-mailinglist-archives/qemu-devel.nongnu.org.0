Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83AF59881D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:55:59 +0200 (CEST)
Received: from localhost ([::1]:53656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhsE-0001pe-Rk
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOhYT-0000TI-2z
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:35:33 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOhYP-00044U-F6
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:35:31 -0400
Received: by mail-pj1-x102c.google.com with SMTP id f21so2050497pjt.2
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=kj3DwGDSHLVqM5bDK5C+6bjZmVq+IkRgxOKi6yNMQLI=;
 b=ZzQ0+J57HBbCmBR5p3MHAOFCJUP88P6K1R45epAwdsgydaqX3qfhKZOeUrl+lbN0g+
 KH3Hjp/+00B+Kic2ScOCZ0ggWnJ9RO//KPhY7tptGMkvqENgDcx5YmYTts30GwddE4V/
 Cwg+IKSVt+7hMeRBZY3qz00ItfifubqFRJ4lKxQX1eC0F7+B91TKXexWxn5+Zm9D5NxX
 Q6xsOjcykEwccCNfWW6xHVVNKsuXL8Xdnu0lyGDPn+UCLoroQ2EU+PjT4+Zs71wVMLT2
 du++Y87fA21qzciNvzlc+opGZLCTLzwn+BlwmK657ehknNX4AiVIviEXDrWltrWhtU4m
 QW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kj3DwGDSHLVqM5bDK5C+6bjZmVq+IkRgxOKi6yNMQLI=;
 b=z8+BHdEJYBS6cdVTUKLKY/04Kf3+41HIHvR0iTCInJ0cfwcj/Vf/EE497OIX7Mtmui
 ak496F0RrhWonw3ahli7YtSGB8X6WFg0cbftQZjF4VJu4D6S/G2DJAroUuvU92BAAST4
 h9ztv9c5GbbEgUgoHv8zCC/2lmXe7d/WJ/wk7836CLZtwF6A4zbCddG6dD52Lo1imfx2
 iA00wvmtuVq74m48Cpkv8yZ7g7I6c04Ou9Z7YQaAsO2VZqHD0vnZRJQX3RhJkZ5s3B/M
 1PCus9Ybh2SCqBt+sol12RdBv8Ko0V4D5TsVAPP3Ob68Aw2skXV1gM6su0ACUDWBGlG4
 D5hA==
X-Gm-Message-State: ACgBeo2EuJzLrjh3dvGLARzdcplEDKAtJzhnrmO1lxIIiAgJhoBC547p
 xcn8rG5q824xCDCB0h89NROPNCaWoNHJJg==
X-Google-Smtp-Source: AA6agR5wM/BofEGW1znlDrwPlcy0TvIAycpTNcHgjbvWBHgOpNpg/196iocko1W/IN8HXavo/W6DrQ==
X-Received: by 2002:a17:902:ca0b:b0:172:9916:695c with SMTP id
 w11-20020a170902ca0b00b001729916695cmr3087724pld.5.1660836928048; 
 Thu, 18 Aug 2022 08:35:28 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.236])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a63f905000000b003fdc16f5de2sm1446934pgi.15.2022.08.18.08.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 08:35:27 -0700 (PDT)
Message-ID: <9f8f29fd-ac66-99e9-af52-4b7ef13d432d@linaro.org>
Date: Thu, 18 Aug 2022 08:35:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 00/12] pc,virtio: fixes
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220817200536.350795-1-mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220817200536.350795-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/17/22 13:05, Michael S. Tsirkin wrote:
> The following changes since commit c7208a6e0d049f9e8af15df908168a79b1f99685:
> 
>    Update version for v7.1.0-rc3 release (2022-08-16 20:45:19 -0500)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to 9afb4177d66ac1eee858aba07fa2fc729b274eb4:
> 
>    virtio-pci: don't touch pci on virtio reset (2022-08-17 13:08:11 -0400)
> 
> ----------------------------------------------------------------
> pc,virtio: fixes
> 
> Several bugfixes, they all look very safe to me. Revert
> seed support since we aren't any closer to a proper fix.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alex Bennée (3):
>        hw/virtio: gracefully handle unset vhost_dev vdev
>        hw/virtio: handle un-configured shutdown in virtio-pci
>        hw/virtio: fix vhost_user_read tracepoint
> 
> Gerd Hoffmann (1):
>        x86: disable rng seeding via setup_data
> 
> Igor Mammedov (1):
>        tests: acpi: silence applesmc warning about invalid key
> 
> Jonathan Cameron (5):
>        hw/cxl: Fix memory leak in error paths
>        hw/cxl: Fix wrong query of target ports
>        hw/cxl: Add stub write function for RO MemoryRegionOps entries.
>        hw/cxl: Fix Get LSA input payload size which should be 8 bytes.
>        hw/cxl: Correctly handle variable sized mailbox input payloads.
> 
> Michael S. Tsirkin (1):
>        virtio-pci: don't touch pci on virtio reset
> 
> Stefan Hajnoczi (1):
>        virtio-scsi: fix race in virtio_scsi_dataplane_start()
> 
>   hw/block/dataplane/virtio-blk.c |  5 +++++
>   hw/cxl/cxl-device-utils.c       | 12 +++++++++---
>   hw/cxl/cxl-host.c               | 17 ++++++++---------
>   hw/cxl/cxl-mailbox-utils.c      |  4 ++--
>   hw/i386/microvm.c               |  2 +-
>   hw/i386/pc_piix.c               |  2 +-
>   hw/i386/pc_q35.c                |  2 +-
>   hw/scsi/virtio-scsi-dataplane.c | 11 ++++++++---
>   hw/virtio/vhost-user.c          |  4 ++--
>   hw/virtio/vhost.c               | 10 +++++++---
>   hw/virtio/virtio-pci.c          | 19 +++++++++++++++----
>   tests/qtest/bios-tables-test.c  |  4 +++-
>   12 files changed, 62 insertions(+), 30 deletions(-)
> 
> 


