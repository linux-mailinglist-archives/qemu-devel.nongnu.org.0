Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D40452D5D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 09:57:04 +0100 (CET)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmuH1-0005s2-5L
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 03:57:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmuG4-00051f-Q3
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:56:04 -0500
Received: from [2a00:1450:4864:20::433] (port=43690
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmuG2-0004tx-Dt
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:56:04 -0500
Received: by mail-wr1-x433.google.com with SMTP id t30so35989539wra.10
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 00:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OgpS53R0OL6+WH5T61FYD+Dpv1PGomir5A1iEvOAObU=;
 b=KXpmZS5jcKKIjCnIu+MIGr1dJTrkad36SL/2KDDO505wn4Hj+3wSZQZhyc63UKTBv4
 0RQ/yRXE/ugmAPnZBauGnMaPYdwy7jWfpcYVUoscCzOGEkgvdyaK0pZAuC7BWO2oY2H+
 Jue8y5xoz+rGZaPfHXHRHidZ4dufRQ/Rt7ryAx4IDOr5PUbUN6VnUBiBby+ok6TJ5ELx
 bv2usUHabbfvDu5SbrVxAJmYjMCb7h7RdPaaR3502q37QeYPtCRW0iL1jJkcQ1Royn8t
 KFPIUxPcgYLtw64fsBxup3EvZUYUWXnrHhZkfGZD/GpqPMRLHislr+kposYv2IV3ltVm
 ihoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OgpS53R0OL6+WH5T61FYD+Dpv1PGomir5A1iEvOAObU=;
 b=ch9CALoi2/D4kSY/YhRR7X0ScCC7y2Gw4ZNp2gfMgMQpDs+daC9O1AT4inV3wibIAt
 tc2hkGIjB3QdkGCNsVBa47MNPF5yKh89rHRTg70Fsh6s/Gb1hthf72Yvr6udorNxqPui
 gZUMVFpBVXJ4sHm5IqaJGI56ayVVEyRQroRg2oiJLHLUPkKlu6XdYWJfbxzUeY/BMfj1
 elSreyg/IGAVrMBj3ajweI/c++jpjctAbeRot2ToZKZmEXCGQqy/jySdpD4kWivz5UZw
 HaS1Wjm3oga4b4QImkH6E6AtQpmYHtzb645eAl8TCwrVwGTXGVHvfFg0LivUt7fPyq1l
 s7iA==
X-Gm-Message-State: AOAM5305pjK/jVF1iIQLKIk/D/WNXenKEFZp3dbODpheee4BVvJHYwXV
 G59NCFWTJoCUYUe537LP04O95w==
X-Google-Smtp-Source: ABdhPJyWT2hqZkUy0ksL6xvkKlFGBOYqx18St8B7D96KS76mekZbzn3EKz8/fljjQYrIAz5kmoMX3A==
X-Received: by 2002:a05:6000:15c8:: with SMTP id
 y8mr7471184wry.101.1637052960732; 
 Tue, 16 Nov 2021 00:56:00 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id j19sm16840243wra.5.2021.11.16.00.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 00:56:00 -0800 (PST)
Subject: Re: [PULL 00/20] pci,pc,virtio: bugfixes
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20211115163607.177432-1-mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f87ec65-5ccf-52d1-3230-b2287ca95c9c@linaro.org>
Date: Tue, 16 Nov 2021 09:55:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 11/15/21 5:37 PM, Michael S. Tsirkin wrote:
> The following changes since commit 0a70bcf18caf7a61d480f8448723c15209d128ef:
> 
>    Update version for v6.2.0-rc0 release (2021-11-09 18:22:57 +0100)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to 18416c62e36a79823a9e28f6b2260aa13c25e1d9:
> 
>    pcie: expire pending delete (2021-11-15 11:10:11 -0500)
> 
> ----------------------------------------------------------------
> pci,pc,virtio: bugfixes
> 
> pci power management fixes
> acpi hotplug fixes
> misc other fixes
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> Eugenio Pérez (4):
>        vhost: Rename last_index to vq_index_end
>        vhost: Fix last vq queue index of devices with no cvq
>        vdpa: Replace qemu_open_old by qemu_open at
>        vdpa: Check for existence of opts.vhostdev
> 
> Gerd Hoffmann (6):
>        pci: implement power state
>        pcie: implement slot power control for pcie root ports
>        pcie: add power indicator blink check
>        pcie: factor out pcie_cap_slot_unplug()
>        pcie: fast unplug when slot power is off
>        pcie: expire pending delete
> 
> Igor Mammedov (2):
>        pcie: rename 'native-hotplug' to 'x-native-hotplug'
>        tests: bios-tables-test update expected blobs
> 
> Jason Wang (2):
>        virtio: use virtio accessor to access packed descriptor flags
>        virtio: use virtio accessor to access packed event
> 
> Julia Suvorova (3):
>        hw/acpi/ich9: Add compat prop to keep HPC bit set for 6.1 machine type
>        bios-tables-test: Allow changes in DSDT ACPI tables
>        hw/i386/acpi-build: Deny control on PCIe Native Hot-plug in _OSC
> 
> Philippe Mathieu-Daudé (1):
>        hw/mem/pc-dimm: Restrict NUMA-specific code to NUMA machines
> 
> Stefan Hajnoczi (1):
>        softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
> 
> Stefano Garzarella (1):
>        net/vhost-vdpa: fix memory leak in vhost_vdpa_get_max_queue_pairs()
> 
>   include/hw/acpi/ich9.h                |   1 +
>   include/hw/pci/pci.h                  |   2 +
>   include/hw/qdev-core.h                |   1 +
>   include/hw/virtio/vhost.h             |   4 +-
>   hw/acpi/ich9.c                        |  18 ++++++++
>   hw/i386/acpi-build.c                  |  12 ++++--
>   hw/i386/pc.c                          |   2 +
>   hw/i386/pc_q35.c                      |   9 +++-
>   hw/mem/pc-dimm.c                      |  23 ++++++----
>   hw/net/vhost_net.c                    |  12 +++---
>   hw/pci/pci.c                          |  25 ++++++++++-
>   hw/pci/pci_host.c                     |   6 ++-
>   hw/pci/pcie.c                         |  79 ++++++++++++++++++++++++++++------
>   hw/pci/pcie_port.c                    |   2 +-
>   hw/virtio/vhost-vdpa.c                |   2 +-
>   hw/virtio/virtio.c                    |  24 ++++-------
>   net/vhost-vdpa.c                      |   8 +++-
>   softmmu/qdev-monitor.c                |   6 ++-
>   tests/data/acpi/q35/DSDT              | Bin 8289 -> 8289 bytes
>   tests/data/acpi/q35/DSDT.acpihmat     | Bin 9614 -> 9614 bytes
>   tests/data/acpi/q35/DSDT.bridge       | Bin 11003 -> 11003 bytes
>   tests/data/acpi/q35/DSDT.cphp         | Bin 8753 -> 8753 bytes
>   tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9943 -> 9943 bytes
>   tests/data/acpi/q35/DSDT.ipmibt       | Bin 8364 -> 8364 bytes
>   tests/data/acpi/q35/DSDT.ivrs         | Bin 8306 -> 8306 bytes
>   tests/data/acpi/q35/DSDT.memhp        | Bin 9648 -> 9648 bytes
>   tests/data/acpi/q35/DSDT.mmio64       | Bin 9419 -> 9419 bytes
>   tests/data/acpi/q35/DSDT.multi-bridge | Bin 8583 -> 8583 bytes
>   tests/data/acpi/q35/DSDT.nohpet       | Bin 8147 -> 8147 bytes
>   tests/data/acpi/q35/DSDT.numamem      | Bin 8295 -> 8295 bytes
>   tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8894 -> 8894 bytes
>   tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8894 -> 8894 bytes
>   tests/data/acpi/q35/DSDT.xapic        | Bin 35652 -> 35652 bytes
>   33 files changed, 176 insertions(+), 60 deletions(-)

Applied, thanks.

r~

