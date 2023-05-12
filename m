Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58051700477
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 11:58:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxPWK-0004i7-67; Fri, 12 May 2023 05:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxPWI-0004hW-I8
 for qemu-devel@nongnu.org; Fri, 12 May 2023 05:57:02 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxPWH-0005em-1A
 for qemu-devel@nongnu.org; Fri, 12 May 2023 05:57:02 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bcae898b2so17180293a12.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 02:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683885419; x=1686477419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mu7Xo/eAcVMcPJuHfe0lFbUfnm16yTO+nOIiWTpNgFI=;
 b=DoR/2A/18AHUhjCc7CIPjBWUBZzbblVWlSidsi1TPf5rjWDoMxn680UPHfSWgcG9Ng
 qsJCtkL2gFaEPxzcxzKz82QcfHoz+UgP19xFerWD9SqeHuzSMocS1l46XVY6WkZz32+o
 invgIi0Lsa6Kw5hVSoJRf7rrKR5O2Vg3HJUM00vDkKljrTgks1x3TrFf40qcrlkCmSZT
 2QTVXmWeiCqlcFofW5wtSd83MlRMzrgKkyRrj1YesCUzu23ziIuA/kG2o8wqi4YPev1/
 Mul+qqvhi6JOd0ebXuYgyXKI24g8UIlDMiAkt+xOSmMLZOjvwj9Zyi+B/Vf/VfFLdEQ2
 Pvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683885419; x=1686477419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mu7Xo/eAcVMcPJuHfe0lFbUfnm16yTO+nOIiWTpNgFI=;
 b=VAQDRcaOge4e1MfXCE3nlANK/Ejt1e99L8goELRLdGqyG2gELj2pjXlL+Fy31SB4R1
 f5soyJbcQfbI8qMrJzmjBjcHnbW8kbclnFfJrUhfzYmys99z74Ykp1upOU3k9OhdbLhn
 +SJZeqaxXpjEUz9FiEHIMslRRzTtuf1JZr+wf4swUOZlw8GPbixNC7wUdUc2zHZG6LF3
 Ipmet3Rg16SExrXRnsTIW8lfpuh2Rkp3uSlzChxM8BWHoIcAU9YwLX2sCNUtRwbukAJz
 BOGsvmgTZjMpwqJekvbX1IZm1byz+7KUj7KuvwgisVRYog739A8PLeUZhpBNZ4HU+UcO
 fkXQ==
X-Gm-Message-State: AC+VfDwKTARI6pK7a0daJ0BNhEs37UAdMcjwNmUrFMI0Qq23P950WM0u
 CvM6Z1nNT03vds204wVo4FUprXXwpk4GpvjNdX8hqg==
X-Google-Smtp-Source: ACHHUZ4B4Q6AqB6yaYpSL+OTgjJovXK9U0mGUlqnvFJ3unsMCAezoiSk2YPKJkYHVpdN+hNRE+vx7bmUmXSMxJVVcAw=
X-Received: by 2002:a05:6402:605:b0:50d:91c8:9e10 with SMTP id
 n5-20020a056402060500b0050d91c89e10mr17376387edv.10.1683885418874; Fri, 12
 May 2023 02:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230512090803.1170154-1-zenghao@kylinos.cn>
 <20230512101122.00006c73@Huawei.com>
In-Reply-To: <20230512101122.00006c73@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 May 2023 10:56:48 +0100
Message-ID: <CAFEAcA8tWWWvOAS=GCTnGD=Sv6h5pUWf3Cy4ux-FeF8s_BjzVw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: enable qxl for aarch64
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Hao Zeng <zenghao@kylinos.cn>, pbonzini@redhat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 12 May 2023 at 10:11, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Fri, 12 May 2023 17:08:03 +0800
> Hao Zeng <zenghao@kylinos.cn> wrote:
>
> > Qemu does not support qxl graphics cards in arm, it is recommended to enable
> >
> > Signed-off-by: Hao Zeng <zenghao@kylinos.cn>
>
> Drive by comment.
>
> > ---
> >  hw/arm/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 0f42c556d7..0305a4f4f3 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -32,7 +32,7 @@ config ARM_VIRT
> >      select VIRTIO_MEM_SUPPORTED
> >      select ACPI_CXL
> >      select ACPI_HMAT
> > -
> > +    select QXL
> Keep the blank line here.

I don't understand why QXL is special here -- isn't it
just another PCI card? We already "imply PCI_DEVICES"
so I would have expected that to work.

I notice that the x86 "config PC" has an "imply QXL",
though, so presumably it doesn't. Paolo, should this
be fixed by making PCI_DEVICES pull in QXL, or by
adding an "imply QXL" to the virt board ?

As a third option, the mips "config LOONGSON3V"
has "imply QXL if SPICE".

I don't know what the right answer is here, but I
suspect it should be the same thing in all three
cases, not three different things :-)

thanks
-- PMM

