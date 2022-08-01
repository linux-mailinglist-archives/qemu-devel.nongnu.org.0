Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCA6586E7F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 18:25:14 +0200 (CEST)
Received: from localhost ([::1]:41912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIYED-0006tN-3f
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 12:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIXxY-00022q-7Z; Mon, 01 Aug 2022 12:08:00 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:41781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIXxW-0003JR-1d; Mon, 01 Aug 2022 12:07:59 -0400
Received: by mail-yb1-xb36.google.com with SMTP id y127so19670946yby.8;
 Mon, 01 Aug 2022 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=gOLdRPWNyF5TB5o92vTnRvM7oD5rHDcIVFZlM7Gkkmo=;
 b=m1dr0/+6kesQmXDUZahf++sWrsQbyhysVejnc9Nj9pfSTE+0ztsNhLImXZeWbEkIzQ
 QxwPvxXsyywapLhhhSZbzxTtkr2tQK27jUj2UkSMwHy4+5vOHn/roQZ+FTq1zjZtdfIR
 Hmn4CxXn5SzfzgZOoLhjL2LFoB2aXwmVd3TJqP5JeNmNnE/aJFjC1cdpejXDxCKHTmwG
 CMDJzWpuzROx+oux/thzo1AuNozCpr6q3LB6cwZOSjq7hETkEXaruppnRTlEJi8a+co+
 6drqcpzM0pl5eEyPN1/sVYvf4UPMaVWwxYndYnDnN8Jd9IOoU03hTlhj8OzQqw0GjtGU
 KhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=gOLdRPWNyF5TB5o92vTnRvM7oD5rHDcIVFZlM7Gkkmo=;
 b=LJ/T5UUiUT6VVBhhLUeb9xeXZzFwgQtprITguoozEMUENVFu15laQWZpw1QeXra1Gl
 86jkT0k2bKRo646BlmYwLYr963CJ+eEQGMFtEZmL8beSQih7Sth3362oUARm8AqrfHSK
 /wJM2j7JHl5tCkxt369y81L5az0DYj81S+vNA0DfBRbp3s/XInXWHJL8glpFTysl6C3C
 jFnDUIcS7QikGjuZPrsCZXY64gcRI3Izmd+w2u9XyC8ilB6FW+ky6WZT0nTPkjxSXAOU
 if0bLeS1CD0GvghD8rEk6MyVNM2ObYAfx3OFnPdFDWrlEftKcvhIPU+6F9RQCTr8OutD
 EtEg==
X-Gm-Message-State: ACgBeo0OrtRuO+F5WIXmlr2FVH1ljX8BZs5K4LEoIJnba+qGthIlC5Va
 2ChbegcWt7PK+RWdTLJHHm9KY5AOilT+KKgZwo0=
X-Google-Smtp-Source: AA6agR6oMkUmVHBkAmmY//uW9WdImoAi5ODma5q7FV2qKUzSJdLC8mk6L5SB2Shl6FDS9vH/HL1CHvFt5lq94UzriCQ=
X-Received: by 2002:a5b:c87:0:b0:66f:2298:4ed7 with SMTP id
 i7-20020a5b0c87000000b0066f22984ed7mr11401729ybq.207.1659370076492; Mon, 01
 Aug 2022 09:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220801013427.10811-1-faithilikerun@gmail.com>
In-Reply-To: <20220801013427.10811-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 1 Aug 2022 12:07:44 -0400
Message-ID: <CAJSP0QW2Cpg4VyQJvaRaeDPTJKuH_3NUvE6BZ_KowhgbwQ12Tg@mail.gmail.com>
Subject: Re: [RFC v5 11/11] docs/zoned-storage: add zoned device documentation
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com, 
 dmitry.fomichev@wdc.com, hare@suse.de, stefanha@redhat.com, mst@redhat.com, 
 armbru@redhat.com, qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, 
 hreitz@redhat.com, eblake@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Sun, 31 Jul 2022 at 21:42, Sam Li <faithilikerun@gmail.com> wrote:
>
> Add the documentation about the zoned device support to virtio-blk
> emulation.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  docs/devel/zoned-storage.rst           | 68 ++++++++++++++++++++++++++
>  docs/system/qemu-block-drivers.rst.inc |  6 +++
>  2 files changed, 74 insertions(+)
>  create mode 100644 docs/devel/zoned-storage.rst
>
> diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
> new file mode 100644
> index 0000000000..e62927dceb
> --- /dev/null
> +++ b/docs/devel/zoned-storage.rst
> @@ -0,0 +1,68 @@
> +=============
> +zoned-storage
> +=============
> +
> +Zoned Block Devices (ZBDs) devide the LBA space to block regions called zones

s/space to block/space into block/

> +that are larger than the LBA size. It can only allow sequential writes, which
> +reduces write amplification in SSD, leading to higher throughput and increased

s/SSD/SSDs/

> +capacity. More details about ZBDs can be found at:
> +
> +https://zonedstorage.io/docs/introduction/zoned-storage
> +
> +zone emulation
> +--------------
> +In its current status, the virtio-blk device is not aware of ZBDs but the guest
> +sees host-managed drives as regular drive that will runs correctly under the
> +most common write workloads.

I don't understand this paragraph. I suggest dropping it. virtio-blk
can be mentioned further down.

> +
> +The zoned device support aims to let guests (virtual machines) access zoned
> +storage devices on the host (hypervisor) through a virtio-blk device. This
> +involves extending QEMU's block layer and virtio-blk emulation code.

This text is specific to your Outreachy project with the goal of
passing through zoned devices via virtio-blk. I suggest writing this
documentation from a broader point of view (emulated storage
controllers and core block layer APIs) and not focussing specifically
on virtio-blk:

1. Block layer APIs for zoned storage
Discuss the QEMU block layer's zoned storage model here. Mention
BlockLimits and how block drivers declare support for zoned storage.

2. Emulating zoned storage controllers
Discuss how emulated storage controllers can use the block layer APIs
when the BlockBackend's BlockLimits model reports a zoned storage
device.

This will help developers who aren't familiar with virtio-blk.
References to virtio-blk make it harder for them to understand how
they should use zoned storage.

> +
> +If the host supports zoned block devices, it can set VIRTIO_BLK_F_ZONED. Then
> +in the guest side, it appears following situations:
> +1) If the guest virtio-blk driver sees the VIRTIO_BLK_F_ZONED bit set, then it
> +will assume that the zoned characteristics fields of the config space are valid.
> +2) If the guest virtio-blk driver sees a zoned model that is NONE, then it is
> +known that is a regular block device.
> +3) If the guest virtio-blk driver sees a zoned model that is HM(or HA), then it
> +is known that is a zoned block device and probes the other zone fields.
> +
> +On QEMU sides,
> +1) The DEFINE PROP BIT macro must be used to declare that the host supports
> +zones.
> +2) BlockDrivers can declare zoned device support once known the zoned model
> +for the block device is not NONE.
> +
> +zoned storage APIs
> +------------------
> +
> +Zone emulation part extends the block layer APIs and virtio-blk emulation section

It's often clearer to describe new features directly instead of the
extensions, changes, or old vs new. The person reading this might not
be familiar with QEMU's block APIs before zoned storage and they don't
care what changed. They just need to know what zoned storage APIs are
available and how to use them.

Here I would say only "The block layer APIs support commands needed
for zoned storage devices, including report zones, four zone
operations, and zone append".

When discussing the zoned storage APIs, avoid mentioning storage
controller emulation as the user of the block API. That is just one
use case. It's possible that zoned storage APIs will be used in other
ways in the future. For example, the qcow2 image format driver could
be optimized for zoned storage devices by laying out and accessing its
metadata on zoned devices using the block APIs. The documentation
should be general enough that someone intending to use the block APIs
differently shouldn't have to know about zoned storage controller
emulation in order to figure out how to use the block APIs for other
purposes.

> +with the minimum set of zoned commands that are necessary to support zoned
> +devices. The commands are - Report Zones, four zone operations and Zone Append
> +(developing).
> +
> +testing
> +-------
> +
> +It can be tested on a null_blk device using qemu-io, qemu-iotests or blkzone(8)
> +command in the guest os.
> +
> +1. For example, the command line for zone report using qemu-io is:
> +
> +$ path/to/qemu-io --image-opts driver=zoned_host_device,filename=/dev/nullb0 -c
> +"zrp offset nr_zones"
> +
> +To enable zoned device in the guest os, the guest kernel must have the virtio-blk
> +driver with ZBDs support. The link to such patches for the kernel is:
> +
> +https://github.com/dmitry-fomichev/virtblk-zbd
> +
> +Then, add the following options to the QEMU command line:
> +-blockdev node-name=drive0,driver=zoned_host_device,filename=/dev/nullb0
> +
> +After the guest os booting, use blkzone(8) to test zone operations:
> +blkzone report -o offset -c nr_zones /dev/vda
> +
> +2. We can also use the qemu-iotests in ./tests/qemu-iotests/tests/zoned.sh.
> +
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
> index dfe5d2293d..2a761a4b80 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -430,6 +430,12 @@ Hard disks
>    you may corrupt your host data (use the ``-snapshot`` command
>    line option or modify the device permissions accordingly).
>
> +Zoned block devices
> +  Zoned block devices can passed through to the guest if the emulated storage

s/can passed/can be passed/

> +  controller supports zoned storage. Use ``--blockdev zoned_host_device,
> +  node-name=drive0,filename=/dev/nullb0`` to pass through ``/dev/nullb0``
> +  as ``drive0``.
> +
>  Windows
>  ^^^^^^^
>
> --
> 2.37.1
>
>

