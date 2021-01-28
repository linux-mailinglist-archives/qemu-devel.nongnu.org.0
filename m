Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E468D306E93
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 08:18:20 +0100 (CET)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l51ZL-00006n-Vv
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 02:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l51Wh-0007QP-Lg; Thu, 28 Jan 2021 02:15:35 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:44080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l51Wc-0007wf-SZ; Thu, 28 Jan 2021 02:15:35 -0500
Received: by mail-yb1-xb33.google.com with SMTP id x78so4502109ybe.11;
 Wed, 27 Jan 2021 23:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3su8nERs1WgrjvXCCzyVB6guaBvShP0tnVo3ZULSKhs=;
 b=HwC4esHM2smkho3SLW/8Gh1SdZSVyEzkJOjtEthOjNHi5sqD8bAgXRixU8jsjIq5Ac
 cp3+pq0v1zx5J3QUQpA0P3W7P1hw0xqORv76HJb/pUYD/ZimzZWZEgi2DrSUVLlk+QUs
 nqEVgNW8JkVqySNIHP0LVBWTg8PA4FGUqfpoWkc2uXszIPcpb3k/gaRwhMZpML+Nisit
 N/D+wx5anCEcFRDVFSISa/1KH3kGaJBWfy9rnZuyTTq4mE60lkdAKc7htwVdto9ifeJH
 ornoPpzLPFxjdsVWfVBgHiGDL2oDn26pF1IzcfterS0TmBwk+1FvhkhKvWuX97bhDjzX
 enwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3su8nERs1WgrjvXCCzyVB6guaBvShP0tnVo3ZULSKhs=;
 b=IzRSuT29bLvkgU64hKj/FVJpuvMxo/iuNSitcqSNd35b65GGu9sm7er2OpOPiWGjEX
 NWvCZg/iqTK0Qtjmeu9sQNnP5yeE4SBE553RXZNy/D+RfeSiH8y4twooEa9NdBXdL4Cl
 1IqVCnhJs2kNPvdTmAeM9fV2d/cB+1eTEMMpCkfa/fNiGYsTZXx9liKl9SPsR/1WQeAq
 o1H2MGOxiZpUiEIt2QnjccCOgQRJbmX5AJr8wHqKyTzUxpA5HnTUWajGoslZiYxFwzir
 Aihlz/2az+RfzpKZQUMQ9XpySRWpwCdNZp1aErB+lm25gup60KGBZdAyUXiUu0FxU8NH
 MGEg==
X-Gm-Message-State: AOAM5333nEZi3sVpcnGKjX9/C8NJ2NkxR84F0d0u4lvbqkvmA/hzgLWb
 KQgIRvr5eL8a07Smt5aLahgmFT2db9iRuZWwYE4=
X-Google-Smtp-Source: ABdhPJzRBpUeYJo4B4LqtnKY9u+fq1A7XKMlDWudA6rQf17IxrOQoJP8ADS/3Wnu0jO5Jl2QWT2mw2KakAbOAD/qJPw=
X-Received: by 2002:a25:cc3:: with SMTP id 186mr1718436ybm.306.1611818129404; 
 Wed, 27 Jan 2021 23:15:29 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmWXTdL=DU0bRNJqx--2_=qa7kLpru7PE5jK4GxZRMWU3w@mail.gmail.com>
In-Reply-To: <CAEUhbmWXTdL=DU0bRNJqx--2_=qa7kLpru7PE5jK4GxZRMWU3w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 28 Jan 2021 15:15:18 +0800
Message-ID: <CAEUhbmWutywRhPNRQJccfo+ojUFL=P4K334zG7L=ZtdjwM_tTA@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] hw/ssi: imx_spi: Fix various bugs in the imx_spi
 model
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 9:36 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Jan 19, 2021 at 9:40 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > This v8 series is based on the following 2 versions:
> >
> > - v5 series sent from Bin
> >   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=223919
> > - v7 series sent from Philippe
> >   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=224612
> >
> > This series fixes a bunch of bugs in current implementation of the imx
> > spi controller, including the following issues:
> >
> > - remove imx_spi_update_irq() in imx_spi_reset()
> > - chip select signal was not lower down when spi controller is disabled
> > - round up the tx burst length to be multiple of 8
> > - transfer incorrect data when the burst length is larger than 32 bit
> > - spi controller tx and rx fifo endianness is incorrect
> > - remove pointless variable (s->burst_length) initialization (Philippe)
> > - rework imx_spi_reset() to keep CONREG register value (Philippe)
> > - rework imx_spi_read() to handle block disabled (Philippe)
> > - rework imx_spi_write() to handle block disabled (Philippe)
> >
> > Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
> > (interrupt mode).
> >
> > Changes in v8:
> > - keep the controller disable logic in the ECSPI_CONREG case
> >   in imx_spi_write()
>
> Ping?

Could we get this applied soon if no more comments?

Regards,
Bin

