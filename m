Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C004DA411
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 21:37:25 +0100 (CET)
Received: from localhost ([::1]:33626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUDv2-000249-Om
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 16:37:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUDmX-0006pY-U0
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:28:37 -0400
Received: from [2607:f8b0:4864:20::1130] (port=38439
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUDmV-00067A-Eh
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:28:37 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2e592e700acso1203507b3.5
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wO1V7x5hyMprSDE1JOHT/WpKqAJg8l3tCqQsYk5h9is=;
 b=YPR08fBPpZayakSv0AGy4v1JIdgiuW2doFzPpfCAkDDT1pgxNGDg7bfymkWuGl/lub
 aHU/Q3qLBB9RTxJEjapniZIAiKnxrQC2xRdATZfYa35hY8CkXdFL0BDbr82CFWxGki9t
 ctKee1be7tM2GuH8luJN1HywsRyZnEbC40r/Sflu1yl4Htb1/4/3vwYc7NiX3eHPLnmM
 1+4rN6Xgc2JY4EqIDIZsglTEs6QWIHbzR0CHgR9xR7r1iwluP9mt3+U0Hjl8m+HQw/4F
 SfRznOgodjfTn24V8LZ31Aam3L7RarE5xi4vozKXBo50Mpn/PLWu4g0Q32jtr/pQKMMB
 CsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wO1V7x5hyMprSDE1JOHT/WpKqAJg8l3tCqQsYk5h9is=;
 b=MX2KN0/gMx9lk46dKNdtY385bqLMYklacFryBobbNgGrPJ2Ufy+MANIALpzEUfh1gh
 9AmvL2Vbf0LXCJEnUWs+x+yGT38U1Dlb09TQ0wcEmWfWk8BR7kwgmSATh2SmAdqNlcAH
 mmQK6w3MIHMbIieoXQ53JySUjkPzTT9exdy9MOe17rrQ7Bt940s2cVZ5ivafBawWhUsZ
 trMC7w7M/3n4hK+xtQEJa7upxoo0Bl+gnJ77ae6zHD4g/l6LasOekXj61PuNmWVmgHrC
 RJVOl9THOXf/K5+ILnGF47mXDzwjC14ZMbhJ2OYz0gHbcK2TXwONV4YIKEv2zicBsTUL
 ZZxw==
X-Gm-Message-State: AOAM532W8Y7E4whXkdmc+8eZdoNuXzJOTRzL56OpnI3phx67/NJ3ndd0
 v7bRXWxsiYBcOfaMnkFSN8nBrfcMEFoJPx+/bLd96g==
X-Google-Smtp-Source: ABdhPJwC+FJJiVkfyonoAVyf0SDbswdkEsJlsAPBlTBc6CdlGIkOUM5HQz3FXZKO2vFx5qOLhjCGL/S/WCZ0pwC9aT0=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr27715069ywb.257.1647376114149; Tue, 15
 Mar 2022 13:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220315022025.18908-1-adeason@sinenomine.net>
 <20220315022025.18908-2-adeason@sinenomine.net>
 <CAFEAcA-FzgoTS=WAhU35v5jW7QbUzrTHSX4r_4nYRdmoGZrpTA@mail.gmail.com>
 <20220315141613.67bed566f6c6295b73436ca0@sinenomine.net>
In-Reply-To: <20220315141613.67bed566f6c6295b73436ca0@sinenomine.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 20:28:22 +0000
Message-ID: <CAFEAcA_BS9N5JtBSQ6hX=--T+hkjdYBQKzTAhkpz8prseb5dag@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] util/osdep: Avoid madvise proto on modern Solaris
To: Andrew Deason <adeason@sinenomine.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 19:16, Andrew Deason <adeason@sinenomine.net> wrote:
>
> On Tue, 15 Mar 2022 18:33:33 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > Can you put the prototype in include/qemu/osdep.h, please?
> > (Exact location not very important as long as it's inside
> > the extern-C block, but I suggest just under the bit where we
> > define SIGIO for __HAIKU__.)
>
> Okay, but this will cause callers that call madvise() directly to
> "work", even though they're not going through the qemu_madvise wrapper.
> There's one area in cross-platform code you noted before, in
> softmmu/physmem.c, and that does cause the same build error if the
> prototype is missing. (I'm going to add another commit to make that use
> the wrapper in the next patchset.)
>
> I assume that's not a concern unless I hear otherwise; just pointing it
> out.

Yeah, that's fine. The idea is that osdep.h is where we fix up this
kind of odd system-header bug, and we do it for everywhere, because
otherwise it's too easy to forget to put in the "make this work
on the oddball platform" code where it's needed.

If you add the patch to change physmem.c, please cc: the author
of the commit that added it (commit cdfa56c551bb) -- it looks
a bit complicated so it's possible it is intentional.

-- PMM

