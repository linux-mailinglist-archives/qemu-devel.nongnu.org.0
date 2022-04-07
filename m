Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CC74F86A1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 19:52:24 +0200 (CEST)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncWIx-0000oG-Ck
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 13:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncWD0-0005gs-Jx
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 13:46:14 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:33363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncWCy-0001qT-Nn
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 13:46:14 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id j2so10982632ybu.0
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 10:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cH7477sPcbQxmIbBL1+2x95FUkHcHoVXfZSgvdRfA3k=;
 b=qAHl6Zb4F2CcrUVDabe3/AQ2BInkA1wbCLLuKzfAvHYz5gAj9ygqI4i7d8MoA8I5KV
 DauFvjTLfHbynsr/ky332boZ3NlEkbXLDsIlAOGoDGDCoxaHZeccYkT5jBwELsvPbMT2
 8MSz7flu12Ugag4XE58rhEzSWB21mXfiSej3HOmbvbWzo4oTNF+CgK3obFaByZ2EGs9R
 hcNTM+xOv0tluKSCg+MAptzfd/sImO074JYuhOby4RViXPQVq8XiEQua4PtZb9fpow3j
 WDycKr8uBAocbOXJoTjRaldB6bcy6mCVlWbq9D8HME4zxEPhgB2JhxT6bOlgSxcMym2H
 nZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cH7477sPcbQxmIbBL1+2x95FUkHcHoVXfZSgvdRfA3k=;
 b=TdXDxsnPczYWjK13s6y6u929iNYMguEoHcv6fGKdL/YJhWkjPuP3WH3qcWxUTwLXzE
 GDKnMv+AF7vBsi+jzVGz93WWXDHS1wIzSCX183/rh/0i2lEpne7VBjF2Ahj2n+v933Ny
 D/QwYqx+w1it0kFrrCuRjCkveeePI8Przbrr5RyAsmkUJ79vQhV3bhtIw5mEbG9w0nDA
 OGjB9eC6OFJHDQ1LRA+S2mJpBlIbeSO1s7WKo+3xeUxJfafIE7D44ddalreByCqtg00L
 YkKlt5wMTY7NU99eT8cs1G63Vat7hLza0saHoFpxfeSq2jXhT+tUMZDIganPhbQUpVWX
 /r5w==
X-Gm-Message-State: AOAM533PAK9XQNd7jZ0ZWUuKgD/uR/Ldb2Sx3GSG+5DSCd2Ncs0+e+cG
 dOlYwYyh15xSyFko7CtiAE4qHadT73iLKLT63wYU3w==
X-Google-Smtp-Source: ABdhPJzr/KF5XZbv2P0VNo3rkryDLyJ9cBBWiqAv0yj5/sSgzGBvWhW2A/GB7xku3eYfQokZqN0B/kY0qEbDx2L61a0=
X-Received: by 2002:a25:e756:0:b0:63e:574d:8789 with SMTP id
 e83-20020a25e756000000b0063e574d8789mr2878508ybh.288.1649353571212; Thu, 07
 Apr 2022 10:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220407081712.345609-1-mcascell@redhat.com>
 <CAJ+F1C+HB5Nbsjk4E-KgFQEpyAWFaCkJvswMQj1yu4Rm-rOQ-g@mail.gmail.com>
In-Reply-To: <CAJ+F1C+HB5Nbsjk4E-KgFQEpyAWFaCkJvswMQj1yu4Rm-rOQ-g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Apr 2022 18:46:00 +0100
Message-ID: <CAFEAcA-OzpiWu5c7-r4Hd42ZW500to3wndtE-=vyiVoed1=1WQ@mail.gmail.com>
Subject: Re: [PATCH v3] ui/cursor: fix integer overflow in cursor_alloc
 (CVE-2021-4206)
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Apr 2022 at 10:21, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
>
>
> On Thu, Apr 7, 2022 at 12:23 PM Mauro Matteo Cascella <mcascell@redhat.co=
m> wrote:
>>
>> Prevent potential integer overflow by limiting 'width' and 'height' to
>> 512x512. Also change 'datasize' type to size_t. Refer to security
>> advisory https://starlabs.sg/advisories/22-4206/ for more information.
>>
>> Fixes: CVE-2021-4206
>
>
> (the Starlabs advisory has 2022, I guess it's wrong then)
>
>> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Does this fix (or any of the other cursor-related stuff I've seen
floating past) need to go into 7.0 ? (ie is it release-critical?)

thanks
-- PMM

