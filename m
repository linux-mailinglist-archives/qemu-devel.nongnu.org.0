Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3365D4BA7D6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 19:13:04 +0100 (CET)
Received: from localhost ([::1]:43588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKlH4-0005Hm-0f
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 13:13:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKl97-0005kD-W9
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:04:51 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=43735
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKl93-0001Gt-0U
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:04:49 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id v63so14636776ybv.10
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 10:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lazB452ztCvc9qsnFJ9w/i9NUbnbc+2tXk+zMU1a4oo=;
 b=m3qluDm6SzE3J7yhe3HqEt9aXkm21Dj5UR+SSbhDhfO0nDNfZsClJetZNju5xocPo5
 Kv9bW03nrSlQ9DjZj0uithEhmyF5Xj2mXS8Or9uUmHerEb+yJP8jISnWrdmhsG0Scwpv
 KTiOkOZ4Sgndqy1Jw9KAAV26mg6U9VhgZURy4RaQav+ISQeFeQ7el/msBwtlUfqpb16W
 v44iBo1qErloda0LmiMKjXMDYaGL9r4xXbaq7C6aOR3+/+lMx+J6X47vtrcXc8sOyxkc
 NYbds9M6+dXNnYkNnIx/Wea0MP2Tc9B7VHym06ITQZ7c8lIYGgemV2z9q8R2eoWT0gQh
 bsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lazB452ztCvc9qsnFJ9w/i9NUbnbc+2tXk+zMU1a4oo=;
 b=okppQYcZ1EpWTFRe+ZgtfgqqJBhPDiziVp0p1KzmuaSf7zCznIyvpL15uhDyvVRi05
 tGnGTvyxGBiFlHqq/HgXcq5dL9L03Yu+D2i8Uqxx/AwjP9zK1qa/Emn4jPQTixjR80Q7
 0Og83JJ7g5v5hyIfDU081JfqUJhS+Zx6i/z9bT9TV3pRwS9OTxq5jPuKyZsKOEaUdAQe
 c4kyacxa3rpvYZgXpaaCBKFNN6d9LcxYom1dGwYzdRjfMgB4vFh2Bcxu9qJJuBLNeOMU
 g3M6uTmoR/DqcjiXReTBREmQD9V4S0scjJPMifwWLzl1w7MJvDEKtL4+1wN2Nh9brn7k
 llCw==
X-Gm-Message-State: AOAM532xaMavl0U0KDzLdFnTQYdzw/r0DC158ZrrnSfvG1Owb/opr4g4
 mWF28le9Y/6f7Uutla8K9x6sX4lUpM7Oax7XvHIrKQ==
X-Google-Smtp-Source: ABdhPJxziJ/K6gN6DlmFvkRY48XDk1cBqlTuVXlIGorQqwh5akrg4jkw0F+uAcXwe/RxPdjV2yDhmfxjSQUmsNkJJIw=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr3606864ybs.140.1645121083768; Thu, 17
 Feb 2022 10:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20220210123403.2059926-1-shorne@gmail.com>
 <20220210123403.2059926-5-shorne@gmail.com>
In-Reply-To: <20220210123403.2059926-5-shorne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Feb 2022 18:04:32 +0000
Message-ID: <CAFEAcA8Gn50VHK41M36OzbSYE5Z7WEoOFqsBweFFgCvsoC6DKA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/openrisc/openrisc_sim: Add support for initrd
 loading
To: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: QEMU Development <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 13:13, Stafford Horne <shorne@gmail.com> wrote:
>
> The initrd passed via the command line is loaded into memory.  It's
> location and size is then added to the device tree so the kernel knows
> where to find it.
>
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>  hw/openrisc/openrisc_sim.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index d7c26af82c..5354797e20 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -187,6 +187,32 @@ static hwaddr openrisc_load_kernel(ram_addr_t ram_size,
>      return 0;
>  }
>
> +static hwaddr openrisc_load_initrd(Or1ksimState *s, const char *filename,
> +    hwaddr load_start, uint64_t mem_size)

Indentation here is off.
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

