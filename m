Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B5A4D8A64
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:06:40 +0100 (CET)
Received: from localhost ([::1]:44912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTo9V-0008Rq-Q3
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:06:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTo8F-0007bb-3A
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:05:19 -0400
Received: from [2607:f8b0:4864:20::112e] (port=41332
 helo=mail-yw1-x112e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTo8C-000348-6c
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:05:18 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2dc242a79beso171326247b3.8
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 10:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7U3OXHVEeOYCh1sgq5T5j+YsY46PtQq3KslW4RpeXXc=;
 b=vbnlF5mHt26mMqz/ussccN8SLHjAow4IFxhLDNNXPtQTVlOaj9PVBDgrY8bjuROQ45
 5XEnPykExIxbzNq+J9w8amTaGrMML4UTbISeG7uu/dYTgThmByfMn7kWlqgwyX7G56qP
 hnsiBHp8Yy1w+7hm4KbDa8R2wzDSKqctvdBvLsLHem/7/WJO1m7Ezm/Ud6ES86/RYtT/
 IVFu5Tds4V8IjclRi8ieb2h+gbeNQUsfoV07QkG+ktXMe36iMr0RFzTu1uZKO7aXz6MK
 N8YWdGeVac47FPQqHJWmEIXC3PdAxPMwyWtKvfXYfu6OFLahaTQ3rZjoOXQeEMk1og7I
 JefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7U3OXHVEeOYCh1sgq5T5j+YsY46PtQq3KslW4RpeXXc=;
 b=Urny7hUos3KlJ3rEHy5oR9VAM1rt8h5+KT0UQP1N6IJzcDKo5g+WsLxAVTsHliP0mP
 lF7zaKAYePThvsEVwfL94gsnJsBXz9c5/20ojzkPQTjSgE4LfjP+0DR4T6KUByPMlWYK
 uD3ItnY35u433AlgMIZPlZORkIohfD+9uEK868N5y0uKvKlTPYP0axb86OivWVbFNQKO
 LGUUETX9orLZS3rmZGPcVL7gPHQ6lmMcqmtOF7vh4HYDB9YFO5p1QiXg9R4y9jOk7a+V
 rpC4ZY8cbADdlV15Fkb521TRjrdrjIgV2lJDojBbhzoVagZ/sPKkFUS4W7g24Zhmsa9a
 XFzA==
X-Gm-Message-State: AOAM531RUF8Q7k6VczL3my//J6KVxf+6PtNen6aEPMMXKRoDEwT/aeC6
 tiorFCmFrVY4S0KxHrwvS7jfJYcBiYJ+QOVYbQgx4g==
X-Google-Smtp-Source: ABdhPJwFEiC0rV7GSbeRKwQ+m/mlCaTZLEw18THDijDzsRLRdU2x0EE/c1F+HFNOzfrfezTjJbCiJUQHA9gaHozyYLI=
X-Received: by 2002:a81:12c3:0:b0:2dc:5f5a:38ec with SMTP id
 186-20020a8112c3000000b002dc5f5a38ecmr19893321yws.347.1647277514722; Mon, 14
 Mar 2022 10:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220314170223.554679-1-raj.khem@gmail.com>
In-Reply-To: <20220314170223.554679-1-raj.khem@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 17:05:03 +0000
Message-ID: <CAFEAcA_SCwN3LpdADuYs7gTqgravOqDan-D6BrcAW_tb0omP8g@mail.gmail.com>
Subject: Re: [PATCH] ppc: Include asm/ptrace.h for pt_regs struct definition
To: Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 17:02, Khem Raj <raj.khem@gmail.com> wrote:
>
> Fixes
> ../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: in=
complete definition of type 'struct pt_regs'
>     return uc->uc_mcontext.regs->nip;
>            ~~~~~~~~~~~~~~~~~~~~^
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/include/host/ppc/host-signal.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/linux-user/include/host/ppc/host-signal.h b/linux-user/inclu=
de/host/ppc/host-signal.h
> index b80384d135..43ee2eee3b 100644
> --- a/linux-user/include/host/ppc/host-signal.h
> +++ b/linux-user/include/host/ppc/host-signal.h
> @@ -11,6 +11,10 @@
>  #ifndef PPC_HOST_SIGNAL_H
>  #define PPC_HOST_SIGNAL_H
>
> +#if defined(__powerpc__)

Why is this #if defined() needed ?

> +#include <asm/ptrace.h>
> +#endif

What host distro are you building with? We do test ppc64be at least
in our CI, and that builds OK.

thanks
-- PMM

