Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5BB4FC3F9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 20:16:21 +0200 (CEST)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndyaK-0003jX-0X
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 14:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndyYt-0002wx-T0
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 14:14:52 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:36883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndyYs-0000Ai-CD
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 14:14:51 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ebebe631ccso90846627b3.4
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 11:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+tF98v3m73tLNT46clKZctZyo5ALGUGLLrG7PJT86L8=;
 b=LEurwASab11Waq7jZWgZa4GspCr/NvTFWStROfq/OevyiMAt/ZCnLBnuFC86DCV8BD
 EFE4p1U1O9K8fkmqjG+PYNCYuM9Dop/rK0kh8qTdHHphMs+PTA//81muxjVH9oF4D7bu
 lDUEi5vFgvgaze/HM/2lLVenmRYs8mG77CKUeW227i7MGLEYkidSnm1EmCzmmD00EN3Z
 8iiepAqmRKV2i09xfPS4frnvLNR+j+Eqmd78abZTjSHyVgQPJi+7jebLAh2C6KMhDio1
 vWKF7QY5N8JNSs1vHTlfsD8fkchhpIIbYdT3YtDvABSoi6c7R5O2arq7ID8Gh70bUp5+
 15EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+tF98v3m73tLNT46clKZctZyo5ALGUGLLrG7PJT86L8=;
 b=kpVx0pipyvIU1LSQKDThVEsDI2qCjIyPhhyqwMisDVszIrgOtZnub1ZCYWNGjlUzKi
 LR+RMn/JEZL++AYMLYH1uthiXdht3+OPpNTvY+6bT4XDEkocZoU3t4I+arzvYngqSv6b
 tk97Uj2zS53s5stGWmb0/TIOEuJSOHi1MiQh1vPUFBN6nPrKqV7hMQaVXmrOJuFiW9xa
 kYOojktEfv7Xd3lpT9CsDODsedwZCkV0sdlMy0H8fCmtWX4N1hcOKDu5QfcENPmIgVOq
 /ZEbpep6njH3+V6dZnASDGGDVmSJYUIBA6MxXXiVrUH+YETE+KSWY/MmZ4K2qDVOK+ER
 IBEg==
X-Gm-Message-State: AOAM5309F6W2MXfsD2gEOlh79pgJS/fRPSLRp7EOrH7uFoeOllsb43JJ
 kxUNQeYSIkQesTImJkXqy9NQYt0p4KchkgaVt8gvJlk8w9s=
X-Google-Smtp-Source: ABdhPJyOPZVqTWQ68D8xUGvAWlWQt3CF5sVio2LkJrKuIAl3RaMfJlFRr183Sf4J/vZGFdrthvMjgTLVJ5+UsN/ODXI=
X-Received: by 2002:a81:db05:0:b0:2ea:2b92:c317 with SMTP id
 u5-20020a81db05000000b002ea2b92c317mr27589476ywm.329.1649700889250; Mon, 11
 Apr 2022 11:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-8-richard.henderson@linaro.org>
In-Reply-To: <20220410055725.380246-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 19:14:38 +0100
Message-ID: <CAFEAcA_MwZrHE6ysNaVEr8xn5KCphU=b_NWuBX_m+VHh2=6-dw@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/arm: Define neoverse-n1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 10 Apr 2022 at 07:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Enable the n1 for virt and sbsa board use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Comments on previous patch apply here too, by and large.

thanks
-- PMM

