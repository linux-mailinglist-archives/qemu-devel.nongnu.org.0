Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB7B5FA159
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:45:22 +0200 (CEST)
Received: from localhost ([::1]:48132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuy1-0006xG-Bb
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohum4-0007zI-DI
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:33:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohum2-0007pJ-S2
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:33:00 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 x31-20020a17090a38a200b0020d2afec803so3580271pjb.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 08:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ER2YKxk+DhIpOc6Cb5PS4WYx+lvuZgpp11sRliO5W5E=;
 b=TWElC5PpKdXkGpBTAyMdLiUNsqgiZjyZK3dG2ct7YcYNTnsLaDV3EYpYVLnzC0gIZz
 qV1a05JEO93SjHqxXzbAgfG7ObyDUozV8bbXkY+SgqM44echgFiYzuJOabNJot/IzA8T
 XYQO7+TBfzVoDltPEIc8FxFbhhwBtDuKuRiYrdiFZIKIYEryoe438TvEo/6PnYnU5fnY
 qnIF/8mWR77HcjL65GpigYLiEvU95aiqpWsza7B3+7iliMWZqNhSQrxeL7JigPJJ296z
 x6UyKg8vV1Mc4WLlk4IsyYjzU2JZCN7VjtZtZr3cnjUU54IvRt9JZGe4TUhJSbjN0Z8P
 2LEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ER2YKxk+DhIpOc6Cb5PS4WYx+lvuZgpp11sRliO5W5E=;
 b=1DUo5B3BSxhxuH6CBOs7Ve/XGL3Jd+u8nYizb4ql4PmEFWV+cQ5j6IWIvldylQALvG
 e7LWLJ25l3CI4R3WnVMLS6pmX7iVAUphcZxbJAE4rv6fKsF2twUypiXipPLaJTHm0PeA
 wPKxtBAsGaGmrG4f7SeH7g6cmTTCxaR5wqNIin+Cz24cUVI0trpEdH2SuB1z0nqLm1j5
 BCmwKsA6BpEj8c5ymeiEyVARGRchoZWK9hLxFa5PXlZSnDAkGq7QUed+9lr6ZZDIZTPX
 nKzKEx7XehURK0o9x4vTCnUr7jey475JxbK7ew1O6KjeSPGN/ebPU/N8FZRnF/HolmED
 nbwA==
X-Gm-Message-State: ACrzQf0YZmj5XIzmxFaDFjsY+anzpW8QWYAyKwSmc9lgxWRlEdTfwLEC
 zMNG59q1lnHdscfdm2zjAFhj945qwB6ELnksAzaKjg==
X-Google-Smtp-Source: AMsMyM60hL8uZz52r0zKYP2qDoTLLrp6r1OJneErkdBinLYuT4BTawk1N9Uwu+QrgDipYu63WJTPjU3McVkWgv+6D1w=
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr17784586pjb.215.1665415976967; Mon, 10
 Oct 2022 08:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <CAFEAcA-Ac-=i_DK5MUtKtTqH7OpyzHAi6u=tHFAFZyvdr1KP8A@mail.gmail.com>
 <CAFEAcA-fOdNeDz9_Hbm7R3_3o2T4Zw8wPrgOtVLK9tUNMciZow@mail.gmail.com>
 <Y0Q4Vugq+d0vaF97@zx2c4.com>
In-Reply-To: <Y0Q4Vugq+d0vaF97@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 16:32:45 +0100
Message-ID: <CAFEAcA9h05S=MmUgKWA2cg9H8Rn7aiRrSDBJAO8yTyFvC7FQ2w@mail.gmail.com>
Subject: Re: [PATCH 1/6] device-tree: add re-randomization helper function
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, 
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Oct 2022 at 16:21, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Mon, Oct 10, 2022 at 11:54:50AM +0100, Peter Maydell wrote:
> > The error is essentially the record-and-replay subsystem saying "the
> > replay just asked for a random number at point when the recording
> > did not ask for one, and so there's no 'this is what the number was'
> > info in the record".
> >
> > I have had a quick look, and I think the reason for this is that
> > load_snapshot() ("reset the VM state to the snapshot state stored in the
> > disk image or migration stream") does a system reset. The replay
> > process involves a lot of "load state from a snapshot and play
> > forwards from there" operations. It doesn't expect that load_snapshot()
> > would result in something reading random data, but now that we are
> > calling qemu_guest_getrandom() in a reset hook, that happens.
>
> Hmm... so this seems like a bug in the replay code then? Shouldn't that
> reset handler get hit during both passes, so the entry should be in
> each?

No, because record is just
"reset the system, record all the way to the end stop",
but replay is
"set the system to the point we want to start at by using
load_snapshot, play from there", and depending on the actions
you do in the debugger like reverse-continue we might repeatedly
do "reload that snapshot (implying a system reset) and play from there"
multiple times.

thanks
-- PMM

