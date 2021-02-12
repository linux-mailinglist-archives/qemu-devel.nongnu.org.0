Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F013B319DD7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 13:07:50 +0100 (CET)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAXEj-0008O4-Hc
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 07:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAXCz-0007Ab-UF
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:06:01 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAXCx-00012Y-1f
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:06:01 -0500
Received: by mail-ej1-x632.google.com with SMTP id y9so15016109ejp.10
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 04:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1h0+aw28yrqyXLyJSm642U/yYHIUnJRTSBvvcbDz3Vo=;
 b=d1Bu9GIs7vIEc1crJYJiJh+UfslymneJ4w61NFTtGtaGiCqJB8pxeE5nVzZPRIlW5f
 9pBWqyZUr+xMo0OZqlMEnhZjI7ASolqC3XNM30rXiFSacTyVrrIdlMEjbBJtoM0tg2mK
 ceFwfFgcMX0Kf40zPBMQLF/N/q3gja2yBiQkYC+w4whf4VsiT9guHolLLqFn0KSpKLYf
 6b55Xti6c0GqaOOv9O6IXaMzCEls+nAtXOwysjvCzeLa76IpPtKiwQOcLr8zNjzV41Yp
 b2iajs84vJt7qZZ+zD9TBkXntnH+mZqJ3de6/+d7Y2ZpnvhDEN+hwVxSthnhca0hukQj
 7VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1h0+aw28yrqyXLyJSm642U/yYHIUnJRTSBvvcbDz3Vo=;
 b=GJmu0FPZLwleRp8rqwcFupptnfca3STK8gF+Z6JF3pKTX+kqtVYsybInCE6nQbAqLy
 OQnrBfh2b0rbjumBq+nd5rMMdqm9QX2RF8g2jCuQKFwNTrk2uL8nuPLuBNVTvkchQyyV
 LBxvkFrnxaqyRGOz/9LuBbSejDzqd04KKql2zoXxkJQX3ZtBYgaO9J7mcrzXoEw5lQCP
 7xf4oFBTy4Qa6kVQG87FJi8zkp6R/QRL4q4gfuqRhVvDrFSDLIsoga2LOl42eNrB/qPx
 lKTIqg6QbGccEOQt6o9PYjPe/9fD438xcf1aHmIxU+e69xH2IfVJ7x5+740GZjheb6kR
 M28g==
X-Gm-Message-State: AOAM531z8dtOifDM89KrCbTLm295mrVdW2Pz1E77W15Y7+yyIpnnPoO7
 N/PuxX/WUmmnIeeCmQuu6P+3KTbXe4C+Zb+5m8Un7Q==
X-Google-Smtp-Source: ABdhPJzP1hw0SLQCuvL+tsDBvLz7fYQsO4ZaDRuTb5d3/hOMGkkH58nKkSkK02CdvtdPlUJ5WuEqF0RaaPVBsxPQ154=
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr2607804ejg.382.1613131557221; 
 Fri, 12 Feb 2021 04:05:57 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8=vG-2Vzrdark8VC5NANe5Fb3qGTpSFk8X94KvXszTbA@mail.gmail.com>
 <c98d4f43-5a29-afcc-fe7d-a3d92063df3a@redhat.com>
 <CAFEAcA8q1ewJ4F-pijt81Qc_rO0xNpy6jJY2DrW0ggTzg27aEQ@mail.gmail.com>
 <5213f033-19dc-bc40-bfd7-10b8c676539b@redhat.com>
 <CAFEAcA-va8hY3tHrhK_UV0bniF=VhietM2Y8ovZt57wWkg8f_w@mail.gmail.com>
 <CAFEAcA_JLx6NAd_YPzKy6iXWqP_c1jkW42bscK+Q=zKN4xAbzQ@mail.gmail.com>
 <20210209181009.7f2cb328.cohuck@redhat.com>
 <CAFEAcA_u7eKMyKKLf1sdMOgW7OPRt9hXiv5aDkfyfJcOfM6XFA@mail.gmail.com>
 <20210209182400.4fe15232.cohuck@redhat.com>
 <CAFEAcA99CxOv9UnzS7sehHhB5mi9P5CtchopqhwyAv=are1y7A@mail.gmail.com>
 <97770e1f-0b18-98fb-5b65-4211ff5465f7@redhat.com>
In-Reply-To: <97770e1f-0b18-98fb-5b65-4211ff5465f7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2021 12:05:46 +0000
Message-ID: <CAFEAcA99R8Fc1+S2SS31KAA8tsGx-BSgP5FaH37fYeE4gJa0Sw@mail.gmail.com>
Subject: Re: getting the console output for s390 cdrom-test?
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Feb 2021 at 11:45, Thomas Huth <thuth@redhat.com> wrote:
> I guess Cornelia simply meant a:
>
>  asm volatile("nop":::"memory");

That will force the compiler not to reorder, but it doesn't
seem to me that it would really force the memory accesses to
appear to the other host CPU thread that's running the device
emulation. So either it's insufficient in the s390 memory model,
or our s390 emulation isn't being sufficiently rigorous about
implementing the memory model...

> Anyway, I've now succeeded in getting my hands on an aarch64 host and tried
> to reproduce the issue, but even after running it in a loop like this:
>
>   for ((x=0;x<200;x++)) ; do \
>    QTEST_QEMU_BINARY=./qemu-system-s390x tests/qtest/cdrom-test \
>    || break ; \
>   done
>
> ... I was not able to reproduce the issue. What kind of host distro are you
> using there? Could the exact host CPU type matter here, too? (I was running
> my code on an HPE Apollo system, with Fedora 33, gcc 10.2)

I expect the host CPU type matters a lot, yes. dmesg reports it
as "cavium,thunder-88xx", with 96 cores.

thanks
-- PMM

