Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F13544F08
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:29:37 +0200 (CEST)
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJAG-0005kv-Kg
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHcO-0002eE-Af
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:50:35 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHcL-0003Gi-K2
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:50:30 -0400
Received: by mail-pl1-x62c.google.com with SMTP id i1so20164028plg.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qVNZfRY74nrsw3BKedvtnR0OOFztiB2FWQkpeU/LUWE=;
 b=ZznWU+MjFIux7dMTljOb8dEVXJWkKdD0mjFWJj+JJ0/+9umr8ycQYQOZPIlsewKaf8
 3BSvb/uU7i+FkIecbfXa3Vw2RLiVqMd+cxlNyE7q+NzuPQGUJ7/YRela0ydrTE9YeKz1
 NEm5WvGA0uymRw1uMArb/ZymOBFw3e4wAPpYxrej145sW42AiVy6QeaPkRUupzXNfIW1
 XvkT6sMSAIzQDYcp53KjForHEHNiEMfnvtMBKb3WDdWuBDg2884LtaBiomZVKSfKxEv5
 zDdGazODbp/Ylz/D2TR1MaNuSOOTzL3kkgOjqhi3a6xRSjqEjOhOWF3Nm8xocqG6X0hc
 oW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qVNZfRY74nrsw3BKedvtnR0OOFztiB2FWQkpeU/LUWE=;
 b=opw/5R3w2qlsNqq9JzvSwWA2vCCfRs38STPcXpM/aG4IoxbPL3HK/hf8VCjSupPQlq
 PCZjnPGua6sO1d3god9KGsfIcvBIKQfDVYtxpQ0GjDu5Diwo4gz9N/DEg0Q4bDpxKhda
 ls9gC2Mr2sGkzcdq28sxaBmFxa6LwptByz7yOz88HJKen0G+d1NI1dwiVNf/4I7RXGXy
 zQ1t/wgDFUY7e9WOATc8beHao5sfmcohDSnA2LNZC1MQ1mD1/Q7ehKUORc4lyG94fs6L
 u6RNgBlcIX+z5nwP6kSKKWWaDdT7IhtUpBGPKNbbkHZjbc3SD1PqRQV+0Yt++4ugVNPn
 1QzQ==
X-Gm-Message-State: AOAM531PR51QbF5/gAQhDlgf/mTv05VkZpS13m226a0b3pi5rYEaPDWZ
 nmGBjSaIEusrcCB9kqtsQT89hl0+ocEA92potRFK2Q==
X-Google-Smtp-Source: ABdhPJyp1xkhr8nOu4UhyV7nREewI1s/RdESwED/4f1vUbUVRdbIeFaR9mNZP8qI8LmYVz10uqFwcSl5BUJx3jQ9tOs=
X-Received: by 2002:a17:903:1205:b0:15e:804c:fab4 with SMTP id
 l5-20020a170903120500b0015e804cfab4mr39545730plh.112.1654779027991; Thu, 09
 Jun 2022 05:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-49-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-49-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 13:50:16 +0100
Message-ID: <CAFEAcA_RiYABeiioTdHOL50F+zw5uQ53yJkf=Q0CmWaUc4zq+Q@mail.gmail.com>
Subject: Re: [PATCH 48/50] pckbd: add i8042_reset() function to I8042 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This means that it is no longer necessary to call qemu_register_reset() manually
> within i8042_realizefn().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

