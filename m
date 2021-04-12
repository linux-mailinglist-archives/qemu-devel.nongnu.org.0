Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5E35C1C5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 11:52:35 +0200 (CEST)
Received: from localhost ([::1]:54430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVtFB-0004h6-Kf
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 05:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtDq-0004F8-Lc
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 05:51:11 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtDm-0000qu-Tk
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 05:51:10 -0400
Received: by mail-ej1-x634.google.com with SMTP id g5so12531529ejx.0
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 02:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BVIGGTt1CSdr/2VL7K/FlJDtgKsvD0UqtKIL8DN6zC4=;
 b=R0E+2cGt0/nRb5E49XVWCYwhcK/9wxLX8BWdk5xJXzSYsya38Dm+DiMi/2MSB0W1wD
 KcLeUBg/uMkeKBaBx8yW79GsGObQz7gZsOX1b4sYXnA1pnuaMBF45GGVzJJaF9p4jFOh
 xfJSo9MlOlVaLjVhWp8OC+sQDMrrr6AoHOmChz4tyizmXBdHLRaU0foLA4zMjttvNscb
 NVG6C+UjnZbpbFjqV0eFM/uJUTpwa5PVpB3JCAcHMwrEtB0qRVpCPjKZ2c0Qft13KnUu
 CuoOHzCv4v1eT3jorJIb1RKtibuHs+3SySFNfGvjMtc6lh43qWpAT7rHKn6JEcvSrzem
 JZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BVIGGTt1CSdr/2VL7K/FlJDtgKsvD0UqtKIL8DN6zC4=;
 b=WgbCELuKZC6x7kGCpVKrXK56H3HrZINXwDH4jHpZPvRMHKXkymE8k5xiEiSCDz2GF0
 aTCsLI4pI9Uvp6Bt0JruhU+PDqaDM0IoMkem9j0rc6uxZkvGaIeOHnD6MzD+q7xWm4dQ
 P9XoGf71HJqaBcv1dWMNGzNR/YbfZU1ZtesF5bh5iNfcMdNOzuu/BJqeycke3xrEUVbr
 ZPR4rcNREORPmbAw2iLA1jCUNZ3M61MfW7LFYR5emYzRZW1CIAeY1Vj1jw08BaP0S5V6
 JeSh9JdhQTUmz64CCyKniRnxjF7CAZqmw5xN9vkmxZi7hEguBFpZr3UVu3Spv+xeIcF3
 P3gw==
X-Gm-Message-State: AOAM5318Bc8/5Ld5xfL3EhoBE9xOWfPCuIJa5qcdrVKbOx4XDJieNAxy
 ke0/+OwMpGoTSj9ZDlsRTEVBOnAkSfspwfq2y+CXGg==
X-Google-Smtp-Source: ABdhPJxWUEzVo1NlULRNQzvLV9JZqr3C7XNZocQ66fJHCgCYaJJ0EgiN4bhIewA/SliPoBK/wzJLqj0dOcxzkxeKMD8=
X-Received: by 2002:a17:906:8303:: with SMTP id
 j3mr7122136ejx.85.1618221065123; 
 Mon, 12 Apr 2021 02:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210412091824.707855-1-stefanha@redhat.com>
 <942ea12a-d187-9533-eba6-298c4eb7d82d@redhat.com>
In-Reply-To: <942ea12a-d187-9533-eba6-298c4eb7d82d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 10:50:20 +0100
Message-ID: <CAFEAcA-y8=pm03apz5JjkuMr8UesWrmB8Ors2dbG0jpqZpJniA@mail.gmail.com>
Subject: Re: [PATCH v2] libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Qin Wang <qinwang@rehdat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Apr 2021 at 10:35, Thomas Huth <thuth@redhat.com> wrote:
>
> On 12/04/2021 11.18, Stefan Hajnoczi wrote:
> > Some downstreams rename the QEMU binary to "qemu-kvm". This breaks
> > qtest_get_arch(), which attempts to parse the target architecture from
> > the QTEST_QEMU_BINARY environment variable.
> >
> > Print an error instead of returning the architecture "kvm". Things fail
> > in weird ways when the architecture string is bogus.
> >
> > Arguably qtests should always be run in a build directory instead of
> > against an installed QEMU. In any case, printing a clear error when this
> > happens is helpful.
> >
> > Reported-by: Qin Wang <qinwang@rehdat.com>
> > Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   tests/qtest/libqtest.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >
> > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > index 71e359efcd..7caf20f56b 100644
> > --- a/tests/qtest/libqtest.c
> > +++ b/tests/qtest/libqtest.c
> > @@ -910,6 +910,16 @@ const char *qtest_get_arch(void)
> >           abort();
> >       }
> >
> > +    if (!strstr(qemu, "-system-")) {
> > +        fprintf(stderr, "QTEST_QEMU_BINARY must end with *-system-<arch> where "
> > +                        "'arch' is the target architecture (x86_64, aarch64, "
> > +                        "etc). If you are using qemu-kvm or another custom "
> > +                        "name, please create a symlink like ln -s "
> > +                        "path/to/qemu-kvm qemu-system-x86_64 and use that "
> > +                        "instead.\n");
>
> The text is very long ... maybe add some \n to wrap it after 80 columns?
> (also not sure whether we really need the second part about the symlink...
> but I also don't mind leaving it in)

Yeah, anybody who runs into this is doing something weird and can
be assumed to be able to figure out how to do what they want with
a name of the right form, I think. You'll never see it if you're
just running 'make check'.

thanks
-- PMM

