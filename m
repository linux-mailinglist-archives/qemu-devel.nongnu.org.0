Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BE62B9BF8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 21:30:46 +0100 (CET)
Received: from localhost ([::1]:34126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfqZm-0007gA-Dd
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 15:30:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kfqOe-0001PL-QD
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:19:12 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:33422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kfqOc-0003jG-99
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:19:12 -0500
Received: by mail-io1-xd42.google.com with SMTP id l22so167506iom.0
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 12:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ropCL+yJSxfh1UHY7SSS3b7mzwZ7N6+Um+strQ4MEkY=;
 b=LwKRTh6syOa6XPm8wGBf5tSYiQOaIsZKOo3fqWdDoc2BkHOTSEybSV7F5sVkk5phnp
 jsDI6obEFfPXKbcbs7f8kvvTKz1ZM5GHbheKcPQY9h1pSqsKgWai/a8HfygXuLcJSMLl
 0Ka5bOpGu7vsNTCjWoPT81jpSvlEebhHaXJczbTeIsMWdBO9AnzEScPCnIw6ewWz21Kd
 z+t9E1M78x8Am4UTx/gt1+pNAnkzKwG2mQ2cUqGyEjHIs5XRFQSWDxtTLZN/q4hDpz3z
 /F8HIF36phC7A8X64+Rsi54mxhE9vAEYPw9W/XT2ndrUs3js9AmW7YykiVb9DGDkkd4h
 S3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ropCL+yJSxfh1UHY7SSS3b7mzwZ7N6+Um+strQ4MEkY=;
 b=FvEownYSXy5KHsoEot6BNfR4X3b/5w/sWZy4NrKywmIzEmaHF4FeIZsfvV1piFLmxi
 I6Vkeyfk6pz7ALZSoxfODeqCi89TpTPOzKptt3ss6YeyVo3sYXdtENWDZl8tueo1xbL1
 hCuLG/PLckd+Kg3VQBSYKlBakZ2lZaXPYwTQNWpk+I6mxstRsV3wIumo+LbH8AKPIqU8
 IT1aMxVEAIiU9O24K0o9KkGrZycenQ0JhH/O0ZDSX8TdhFj9DMHV16keV6bGVwssD8XH
 YNq63qOJC544bh4kbI+qsgkzsuSMEGoMHrnSkKLpKV5+F/4wkTmmqGMjSdA2Mhu4cAH+
 6PGg==
X-Gm-Message-State: AOAM530nq6J6CMU1YLV0eLUJw/O0BmrkEgNUgMBp6zxoZKdyjC2LPc+i
 NKZZm6j4WeH3P8od1DKX/mR5RqW5VymhYYZTQQc=
X-Google-Smtp-Source: ABdhPJxnduq64EiHuYOBsVTzZFZDKmWEJuM4ZOWEphCLE61zWqHV45AZMJ1T+ll4Y17chjfL5Kne6f5/KoL1uVC+0W0=
X-Received: by 2002:a6b:b30b:: with SMTP id c11mr7289765iof.175.1605817149185; 
 Thu, 19 Nov 2020 12:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20201105175153.30489-1-alex.bennee@linaro.org>
 <20201105175153.30489-7-alex.bennee@linaro.org>
In-Reply-To: <20201105175153.30489-7-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Nov 2020 12:06:44 -0800
Message-ID: <CAKmqyKPWiy77ePe6y7cOGkOjDfdikX=SoyACEfPf6XjvzwvX2A@mail.gmail.com>
Subject: Re: [RFC PATCH 06/15] docs: add some documentation for the
 guest-loader
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
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
Cc: julien@xen.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 andre.przywara@arm.com, stefano.stabellini@linaro.org,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Takahiro Akashi <takahiro.akashi@linaro.org>, stefano.stabellini@xilinx.com,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 5, 2020 at 9:58 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/system/guest-loader.rst | 54 ++++++++++++++++++++++++++++++++++++
>  docs/system/index.rst        |  1 +
>  2 files changed, 55 insertions(+)
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

RISC-V.

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> index 3cff0ca98f..b5cfe8ee93 100644
> --- a/docs/system/index.rst
> +++ b/docs/system/index.rst
> @@ -25,6 +25,7 @@ Contents:
>     ivshmem
>     linuxboot
>     generic-loader
> +   guest-loader
>     vnc-security
>     tls
>     gdb
> --
> 2.20.1
>
>

