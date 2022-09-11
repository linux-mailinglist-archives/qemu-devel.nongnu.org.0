Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C165B50AB
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:39:17 +0200 (CEST)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRrQ-00040v-8Z
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oXRgc-0000O4-Af
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:28:06 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:34473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oXRga-0004Om-CC
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:28:05 -0400
Received: by mail-lj1-x234.google.com with SMTP id z23so8164938ljk.1
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 11:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=oOgEsPCj6UpUClwGvnb9Nqtah+6ANhn2doByIK1acxE=;
 b=HYS10QjqSkKpT62l/7de4j2YjNmyGtjjum7ZDoCm8QvpQLbXUPVP7akuXNcpD+M1LO
 aEr1sIV+mI+OFNFw2eCwAHBXdkwUThqy4vzn3s0dxj/x2gRP/0FiCYlhieOIyT/h+XMT
 Qzrf8rap0dIEW45jzsMBfoFI4ICnrV2HKtuYLjX56N+ECkzSNPqPGOJzVZPue5KZJ8xw
 xBKytACNqEwnQ9OQMGii3+xa11tmIForYjFa92PLTkLO4X5dpOur2WHwDOr+W1pIUDqn
 vflm12DHZjfxCxjQxhLHH8lHfZyhQ3xJYe95ew5OAqKi8R79W14Mf6o1v4VbHsXPpquc
 S2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=oOgEsPCj6UpUClwGvnb9Nqtah+6ANhn2doByIK1acxE=;
 b=kBFYFCQTKUbkUNbrKrykcHXv5EzQdZaP4o7EKe4BGBJ+qXswZiqZlmFwZumSiyfdsR
 GwCJ/MzMZEv8lcco1Jj98lhg6dDMvSdQPbadyKEmHcvH9RKCqyGjQi42FQnqtkWi7sIm
 gBUvl1I4QSHQCgFFTDerwf4KS6kGqEAtBZh1ntXSNFZbQEZ6gErcuh4nP0wM/dn1RsvP
 vjNyQ7jrj4UMtKrnnswZDTBD8J7mn/POIIxhvpgNG1IfDEn/mjdcYPx9sUeqJ8tC/Xy9
 foKp6FtmqFCq8y6Wvu+YPVzQovQE6JBkEDiVXJtqQzzE+zzvxHy8kVkqMEVK2JwjU5X5
 rPMQ==
X-Gm-Message-State: ACgBeo2sc+mzjBGCO75LF0AlZnQmNXqvtRG/tNucaXR4v9fzYtd32GzU
 /GOK6LAaO9ZFfVoZS4EMytjpL1tHka+9qq3dGnhdUQ==
X-Google-Smtp-Source: AA6agR4y382nDARDa/Qrhnw7DmU7RYRmdg0ceZxevbR6CNBWoLNVpBw0d1aFRKNTtHs99EXpj2x7K3DDdRXqO6TMRv8=
X-Received: by 2002:a2e:a99b:0:b0:25e:be66:72f2 with SMTP id
 x27-20020a2ea99b000000b0025ebe6672f2mr6540910ljq.27.1662920881866; Sun, 11
 Sep 2022 11:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
 <20220908173120.16779-2-arwed.meyer@gmx.de>
 <CAFEAcA_F+ETYHT-HSs3wHwjqP4CEe2LtdfCf8B_P2Ted4xvk+w@mail.gmail.com>
 <1bd4abdc-e0db-1fa6-99ba-84b729e5cb22@gmx.de>
In-Reply-To: <1bd4abdc-e0db-1fa6-99ba-84b729e5cb22@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Sep 2022 19:27:50 +0100
Message-ID: <CAFEAcA-9RD_Lxypgm1yM6T_R=SS=LD9JPQbD5SFek4_wrCnKhg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] msmouse: Handle mouse reset
To: Arwed Meyer <arwed.meyer@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, 11 Sept 2022 at 18:14, Arwed Meyer <arwed.meyer@gmx.de> wrote:
>
> Am 08.09.22 um 23:11 schrieb Peter Maydell:
> > On Thu, 8 Sept 2022 at 18:43, Arwed Meyer <arwed.meyer@gmx.de> wrote:
> >>
> >> Detect mouse reset via RTS or DTR line:
> >> Don't send or process anything while in reset.
> >> When coming out of reset, send ID sequence first thing.
> >> This allows msmouse to be detected by common mouse drivers.
> >>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
> >> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
> >
> > How does this work across migration? There doesn't seem
> > to be anything that handles migration of the existing
> > state inside the MouseChardev either, though...

> can you please explain in more detail what you don't understand and what
> you mean by "migration"?

Migration is when the state of the whole VM is copied from
one host to another, or, equivalently, when it is saved to
the disk image with 'savevm' to be restarted later. For this
to work all the guest-changeable state in the whole VM (all
device registers, internal state, etc) has to be saved so
it can be reloaded on the destination. My question is basically
how this new state in mouse->tiocm, and more generally how
the existing other state fields in that struct, are saved
and loaded during the migration process. I know how this
works for device models, but I'm not sure how chardevs
figure into it. (Perhaps the answer is "this shouldn't be
a chardev at all" ???)

thanks
-- PMM

