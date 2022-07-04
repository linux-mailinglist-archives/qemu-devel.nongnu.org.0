Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBFA565793
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:43:03 +0200 (CEST)
Received: from localhost ([::1]:57888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MLu-0004O1-DT
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M0e-0004Df-5i
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:21:04 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:35679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M0a-0002aA-Ew
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:21:03 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31cac89d8d6so12369117b3.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MVkXvj+NclhPyjQQ+0553v4FAr9OmjdWvi2qejx8f3w=;
 b=rGNJeWhWs0P+J1dT/VsN0wuV5teYRD1x11QybzYFsd27FPmlQt/ibal1yLwnc7Smy/
 x69mBEZu7Gk4jV5zeDEKM0sxNfLwiEIY+qJeXRqpr0WFv0pki5emfGUx3dtGU7caXjph
 CejiUO7LmBE4K20VL12jU71xtUppdbwScqw/YwmolUd3rFRBuhiYSZT3ElsfQwPF43X5
 ct0HEPloq/ziS5/9DLhANY0xSxAPP3VnLYEcV0W08JI+JEVppV1EM7hF0q3KUJ5m5Kvb
 CUvCniuTuoLXGFOghxqgdrGyJHjVEgknn85qc/+dv4tvs4CdHaHq7AZFv3SlS5Tm25R5
 sZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MVkXvj+NclhPyjQQ+0553v4FAr9OmjdWvi2qejx8f3w=;
 b=RsFVTls0HQ63W+J3C+9WM+josL27PSsdP3hynQtY5EgWPF0RLJWCTTp4aYF3GpLzde
 zwrglGnDfIRhQzf/kaDbzxsOBKzrGMdCZB9VTBCtaFraryMp7mUetFdEC2WrUey7bx+a
 kvLcxTNLbOAoZfxhOfe/rrRk2rxjkc00xY+6xzkq65b4wuQJGpWh//1Rs5DjblMMqtwp
 1uwZVpV8HoV0XwKzO8/ar1BFEfwk8v5v8bs8YlunzbAspwcMhvD+IdNwkMjQ0r4DEZca
 HeBqChY/KTvaLt/n9xEnRmVMD9NTt5ZiK5RzyeuE7wKpbzoO+PGOr8eXOH6W0JnR275m
 KAtw==
X-Gm-Message-State: AJIora8f9IIZtSoi5eUtxyPHWfF5QAWe8SgPOYIvohLiT92Fqc5scP6q
 yLQ1R1ioQDi74Pr1CBG1+/wjLKrWSn/rLRkOgVRSTg==
X-Google-Smtp-Source: AGRyM1vPtbRuYJrMGgslhG8nZO1BGdR+vwF4mD3wEoPjjPEH6KrRJ22pLmhg8KPm1X0KIgoPkPuevleVGxZOGKP+C24=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr9994021ywe.455.1656940859882; Mon, 04
 Jul 2022 06:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-13-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-13-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:20:49 +0100
Message-ID: <CAFEAcA-=tHdf4Nhw27wQwtYWPY2jupvAROBCoB=74Y-b+XKD6A@mail.gmail.com>
Subject: Re: [PATCH 12/40] lasips2: don't use vmstate_register() in
 lasips2_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Since lasips2 is a qdev device then vmstate_ps2_mouse can be registered using
> the DeviceClass vmsd field instead.
>
> Note that due to the use of the base parameter in the original vmstate_register()
> function call, this is actually a migration break for the HPPA B160L machine.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

