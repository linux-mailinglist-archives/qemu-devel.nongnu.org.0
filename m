Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D6B54D4F2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 01:04:33 +0200 (CEST)
Received: from localhost ([::1]:40968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1c3r-0006lr-TU
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 19:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1c1t-00061k-0z
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 19:02:29 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1c1r-0001fr-6D
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 19:02:28 -0400
Received: by mail-pl1-x630.google.com with SMTP id o6so11654235plg.2
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 16:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=qWCEAL+HAJiCXpVIw3vDUSrrI1GHEdYOrXZ8uv0im7o=;
 b=Z1eZpDf174pGHJ6HjCZL0GAwnvmn2FIx2ek4Cg6yTpOjJSbnrbJquGuCxbLbB3mXoN
 VpmMd2JGTV6Sah/4VNiV1tYldj2wsyIwVgUzlI/Mu4V/jmS+VB4h1ByYVmhc1iQ0k4b/
 DffG2Lk+uh50RiliMr+NzLbltjAkXbP5xH7Y4nji0CXqRqYdqFl7yV1VIgen4ZFkcQfk
 X+YZCtD3yLdzYAx9RNgkCsEtLIKDpO+6ycsw7TOMTZmpiTaezjlR4rtep1GVVOHIBofQ
 ZPl5uqp7GH1Z/+4j1uljPzxrBcd+n1izCA2h9Ke+tGEZAUXVY88jQv96bj3b/rb6C09U
 j8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qWCEAL+HAJiCXpVIw3vDUSrrI1GHEdYOrXZ8uv0im7o=;
 b=efswu9xzl9HOq5DBWmCzVHfRv6PM7F8bqiXAYBeEJWstUxzlO/BJoG/nL8KeqJ++1s
 qHggGddWhdcdtU5rle5dB10R7DnkDSwAdImGv0qm4fguCJeD/NIVqNZbWzzCi/6SPdWL
 by1ssY7zxYkoQWlnhd2ENMzCiQn0Y7tqaerXqXjehb8wpFEw2EESDI0w4oL03YDdPvnN
 P0r/h4o07lkRR/AWJi/acWg35pM27atPJn1Rt67ZVq19RCQPia0XORjkEUdjm3SYaFfg
 aUtPd2rxNIO83k0dR267Sy0tKX5DiWb98kO6Td0ud3o9WL7jYJy7Q9bCiVqYawUHLj5U
 WP9g==
X-Gm-Message-State: AJIora+bqwe2Ogx2lRsJHUE3fjpDcUW96AhEfHpois2qKI2WEZaWvWam
 LcZmoWdiVZPNiSeVSdEAyWTaPg==
X-Google-Smtp-Source: AGRyM1u7JQjAXyz8+rR7TgyjkZUP8jVM2Q36Bq8D2+S9eVJ8nNVbmOQrFHm67CWAYeBJ4TGjbRLg/A==
X-Received: by 2002:a17:90b:1b10:b0:1e8:2966:3232 with SMTP id
 nu16-20020a17090b1b1000b001e829663232mr12675713pjb.103.1655334145167; 
 Wed, 15 Jun 2022 16:02:25 -0700 (PDT)
Received: from [172.22.33.109] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a170902d1d200b0016782c55790sm142355plb.232.2022.06.15.16.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 16:02:24 -0700 (PDT)
Message-ID: <8daf295d-7af1-73ad-739f-7311a5584626@linaro.org>
Date: Wed, 15 Jun 2022 16:02:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/18] Block patches
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220615155129.1025811-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220615155129.1025811-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 6/15/22 08:51, Stefan Hajnoczi wrote:
> The following changes since commit 8e6c70b9d4a1b1f3011805947925cfdb31642f7f:
> 
>    Merge tag 'kraxel-20220614-pull-request' of git://git.kraxel.org/qemu into staging (2022-06-14 06:21:46 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> 
> for you to fetch changes up to 99b969fbe105117f5af6060d3afef40ca39cc9c1:
> 
>    linux-aio: explain why max batch is checked in laio_io_unplug() (2022-06-15 16:43:42 +0100)
> 
> ----------------------------------------------------------------
> Pull request
> 
> This pull request includes an important aio=native I/O stall fix, the
> experimental vifo-user server, the io_uring_register_ring_fd() optimization for
> aio=io_uring, and an update to Vladimir Sementsov-Ogievskiy's maintainership
> details.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Jagannathan Raman (14):
>    qdev: unplug blocker for devices
>    remote/machine: add HotplugHandler for remote machine
>    remote/machine: add vfio-user property
>    vfio-user: build library
>    vfio-user: define vfio-user-server object
>    vfio-user: instantiate vfio-user context
>    vfio-user: find and init PCI device
>    vfio-user: run vfio-user context
>    vfio-user: handle PCI config space accesses
>    vfio-user: IOMMU support for remote device
>    vfio-user: handle DMA mappings
>    vfio-user: handle PCI BAR accesses
>    vfio-user: handle device interrupts
>    vfio-user: handle reset of remote device
> 
> Sam Li (1):
>    Use io_uring_register_ring_fd() to skip fd operations
> 
> Stefan Hajnoczi (2):
>    linux-aio: fix unbalanced plugged counter in laio_io_unplug()
>    linux-aio: explain why max batch is checked in laio_io_unplug()
> 
> Vladimir Sementsov-Ogievskiy (1):
>    MAINTAINERS: update Vladimir's address and repositories
> 
>   MAINTAINERS                             |  27 +-
>   meson_options.txt                       |   2 +
>   qapi/misc.json                          |  31 +
>   qapi/qom.json                           |  20 +-
>   configure                               |  17 +
>   meson.build                             |  24 +-
>   include/exec/memory.h                   |   3 +
>   include/hw/pci/msi.h                    |   1 +
>   include/hw/pci/msix.h                   |   1 +
>   include/hw/pci/pci.h                    |  13 +
>   include/hw/qdev-core.h                  |  29 +
>   include/hw/remote/iommu.h               |  40 +
>   include/hw/remote/machine.h             |   4 +
>   include/hw/remote/vfio-user-obj.h       |   6 +
>   block/io_uring.c                        |  12 +-
>   block/linux-aio.c                       |  10 +-
>   hw/core/qdev.c                          |  24 +
>   hw/pci/msi.c                            |  49 +-
>   hw/pci/msix.c                           |  35 +-
>   hw/pci/pci.c                            |  13 +
>   hw/remote/iommu.c                       | 131 ++++
>   hw/remote/machine.c                     |  88 ++-
>   hw/remote/vfio-user-obj.c               | 958 ++++++++++++++++++++++++
>   softmmu/physmem.c                       |   4 +-
>   softmmu/qdev-monitor.c                  |   4 +
>   stubs/vfio-user-obj.c                   |   6 +
>   tests/qtest/fuzz/generic_fuzz.c         |   9 +-
>   .gitlab-ci.d/buildtest.yml              |   1 +
>   .gitmodules                             |   3 +
>   Kconfig.host                            |   4 +
>   hw/remote/Kconfig                       |   4 +
>   hw/remote/meson.build                   |   4 +
>   hw/remote/trace-events                  |  11 +
>   scripts/meson-buildoptions.sh           |   4 +
>   stubs/meson.build                       |   1 +
>   subprojects/libvfio-user                |   1 +
>   tests/docker/dockerfiles/centos8.docker |   2 +
>   37 files changed, 1565 insertions(+), 31 deletions(-)
>   create mode 100644 include/hw/remote/iommu.h
>   create mode 100644 include/hw/remote/vfio-user-obj.h
>   create mode 100644 hw/remote/iommu.c
>   create mode 100644 hw/remote/vfio-user-obj.c
>   create mode 100644 stubs/vfio-user-obj.c
>   create mode 160000 subprojects/libvfio-user
> 


