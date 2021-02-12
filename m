Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980C131A709
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 22:44:20 +0100 (CET)
Received: from localhost ([::1]:39922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAgEd-0002G2-MV
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 16:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgAU-0008FR-N0
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:40:06 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:42287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgAS-0005x0-T3
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:40:02 -0500
Received: by mail-il1-x136.google.com with SMTP id z18so503573ile.9
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 13:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Jp4CCHwWK240T1rzKA41Yn74M6YlFRWIOSQ6mAraccc=;
 b=RWzc+u5PJMONDFlBzkgnv9gzrcnhqfOiQi8SEexMjFuNfqDtxyTl7d3D+DU4N5rn8X
 dNqYO/cLgfTHOw/rxa920ZsS57PySmZH4/DD6nNdeEbBna1uKhu0c3bnCIFWHTKD1uSC
 7ys4Z250E3DdBz6ssIM8sihIfzgsE2CE4OGpXryRjoUSfBGSfIeJA8vBBlkukgO5I75v
 omdwytRj4y+Q7H2d6R5QrTLUMape5tPICR0gUqesni70IiM9wZeXQfvntglMCHhoFalm
 8VgR6hoHEJo/bk9ElYvXHl6Yua1fEKH3GnGN+UyZClvVWF+lIysi23UeOOVH3KKIVz9J
 j9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Jp4CCHwWK240T1rzKA41Yn74M6YlFRWIOSQ6mAraccc=;
 b=o9ZhwJU7Xn4Hd0jCOGc++DJa0qVjgxkbykD/B75ksX1abCqFAw85D+FxMAxkT/cHQt
 3sE7YuQ7rQiiibfzFDUHOC29gbLcpJtOiF8nEb7QWzf8vFCnARaOS1K0qJquSn1eWCkx
 qzZozVsWAzR3ETil3WOZT17kd4eEAAoMNny5OTMDM5Xw1LfgLHrKgqTEdnEOp9I7xG4N
 lsd7uY0xONGWSv0CYnGFRvsnlhFsdS6w0g1afzYDGFueibhID15xUokqdkZw+0XoS9TW
 VVoWX+wCPfviEOMmODAh6xDrLStaQzd5XXv+mBIOph0Du7LPd4MWRMoNOgEjTifBw5Ux
 Atig==
X-Gm-Message-State: AOAM531bZshGWH4KyHqw9ZaGNnuU39NjoQB+X6G+0beMcdg6KLMd6War
 Tbm8AHeXvUrkOoL4snbSDcc1UxEAfF6HTUvCBlRx5VDDzDI=
X-Google-Smtp-Source: ABdhPJzSYfVvPhaNdhr6PllD44RL2BM6sEzXFDBlNJvKz9+9scpPbwgU89qj2yJK8Dpm+bOe9xIKp2iFVZnlOlkRWBk=
X-Received: by 2002:a92:d445:: with SMTP id r5mr3870130ilm.227.1613165999438; 
 Fri, 12 Feb 2021 13:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-7-alex.bennee@linaro.org>
In-Reply-To: <20210211171945.18313-7-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 13:39:18 -0800
Message-ID: <CAKmqyKM6JPDfk555+Dswn4V-hd-qqDPr+V-a31QeVJg=148iWQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] docs: add some documentation for the guest-loader
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 stefano.stabellini@xilinx.com, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 9:20 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20201105175153.30489-7-alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
> v2
>   - add docs and MAINTAINERS
> ---
>  docs/system/guest-loader.rst | 54 ++++++++++++++++++++++++++++++++++++
>  docs/system/index.rst        |  1 +
>  MAINTAINERS                  |  1 +
>  3 files changed, 56 insertions(+)
>  create mode 100644 docs/system/guest-loader.rst
>
> diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
> new file mode 100644
> index 0000000000..37d03cbd89
> --- /dev/null
> +++ b/docs/system/guest-loader.rst
> @@ -0,0 +1,54 @@
> +..
> +   Copyright (c) 2020, Linaro
> +
> +Guest Loader
> +------------
> +
> +The guest loader is similar to the `generic-loader` although it is
> +aimed at a particular use case of loading hypervisor guests. This is
> +useful for debugging hypervisors without having to jump through the
> +hoops of firmware and boot-loaders.
> +
> +The guest loader does two things:
> +
> +  - load blobs (kernels and initial ram disks) into memory
> +  - sets platform FDT data so hypervisors can find and boot them
> +
> +This is what is typically done by a boot-loader like grub using it's
> +multi-boot capability. A typical example would look like:
> +
> +.. parsed-literal::
> +
> +  |qemu_system| -kernel ~/xen.git/xen/xen \
> +    -append "dom0_mem=3D1G,max:1G loglvl=3Dall guest_loglvl=3Dall" \
> +    -device guest-loader,addr=3D0x42000000,kernel=3DImage,bootargs=3D"ro=
ot=3D/dev/sda2 ro console=3Dhvc0 earlyprintk=3Dxen" \
> +    -device guest-loader,addr=3D0x47000000,initrd=3Drootfs.cpio
> +
> +In the above example the Xen hypervisor is loaded by the -kernel
> +parameter and passed it's boot arguments via -append. The Dom0 guest
> +is loaded into the areas of memory. Each blob will get
> +`/chosen/module@<addr>` entry in the FDT to indicate it's location and
> +size. Additional information can be passed with by using additional
> +arguments.
> +
> +Currently the only supported machines which use FDT data to boot are
> +the ARM and RiscV `virt` machines.
> +
> +Arguments
> +^^^^^^^^^
> +
> +The full syntax of the guest-loader is::
> +
> +  -device guest-loader,addr=3D<addr>[,kernel=3D<file>,[bootargs=3D<args>=
]][,initrd=3D<file>]
> +
> +``addr=3D<addr>``
> +  This is mandatory and indicates the start address of the blob.
> +
> +``kernel|initrd=3D<file>``
> +  Indicates the filename of the kernel or initrd blob. Both blobs will
> +  have the "multiboot,module" compatibility string as well as
> +  "multiboot,kernel" or "multiboot,ramdisk" as appropriate.
> +
> +``bootargs=3D<args>``
> +  This is an optional field for kernel blobs which will pass command
> +  like via the `/chosen/module@<addr>/bootargs` node.
> diff --git a/docs/system/index.rst b/docs/system/index.rst
> index cee1c83540..6ad9c93806 100644
> --- a/docs/system/index.rst
> +++ b/docs/system/index.rst
> @@ -26,6 +26,7 @@ Contents:
>     ivshmem
>     linuxboot
>     generic-loader
> +   guest-loader
>     vnc-security
>     tls
>     gdb
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 774b3ca7a5..853f174fcf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1997,6 +1997,7 @@ Guest Loader
>  M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>  S: Maintained
>  F: hw/core/guest-loader.c
> +F: docs/system/guest-loader.rst
>
>  Intel Hexadecimal Object File Loader
>  M: Su Hang <suhang16@mails.ucas.ac.cn>
> --
> 2.20.1
>
>

