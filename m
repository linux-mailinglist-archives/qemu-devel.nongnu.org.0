Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DA4612320
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 15:07:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oolXw-0002Hr-GY; Sat, 29 Oct 2022 09:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oolXu-0002Hi-1h
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 09:06:42 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oolXs-00008l-Ji
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 09:06:41 -0400
Received: by mail-qt1-x82b.google.com with SMTP id ay12so4396197qtb.12
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=up9YclUJMLe3g81tZyvyrINT4Rku/xMj1hnp+RjLIaw=;
 b=FpznTOwNpMYbQA38po/ezJFA38TB5Rif46M4a3X1Uatk2z5XW/CkRl38RSc5zgz6dj
 PmB2t0qbCXjfc9kAGKk+F1oY9c9TArWDb2URYkfa2XCk0qjT2sJv7yf+Ph/zS4a+XaAa
 h3auNlbQ6Ylwfm+AbzuyBh5XFdW0KBsZICnao55y2lmEGQQlpQ9DRxpVSl85zUd0XFpm
 nvb844o1jcGI75ECJHRC6TdFthSxc0y7skG6zBhQZEqgn5TSVvq3EmgdTmtGizDFBNpd
 cHAzqGuJr9VEwG5tI0j3KxD8dSYwH0vvUaV5RWw5NRXIremFP397pNC7WCmsOWo44uXk
 HMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=up9YclUJMLe3g81tZyvyrINT4Rku/xMj1hnp+RjLIaw=;
 b=cy+DfH3IKHd1SkCWlfxpW2kQiUxmZ7vDtekOnZei2+SFP3dRRCkt1bEnb+kCeWQmFA
 C+rlGiueiFiBxagEk+eq8Pie+uku/+odVWs1gbfxc1szpZfnT6YYfuwgkKR83PvQt/vI
 mGZ4Uj9Afscf8R2mm5PCKDpPsDxQrgCy25MmiNBWTrlxkTM1yYFr/sukvuJyVdOU5ghB
 6xC+jaNmlD6+D6eTaKZZnjP/aiCVR3cpbrzTh0VGQ9Z4w2BwFpYlGy8KVk+Hoa1D/LZo
 QikgJL3jy6FIw1bjuu1mCXyao0cLNxUsHFw5B7xPlLHW8K+pA6XdoMjYQY6HeWVwZwnm
 E1LA==
X-Gm-Message-State: ACrzQf1rUosBfd37SSHRy1xVBdQBsKtS7wkHT8NNnXCNuqFLr86oOMfV
 PGbbxWRH9XR5lJ0V3Huqry/xKGezPtyeG5ri7pk=
X-Google-Smtp-Source: AMsMyM6ArqPaciLn31n6oH4Bh8leFOipker1y26q0LA3xRBWuHBaa+qPFn9M0/ACq6tW0cz2oV8vvsNBedJJZ9ysoB0=
X-Received: by 2002:ac8:57c5:0:b0:39a:6512:6e3e with SMTP id
 w5-20020ac857c5000000b0039a65126e3emr3467736qta.334.1667048799098; Sat, 29
 Oct 2022 06:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-7-bmeng.cn@gmail.com>
 <85f915c4-938c-8a23-a4c2-01fba0f87b63@redhat.com>
 <CAEUhbmVNNuSRgjHiewKhqOifTF2_Rzn+8uUNphay6aXRYHg=kw@mail.gmail.com>
 <CAEUhbmXmKoE+cZUO-6Z=yPcWr1fknyw5PFyY+=c2-E4kCf-0AA@mail.gmail.com>
In-Reply-To: <CAEUhbmXmKoE+cZUO-6Z=yPcWr1fknyw5PFyY+=c2-E4kCf-0AA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 29 Oct 2022 21:06:27 +0800
Message-ID: <CAEUhbmX4uDWWoc=B23TZS9gbPCMkPu+H-jFcMYuPYWE_QuMR7w@mail.gmail.com>
Subject: Re: [PATCH 6/7] .gitlab-ci.d/windows.yml: Unify the prerequisite
 packages
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Thomas,

On Sat, Sep 24, 2022 at 5:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Thomas,
>
> On Sat, Sep 10, 2022 at 8:32 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Sat, Sep 10, 2022 at 12:32 AM Thomas Huth <thuth@redhat.com> wrote:
> > >
> > > On 08/09/2022 15.28, Bin Meng wrote:
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > At present the prerequisite packages for 64-bit and 32-bit builds
> > > > are slightly different. Let's use the same packages for both.
> > >
> > > Not sure whether that's a good idea ... I did that on purpose to save some
> > > few time during compilation (since the Windows jobs are running very long
> > > already) ... did you check whether it makes a difference in the run time now?
> > >
> >
> > Not much difference on the build time. Actually I found after we
> > switched to single thread build the time did not increase too.
> >
> > One side note regarding the gitlab shared runner:
> >
> > It seems the shared runner Windows VM is quite slow. Is it possible to
> > get a faster VM externally?
>
> Any further comment for this patch?
>

Ping?

Regards,
Bin

