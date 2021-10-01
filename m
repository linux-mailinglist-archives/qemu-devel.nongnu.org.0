Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FBD41EDC5
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 14:48:18 +0200 (CEST)
Received: from localhost ([::1]:59670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWHxZ-0004z3-5M
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 08:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWHwe-00046X-3n
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:47:20 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWHwc-0007uV-1f
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:47:19 -0400
Received: by mail-wr1-x433.google.com with SMTP id s21so15275062wra.7
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 05:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wlX5Rum6kPlLsB5+W+kIcc3NvpkK0BqwIAZHzSayr9k=;
 b=CwCLWpP/8YwtEWiiPvHAuvWtA53TDWAA/lBmB4MzYVLHFmQmy7ZfFakSyQjg+H2oav
 rPVG4ax1Q/MY0i53YN6mVMQ26e5K8qoJDrJrB/Dyvaa/2F+aHK+UGInk1ZkOwvZKj+sL
 /0e4l5sJSnWTt0/PGJO03MjR1+dd1MY/M4oNbsSVUpkv99oZTUAXcLtdAuiq/fSlYyaK
 KgsXBHtLsu49ZGiybj/D7jLFlINgYxhrYU6xyngemckURKtB1uFuhPvPP86kgxvHA1sG
 LtYyi8lEba/6rmy5mzctc/MvBIqm/HPhArgA5Mlr3+qoU9tgaWBCPArIj9zYr/Uwxh9d
 tvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wlX5Rum6kPlLsB5+W+kIcc3NvpkK0BqwIAZHzSayr9k=;
 b=68HkkrEkhgGGtgheZlrcgCYRsC127lSnVFjEv+z4LSkQ7KHcJ6NoB92KgGYuG8eL8a
 DPsd3oBwUGCGmAc/IUk6c3HnYWslJP0SEuVjAm2Zonthhrt4BSWl4Pw5KpwErbEfwV2e
 TI0D8zEOLaJWxwMEpYTm+cscJcmHnjU2gDKzg1suRr8UTue587o0MnHh7DdmZzkHAXNN
 xcVC52KGDX0VYl2ZopmnXdNGhtbdhj2JBGoGlCqNK3bolIXDYe4hnraWUF926JFxOYpv
 y8Fuw4pvuvD6u05BJnleOfa7bqvZg3BMfxXwFBjWBzrNI3cAOvfjdQHujCDO4ZSrrGbi
 fvgA==
X-Gm-Message-State: AOAM532qMQ+rkrst2IcsqxrrpKq6+x0WGEMaHIB5niVOxUHOdfjzOzMB
 BAuN1dhD6cnKq8fXOAdv5WGb6ln1Whufe94WckOiKQ==
X-Google-Smtp-Source: ABdhPJzf46VDiUt4wG1PnjV54Hi2asNp4xS1y7RPwHDPGVV3iN1si70R6ER/NBM3IslN395vzBc8+4tBQLY9OnCce3k=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr11908053wrw.376.1633092436321; 
 Fri, 01 Oct 2021 05:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211001121943.1016447-1-thuth@redhat.com>
In-Reply-To: <20211001121943.1016447-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Oct 2021 13:46:22 +0100
Message-ID: <CAFEAcA_Vjvi8JvELyG1DghCoHbUR1fzodPoaU2n-QPcf9bGwCg@mail.gmail.com>
Subject: Re: [PATCH] hw/ppc: Deprecate the ref405ep and taihu machines and the
 405 CPU models
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Oct 2021 at 13:22, Thomas Huth <thuth@redhat.com> wrote:
>
> These machines need a firmware image called 'ppc405_rom.bin', and nobody
> seems to have such a firmware image left for testing, so the machines are
> currently unusable. There used to be support in U-Boot, but it has been
> removed a couple of year ago already.
> Thus let's mark these boards and the 405 CPU as deprecated now, so that we
> could remove them in a couple of releases (unless somebody speaks up and
> says that these are still usefull for them).
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 15 +++++++++++++++
>  hw/ppc/ppc405_boards.c    |  2 ++
>  2 files changed, 17 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 2f7db9a98d..27c03ef624 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -238,6 +238,11 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>  (the ISA has never been upstreamed to a compiler toolchain). Therefore
>  this CPU is also deprecated.
>
> +PPC 405 CPU models (since 6.2)
> +''''''''''''''''''''''''''''''
> +
> +The related boards ``ref405ep`` and ``taihu`` are marked as deprecated, too.
> +

What is this "too" a reference to? The immediately preceding section
in the document is about the MIPS I7200 CPU model.

The not-being-deprecated sam460ex board also uses the ppc405 CPU
I think, so I don't think we can drop the CPU models.

>  QEMU API (QAPI) events
>  ----------------------
> @@ -258,6 +263,16 @@ This machine is deprecated because we have enough AST2500 based OpenPOWER
>  machines. It can be easily replaced by the ``witherspoon-bmc`` or the
>  ``romulus-bmc`` machines.
>
> +``ref405ep`` and ``taihu`` machines (since 6.2)
> +'''''''''''''''''''''''''''''''''''''''''''''''
> +
> +These machines need a firmware image called 'ppc405_rom.bin', and nobody seems
> +to have a working copy of such a firmware image anymore. `Support in U-Boot

"any more".

> +<https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdfdba62c069>`__
> +has been removed a couple of years ago, too, so it is very unlikely that
> +anybody is still using this code at all.

(I'm not sure whether anybody ever actually successfully booted a
u-boot binary on QEMU's taihu/ref405ep boards.)

> +
> +
>  Backend options
>  ---------------
>
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 972a7a4a3e..1578c0dac8 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -317,6 +317,7 @@ static void ref405ep_class_init(ObjectClass *oc, void *data)
>      mc->init = ref405ep_init;
>      mc->default_ram_size = 0x08000000;
>      mc->default_ram_id = "ef405ep.ram";
> +    mc->deprecation_reason = "ppc405 CPU is deprecated";
>  }
>
>  static const TypeInfo ref405ep_type = {
> @@ -547,6 +548,7 @@ static void taihu_class_init(ObjectClass *oc, void *data)
>      mc->init = taihu_405ep_init;
>      mc->default_ram_size = 0x08000000;
>      mc->default_ram_id = "taihu_405ep.ram";
> +    mc->deprecation_reason = "ppc405 CPU is deprecated";
>  }

We're not deprecating the machine types because we're deprecating
the CPU types. We're deprecating them because we believe that
nobody's using them.

-- PMM

