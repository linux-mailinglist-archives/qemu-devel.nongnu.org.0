Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E003F1BC9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:42:29 +0200 (CEST)
Received: from localhost ([::1]:52410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjFU-0000L1-QY
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjCz-00062X-Nw
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:39:53 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjCx-0005jo-FS
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:39:53 -0400
Received: by mail-ed1-x52a.google.com with SMTP id i6so9259677edu.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rVC8tfYhipmemYFmjRtRhdi68uher+bWuQLN9CUoqW8=;
 b=NweIJOjvpsIbnLG97Qd+47zOtT41W+NbWQsFkqBH6TBWhhj5i88F6bEykAtvgBso/x
 pmV2PxpVQRK4bXF2c8o0sCq9IOSIwQHrr5uij6TNn0BnVmf/fb0nF3I3whVaeIUO7g4X
 DBBq+BmL2DxTD8siPo/b+TEa+gyle9b6wsZrq1SWbF92SOZPpuKCE6TOXsNNmP0DlZ/b
 P8YNArCQ+mqJnqOemc/od1kDlhpip22muPMhLDpa5D5L7HVhf/An+QW1rWrjeX2yn+BE
 +kRJF6wGD8vwzpaIiXlUPBNnN7gd8SYnQgdBMkXqL5GlMryKO7mVsdPXNqEAQ954X2SS
 w4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rVC8tfYhipmemYFmjRtRhdi68uher+bWuQLN9CUoqW8=;
 b=dsoNw+barWtUIhVY32+n08ZIthb0cdki+SjduvWNYW1vbCBqK8Ium/zhB9ntTuwlRs
 xb+DvYxsoX7Clo82YMdP6ZmjW3sQflB62UEIVw6NCkZudM9xVQdjPRkWYW1j+6/IUg9w
 kNQ+JByKk5RDLrkjz73uEVFd2jCyOU9evWFXLhOmF4dAMyPVexFPJyULT8Qr3Oa1Kmwo
 UUfvPaDKa+y04ppfutcx7NdYQccsEAVW39x5pLDjAwOoqZDcDJVAB7hMLk136VnmiVK1
 3Dt12VznoIiNr7nPaJbkZxfwgaFYyGlcFI4ABEIFKc0P7CSzylj8l74Wx7kICzbLpXcD
 J53w==
X-Gm-Message-State: AOAM531Ebd3LxbV1WYkL6YtowtEuUcDw3JTnWzl85kEFjvgkyX/aP94H
 Z121zLh/huqTBfYB/l/J+US6LZv2T/gCMDeaSPf1rQ==
X-Google-Smtp-Source: ABdhPJxPy1Tbwa0IrIjEOnUhL73R/0RC4se0mZNxmttHkMVtLwjpHEhm0O7MW+tpAHWwjImV+aUDph4Mq6VuQ9Sji5Q=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr16746117edc.204.1629383989466; 
 Thu, 19 Aug 2021 07:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210819142731.2827912-1-philmd@redhat.com>
In-Reply-To: <20210819142731.2827912-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:39:03 +0100
Message-ID: <CAFEAcA90OerVT659PRwss_OKG24n=zx_X_w2nT3KPsKtVXyB8A@mail.gmail.com>
Subject: Re: [PATCH] qdev: Complete qdev_init_gpio_out() documentation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 15:27, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> qdev_init_gpio_out() states it "creates an array of anonymous
> output GPIO lines" but doesn't document how this array is
> released. Add a note that it is automatically free'd in qdev
> instance_finalize().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/qdev-core.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bafc311bfa1..555d4e444a5 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -597,6 +597,10 @@ void qdev_init_gpio_in(DeviceState *dev, qemu_irq_ha=
ndler handler, int n);
>   *
>   * See qdev_connect_gpio_out() for how code that uses such a device
>   * can connect to one of its output GPIO lines.
> + *
> + * There is no need to release the @pins allocated array because it
> + * will be automatically released when @dev calls its instance_finalize(=
)
> + * handler.
>   */
>  void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
>  /**

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

