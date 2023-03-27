Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149456C9CB9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 09:49:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pghaF-0000PH-2p; Mon, 27 Mar 2023 03:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pghaC-0000P7-5T
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 03:48:00 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pgha8-0005iI-Oe
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 03:47:59 -0400
Received: by mail-ed1-x532.google.com with SMTP id w9so32089709edc.3
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 00:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1679903275;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ob9onovgsUgQCsAg308VXnCEaQPl89Y5/xImBpp+bk0=;
 b=UtIMsctr+AUqWs6UM7Zwx6z7cvHVnTFJVs06F04ZlFIcgDqDC+nL2QA3XhVPzSN3nh
 /QCx5mxDUHSLmStAdMv0lBoj1dngeFAZ4HJ4Yw9xf1CGRQIv6LWSnYZhN9h+9EKVq3c7
 FiPSRkkvBUcrz1u+AOfaE0IFPBQLe+QR3nmGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679903275;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ob9onovgsUgQCsAg308VXnCEaQPl89Y5/xImBpp+bk0=;
 b=tiGbnQbLo5a9zN98KRDSjm3YdaLwg86u/7yYnu8cgqvkUNzZRKpH3i+3Bfw618E7yJ
 DGWVOu/bgaIsXoDFv7UJgkaQcC3tKpXzs7u7C3ymVZsxw+Lh3JSPK1KeNOyuEMHfhMmN
 a1At2tOXMTlPqiWfdEp0yGtvdJopQc35PsmDuwYIrBfu8GXWv1JiFiV17uSm1qxtW09M
 /usCUB+r2c2FhQuQVd+aYbG6Wa8e7yoy2iP12+3UqWI+/KO5FNW9sJtI7YXXRykRXa0P
 KbHawwmGEbL4GsQaGvuGfx5c1jOPUcR1IWYo5GIn4qflTB0l2K8WTFXtzWpZBzcGKjZK
 JdjQ==
X-Gm-Message-State: AAQBX9fW/UgLVNcAx0ubsWYWHPaB8Vma5fTIemAtRiUwRbvHzuXOeUlX
 p18hEq3mevDhzPNPNSRzvp3LsZwx0YS9V7yDgkM=
X-Google-Smtp-Source: AKy350b/agr/5vlcWtXubYq8lpLQLuTFoIvCNnYS1kSlolvSDIziN9AQmNViIKK0EJW23pCvRXMUCoeQUi8j3kXLJRM=
X-Received: by 2002:a50:9fae:0:b0:501:c965:33bd with SMTP id
 c43-20020a509fae000000b00501c96533bdmr4995124edf.6.1679903274778; Mon, 27 Mar
 2023 00:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <20230326224426.3918167-2-ninad@linux.ibm.com>
In-Reply-To: <20230326224426.3918167-2-ninad@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Mar 2023 07:47:42 +0000
Message-ID: <CACPK8XfLBT-6eu4cv=CbS2d368N-wcVuvSy+w4Kt-JavPqrhyA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] docs: Add support for TPM devices over I2C bus
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: qemu-devel@nongnu.org, andrew@aj.id.au, stefanb@linux.ibm.com, 
 clg@kaod.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sun, 26 Mar 2023 at 22:44, Ninad Palsule <ninad@linux.ibm.com> wrote:
>
> This is a documentation change for I2C TPM device support.
>
> Qemu already supports devices attached to ISA and sysbus.
> This drop adds support for the I2C bus attached TPM devices.
>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>
> ---
> V2:
>
> Incorporated Stephen's review comments
> - Added example in the document.
>
> ---
> V4:
> Incorporate Cedric & Stefan's comments
>
> - Added example for ast2600-evb
> - Corrected statement about arm virtual machine.
>
> ---
> V6:
> Incorporated review comments from Stefan.
> ---
>  docs/specs/tpm.rst | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 535912a92b..590e670a9a 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -21,12 +21,16 @@ QEMU files related to TPM TIS interface:
>   - ``hw/tpm/tpm_tis_common.c``
>   - ``hw/tpm/tpm_tis_isa.c``
>   - ``hw/tpm/tpm_tis_sysbus.c``
> + - ``hw/tpm/tpm_tis_i2c.c``
>   - ``hw/tpm/tpm_tis.h``
>
>  Both an ISA device and a sysbus device are available. The former is
>  used with pc/q35 machine while the latter can be instantiated in the
>  Arm virt machine.
>
> +An I2C device support is also provided which can be instantiated in the Arm
> +based emulation machines. This device only supports the TPM 2 protocol.
> +
>  CRB interface
>  -------------
>
> @@ -348,6 +352,34 @@ In case an Arm virt machine is emulated, use the following command line:
>      -drive if=pflash,format=raw,file=flash0.img,readonly=on \
>      -drive if=pflash,format=raw,file=flash1.img
>
> +In case a ast2600-evb bmc machine is emulated and want to use TPM device
> +attached to I2C bus, use the following command line:
> +
> +.. code-block:: console
> +
> +  qemu-system-arm -M ast2600-evb -nographic \
> +    -kernel arch/arm/boot/zImage \
> +    -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
> +    -initrd rootfs.cpio \
> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
> +    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e

For testing, use this command to load the driver to the correct address:

echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device

(I don't know how specific we want to make the instructions, but
adding a line like above would help others from having to re-discover
the command).

> +
> +In case a Rainier bmc machine is emulated and want to use TPM device
> +attached to I2C bus, use the following command line:
> +
> +.. code-block:: console
> +
> +  qemu-system-arm -M rainier-bmc -nographic \
> +    -kernel ${IMAGEPATH}/fitImage-linux.bin \
> +    -dtb ${IMAGEPATH}/aspeed-bmc-ibm-rainier.dtb \
> +    -initrd ${IMAGEPATH}/obmc-phosphor-initramfs.rootfs.cpio.xz \
> +    -drive file=${IMAGEPATH}/obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2\
> +    -net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443\
> +    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
> +    -tpmdev emulator,id=tpm0,chardev=chrtpm \
> +    -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
> +

I'd drop this example, the above one is enough.

>  In case SeaBIOS is used as firmware, it should show the TPM menu item
>  after entering the menu with 'ESC'.
>
> --
> 2.37.2
>

