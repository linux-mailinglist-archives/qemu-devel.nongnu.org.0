Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A54747614D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:03:24 +0100 (CET)
Received: from localhost ([::1]:40946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZYh-0005cL-Kq
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:03:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxXrb-0006Xy-5G
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:14:48 -0500
Received: from [2607:f8b0:4864:20::102e] (port=56224
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxXrY-0000Cl-Rd
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:14:46 -0500
Received: by mail-pj1-x102e.google.com with SMTP id v23so17980619pjr.5
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 09:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sPjmjlHxaEfBxh6AJTHB4EYW5RbYzPQnOlFXe7TbtcA=;
 b=pEqBg4dD/65fWJ0ykfw8UaV2EkbUaJtOXIegyUWcAQndP3Lr9SiBn5bInfyrN77cS5
 L2lOp0CGnJG6uhcUhLhMP5EMlWrg507+VgmbmekZ3Y2B4W/M5VRT/nraLZzehVUydBWJ
 AL0dzrUyVhq5B8cZtAf2aL2obFRvqCN1DFvj/XH2tOfS9XrdHDMkwEa3AGksEsqaumwR
 oR4FMztxLNc8k32e9lRfu/ULCm2MGvk/wI7RUPK6Sa54Wv4+Q1U5IFL3vrfSKGvlkDUS
 wEF2BHfD0oV/MZzPQIb3zmrmWwfDYn35u042uySwFKqV2ZzmjGSAk33cv0oSXERniTZM
 QM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sPjmjlHxaEfBxh6AJTHB4EYW5RbYzPQnOlFXe7TbtcA=;
 b=J1zlPnjQbNTByv23XkXte2zY9GsPhR47/Ukm/Yxz9mkLkbY2hmPhFrJv7UwgzLLljq
 J9MfAPzHjorkorWbfD2KyKQE6Kh0s+Q7C2bC5wbCWu9KhANYDjFciIHi7rJEgitdUM0I
 6EGwPXQulVThlk2KE0dhU0+V0Jis06wulI9LIzXHeQ8BuTRrlUhroTXtlxxLgCdSTSgm
 MM+Lk6f6ddJsnZLx6DV0E5ckkUTd/BcEdxm/jCKvs5Q0pFyarRNZgdyTnBjcTvUS51HM
 gEkSSKiAoVwMRWo3xqZlSdClTO/t4izPImBtJpn86zk174Ek6O4P6pq3s5UXLI95abOE
 XkRA==
X-Gm-Message-State: AOAM533vl5ETyT9Wl3pFRVrfO2W6tqo5hMc8X3L4BYxDKMQZSBg3hhC2
 zcSBnwLX7/PmkpVp41Iwr2UCbtDYK+5URw==
X-Google-Smtp-Source: ABdhPJxwnNBR3dQy7Vc2Tcwg8ZiJGL53QIWlMB04N2bHh/9MiEzVKA2hA09LCDJo14mw5LzHgriejg==
X-Received: by 2002:a17:902:8603:b0:148:af0c:cbd with SMTP id
 f3-20020a170902860300b00148af0c0cbdmr2200573plo.126.1639588483061; 
 Wed, 15 Dec 2021 09:14:43 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id 10sm1585478pfm.56.2021.12.15.09.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 09:14:42 -0800 (PST)
Subject: Re: [PULL 00/16] qtest and gitlab-CI improvements
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211215073402.144286-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8bad026b-d648-e72e-bb2d-c2fea5463a0d@linaro.org>
Date: Wed, 15 Dec 2021 09:14:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215073402.144286-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/14/21 11:33 PM, Thomas Huth wrote:
>   Hi!
> 
> The following changes since commit 76b56fdfc9fa43ec6e5986aee33f108c6c6a511e:
> 
>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2021-12-14 12:46:18 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2021-12-15
> 
> for you to fetch changes up to 7876cba8fc0cab9a4c803a30f427d4b20b95a868:
> 
>    gitlab-ci: Test compilation on Windows with MSYS2 (2021-12-15 08:08:59 +0100)
> 
> ----------------------------------------------------------------
> * Add virtio-net failover test
> * Make qtests a little bit more flexible with regards to reduced configs
> * Move libssh setup from configure to meson.build
> * Run device-crash-test in CI
> * Add jobs for NetBSD and OpenBSD to the CI
> * Test compilation with MSYS2 in the gitlab-ci, too
> * Add new virtio-iommu test
> 
> ----------------------------------------------------------------
> Eric Auger (4):
>        virtio-iommu: Remove set_config callback
>        virtio-iommu: Fix endianness in get_config
>        virtio-iommu: Fix the domain_range end
>        tests: qtest: Add virtio-iommu test
> 
> Laurent Vivier (4):
>        qtest/libqos: add a function to initialize secondary PCI buses
>        tests/qtest: add some tests for virtio-net failover
>        tests/libqtest: add some virtio-net failover migration cancelling tests
>        tests/libqtest: add a migration test with two couples of failover devices
> 
> Thomas Huth (8):
>        tests/qtest: Run the PPC 32-bit tests with the 64-bit target binary, too
>        tests/qtest: Fence the tests that need xlnx-zcu102 with CONFIG_XLNX_ZYNQMP_ARM
>        tests/qtest: Add a function that gets a list with available machine types
>        tests/qtest: Add a function to check whether a machine is available
>        Move the libssh setup from configure to meson.build
>        gitlab-ci.d/buildtest: Add jobs that run the device-crash-test
>        gitlab-ci: Add cirrus-ci based tests for NetBSD and OpenBSD
>        gitlab-ci: Test compilation on Windows with MSYS2
> 
>   .gitlab-ci.d/buildtest.yml        |   23 +
>   .gitlab-ci.d/cirrus.yml           |   35 +
>   .gitlab-ci.d/cirrus/kvm-build.yml |   31 +
>   .gitlab-ci.d/qemu-project.yml     |    1 +
>   .gitlab-ci.d/windows.yml          |   98 +++
>   configure                         |   27 -
>   hw/virtio/trace-events            |    3 +-
>   hw/virtio/virtio-iommu.c          |   42 +-
>   include/hw/pci/pci_bridge.h       |    8 +
>   meson.build                       |   13 +-
>   meson_options.txt                 |    2 +
>   scripts/meson-buildoptions.sh     |    3 +
>   tests/qtest/boot-serial-test.c    |    3 +-
>   tests/qtest/cdrom-test.c          |    8 +-
>   tests/qtest/libqos/libqtest.h     |    8 +
>   tests/qtest/libqos/meson.build    |    1 +
>   tests/qtest/libqos/pci.c          |  119 ++++
>   tests/qtest/libqos/pci.h          |    1 +
>   tests/qtest/libqos/virtio-iommu.c |  126 ++++
>   tests/qtest/libqos/virtio-iommu.h |   40 ++
>   tests/qtest/libqtest.c            |   79 ++-
>   tests/qtest/meson.build           |    9 +-
>   tests/qtest/prom-env-test.c       |    8 +-
>   tests/qtest/virtio-iommu-test.c   |  326 +++++++++
>   tests/qtest/virtio-net-failover.c | 1352 +++++++++++++++++++++++++++++++++++++
>   25 files changed, 2290 insertions(+), 76 deletions(-)
>   create mode 100644 .gitlab-ci.d/cirrus/kvm-build.yml
>   create mode 100644 .gitlab-ci.d/windows.yml
>   create mode 100644 tests/qtest/libqos/virtio-iommu.c
>   create mode 100644 tests/qtest/libqos/virtio-iommu.h
>   create mode 100644 tests/qtest/virtio-iommu-test.c
>   create mode 100644 tests/qtest/virtio-net-failover.c

Applied, thanks.

r~


