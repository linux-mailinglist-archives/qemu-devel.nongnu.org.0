Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0CA702BEC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:55:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWmZ-0001q3-Mq; Mon, 15 May 2023 07:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyWmX-0001pl-Nu
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:54:25 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyWmV-0001LO-4s
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:54:25 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bc3a2d333so19082374a12.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 04:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684151661; x=1686743661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FvAESZF+lG8+10R09a8j0dn6TL6Y3U38pLmp3+1pcMc=;
 b=pBhF2D+WlfqUjAGPLInn62IsTjc8EPn/vLOhlU0Yw/lnym0ARc9Wwob3+t1QW2xdcU
 1HbEipMFqmRY39EAUA1NCt/s4k8bHXsmUDhZmX3gdmIFagbsB5a31YiY6Lu8C0WcQHZZ
 wmfrC62NACtflyG/ny35ln/DBvXKEH5AhcoFCLq2TqVntWwQyKlkwk9637pr5NcQ44nn
 A0vEouvDo72Ea9z/m9PWMsk4faGiS5iD56VWi6xfFIPd1hrvRhBvbdE6kZSKOGWG6iBq
 aodjKRsfPLrGaZaV+H0DPmTDrnkjoh1PydK+9LvF5bDw1fCanmRT95suxEfKD81NFHfO
 Uvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684151661; x=1686743661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FvAESZF+lG8+10R09a8j0dn6TL6Y3U38pLmp3+1pcMc=;
 b=UBD+hYwQB54IFRvf3TlIo9TkzxnoGDYyfoIKmW13EToMaXHtmCFsoIPMWZq50x+S48
 CQe6QSicLLtTohIXjWXSxHG0ZKDQkxRa8qebu0d3vtJKJt+CKIIZ37uaBNM+yeOchzn3
 xyz55W9zcQYKZ3mg8YgK4DS+EFghbyjJsfNgk6HPTHHVTuMhCSKHRGlInFnek1jWFWXn
 rs4/avdVG/aGbJzDzM9SSzFV1Fges1pTHFG4UyAT+A1++rlQ9X4IjwJzjIVlt4qL5BVn
 pEm21wFhHQVlX7FPfjwQN4lM1JaZor+cx1Fd1e+yZnCsIqScv9lLi1Jt5Os6NNjJqKLd
 dVyw==
X-Gm-Message-State: AC+VfDx44UhOQ6Mi894J5hlj0FJKMHRXCP37OqAeaW7Meur2rUXXDet5
 QM6YZ7VWFUsMJcDbJ13UywbCNVX+kQ9NIi2Bcq5UhQ==
X-Google-Smtp-Source: ACHHUZ6LccboUTwTa3nOvJBnP/H9Hu2RVw2vBhiupM/CdhJ2p+X8ZnqMWdGIAaVyeHBxSl0E7knNthXaQgDjixusVOc=
X-Received: by 2002:aa7:d45a:0:b0:50b:c4fb:770f with SMTP id
 q26-20020aa7d45a000000b0050bc4fb770fmr23796026edr.34.1684151661319; Mon, 15
 May 2023 04:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230512093108.1180726-1-zenghao@kylinos.cn>
 <ZGHyvBb8BQdKhWEy@redhat.com>
 <e2d06c7a6528a16b6ae58360d49a1fc9c7e8ade5.camel@kylinos.cn>
 <CAFEAcA8fN-+FUJapo=+ObZgfrJW32ccFj22qvU92ndNzPLQ9Dw@mail.gmail.com>
 <ZGIDg+8xIOGpTIO4@redhat.com>
 <wfky3jb2iuza4aom6si2jfkbgnjhalkpzmsc3x2ofjzilgtssw@ejwsuey3khif>
In-Reply-To: <wfky3jb2iuza4aom6si2jfkbgnjhalkpzmsc3x2ofjzilgtssw@ejwsuey3khif>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 12:54:10 +0100
Message-ID: <CAFEAcA_E4fUg_W9wCoZcwFR+vXCA0PPtxB5cmEFU9Jt5=zxGGg@mail.gmail.com>
Subject: Re: [PATCH V2] hw/arm: enable qxl for aarch64
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Hao Zeng <zenghao@kylinos.cn>, pbonzini@redhat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 15 May 2023 at 11:54, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > > > On Mon, 2023-05-15 at 09:52 +0100, Daniel P. Berrang=C3=A9 wrote:
> > > > > Overall, IMHO, we should keep QXL restricted to as few build
> > > > > scenarios
> > > > > as possible. Given the status of SPICE, possibly we'll even want =
to
> > > > > deprecate it on x86 eventually, not add it to more arches.
> > > > >
> > > > > What are you seeing as the compelling use case that requires QXL =
to
> > > > > exist on aarch64 ?
> > >
> > > >    Thank you for your answer, it made me learn a lot. No use case, =
just
> > > > outside customer feedback on the ARM architecture qxl use has probl=
ems,
> > > > I compiled the community qemu, found that the default does not supp=
ort
> > > > qxl display, so the submitted enablement.
> > > >   I agree with you, please ignore this commit.
> > >
> > > I would still like to know why QXL isn't automatically
> > > enabled like every other PCI device...
> >
> > Historical reasons ?
>
> Yes.  Any display device with a pci memory bar is disabled on arm due
> to the caching problems.  So virtio-gpu is the best option available
> (and it IMHO still is, it works without strings attached).

They all still build as far as I can see: if you
run "qemu-system-aarch64 -device help" it lists cirrus-vga,
ati-vga, bochs-display and the rest. This is correct, too --
there's no reason to deny TCG users these devices just because
they don't work in KVM.

I'm not trying to recommend QXL particularly, I'm just
not clear (a) how technically we are arranging for it not
to be built just like any other PCI device (assuming Spice
support is present at all) or (b) whether we really want
it to not be the same as all the other available but not
necessarily recommended PCI devices. Plus however we decide
to do the Kconfig logic we should resolve the discrepancy
between what hw/i386/Kconfig does and what hw/mips/Kconfig does.
(I would tend to go for "if it can be made to work, have it
enabled, and let users decide what they want to use". We
have *lots* of things QEMU can do that are almost always
not the sensible choice...)

thanks
-- PMM

