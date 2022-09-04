Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699765AC312
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 09:09:25 +0200 (CEST)
Received: from localhost ([::1]:41956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUjkx-0005md-Te
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 03:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oUjio-0004Ah-5w
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:07:10 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:45053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oUjim-0000YK-C3
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:07:09 -0400
Received: by mail-io1-xd36.google.com with SMTP id d68so4791837iof.11
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 00:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=nsoOUpeuKR8xibgN81BhG1OqCu8Z/QahqIosnLSxSj0=;
 b=ZF6FBEf1aQ2RH7DLplWpaEfk4Z6BfqWtHXtlInLh9e/P9km9QAxrqLFcn7KHi1zlQ6
 8ApA1L6gmjOEeU0c6/ZyKMMzCQeZU/Rz5IEU6rHzUXlHZ0XRgj2ADq3fsNII10BV8dJY
 uD7X2O9rmwad6dHjgQmDHEjZtQk7pc5+u58pfIPUEYNIryedcROKv3IySwHmjN6qMhDr
 9/jOIpH1VVCccaQWXX6IuotHF35qEUbu838xYlVlWRDoxyGJz3ZvRaxoimo2I3tW9iZU
 4EvEilRvs5f0trc40tSbCoq6UIkzIiyrYjSP9+8FIUTtJb/BIplX/GvtcIVCbyThE86B
 g9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=nsoOUpeuKR8xibgN81BhG1OqCu8Z/QahqIosnLSxSj0=;
 b=iKdYD9Wj0YE8Q9MhSjnUgeOGikMNmEZnZWmt52ni1R25+t+3HriCui2GHQFIgAID5O
 Le2n5gxlXrMlNv9iinRZi1jSapjVeEiUnFL/rNE0htAMm4PrBijRsMkjUyXzPQgiwiN/
 9dWwMAyasNDkz2Nrn8wgVejt4IvNLo1ijx7wcnTb9k87/1XdEfWp8lTh8Dg9v2LAaL3A
 CrSNjsR30Xn94Mm5iL9ObRR4XSzs6XNSR/8hlm9ZDsjAQCmsB/c1CVWr/xSA/D4KAYhc
 jslbYCeUDK3aJXoc7/8BHtoEUyJ2o7YTR4CHwVcZeFWW3hFQOts6tJpqH1Is9DewNyc9
 LCmw==
X-Gm-Message-State: ACgBeo1bctmMkSAcvnbtl22hvCbgMs6iJvYhAWuTNN4gfMVxf3SRYuNC
 lMRt9iQ7NshoJAPRlYje6Kc3kv1qXTgLGoLGlbIR8w==
X-Google-Smtp-Source: AA6agR75V0ji+OrM6qBfF2dJLWkoEwc6a20otexFpzqZwNtvwOGT0Ti9yV3cWwTlVFQsIJj8fdWwuYig4LbbAw/MhKQ=
X-Received: by 2002:a6b:105:0:b0:688:2b66:1ed6 with SMTP id
 5-20020a6b0105000000b006882b661ed6mr21057192iob.165.1662275226221; Sun, 04
 Sep 2022 00:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220831013236.32937-1-akihiko.odaki@daynix.com>
 <87tu5qulay.fsf@pond.sub.org>
In-Reply-To: <87tu5qulay.fsf@pond.sub.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sun, 4 Sep 2022 16:06:55 +0900
Message-ID: <CAE=JJXdg=Miisek8WeqQ12NqL8obzmuyzD0mbv1SfiJTyVBLuw@mail.gmail.com>
Subject: Re: [PATCH v2] pci: Assert that capabilities never overlap
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
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
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Sep 2, 2022 at 7:23 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>
> > pci_add_capability appears most PCI devices. Its error handling required
> > lots of code, and led to inconsistent behaviors such as:
> > - passing error_abort
> > - passing error_fatal
> > - asserting the returned value
> > - propagating the error to the caller
> > - skipping the rest of the function
> > - just ignoring
> >
> > The code generating errors in pci_add_capability had a comment which
> > says:
> >> Verify that capabilities don't overlap.  Note: device assignment
> >> depends on this check to verify that the device is not broken.
> >> Should never trigger for emulated devices, but it's helpful for
> >> debugging these.
> >
> > Indeed vfio has some code that passes capability offsets and sizes from
> > a physical device, but it explicitly pays attention so that the
> > capabilities never overlap.
>
> I can't see that at a glance.  Can you give me a clue?
>
> >                             Therefore, we can always assert that
> > capabilities never overlap when pci_add_capability is called, resolving
> > these inconsistencies.
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>

Looking at vfio_add_std_cap(), and vfio_add_ext_cap() it seems that
they are clipping the size of capabilities so that they do not
overlap, if I read it correctly.

Regards,
Akihiko Odaki

