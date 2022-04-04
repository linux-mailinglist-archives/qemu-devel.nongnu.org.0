Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F244F1125
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 10:45:21 +0200 (CEST)
Received: from localhost ([::1]:34910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbIKv-0002B7-0b
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 04:45:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbIHG-0008ED-Dy
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:41:34 -0400
Received: from [2607:f8b0:4864:20::b2a] (port=43671
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbIHE-0000c0-TA
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:41:34 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id w134so8434844ybe.10
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tGIb91y0ZpHq16/rNiDp/epIqi89FUJX0pc0g1g8M3M=;
 b=AnBR2jc0cYaplimOvagm3gRg8/40PT2LTgFE9tpldUWZtNDlChakQegSxcKdudSk0F
 nbxYuR0RanmZ7/k+lm8qotehd5D+q3kpaE/adr/C4yxOWzMWGcvN1edOHM45dDZS9IwM
 AYg8xVVus4TX4m3m/17SS8CgrvoPwJOCXairIbgFmuk2Ic8Fax/UexC3nl3oAPZKd1JF
 t+CSYTERoNUct8BMHzaEJbj252J/2SXh+tFtlx6/UihyBD2yQgtpxyXqxBoiVQ5fetUx
 euK3uqs5cQyAz4QYJlCw6ISe8xWC0Tys6DhbwRTObNyMVwRQiHhdZLU+IgePDYmSCm/v
 AoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tGIb91y0ZpHq16/rNiDp/epIqi89FUJX0pc0g1g8M3M=;
 b=akAtLpQMnsHTOEXFeluVDnkoCRXCWEeUkzV23XE11KhdGVuXM/nRKcrNDYWhGLtroz
 LoP8Ma+2Hzx8186XIqf58PEELvZz1OCGur3+2cUQOYr61BP0XZZ5sjNrIr2qA74JsrKV
 FAjpO/uo6OrLLxsenJmQdp8KH7YX/ya6PanswBNlMAEBI9pITA4MooGiaXy47+RvwmG6
 c7G0dzOsffCoPmYh4SDd4Dlxec/MYqbLyd3/z1KmHefdkNdOB4Jdd7zt5O03IB5Ppx7F
 fKsLT14RYB8B8NTYVqRlMJ88PHwARJQ7+/dL3UIV6HNvUXTXOoPWYO8yvkPYgdesdEzx
 CYJw==
X-Gm-Message-State: AOAM5331Q56alCShsINEPR16AxR3TDUepAqkaJJLPvQrxpDX2ebRLid4
 JlKl32fRehB/mYhyS/JHZLuJO6yXNHcB0zCLPz7ZYg==
X-Google-Smtp-Source: ABdhPJzPjPI80MwoXiOGg2bbX9RnQQnH4SkxIhPdd6uOA/4odYZkA04t/MbL62PR1bOA0A/dZMkzog5KzIPmiXheYL0=
X-Received: by 2002:a25:3d0:0:b0:63d:c88a:fafa with SMTP id
 199-20020a2503d0000000b0063dc88afafamr3844554ybd.479.1649061691849; Mon, 04
 Apr 2022 01:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220401191643.330393-1-richard.henderson@linaro.org>
 <6dcbc929-6d27-2520-0ee6-f416b2469ec4@kaod.org>
In-Reply-To: <6dcbc929-6d27-2520-0ee6-f416b2469ec4@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2022 09:41:20 +0100
Message-ID: <CAFEAcA9MNgR+hbw=Q5cyZBGPbL7q=FwNeu2Q_9HS+eLHixTsbg@mail.gmail.com>
Subject: Re: [PATCH] linux-user/ppc: Narrow type of ccr in save_user_regs
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: danielhb413@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Apr 2022 at 07:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 4/1/22 21:16, Richard Henderson wrote:
> > Coverity warns that we shift a 32-bit value by N, and then
> > accumulate it into a 64-bit type (target_ulong on ppc64).
> >
> > The ccr is always 8 * 4-bit fields, and thus is always a
> > 32-bit quantity; narrow the type to avoid the warning.
> >
> > Fixes: Coverity CID 1487223
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   linux-user/ppc/signal.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
>
> Queued for ppc-7.0

NB that this is only suppressing a coverity warning, not
correcting any incorrect behaviour, so if you don't have
anything else you were planning to send for 7.0 it could
also wait til 7.1.

thanks
-- PMM

