Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799CE5B9A7B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 14:09:44 +0200 (CEST)
Received: from localhost ([::1]:59146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYngd-0002nb-46
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 08:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oYnX0-0006MD-Lh
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 07:59:48 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oYnWx-0004dg-RC
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 07:59:46 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so22114703pjq.3
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=tuVbvaRL4RZvmvYaSg1XTHPOCgJwHdMgZf3EjACZqVQ=;
 b=ki5zkL8IE7bKNoveDsUcbdKQ1A0q3/j4yujGC6To9afjEsShkadXQ++wWXoJ5cymcJ
 ce5kyKAzMKEXqwuFSCjW+AzDObTvZaV9jXSEw6MlxLdE0eX7rE33AJ19KSLsLQyyLjsn
 271OQ01a06u3gI6pujrIlNTUaV7hxrB1dr3974S8Lza+Io/x/OgLuoydYIz0l2WLD+rb
 UI983kG83kaHO3LAQrGGuMJokSPDaxy5s2ASO6hL/k8f9T16c5bIW9im0qtwnPbdKSM+
 SCsvc96UIuNX8HqPTFQUDK3FXG7XCoUMUKud04lPCYR1d18PrlvQ2eLvNit6WUlWF81A
 u+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=tuVbvaRL4RZvmvYaSg1XTHPOCgJwHdMgZf3EjACZqVQ=;
 b=bhjsQG4n0X6OZbD+2Dm/6ajJMSrAOK7JPb2/nqYUeHh+W4BpjO1bCLMZFHWpIwisET
 tN0OrmwTxw9ShXNvyksh6hUWkwboGn3WTKblsks7NWX7qSNtsjj9v7mV9A7GXHqs8yvS
 NW3iz9McFN/Th+s2o3kAnLCgYgbsl9X7Oi4CvV1q0ynOYGiQCDiTjqLhO5rWb9Fqsrl1
 YsIOtmLiCrTJyeRxt/NAtMHcwx8GI+3422kUq4iIfiFxCdfcl8GVU4SSaHcJjvZI5/xV
 r+TsQ6FInDfH9Ds10H6iBvN0FQ2ahfxa5uSen+RK6dsBfWTr5/k4gK6T55Dr6vzHWtk8
 51tg==
X-Gm-Message-State: ACrzQf2NqclGlZoqEsKLXqwWk8DACWicLXn5L+3bI8z+qIVArJAhb1cE
 o5NQ1aaa6j8mE7L4qri8FpQm6g==
X-Google-Smtp-Source: AMsMyM76ZKpm6f9QUqEArQZxX84mD5H1MHRQp2nWbMiKiFoeahiDL2boixXzSRSna/GrY0a0kmlCgw==
X-Received: by 2002:a17:90b:4a12:b0:203:3482:d39e with SMTP id
 kk18-20020a17090b4a1200b002033482d39emr2996801pjb.145.1663243179636; 
 Thu, 15 Sep 2022 04:59:39 -0700 (PDT)
Received: from sunil-laptop ([49.206.11.215]) by smtp.gmail.com with ESMTPSA id
 w63-20020a623042000000b00528a097aeffsm12004778pfw.118.2022.09.15.04.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 04:59:39 -0700 (PDT)
Date: Thu, 15 Sep 2022 17:29:32 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH V4 1/3] hw/arm, loongarch: Move load_image_to_fw_cfg() to
 common location
Message-ID: <YyMTpMuQ0UP9Mqaz@sunil-laptop>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906090219.412517-2-sunilvl@ventanamicro.com>
 <CAKmqyKOZSaE9CYGmYSKOEnkQkGDUkchut+i2mQjcZLSVx-qWag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKOZSaE9CYGmYSKOEnkQkGDUkchut+i2mQjcZLSVx-qWag@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Could maintainers of hw/arm and hw/loongarch to take a look at this? I
have addressed Peter's earlier comment.

Thanks
Sunil

On Thu, Sep 08, 2022 at 11:17:52AM +0200, Alistair Francis wrote:
> On Tue, Sep 6, 2022 at 11:38 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
> > function will be required by riscv too. So, it's time to refactor and
> > move this function to a common path.
> >
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Alistair
> 
> > ---
> >  hw/arm/boot.c             | 49 ---------------------------------------
> >  hw/loongarch/virt.c       | 33 --------------------------
> >  hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
> >  include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
> >  4 files changed, 53 insertions(+), 82 deletions(-)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index ada2717f76..704f368d9c 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -818,55 +818,6 @@ static void do_cpu_reset(void *opaque)
> >      }
> >  }
> >
> > -/**
> > - * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
> > - *                          by key.
> > - * @fw_cfg:         The firmware config instance to store the data in.
> > - * @size_key:       The firmware config key to store the size of the loaded
> > - *                  data under, with fw_cfg_add_i32().
> > - * @data_key:       The firmware config key to store the loaded data under,
> > - *                  with fw_cfg_add_bytes().
> > - * @image_name:     The name of the image file to load. If it is NULL, the
> > - *                  function returns without doing anything.
> > - * @try_decompress: Whether the image should be decompressed (gunzipped) before
> > - *                  adding it to fw_cfg. If decompression fails, the image is
> > - *                  loaded as-is.
> > - *
> > - * In case of failure, the function prints an error message to stderr and the
> > - * process exits with status 1.
> > - */
> > -static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
> > -                                 uint16_t data_key, const char *image_name,
> > -                                 bool try_decompress)
> > -{
> > -    size_t size = -1;
> > -    uint8_t *data;
> > -
> > -    if (image_name == NULL) {
> > -        return;
> > -    }
> > -
> > -    if (try_decompress) {
> > -        size = load_image_gzipped_buffer(image_name,
> > -                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
> > -    }
> > -
> > -    if (size == (size_t)-1) {
> > -        gchar *contents;
> > -        gsize length;
> > -
> > -        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
> > -            error_report("failed to load \"%s\"", image_name);
> > -            exit(1);
> > -        }
> > -        size = length;
> > -        data = (uint8_t *)contents;
> > -    }
> > -
> > -    fw_cfg_add_i32(fw_cfg, size_key, size);
> > -    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
> > -}
> > -
> >  static int do_arm_linux_init(Object *obj, void *opaque)
> >  {
> >      if (object_dynamic_cast(obj, TYPE_ARM_LINUX_BOOT_IF)) {
> > diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> > index 5cc0b05538..eee2c193c0 100644
> > --- a/hw/loongarch/virt.c
> > +++ b/hw/loongarch/virt.c
> > @@ -542,39 +542,6 @@ static void reset_load_elf(void *opaque)
> >      }
> >  }
> >
> > -/* Load an image file into an fw_cfg entry identified by key. */
> > -static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
> > -                                 uint16_t data_key, const char *image_name,
> > -                                 bool try_decompress)
> > -{
> > -    size_t size = -1;
> > -    uint8_t *data;
> > -
> > -    if (image_name == NULL) {
> > -        return;
> > -    }
> > -
> > -    if (try_decompress) {
> > -        size = load_image_gzipped_buffer(image_name,
> > -                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
> > -    }
> > -
> > -    if (size == (size_t)-1) {
> > -        gchar *contents;
> > -        gsize length;
> > -
> > -        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
> > -            error_report("failed to load \"%s\"", image_name);
> > -            exit(1);
> > -        }
> > -        size = length;
> > -        data = (uint8_t *)contents;
> > -    }
> > -
> > -    fw_cfg_add_i32(fw_cfg, size_key, size);
> > -    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
> > -}
> > -
> >  static void fw_cfg_add_kernel_info(FWCfgState *fw_cfg)
> >  {
> >      /*
> > diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> > index d605f3f45a..371a45dfe2 100644
> > --- a/hw/nvram/fw_cfg.c
> > +++ b/hw/nvram/fw_cfg.c
> > @@ -41,6 +41,7 @@
> >  #include "qapi/error.h"
> >  #include "hw/acpi/aml-build.h"
> >  #include "hw/pci/pci_bus.h"
> > +#include "hw/loader.h"
> >
> >  #define FW_CFG_FILE_SLOTS_DFLT 0x20
> >
> > @@ -1221,6 +1222,37 @@ FWCfgState *fw_cfg_find(void)
> >      return FW_CFG(object_resolve_path_type("", TYPE_FW_CFG, NULL));
> >  }
> >
> > +void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
> > +                          uint16_t data_key, const char *image_name,
> > +                          bool try_decompress)
> > +{
> > +    size_t size = -1;
> > +    uint8_t *data;
> > +
> > +    if (image_name == NULL) {
> > +        return;
> > +    }
> > +
> > +    if (try_decompress) {
> > +        size = load_image_gzipped_buffer(image_name,
> > +                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
> > +    }
> > +
> > +    if (size == (size_t)-1) {
> > +        gchar *contents;
> > +        gsize length;
> > +
> > +        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
> > +            error_report("failed to load \"%s\"", image_name);
> > +            exit(1);
> > +        }
> > +        size = length;
> > +        data = (uint8_t *)contents;
> > +    }
> > +
> > +    fw_cfg_add_i32(fw_cfg, size_key, size);
> > +    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
> > +}
> >
> >  static void fw_cfg_class_init(ObjectClass *klass, void *data)
> >  {
> > diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> > index 0e7a8bc7af..c1f81a5f13 100644
> > --- a/include/hw/nvram/fw_cfg.h
> > +++ b/include/hw/nvram/fw_cfg.h
> > @@ -342,4 +342,25 @@ bool fw_cfg_dma_enabled(void *opaque);
> >   */
> >  const char *fw_cfg_arch_key_name(uint16_t key);
> >
> > +/**
> > + * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
> > + *                          by key.
> > + * @fw_cfg:         The firmware config instance to store the data in.
> > + * @size_key:       The firmware config key to store the size of the loaded
> > + *                  data under, with fw_cfg_add_i32().
> > + * @data_key:       The firmware config key to store the loaded data under,
> > + *                  with fw_cfg_add_bytes().
> > + * @image_name:     The name of the image file to load. If it is NULL, the
> > + *                  function returns without doing anything.
> > + * @try_decompress: Whether the image should be decompressed (gunzipped) before
> > + *                  adding it to fw_cfg. If decompression fails, the image is
> > + *                  loaded as-is.
> > + *
> > + * In case of failure, the function prints an error message to stderr and the
> > + * process exits with status 1.
> > + */
> > +void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
> > +                          uint16_t data_key, const char *image_name,
> > +                          bool try_decompress);
> > +
> >  #endif
> > --
> > 2.25.1
> >
> >

