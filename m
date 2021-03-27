Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6599E34B926
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 20:44:46 +0100 (CET)
Received: from localhost ([::1]:46428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQErU-0006sO-V7
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 15:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQEqa-0006OF-3q
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 15:43:48 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQEqY-00042E-KK
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 15:43:47 -0400
Received: by mail-ej1-x632.google.com with SMTP id ce10so13428618ejb.6
 for <qemu-devel@nongnu.org>; Sat, 27 Mar 2021 12:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uRQe+6KSkgX//yE/W0/S8OosBZ7lj6NFfHsWTJg4Dkg=;
 b=O6NvPQ4Xry4J7ZqajNoVtCWvoLKw3pDd04wVRkq5MdA1aRd2CPV7EWuncv14mN6Yk8
 B+TBhbFi86dw2ijVL0v17W5o801n68GEi4NE2+d04za/EowZK1WphI3qpdkyDB4BmoEX
 GKDThtZTq9Py1DRR/mgWA0LrY0PbzKHR/gfmSdDWoApib96W/EN9UeEm1STIJ5I0kuPd
 Hu95sAaz9AreM7xaAH67gZ17lzkJmUBj4OR1zrY+qmu7OTeyt/ssXZ23DMXPvObc5ca7
 /1avgfLfX0LOjlsvSkuI8ncA7Vk2RlAV/K2EpGg8Yfo8etuBO1eOu1TgtbP9xFf4qjYp
 2kQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uRQe+6KSkgX//yE/W0/S8OosBZ7lj6NFfHsWTJg4Dkg=;
 b=Ve/VNrXWoCuwmcZ3iykfeJJSZTQLUL/kLoxznXTG7EZNNaAMiv97njVat+M6OZAzAC
 n//NAftnOMz2yy/0J7kYFeigG73gEg0xz4oDlz45cX5VXq2EIg/5JKD0hZAJC/e57/se
 lo4XUIHnOpUE0Mn8S45QMluUb6+Jwqyw8Z+emTAMuAVp2PcjmO08gXHzyNRtrFOrW5hs
 6kAnNsLoedfqTtbqb+mZzKa3blFgBqtS0RWhTvSooHc9MuU5AT+tQq78sro4SyaOPzh4
 YG+lhbffwNay1dHV6SYOnoLqTajUB+e071+N35ft69rV3ydvcUCl6O87ZuGf1IZWqLRK
 2usQ==
X-Gm-Message-State: AOAM530fEex6gP4DMwPHhy6+Cba0yGg1qHjaG3HKAsgEBN5KEIb4Dzhx
 o+4Gn1mKJIoeVAIh6kmY4TquUIQhjweLG6qMzGiM6A==
X-Google-Smtp-Source: ABdhPJxzQvjDWcpEdg5d17JGSbRFemEAfNk2SJ2QOBJmnEl94f+Q0R4alYkIzokcBxHsunRA+oYBWI1AemWgUvWkEHs=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr21950327ejc.250.1616874224945; 
 Sat, 27 Mar 2021 12:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210327143452.1514392-1-f4bug@amsat.org>
 <CAFEAcA8Ue2BcWy0RuOO7jbK-+gBjFMwXvugvAwUhLb1E9VfN8w@mail.gmail.com>
 <f9249085-81c7-7d64-6738-2d9318302c98@amsat.org>
In-Reply-To: <f9249085-81c7-7d64-6738-2d9318302c98@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 27 Mar 2021 19:43:16 +0000
Message-ID: <CAFEAcA94uWncu52y2x2rZpAUrtnM5+Y4-LQyWhZm297V3weVzA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] memory: Add 'priority' property setter
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 27 Mar 2021 at 18:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 3/27/21 5:58 PM, Peter Maydell wrote:
> > On Sat, 27 Mar 2021 at 14:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >>
> >> The first patch is an old fix, it would be nice to get it
> >> merged eventually, but not a problem during years, so can
> >> also wait 6.1.
> >>
> >> The second patch add the memory_region_set_priority() helper
> >> useful to memory controller devices.
> >>
> >> The rest add the 'size'/'priority' object setters.
> >
> > Do you have a series which makes use of these new APIs?
>
> Yes, new board / SoC, many patches, I'm trying to split to
> have review because I don't expect many developers to review
> a series adding 20+ devices...

> I can send an omnibus series if you prefer.

No, you don't need to send a series, but a brief description
of the kind of device that would want to be able to dynamically set
MR size and priority would be helpful, I think.

thanks
-- PMM

