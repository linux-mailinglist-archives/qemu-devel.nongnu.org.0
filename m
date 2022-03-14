Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9424D8C83
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:34:48 +0100 (CET)
Received: from localhost ([::1]:51066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqSt-00005H-G9
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:34:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTqRm-0007aF-BT
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:33:38 -0400
Received: from [2607:f8b0:4864:20::1133] (port=40729
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTqRk-0000r3-SE
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:33:38 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2e57826a10bso18614377b3.7
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NypDElBryCRX8rDkQJfbavXCt788KUUXgH9C0LgqFNE=;
 b=DrU6HamTshFRaIZTya+xqU3GdMLM09HLrgsWdLcyiCgRcMXhMh2/VLj+oLCRWZsmzj
 5DsAfH7c/TuhmCnDm50EbYdfHNwI6aomXt9rQcloOUFoChNz16fFu7Znh1RL6yQz3pQS
 7ZuZH6SAZAcwo6RpEjkPkxt5zdR5GG3hj65oSKk+D3Dxd0glmRL0btuumz21vkg015lw
 4HsGwo1yL7NuhpqhZfLoQXEcwd2VmobiG86YIl16O3Zc9UAwZbr47k85vlVnbJxcPmsP
 FmrnWRJNNeXl6nUqqcf6mVfi79/viHE0eeXTHQJdMlhmJGTGSiTEAmHlXHMGhJ/hFmLQ
 e9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NypDElBryCRX8rDkQJfbavXCt788KUUXgH9C0LgqFNE=;
 b=bUb5vFGLR0/PhFlJikMrQYpo5EaxYTdkzxdHJy9/EXIHekksWtVEd6gkFaj7fNOpts
 i5NTBLOpvyutkRTrl9nHYBmgnzhw3ZhosJNqhESgOtYWgYDQgf9q3wzni0uNgCNPBRXv
 yo3lkVXRhSTRZDe4UP9j7a66g7lUzZwJB7jIaQv80MARlTFor89xxaSeuXqpRc0HIOPl
 SSxK2NzZX8mNpC/2PLD2Dhje99hB4u1auUgcAENFnGsFeFzOtUe2Vzn0n4larr/mG7Os
 +dH3QjcIVcgSbjY7s8FQ04Jcowupw+Wd7ej/tbM0H5+LSEShFGoa/jwY0sF+fgh6+UR4
 1uCg==
X-Gm-Message-State: AOAM533YnZ+TzpbqvYQL/+7Vhvwf3/nU5U3mVzoo7AGlHfgsQXUS6w9u
 xGQX+9uwQiJEuaqn2X9/N1TM0RlfXnWB3M/WhHaGDw==
X-Google-Smtp-Source: ABdhPJywfX2us1hBd6S+qEKsF88VkCCghm4Z0yUxCHfAPNYjVnl8Qug4sEEmCcSGiQfNQRVX412dZ4drGJTVdd/zIEk=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr20088001ywh.329.1647286415838; Mon, 14
 Mar 2022 12:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220304165628.2345765-1-peter.maydell@linaro.org>
 <942e09d4-13c9-d36a-b54c-920e570dcd38@linaro.org>
In-Reply-To: <942e09d4-13c9-d36a-b54c-920e570dcd38@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 19:33:24 +0000
Message-ID: <CAFEAcA99ZLFZedFaVXrEHM-1bVw9=HmU3f0SW4Csjh=L9hV0dA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix handling of LPAE block descriptors
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 19:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/4/22 08:56, Peter Maydell wrote:
> >           page_size = (1ULL << ((stride * (4 - level)) + 3));
> > +        descaddr &= ~(page_size - 1);
> >           descaddr |= (address & (page_size - 1));
>
> As is,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> though I wonder if it reads better as
>
>      page_bits = stride * (4 - level) + 3;
>      descaddr = deposit64(descaddr, 0, page_bits, address);

I thought about that, but we specifically need page_size
anyway to return it later:

    *page_size_ptr = page_size;

and calculating both page_bits and page_size felt a bit awkward.

-- PMM

