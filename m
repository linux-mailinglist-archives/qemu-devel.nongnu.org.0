Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C953F68BC9F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:17:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0QX-00076i-VL; Mon, 06 Feb 2023 07:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pP0QS-00075p-UT; Mon, 06 Feb 2023 07:16:49 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pP0QQ-0005de-Vh; Mon, 06 Feb 2023 07:16:48 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id t1so4817788ybd.4;
 Mon, 06 Feb 2023 04:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=596HnDT91IvH+L15h0g8S8LsiuMCFZorR/BNjauAA3k=;
 b=UTx4iysbn3W35xavQpfyT0Zt22yBNi+YSKw/gsA+i+GfN37BYkLPDUYqm++2scJBse
 sNOkbqG/R9XcfiqhW4o2HoZPVm/7+6jF1tX/fybR39pflXYfQh16uzLyf4TFWAXZyoDq
 HtnY1uCzTbh52VBSNM6qL8YgXyxB7rfxrnYMTO0QcPr+wL24vOkKIizcQ9whb32Y6T1s
 ioaQ//T5w2XH2cJoHbKGh5V/2zwmvlWMufBNmV8tWKY8uzuwU+29kHusMmSyHEsMQ1PQ
 gQICP8aDcmB1ruf/i1SQ5yL4IxvT6qQsjZpmYlcxeK4FOJUh4w7kwWvRvzTLjwZPGuvZ
 ZVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=596HnDT91IvH+L15h0g8S8LsiuMCFZorR/BNjauAA3k=;
 b=5jZEQDaPtKsaboAo5MkMMQpXbvONL+EpDmHctj+2+TDNDNzxvvRJ9Rpxjpp12sYE+g
 /xSj+x38BkqHeRjQRIUV0H3CZJdRzaG/Ib0feAGnU+DMmo5YeTJ7bE9MlVblOrAYNp6X
 qBYf7heRfDrEDPhA4g07ib5VGZ7Xyu8qfDbXkQ4HPgDz29fx2O6RlBX4dQC8SW8lhjed
 zlq+AinN4lCcoGwCmGf5HKp2UZCd02IWyMHaQlKVqekS0c3rVyyBKiN+9dYvHYXqOSa8
 HzNboUlG7hgfl8l983sM0aPKQ1omFcq7DYon5DyA455U24m0iL6BUQNUbMQBK7VwQt94
 PXWQ==
X-Gm-Message-State: AO0yUKVCJ3fraxDlrHMqsDvX4MZlYiQ3PBGUxTxU71Q8EP7f6JiWKbW7
 cb2yHHf0xtU5dVBqPLJxDjHaJJsjy+8c4kDxTaQ=
X-Google-Smtp-Source: AK7set/igDXfS/g5MdZvZZIICl1YiUWdrne51CB/kNgB0O7/6lsuJWpAq5nDV9eHPXBpOCRIR6rB+yyh8SheYaeudoo=
X-Received: by 2002:a5b:a:0:b0:880:9ae0:2728 with SMTP id
 a10-20020a5b000a000000b008809ae02728mr559393ybp.366.1675685805616; 
 Mon, 06 Feb 2023 04:16:45 -0800 (PST)
MIME-Version: 1.0
References: <20230129102850.84731-1-faithilikerun@gmail.com>
 <20230129102850.84731-9-faithilikerun@gmail.com>
In-Reply-To: <20230129102850.84731-9-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 6 Feb 2023 07:16:33 -0500
Message-ID: <CAJSP0QW2C1d+069mTdOsXkT81VFEcqTcepCw98BSDUMt6Xp86Q@mail.gmail.com>
Subject: Re: [PATCH v15 8/8] docs/zoned-storage: add zoned device documentation
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, hare@suse.de, damien.lemoal@opensource.wdc.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 29 Jan 2023 at 05:31, Sam Li <faithilikerun@gmail.com> wrote:
>
> Add the documentation about the zoned device support to virtio-blk
> emulation.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  docs/devel/zoned-storage.rst           | 43 ++++++++++++++++++++++++++
>  docs/system/qemu-block-drivers.rst.inc |  6 ++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 docs/devel/zoned-storage.rst

This patch uses the old "zoned_host_device" BlockDriver name. Please
update it to "host_device".

It's probably a good idea to search the patches for zoned_host_device
to find any other places that need to be updated. That can be done
with git log -p master.. | grep zoned_host_device.

> diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
> new file mode 100644
> index 0000000000..03e52efe2e
> --- /dev/null
> +++ b/docs/devel/zoned-storage.rst
> @@ -0,0 +1,43 @@
> +=============
> +zoned-storage
> +=============
> +
> +Zoned Block Devices (ZBDs) divide the LBA space into block regions called zones
> +that are larger than the LBA size. They can only allow sequential writes, which
> +can reduce write amplification in SSDs, and potentially lead to higher
> +throughput and increased capacity. More details about ZBDs can be found at:
> +
> +https://zonedstorage.io/docs/introduction/zoned-storage
> +
> +1. Block layer APIs for zoned storage
> +-------------------------------------
> +QEMU block layer supports three zoned storage models:
> +- BLK_Z_HM: The host-managed zoned model only allows sequential writes access
> +to zones. It supports ZBD-specific I/O commands that can be used by a host to
> +manage the zones of a device.
> +- BLK_Z_HA: The host-aware zoned model allows random write operations in
> +zones, making it backward compatible with regular block devices.
> +- BLK_Z_NONE: The non-zoned model has no zones support. It includes both
> +regular and drive-managed ZBD devices. ZBD-specific I/O commands are not
> +supported.
> +
> +The block device information resides inside BlockDriverState. QEMU uses
> +BlockLimits struct(BlockDriverState::bl) that is continuously accessed by the
> +block layer while processing I/O requests. A BlockBackend has a root pointer to
> +a BlockDriverState graph(for example, raw format on top of file-posix). The
> +zoned storage information can be propagated from the leaf BlockDriverState all
> +the way up to the BlockBackend. If the zoned storage model in file-posix is
> +set to BLK_Z_HM, then block drivers will declare support for zoned host device.
> +
> +The block layer APIs support commands needed for zoned storage devices,
> +including report zones, four zone operations, and zone append.
> +
> +2. Emulating zoned storage controllers
> +--------------------------------------
> +When the BlockBackend's BlockLimits model reports a zoned storage device, users
> +like the virtio-blk emulation or the qemu-io-cmds.c utility can use block layer
> +APIs for zoned storage emulation or testing.
> +
> +For example, to test zone_report on a null_blk device using qemu-io is:
> +$ path/to/qemu-io --image-opts -n driver=zoned_host_device,filename=/dev/nullb0
> +-c "zrp offset nr_zones"
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
> index dfe5d2293d..0b97227fd9 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -430,6 +430,12 @@ Hard disks
>    you may corrupt your host data (use the ``-snapshot`` command
>    line option or modify the device permissions accordingly).
>
> +Zoned block devices
> +  Zoned block devices can be passed through to the guest if the emulated storage
> +  controller supports zoned storage. Use ``--blockdev zoned_host_device,
> +  node-name=drive0,filename=/dev/nullb0`` to pass through ``/dev/nullb0``
> +  as ``drive0``.
> +
>  Windows
>  ^^^^^^^
>
> --
> 2.38.1
>
>

