Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E60635C4B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 13:00:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxoPl-0006dK-Q6; Wed, 23 Nov 2022 06:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxoPk-0006ct-5w
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:59:40 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxoPi-0002Uc-I4
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:59:39 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 y14-20020a17090a2b4e00b002189a1b84d4so1627114pjc.2
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 03:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HASg6FGjF4AWSODFZwZUHQgxm6DkhRHvDVB0aynntmE=;
 b=YroJeawY8Y+XWxFehXHqXxQoe7qciR5UChNmrVcQExv/egWdDg1LqZWXoJ+eZsppKK
 FjjJomJBPg8jLz2Ht0IJWHvTV1Xp11/CbFysv1kUqZ+3LcmHAm6IdreeAX4zdqPl4Vc9
 ugyaEoLL/lPSHSyHx8iX/Wp+XjuiSS/f5Epb9I6glIFFBg/WWmjDPI3HPcr3mqw2V81O
 7lZW3KJk6bLMbUKtEk5HC7zOn8aFDfS2mgG0H0kS1v6VK69nFh5XteIQoQs8g1dpQMzB
 XE7wsXj9GmrPn4KHxBE+rgaGeMJ1D/s30pc00hN/T8gwYvus63Nvl1r2cPiOP0wQ5kwH
 knSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HASg6FGjF4AWSODFZwZUHQgxm6DkhRHvDVB0aynntmE=;
 b=5H0GXhAcStUNcEKYENf55VTAg0p69t1ffoLIC0OAHDw1eWJK7PvqqSdE//bh1ZXTke
 5Cf07Ue6P1nKIc5QPiNcyiGK9q3MGHCZTwMy3oi0N+CGpx5puxBeaLkDmBkFGA84EvpE
 1l1OQps1bMNiXx/PYnwRaZr7KIzTdLBPTCL9EOMSOVjXwJcgKxM+WJikTEhsoZQnqDKo
 Q5cSYS2mffxSeFIVOU8LAHiqDDwTJuRBNhIYEpyZrjJ2WyhcaJhtzxBGETD0NxlR/OyT
 7inEtWQQ9jPEPRo/fPS7AYdY7Y0ymqwbX8Ti4xPSUZTkeS1uzJqALmj+W1+xmrZQ0Sy3
 lD/w==
X-Gm-Message-State: ANoB5pmFDZykKbobefINzdTU7Kqxdlqjwsz/VwY2XNYtsZF6RwmUetrq
 HjdQc5WajbSEw4kMOwdOH3/IJAvs0DnBbXXfU+eFVA==
X-Google-Smtp-Source: AA0mqf4ACilkV+3mxlgfMqI71B7soIO7YkxrrQQY0qgn3Whrp+5RJkp2+YNRB0JSFbFJhto6bZmuE5nQMpo74ONAlQQ=
X-Received: by 2002:a17:90a:7004:b0:218:8757:8f2b with SMTP id
 f4-20020a17090a700400b0021887578f2bmr24941049pjk.221.1669204776677; Wed, 23
 Nov 2022 03:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20221124033802.meuiphlcskwu3aty@M910t>
In-Reply-To: <20221124033802.meuiphlcskwu3aty@M910t>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Nov 2022 11:59:25 +0000
Message-ID: <CAFEAcA_=5k0Q+90AwFtisjxgrj83wd5fVJv319v8ogewuNp=KQ@mail.gmail.com>
Subject: Re: arm: gdb-stub is broken by FEAT_HAFDBS
To: Changbin Du <changbin.du@huawei.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, liyang <liyang281@huawei.com>, 
 Hui Wang <hw.huiwang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 23 Nov 2022 at 11:38, Changbin Du <changbin.du@huawei.com> wrote:
>
> Hello, Richard,
> We just noticed the gdb-stub is broken and probably caused by commit 4a3585568
> ("target/arm: Plumb debug into S1Translate").
>
> (gdb) target remote :1234
> Remote debugging using :1234
> 0x000000000e1716d0 in ?? ()
> => 0x000000000e1716d0:  Cannot access memory at address 0xe1716d0

Hi -- is this fixed by commit 26ba00cf58e9f21b08f (just landed
upstream last night) ?

thanks
-- PMM

