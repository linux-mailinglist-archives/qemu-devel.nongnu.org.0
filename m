Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BE7526701
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:28:04 +0200 (CEST)
Received: from localhost ([::1]:58342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npY95-000780-6n
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npY3M-0007Pn-K9
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:22:08 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:35140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npY3K-0006jm-SE
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:22:08 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2f7c57ee6feso95796517b3.2
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yJXHhx8td0TuqH5sRTS4MRZPKm08GCjeszXm5DRFSbc=;
 b=RcjNadflHXzUn0ZT/Q3Eyy0zJ2+lgG9K0wp1oeyieGse2J1QZYpZ+9Rl05VtIQC31V
 5n1TtGkmYHruQSkzYwJlSvQx92pDGQMD/KNwf+MW7SeOmXWwP7H3MTCxC45sUGPvJQMZ
 cleFI5nuKhpZDr+Yjt6kufWq1PtlEahDulmKlkBh+GrJCpe/zdClelxnJdLtIg/dWeV6
 +eS7J9jJ0+v+fbtt/vEQGHjXh7kv7twGpT5ggMQ/ecXmTmkZk03BTVkzxLwCGFWQg5f8
 U6aBSg4CaWMNeys+teXGIzwjC6IAZ66lpXBbx6+F2ZiKc8NvDf5qWNkWH2dnKlVgYdXl
 IbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yJXHhx8td0TuqH5sRTS4MRZPKm08GCjeszXm5DRFSbc=;
 b=F7PCl2auo5XU1WU/eEu823TX0tp5C9so/ER68w6UdjlsfklncpYLZYG/3jjNLuDfT9
 mSOkzq5f8o+/65uIrfLrroweQM2cZegjtJtz9P9itv/Ve00OGcY1Ek9DeKQgKXoVCqW2
 hUnlhaFosfaws6ln1bkCjuYdTy5z8+jbW9LBiftLcp6Letnd5tqpi8fBT39E/OCn7pdQ
 TEe+AL5HaLcwpzoU5OmZtE0tWJvQL/7rre55G8Igvb6P5rjgSYckqDr8K5lijLLg7zeP
 X62iBK1eZMGiXVkpnYWm01UprL0qClLUJny9grcDPliMnB6JdOOhu2uf3OtcrVVhEiKv
 x8hA==
X-Gm-Message-State: AOAM531EnkwPaiVp1AITL0NwRTZZtTWs+xEPKt1SmVbQ3yFxmw0QkLIF
 ypGht2YfWIU7OO5QFU8wDEkHyt6MHBLW/GkrmrwtSQ==
X-Google-Smtp-Source: ABdhPJz6+6b3az2f26NMKc60MDw7FyukCO1vPoxqRP2VqQ03k3/c3YWajGyjnEyyJqv/xex2hkFL7CcDyqwlsqkKHmU=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr6839673ywb.257.1652458925837; Fri, 13 May
 2022 09:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220504110521.343519-1-thuth@redhat.com>
 <20220504110521.343519-7-thuth@redhat.com>
 <CAFEAcA-smunqB+Q9NfD=1=QJT2pAZ+OqZTe==ZYbZkx9Rp=pMA@mail.gmail.com>
 <faa22312-d676-cd28-ccd9-438acd57cd6c@linaro.org>
In-Reply-To: <faa22312-d676-cd28-ccd9-438acd57cd6c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2022 17:21:54 +0100
Message-ID: <CAFEAcA8vnt3sSuUMA=neuwb7JqVcSnb+bm94xfpb5rSQYmD2Rg@mail.gmail.com>
Subject: Re: [PULL 06/15] target/s390x: vxeh2: vector string search
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, 
 David Miller <dmiller423@gmail.com>, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Fri, 13 May 2022 at 17:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/13/22 08:54, Peter Maydell wrote:
> >> +    s390_vec_write_element64(v1, 0, k << es);
> >
> > Specifically here, because k is 32 bit but s390_vec_write_element64()
> > takes a uint64_t argument, we will do the shift as a signed 32 bit
> > value before widening to 64 bits, so if the values of 'k' and 'es'
> > are such that we might shift beyond bit 32 we'll get the wrong
> > value. It looks like 'es' is one of the MO_* values, so generally
> > small, but the upper bound on 'k' is a bit less obvious to me.
> > Is the overflow-of-32-bits case impossible?
>
> No, the upper bound of (k << es) is 16.
>
> We perform the operation with k in units of element size, so that indexing works nicely,
> then convert back to units of bytes at the end to report results.  It's a byte index into
> the vector register, with 16 as an indicator of match not found + eos not found.

Cool; I've marked the coverity issue as a false positive.

thanks
-- PMM

