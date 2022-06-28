Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E6B55BFA2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:55:20 +0200 (CEST)
Received: from localhost ([::1]:51656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o670B-0006ID-Ao
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o66Q9-0008IL-Fy
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:18:05 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:44755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o66Q7-0002qu-AX
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:18:05 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 65so11298051pfw.11
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 01:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=85TRZM4x4H0Onxt9hXtvnvzl4IWKQ3yth36Domq5fjY=;
 b=atwA1MLqHT30OGC/kpB+FucZyA3xPCimQvX2iOQ8Souy0qU6zAiNRjEg52f2044eyn
 68nQYmo0NmtiTOosOwAP9e55dTiN/M6drgXMm64DUmlHM5/HU2VHymEkLEerBZC+Thtn
 y9SA0lRr7lT8DrUU7UyCwqU3qoINrtg2bWMkQKdVxkaOznIEesqzOtFk5X0sD9RQjmhy
 SEmvKtXOrOJcwfoPQEtNDTZ579dldZOJePN2mQM43/K9PKyPLrkiReEgYM44C3M2TdqA
 oPtzCxkPsFXJyskTD91S6AlmMLNuggLCaIT4wrnGVh5Oh7ATQkLG8UwxWH0jbC0y2MO+
 2QEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=85TRZM4x4H0Onxt9hXtvnvzl4IWKQ3yth36Domq5fjY=;
 b=N+FTbyPGQCBTqOvCs8osU9/IIWgv9/jSOCtQGUaQ2J0Vy3AcGAsXEFAvvFjYj2m3kf
 LNorMBRE2AnoQ/CeMMK3GJT7AUlmuCXiWkwjPEQpIVaZdiJhyzmp++DmpOqBTjXHA45o
 OOQc9LEA2fF4SN5efb8vOwOhAUYsYdSb+1buHDYuBkUfn3JS0QacNB0qYP4Zre3i4vc0
 0pvp1A3IBRz4OyWJf4cTgqco+yMeNHeJaEqGtgITCcdwu5l+PS6sNwuUeAHV1isbtZJF
 kJ5aLQPDzFO/Q4TmC1pJDPqK5QpXAeEOa3BjyJ91rqOq//oM2gPyt+MkFxcMH+sogYU9
 xLYw==
X-Gm-Message-State: AJIora/W6EIGzY9T9RBj5Cu2bTWHvAfIgyYmwOatme2ixOlxfLMrTTD9
 xAcA7cZkDAf2/8ply4zW/VAybQ==
X-Google-Smtp-Source: AGRyM1tlkfxCmN6XiRBrvwSw3uorIMYuj+TlJLd2pKZzDSFXGaJ0Czjgwet6do5VrVpRvvTANmTbiQ==
X-Received: by 2002:a63:4558:0:b0:411:442a:b740 with SMTP id
 u24-20020a634558000000b00411442ab740mr4956428pgk.540.1656404281736; 
 Tue, 28 Jun 2022 01:18:01 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a17090a7d1000b001ec87220fb9sm8877799pjl.16.2022.06.28.01.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 01:18:01 -0700 (PDT)
Message-ID: <9d41e2b4-095c-7439-ba4b-2263ce4597bc@linaro.org>
Date: Tue, 28 Jun 2022 13:47:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/12] virtio: fixes
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220628044201.217173-1-mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220628044201.217173-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 6/28/22 10:12, Michael S. Tsirkin wrote:
> The following changes since commit 097ccbbbaf2681df1e65542e5b7d2b2d0c66e2bc:
> 
>    Merge tag 'qemu-sparc-20220626' of https://github.com/mcayland/qemu into staging (2022-06-27 05:21:05 +0530)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to 81cf38f3ff3c7db8fcd2f46df9a294fdf6f4a910:
> 
>    include/hw/virtio: document vhost_ack_features (2022-06-27 18:53:18 -0400)
> 
> ----------------------------------------------------------------
> virtio: fixes
> 
> fixes all over the place
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alex Bennée (3):
>        contrib/vhost-user-blk: fix 32 bit build and enable
>        include/hw/virtio: document vhost_get_features
>        include/hw/virtio: document vhost_ack_features
> 
> David Hildenbrand (1):
>        MAINTAINERS: Collect memory device files in "Memory devices"
> 
> Jagannathan Raman (1):
>        msi: fix MSI vector limit check in msi_set_mask()
> 
> Kevin Wolf (3):
>        docs/vhost-user: Fix mismerge
>        libvhost-user: Fix VHOST_USER_GET_MAX_MEM_SLOTS reply
>        libvhost-user: Fix VHOST_USER_ADD_MEM_REG reply
> 
> Konstantin Khlebnikov (2):
>        vhost: add method vhost_set_vring_err
>        vhost: setup error eventfd and dump errors
> 
> Zhenzhong Duan (2):
>        virtio-iommu: Fix the partial copy of probe request
>        virtio-iommu: Fix migration regression
> 
>   include/hw/virtio/vhost-backend.h         |  3 +++
>   include/hw/virtio/vhost.h                 | 22 ++++++++++++++++++
>   contrib/vhost-user-blk/vhost-user-blk.c   |  6 ++---
>   hw/pci/msi.c                              |  4 ++--
>   hw/virtio/vhost-backend.c                 |  7 ++++++
>   hw/virtio/vhost-user.c                    |  6 +++++
>   hw/virtio/vhost.c                         | 37 +++++++++++++++++++++++++++++++
>   hw/virtio/virtio-iommu.c                  | 16 +++++++++----
>   subprojects/libvhost-user/libvhost-user.c | 19 +++-------------
>   MAINTAINERS                               | 25 ++++++++++++---------
>   contrib/vhost-user-blk/meson.build        |  3 +--
>   docs/interop/vhost-user.rst               | 16 -------------
>   meson.build                               |  2 +-
>   13 files changed, 112 insertions(+), 54 deletions(-)
> 
> 


