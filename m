Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE804E685F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:08:09 +0100 (CET)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRsV-00010y-UZ
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:08:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXRkY-0001mX-P2
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:59:55 -0400
Received: from [2607:f8b0:4864:20::82f] (port=36540
 helo=mail-qt1-x82f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXRkV-00087V-Ub
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:59:53 -0400
Received: by mail-qt1-x82f.google.com with SMTP id s11so4551231qtc.3
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 10:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uyfCFvP6ei9RQWXMIstZhaIdoAq7A2kGRLl0P4QkGXA=;
 b=hLN2ugm64hN4+iJOJANz6GyRsfASwQPqXAZRHK5EOhd6LZSE9k22hNX2EvJTE2KfYE
 B8lWFyg5SI4CVWpI6dwrgRfYIAIVh1Ohdum/9pQhuQdMxU24qYVQVgH8bfHo9c9FrQxm
 Sv96rTwVt+eHD9K/tlrgawNvXA/R5yke065Hb6QTU4t4oOVSKdpHuYDU9ASYoP1FzB8E
 v1FWiDBtgU0HGMAKYsDcsAqPd2wqeBXSDWyk6wG9LLDtXksudE49MklempFVqq+qWX/b
 VAl28Z6VpXLk24c4yeY8YFhkW4GTmixgtD2bnzD2KJZiC+kLkGffjk5a5MHwfZgZYiYl
 2sHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uyfCFvP6ei9RQWXMIstZhaIdoAq7A2kGRLl0P4QkGXA=;
 b=ztIopYqPdtA/F6LYDh5JY8fzXh7B2sH4NuZm/qmDurtlqQaR8J0lDstX8tfF3FcYMj
 /xUa4Uwj7ZCkyyec5HM0Yu9T6ENwRt3zP9G24vtGnF6kGHulwIJLWHF15lqXWWxdu8Ny
 9naKB7aP9JQ1CJduTF/RGdZ/gLBC8S6hm3ghC4hbHe2nC1I3Uk47US2fZT9h3jo8Ip4Y
 a7Cu67qEoiIK9E6IqEWevnRIBGeGWE83IWj7Xg6ClrrS1jfzye9kVATBxU0sfTmgy7xe
 DqGs4BYxlAePBW1dm3cd8YEO4P6iDdn4EsoyMSOYsrITQu2+KwNRoyLJD5FwDB2JRAEm
 cuKw==
X-Gm-Message-State: AOAM533BpApv4lXieumS73bOrLHjSVZYz4p8h2a3OvnMpldhZ9wh2q8I
 W8T9LyS3Ccqy96aXFXxl2zuA/TrH/nWBHY9LNy8KPGEE/dWeqg==
X-Google-Smtp-Source: ABdhPJzKT3McfxmQzSKbLlEyRNRynWwEzwxkMz6QvDkbiN2x4IRGiG/KfeNWC8W/7omtVLXFHR5b28QwIOS3k1+SkjU=
X-Received: by 2002:a05:622a:1d6:b0:2e2:db3:17c9 with SMTP id
 t22-20020a05622a01d600b002e20db317c9mr5694091qtw.665.1648144789628; Thu, 24
 Mar 2022 10:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220324171756.196654-1-zongyuan.li@smartx.com>
In-Reply-To: <20220324171756.196654-1-zongyuan.li@smartx.com>
From: Zongyuan Li <zongyuan.li@smartx.com>
Date: Fri, 25 Mar 2022 01:59:39 +0800
Message-ID: <CADXGpufzhJQ+SbgdHzRf=xfY8m6h=gUt7PWtTfoj-sSiN6FOPg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Replace 'qemu_irq_split' with 'TYPE_SPLIT_IRQ'
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::82f;
 envelope-from=zongyuan.li@smartx.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This version seems to have some code style errors. I will fix that soon.
Sorry for the bother.

Li

On Fri, Mar 25, 2022 at 1:18 AM Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> This patch set tries to replace 'qemu_irq_split' function with QOM
> object 'TYPE_SPLIT_IRQ' and totally remove this call.
>
> If this patch set is applied, issue:
>
> https://gitlab.com/qemu-project/qemu/-/issues/811
>
> can be closed.
>
> Changes since v3:
>
> 1. Squash Patch 3 & 4 into one, since they would affect each other.
> 2. Use `object_initialize_with_child` and `qdev_realize` for device code.
> 3. Code style fixes.
> 4. Remove unnecessary `if` statement used with `qdev_realize_and_unref.
> 5. Narrow scope of some variables.
>
> Zongyuan Li (4):
>   hw/arm/realview: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
>   hw/arm/stellaris: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
>   hw/intc/exynos4210: replace 'qemu_split_irq' in combiner and gic
>   hw/core/irq: remove unused 'qemu_irq_split' function
>
>  hw/arm/exynos4210.c           | 26 ++++++++++++
>  hw/arm/realview.c             | 33 +++++++++++----
>  hw/arm/stellaris.c            | 15 ++++++-
>  hw/core/irq.c                 | 15 -------
>  hw/intc/exynos4210_combiner.c | 79 +++++++++++++++++++++++++++--------
>  hw/intc/exynos4210_gic.c      | 36 ++++++++++++----
>  include/hw/arm/exynos4210.h   | 11 ++---
>  include/hw/core/split-irq.h   |  5 +--
>  include/hw/irq.h              |  5 ---
>  9 files changed, 161 insertions(+), 64 deletions(-)
>
> --
> 2.34.0
>

