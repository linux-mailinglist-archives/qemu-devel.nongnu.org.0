Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0E715BF07
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 14:14:25 +0100 (CET)
Received: from localhost ([::1]:52110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2EK0-0003eF-EV
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 08:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2EIz-0002bS-EG
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 08:13:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2EIy-0005Ze-Fv
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 08:13:21 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33222)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2EIy-0005ZZ-Bi
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 08:13:20 -0500
Received: by mail-ot1-x342.google.com with SMTP id b18so5523476otp.0
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 05:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sRPFe5U6MUGNNbyeQEXCSa1vv7EhdGA1F75GGwgnhhE=;
 b=HCWnwBdgkd87pFZrx/TmQwZkK9r9cdP2apHjhSEHNIlZ9K5JZNseW5Ww+sFBEN0/jo
 EYMH+Yz/2hg6DLL1NCWQetdfj3pLIJi5CuB8uxF2EkG/GmVTLvzJn7D2S/NKx5f5Fo0z
 jwya84PTL+kKq8e9FzNtPeycmGwAO/50WGICyuy9u3NdDc7bG4tf+r0D+DxgSHMb8Py1
 vWwqTea1JQ4mCxYnGXylm1a9NKOfYDzMwjS6wBl9hFfRE3hrc7WWAHyVwMkwh+dCT9MV
 /5anhf67jSUGdoBrGXrTqTM7x9tt5oT6o6x5mY+8jyq10yfZZm/vQcaMhxHr/a5cWFhX
 epsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sRPFe5U6MUGNNbyeQEXCSa1vv7EhdGA1F75GGwgnhhE=;
 b=LVOxdF/mZsCEkVBnsgpnKqAXCTIA9nN+O6OKTa9WPskjDgXaxkL3Qt/EIfdSYhnEt1
 t/5bbdo+lUHnvzbnKFMBo7V3yJgu8kiknzGNfCSBZoeW1YRqpHoIHIGV7INgRdDh4yiZ
 HsUmc6RIcw72M7DmcvrkuUm6uG2HRvSe0ni33YpJdwvX7ImzIlOql79pv8kZw0GuIcr3
 EjemBo4xnvT606+mgPXUHC7ktSPdvE4O6ZYwnw8qKcJgrpP4uz9MNRjDsywbgLlAK+F5
 yHX/2CVFxCRNCYgoepQrvzXuyfjJIX2pjlXs6sIJ/8DDNYYSntaTwdylvQgGv7Wxb83u
 FXXQ==
X-Gm-Message-State: APjAAAXmpv2sB7e5H/lzV6xbgpafyGkDFLcsibGvSAplxkXjl1n7ln7K
 KdXditHihm6netPKsMlsYnbQC36OfHLm2w7A6SVu5g==
X-Google-Smtp-Source: APXvYqzWDlxR/MOF6vmVdzaYjlMJ6ggyvQ+FA7dsJqHjA80DxGI85WJLzZasCOMc//txW6GWF5Qf71wYF2/Je3kZKok=
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr12609558otq.221.1581599599727; 
 Thu, 13 Feb 2020 05:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20200211194228.16907-1-richard.henderson@linaro.org>
 <20200211194228.16907-2-richard.henderson@linaro.org>
 <CAFEAcA9Lq2tbsGqpSYWU=g1OYfu_TeXv5nuyBayJwapdLLKP9w@mail.gmail.com>
In-Reply-To: <CAFEAcA9Lq2tbsGqpSYWU=g1OYfu_TeXv5nuyBayJwapdLLKP9w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Feb 2020 13:13:09 +0000
Message-ID: <CAFEAcA8xeDzDH8EQGifve3PmETp=Yxzv-qL3uRFW6wRfVOgzZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/arm: Fix select for aa64_va_parameters_both
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Feb 2020 at 13:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 11 Feb 2020 at 19:42, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Select should always be 0 for a regime with one range.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> This change makes sense, and matches what aa32_va_parameters() does,
> but I think we need to update some of the callsites.

Assuming those changes are done in separate patches, for
this patch itself:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

