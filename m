Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7173736E98A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 13:26:50 +0200 (CEST)
Received: from localhost ([::1]:48052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4oj-0006TU-9O
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 07:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lc4nK-0005sj-15
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:25:22 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:39636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lc4nC-000254-Gd
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:25:21 -0400
Received: by mail-ed1-x52e.google.com with SMTP id g14so18412045edy.6
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 04:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8OJw141l5hu/O1o30BDbFvj9pSXHnhn3uoEu2iESEK0=;
 b=y7XjqvyHMeD4EJxvrQzQiLs3E3q7QtW4C+Iu5/BgqtAYQH26+pqfyI0d/fqnjWdsI3
 8xOfpiKAe74UvogR/yTdmPkExj0uRQQa2DnXmC/3D3r7cVrSf1QiFrO2+cmaOpurqi0D
 SJ+tHAq5KY10jpy1WN53GPO3xm5DQDBFghGQffQv06cT7OW2m7DCpr1PWGqjlQCXo9BF
 KytfQXCDjyEQmxs2xcydUdraDF7Gohr5hbDZd9iySl+cQTl8MgL1LfJkwQcOxdt8HXEL
 4x8LAo40o8ODf4Gc/lBoHCWoqCKW/bsqyAlq6Bt4TUZuuux6dobhBF+rybNVzm+J2bA9
 slGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8OJw141l5hu/O1o30BDbFvj9pSXHnhn3uoEu2iESEK0=;
 b=K6dWSPho5eX69Wv86mH1+31/BTFGg7SvJ1ilaeaiVj819e2wius4AavuAj0L6To7mR
 VOCDBztSUDuOFbew/x9mIRlTDwtvP1tW+4DhSMXf8vuom3V2N1O3hft09tocQRMGKxzI
 5WOek8E/1gjE+zMOi64moRmNEcONpE1NPLZRwn1s+8pnDRWdWebgVvpY1E8jS1UIF6U5
 idga4ULgqNaEc1gfBPAZPhpKfOlJcdodAE36IsgMhb7C3w0HB8mc52oH/kTB93XQowh2
 WMW4AvGQHuAOJW1NbH6VcoH/DcGLSgEj4GPgt28uL+MdbmoJwrJj/kLRpVG1grNOwhtg
 D3Pg==
X-Gm-Message-State: AOAM5330STfXN2FVKfEGaX9gds4uSPEqDyiqRraxHZ2QIYgYdFXDlOWv
 qxC29GCq9zxZc6wC0j2V0FAVgqis6qqQshnM3pLhZw==
X-Google-Smtp-Source: ABdhPJyZs9GMI1geInMsPnQv0AMXHccRGwLrCCMCFXvT8fOurUtjuUEKnKYdWMd8zKMsMTzzkPs1WIXUuuZMsgwwYSA=
X-Received: by 2002:aa7:c0ce:: with SMTP id j14mr17124815edp.251.1619695512658; 
 Thu, 29 Apr 2021 04:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <978e7623-8150-a2ac-20b0-69ab094c8a43@redhat.com>
In-Reply-To: <978e7623-8150-a2ac-20b0-69ab094c8a43@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Apr 2021 12:24:11 +0100
Message-ID: <CAFEAcA8dWp0Y4=tA9wUZ10h5hNdaUP-xcCku96uhciB32i7gPg@mail.gmail.com>
Subject: Re: Let's remove some deprecated stuff
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Anthony Green <green@moxielogic.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Apr 2021 at 12:19, Thomas Huth <thuth@redhat.com> wrote:
>
> On 29/04/2021 11.59, Markus Armbruster wrote:
> > If you're cc'ed, you added a section to docs/system/deprecated.rst that
> > is old enough to permit removal.  This is *not* a demand to remove, it's
> > a polite request to consider whether the time for removal has come.
> > Extra points for telling us in a reply.  "We should remove, but I can't
> > do it myself right now" is a valid answer.  Let's review the file:
> [...]
> > Thomas Huth:
> >
> >      ``moxie`` CPU (since 5.2.0)
> >      '''''''''''''''''''''''''''
> >
> >      The ``moxie`` guest CPU support is deprecated and will be removed in
> >      a future version of QEMU. It's unclear whether anybody is still using
> >      CPU emulation in QEMU, and there are no test images available to make
> >      sure that the code is still working.
>
> I'm fine with dropping moxie now - I've never seen anybody using it and I've
> never spotted any binaries in the internet that could still be used for
> regression testing of this target. And I've also put Anthony Green on CC:
> when I suggested the deprecation and he never replied. So I think it's
> really completely unused.
>
> >      ``lm32`` CPUs (since 5.2.0)
> >      '''''''''''''''''''''''''''
> >
> >      The ``lm32`` guest CPU support is deprecated and will be removed in
> >      a future version of QEMU. The only public user of this architecture
> >      was the milkymist project, which has been dead for years; there was
> >      never an upstream Linux port.
> >
> >      ``unicore32`` CPUs (since 5.2.0)
> >      ''''''''''''''''''''''''''''''''
> >
> >      The ``unicore32`` guest CPU support is deprecated and will be removed in
> >      a future version of QEMU. Support for this CPU was removed from the
> >      upstream Linux kernel, and there is no available upstream toolchain
> >      to build binaries for it.
>
> I didn't add these two entries to the deprecation list, I just moved them
> around since they were in the wrong section. Both have been added by Peter
> instead (commit d8498005122 and 8e4ff4a8d2b)

Yes, I think moxie, lm32 and unicore32 are all OK to drop now.

-- PMM

