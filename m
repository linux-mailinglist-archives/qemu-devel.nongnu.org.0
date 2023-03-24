Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF536C804A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 15:49:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pffZY-0006CW-8l; Fri, 24 Mar 2023 07:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pffZU-0006C5-8b
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 07:27:00 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pffZ0-0006S0-VY
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 07:27:00 -0400
Received: by mail-wm1-x32c.google.com with SMTP id l37so949268wms.2
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 04:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679657171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MlHKJ6K1zct95sARRkCFNAhuCnsPonoHrS1/OWLVQnc=;
 b=Q5qYAO2lTWhTlrD/RhA62HYQcC8VQnFBYBGDKWBZ7TkDS3YLY37haLw886DpnH/0AO
 x6fp3sLicfQ+a8W8Td7jT68Feh/L9GyYNOrk76vwS7T3UorMDJTT2tNgHi8J4FKSbIMI
 9iNLj7T9xB+uj3KJX+XAyTIdBP8VYlmuxWP+nx8wkpu/5CVTGdwUPdFFPb066c0aL2U+
 ls1LVmEAGghi4Frvxk2iApKCVxMpvvhkc+XnPya2i5gSRbphjlnFlxW0ieQ89fJCImZr
 WjZoLVWLP/jUKD5WOm2PEdCRZ2m+l2SM5LSSmG8qblFPH32PQSj8DaA0FzoG+bIehtDn
 yYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679657171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MlHKJ6K1zct95sARRkCFNAhuCnsPonoHrS1/OWLVQnc=;
 b=TaxsczTF6JyfpH+mQld0anWaWwUUO/34FaIcW8KzkpIGT6rlsyq0gCKFHjQgIyAbbZ
 mGDrmWvx0Rjfuq3Snm1DD7xqenjvXUr9eEQCTAc+pNgw73B3tlTJyiWX5HyT5YJuprtX
 84/BRM2x28dlIKtzqcp2BLf8CWtEoQZ3VWHhdCEF7CCNRdjpAAwTUIcnY+xcs3gncXNh
 +7iYVDhjMNfZBW5vzg7RAujdt9yaP1bxLo8H0aWDbU3P9s+y0qqUkgTEdnezkpkn4C98
 pAauGNWMpRHLWWpGPITi/DCGss4FHa8gKNtYg3ZJ/oBr1/RrtrAYuKGz5aYmmtfE56WB
 8vjA==
X-Gm-Message-State: AO0yUKWQsw1/7kKeL70Lrbvi/ttEaZIxDYBTY/rHUqaEKuQ2zTQhzGQD
 oVpSSbCFDBFfj7AsGMoGcgJoeA==
X-Google-Smtp-Source: AK7set8lbM6OFY45kOwrU0ydbnXWYjFWNk8zS8Z/eBOEdq+VHsQWWmu5QL/0aHDXltztJAjbvkKXgg==
X-Received: by 2002:a05:600c:2286:b0:3ea:ecc2:daab with SMTP id
 6-20020a05600c228600b003eaecc2daabmr2647798wmf.3.1679657166949; 
 Fri, 24 Mar 2023 04:26:06 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.149])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adfef85000000b002cfed482e9asm18250440wro.61.2023.03.24.04.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 04:26:06 -0700 (PDT)
Message-ID: <41f2ee75-0465-94d4-90bb-7289e49fdb5d@linaro.org>
Date: Fri, 24 Mar 2023 12:26:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v18 0/8] Add support for zoned device
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, hare@suse.de,
 damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org
References: <20230324090605.28361-1-faithilikerun@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230324090605.28361-1-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Sam,

On 24/3/23 10:05, Sam Li wrote:
> Zoned Block Devices (ZBDs) devide the LBA space to block regions called zones
> that are larger than the LBA size. It can only allow sequential writes, which
> reduces write amplification in SSD, leading to higher throughput and increased
> capacity. More details about ZBDs can be found at:
> 
> https://zonedstorage.io/docs/introduction/zoned-storage
> 
> The zoned device support aims to let guests (virtual machines) access zoned
> storage devices on the host (hypervisor) through a virtio-blk device. This
> involves extending QEMU's block layer and virtio-blk emulation code.  In its
> current status, the virtio-blk device is not aware of ZBDs but the guest sees
> host-managed drives as regular drive that will runs correctly under the most
> common write workloads.
> 
> This patch series extend the block layer APIs with the minimum set of zoned
> commands that are necessary to support zoned devices. The commands are - Report
> Zones, four zone operations and Zone Append.
> 
> There has been a debate on whethre introducing new zoned_host_device BlockDriver
> specifically for zoned devices. In the end, it's been decided to stick to
> existing host_device BlockDriver interface by only adding new zoned operations
> inside it. The benefit of that is to avoid further changes - one example is
> command line syntax - to the applications like Libvirt using QEMU zoned
> emulation.
> 
> It can be tested on a null_blk device using qemu-io or qemu-iotests. For
> example, to test zone report using qemu-io:
> $ path/to/qemu-io --image-opts -n driver=host_device,filename=/dev/nullb0
> -c "zrp offset nr_zones"

Sorry to jump late, but the patch subject prefixes are a bit confusing.
Some suggestions:

> Sam Li (8):
>    include: add zoned device structs

block/block-common: ...

>    file-posix: introduce helper functions for sysfs attributes

block/file-posix: ...

>    block: add block layer APIs resembling Linux ZonedBlockDevice ioctls

block/block-backend: ...

>    raw-format: add zone operations to pass through requests

block/raw-format: ...

>    config: add check to block layer

block: ...

>    qemu-iotests: test new zone operations

iotests: ...

>    block: add some trace events for new block layer APIs

I'd squash that with patch #4 "block/raw-format: add zone operations to 
pass through requests".

Regards,

Phil.

>    docs/zoned-storage: add zoned device documentation
> 
>   block.c                                |  19 ++
>   block/block-backend.c                  | 133 ++++++++
>   block/file-posix.c                     | 444 +++++++++++++++++++++++--
>   block/io.c                             |  41 +++
>   block/raw-format.c                     |  18 +
>   block/trace-events                     |   2 +
>   docs/devel/zoned-storage.rst           |  43 +++
>   docs/system/qemu-block-drivers.rst.inc |   6 +
>   include/block/block-common.h           |  43 +++
>   include/block/block-io.h               |   9 +
>   include/block/block_int-common.h       |  29 ++
>   include/block/raw-aio.h                |   6 +-
>   include/sysemu/block-backend-io.h      |  18 +
>   meson.build                            |   4 +
>   qemu-io-cmds.c                         | 149 +++++++++
>   tests/qemu-iotests/tests/zoned         |  89 +++++
>   tests/qemu-iotests/tests/zoned.out     |  53 +++
>   17 files changed, 1069 insertions(+), 37 deletions(-)
>   create mode 100644 docs/devel/zoned-storage.rst
>   create mode 100755 tests/qemu-iotests/tests/zoned
>   create mode 100644 tests/qemu-iotests/tests/zoned.out
> 


