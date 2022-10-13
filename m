Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F455FD447
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 07:44:39 +0200 (CEST)
Received: from localhost ([::1]:36426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oir1J-0000Go-0E
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 01:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oiqwY-0006KR-P0
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 01:39:44 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oiqwW-00045a-7B
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 01:39:42 -0400
Received: by mail-ed1-x534.google.com with SMTP id m15so1086868edb.13
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 22:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n1Rf/VERGkd3V32Qr6JPTMJmLPy270dzb6uHzmVKPm8=;
 b=4WQFYfIMGJHl4iyCjcoLY+lL/6ZjRha9QYM9oxv0izADBav9cO+QxORcYyYuDZ9KLZ
 vm/y54s6ELnbp6c1B/VXngDxBDv+ejV1QieBbGa9wLvMpqBk1UStceEDAIZ2JP3TqL4k
 aiPKi5LBTtBDm3+LQiNI/zL6rHbIo96PWfmNv0ciMsBwJG+AwzakOFMqSMDFJEqhmzoH
 PUWoVyHbDyd+pHBbxPx4V9ufmi0OFCbn311N17qD7UEfHhVsH+epMK6CTOFvDNuXlezm
 vMb8qB/g16J3W5ZQoQGDBcMlG97MUA93a1ERs4CjA0CkNbnkFft/4KJP+PfuK5MFwajU
 CtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n1Rf/VERGkd3V32Qr6JPTMJmLPy270dzb6uHzmVKPm8=;
 b=dRFM+lprqJb4LkDtB9r80Wos3x1Sb14S1EAYHEZuW4okEn9ECJgVHCYuFz3lY49aJR
 RsC7FSTzo5uuxnswkmOXvqXmBe8BYx+hEuZvroCV5seIvARdCoIPiP4TXBtgM/4UEwAT
 TYbdLfRv6oJWs2sR014b2zkxzeVJ5Rpq6ZIGDH9tu5ekRu5zpLrPRkjJ5TFqI4oF5zOS
 xjxqF8Bwsju3tJoZT5iimLCnYDAv/PVtyko7GDmdYN7FpeRFUr/6ur2+EBJ4V81e3kY6
 qhFpovqmiNv4vKtSj3/MAAlJ/7AIITxW8VzwgpGyqVfo9psf52ydpdhW5CFHPelRJth6
 YO5g==
X-Gm-Message-State: ACrzQf2NrPDguXS3yY7WzOXrpBq3Muo/k03LlM0+EuNfGgqXgRh0FsHf
 M1iUYmmNSsAze1nI/DOH+39Gk9xCVkKwgEAd9uVBbg==
X-Google-Smtp-Source: AMsMyM64RqYbbupGvWT51xvIvcnhWJCjvGH+T19mSMtVfWykXh/DFKq8UyCIIkeYlKDrxbtfypuIL9zU28Enze04KaE=
X-Received: by 2002:a05:6402:4310:b0:45c:c16c:5c7d with SMTP id
 m16-20020a056402431000b0045cc16c5c7dmr4426418edc.246.1665639578103; Wed, 12
 Oct 2022 22:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220831013236.32937-1-akihiko.odaki@daynix.com>
 <87tu5qulay.fsf@pond.sub.org>
 <CAE=JJXdg=Miisek8WeqQ12NqL8obzmuyzD0mbv1SfiJTyVBLuw@mail.gmail.com>
 <875yi2mat1.fsf@pond.sub.org>
 <CAE=JJXcRH-0TuM7WgbM35Nb=Ud94K-LUcdzjoyJDMEuK9o=uFw@mail.gmail.com>
 <87mtaitpph.fsf@pond.sub.org>
In-Reply-To: <87mtaitpph.fsf@pond.sub.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Oct 2022 14:39:27 +0900
Message-ID: <CAE=JJXcbioK4Nod0mSuRY1Mpj8nAYJvgX62cGyG8_MDfVgjyOQ@mail.gmail.com>
Subject: Re: [PATCH v2] pci: Assert that capabilities never overlap
To: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 Alex Williamson <alex.williamson@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>, 
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 29, 2022 at 7:55 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>
> > On Mon, Sep 5, 2022 at 6:26 PM Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> >>
> >> > On Fri, Sep 2, 2022 at 7:23 PM Markus Armbruster <armbru@redhat.com> wrote:
> >> >>
> >> >> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> >> >>
> >> >> > pci_add_capability appears most PCI devices. Its error handling required
> >> >> > lots of code, and led to inconsistent behaviors such as:
> >> >> > - passing error_abort
> >> >> > - passing error_fatal
> >> >> > - asserting the returned value
> >> >> > - propagating the error to the caller
> >> >> > - skipping the rest of the function
> >> >> > - just ignoring
> >> >> >
> >> >> > The code generating errors in pci_add_capability had a comment which
> >> >> > says:
> >> >> >> Verify that capabilities don't overlap.  Note: device assignment
> >> >> >> depends on this check to verify that the device is not broken.
> >> >> >> Should never trigger for emulated devices, but it's helpful for
> >> >> >> debugging these.
> >> >> >
> >> >> > Indeed vfio has some code that passes capability offsets and sizes from
> >> >> > a physical device, but it explicitly pays attention so that the
> >> >> > capabilities never overlap.
> >> >>
> >> >> I can't see that at a glance.  Can you give me a clue?
> >> >>
> >> >> >                             Therefore, we can always assert that
> >> >> > capabilities never overlap when pci_add_capability is called, resolving
> >> >> > these inconsistencies.
> >> >> >
> >> >> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> >>
> >> >
> >> > Looking at vfio_add_std_cap(), and vfio_add_ext_cap() it seems that
> >> > they are clipping the size of capabilities so that they do not
> >> > overlap, if I read it correctly.
> >>
> >> If we want to deal gracefully with buggy physical devices, we need to
> >> treat pdev->config[] as untrusted input.
> >>
> >> As far as I can tell:
> >>
> >> * vfio_add_capabilities() replicates the physical device's capabilities
> >>   (starting at pdev->config[PCI_CAPABILITY_LIST]) in the virtual device.
> >>
> >> * vfio_add_std_cap() is a helper to add the tail starting at
> >>   pdev->config[pos].
> >>
> >> Could the physical device's capabilities overlap?  If yes, what would
> >> happen before and after your series?
> >>
> >
> > When the capabilities overlap, vfio_std_cap_max_size() and
> > vfio_ext_cap_max_size(), called by vfio_add_std_cap(),
> > vfio_add_ext_cap() should clip the size of capabilities. Comments in
> > vfio_add_std_cap() and vfio_add_ext_cap() say: "Since QEMU doesn't
> > actually handle many of the config accesses, exact size doesn't seem
> > worthwhile."
>
> Weird :)
>
> Back to your patch.  Its core is dumbing down of pci_add_capability() so
> it can't fail anymore.  Instead it aborts on overlapping capabilities.
> Note that it already aborts when running out of PCI config space.
>
> The remainder of the patch simplifies callers accordingly.  Some callers
> ignore the error before the patch, some abort on error, and some pass it
> on to their callers.  Too much for me to review in detail.  We can talk
> about ways to split it up if that's desired.

Yes, I'd like to hear your ideas on how it should be split up. The
main challenge here is that it changes the signature of a function
without changing its name.

>
> My one concern is device assignment, which should treat the device's
> capabilities as untrusted input.  If you're right in that such
> capabilities get truncated before they reach pci_add_capability(), then
> your change from failure to abort is okay.
>
> I'd like to leave checking your correctness argument to actual PCI
> experts.
>

Included PCI maintainers in To. Michael S. Tsirkin and Marcel
Apfelbaum, Can you confirm this?

Regards,
Akihiko Odaki

