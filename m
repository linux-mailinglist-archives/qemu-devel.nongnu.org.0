Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6731F3F3A4A
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 12:44:01 +0200 (CEST)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHOTo-00021b-GQ
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 06:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHOSR-0001EI-80
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 06:42:35 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHOSN-00081U-7C
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 06:42:35 -0400
Received: by mail-ed1-x529.google.com with SMTP id dj8so17872652edb.2
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 03:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FnuqrSSGd3SJXZR1WIeCXki/GoQyPQzWDF4vkjbT9HM=;
 b=rA2tBHbyeoweRtjoes1cB8O7REIjebPXf7p855Bh/ypCg7mY3KCvtBwVpHUAhDEEpI
 +qNisdjA9+9fllKu7YZYnBjXmlrchOPNLmTShEEEzfY1J/IILScQW0EvWAxvnX4rDhcC
 ihaQksStwqMUnWoh0IqWACuADbrZiryxl1vXs9wHsNcrp/Vz/5NMmeWD26n5WirPIsBT
 fron30Wv3rgW3DdQl38ZPnSell4Zk1rGJYAD3yZB52toSQ60uifr0Thsl0tLePSO5oBU
 ki+rSOKWzVSyF6ze983tztQZZSAt2WeLa3ORythiaCj1dYHMXNSCGHGnpTW/pP94moAI
 NrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FnuqrSSGd3SJXZR1WIeCXki/GoQyPQzWDF4vkjbT9HM=;
 b=Fwl3t3uxPcLIakqgAEXWznrpM+RXhJAobKtGf5KuivMq9g3WzrYAXpVS3HWVJUQsDO
 kceUY6clpO6f8k/zkfWOA3OrCZK8XR/QQtrpszaoVVp4/ExVuw3/7pv4JhEZBK3VABKu
 NaGRl3zJHC1hN4VH4LGbTTWdr7Z7Q2IJA7920wDAoYBxzizpQhgNrsRHywKIvHD+0skt
 bTj0xCnflOMfOipfMz0LI4tsviYP00UXXSkPEp1B1bWsTiV6p5vFfMZi8dFgtV5QSn08
 7Mtw/mepyy18EzBSQkAv9k1JHokPx5gMFyn8zp7e/uY05DUnW5TI5hCTXqsGz0MXLTT7
 siRA==
X-Gm-Message-State: AOAM533lP+P/faz2+vnerfU8PeXFLsnqKxiQEsmfaEAqHdhZGdNUOgEw
 unFSe1LYSeRsR3eVat6kdhOUEYOPuylUfGwUoXCwHw==
X-Google-Smtp-Source: ABdhPJy07Il9WXIYlPpvnLsWWrAPf7ZuCVx2qUHg4KPaiZ6Tx0tj95ffVaV2iwChApeoG5/3eg6HyEchRgS57m0fG+w=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr27059438edc.204.1629542549205; 
 Sat, 21 Aug 2021 03:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210820155211.3153137-1-philmd@redhat.com>
 <CAEUhbmXP7=0j10Kf3w1DsPb-ByCTv+dSGbF=0ARQXd44soyv6A@mail.gmail.com>
In-Reply-To: <CAEUhbmXP7=0j10Kf3w1DsPb-ByCTv+dSGbF=0ARQXd44soyv6A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Aug 2021 11:41:42 +0100
Message-ID: <CAFEAcA8KbXsBKXm6FVJH2jd1NsRcn+hrSPxGYDdoWgum0Vi8HQ@mail.gmail.com>
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 Aug 2021 at 11:03, Bin Meng <bmeng.cn@gmail.com> wrote:
> Does g_autofree work with every compiler we support?

Yes. We use it extensively:
  $ git grep g_autofree |wc -l
  329

> Looks it only applies to GCC and clang?
> https://www.gitmemory.com/issue/linuxwacom/libwacom/142/518787578

Those are the only two compilers we support :-)

-- PMM

