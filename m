Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C586063B1CC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 20:03:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozjNu-0005B9-L3; Mon, 28 Nov 2022 14:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ozjNq-0005AW-QM
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 14:01:38 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ozjNn-0004wZ-Mi
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 14:01:37 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 6so10762871pgm.6
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 11:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UuCfN3zIawo4UhZS22BBvX/R1rHFOrnnMNUz0XIZq68=;
 b=IZA9HmPzhVEQO5YkRpHH/P8HpQRq9ekSGo0gUxLjCRde5iGvcI9tRmu8DU8dtAMJIk
 CmExGZOMC/NtAX2/pRI5RFZenEBeoVbw9xsK+IhEylF3W+XeA67mpC+Iv6V2CiiUi9iH
 gPuiV/k2l9fYuixQStjgUy6JepEpPxdSfqoq39rk0ffpGPdWikBchI9agsZs0TV628Ut
 8T1aZFaBqifiZiUQGLJWUUaEpvxADYJerZcuaIwL4UmCg6wEFlCtmkfIL9gP39lYgCLc
 cr0bk+HFD9jtLpqjQGVFhTV5K98hT5gPE6uMSllMRdvuk3CSCn34chbHCcigbPpYhDel
 41Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UuCfN3zIawo4UhZS22BBvX/R1rHFOrnnMNUz0XIZq68=;
 b=p23AlKl2UfC+Mpfh1i5ZCI9kOjrofnZsALnvch/SEF/6YOdCw8WcWloX/nFdPA81JX
 Jl1CTQXln7n/f6LY0FSOm4yZIRT+LOBWwItzWagVzAOErdRvlelHXhyHtiM3Pr6ehU0S
 Ck5Tl7wd8UkDDNpaSNGcVGAqxte+8hPN/XAKIOjTopWqA67GQQkil3lyWcJnY2bQL0J5
 YOwwk4G3dBXS0ZyiCy7LYUSzOGTn6FYT/xONo0GmNXffgZ09l7xoEVuwJUytgZGgoMO6
 NkX+CFe780b2ZAGPDfjvxsFmwZIz49nMoEt5gAx1aIeF3k/QIhXD/hJaaGGbNGc74pLL
 cq2Q==
X-Gm-Message-State: ANoB5pkAkUmOfi8fYUwCIZSoAqSYwNPUbnEY6VKar8hCtpZqCx/zL3/C
 UbAliNVKH5B3nXB0NIhCTaUi47W4GZvWB7g64hxUqA==
X-Google-Smtp-Source: AA0mqf5sAvMBTMkB+2a9FXW0kOTI2shZKPe7gtFJ7dySB4JXnhhzylFjueGf2ZLnVizcHIHkJmjque6y18Q9nfBhj0w=
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr29017064pgl.231.1669662094131; Mon, 28
 Nov 2022 11:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com>
In-Reply-To: <20221108023542.17557-1-schspa@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Nov 2022 19:01:22 +0000
Message-ID: <CAFEAcA_EgkndLQs=1KtXHuvVPLGs9RzHWL3QWG4CWCjbNfipQw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 8 Nov 2022 at 02:35, Schspa Shi <schspa@gmail.com> wrote:
>
> We use 32bit value for linux,initrd-[start/end], when we have
> loader_start > 4GB, there will be a wrong initrd_start passed
> to the kernel, and the kernel will report the following warning

> To fix it, we can change it to u64 type.
>
> Signed-off-by: Schspa Shi <schspa@gmail.com>
> ---
>  hw/arm/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 57efb61ee419..da719a4f8874 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -638,14 +638,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      }
>
>      if (binfo->initrd_size) {
> -        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
> +        rc = qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-start",
>                                     binfo->initrd_start);
>          if (rc < 0) {
>              fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
>              goto fail;
>          }
>
> -        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
> +        rc = qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-end",
>                                     binfo->initrd_start + binfo->initrd_size);
>          if (rc < 0) {
>              fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");

Hi; the device-tree folks got back to me a bit late on this one,
but apparently the intention is that these fields should be
of a size that matches the #address-cells (and they'll fix the
schema docs to say that at some point). Some future kernel
or dtb-schema-check might warn about this, and also since it is
what u-boot does:
https://github.com/u-boot/u-boot/blob/218e2c45af83f2cb7b1374b9023b4ced6eb0bb77/common/fdt_support.c#L248
following that same approach is the safest thing in terms of not
breaking existing code.

I think that to do this in QEMU we just need to call

   qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-start",
                                acells, binfo->initrd_start);

and similarly for initrd-end.

Would you mind doing a respin and test of this patch that works
that way?

thanks
-- PMM

