Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906A5697E1F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:12:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSIVO-0001NR-Id; Wed, 15 Feb 2023 09:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pSIVM-0001Mj-If
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:11:28 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pSIVK-00020C-Rj
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:11:28 -0500
Received: by mail-lj1-x229.google.com with SMTP id k24so1388623ljn.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 06:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uR+TnU8HEefWGi/zEwE4Jo0YoPCKUB5XdXVRtx0kN6k=;
 b=Ai5AKOOrBEwSrQBl1Nu+kYO4KdSYmyyWybiftc4oEWh3DuhOL9hyOSAhNHFn16hTD6
 UH60NwkoBibtidFyQtfkCp+8/NSFIj1rKcRWDdZhIsiW9VhisM7Z2Dero9nNP4T5fGY6
 Q3tY1cbKjURWLrU/ZHB7Fq0WNZ4w41MscnQCGZ79ayVmB/5RPyDjUOoLpiWMuYWyvpDu
 dOshJ2kcAwXzTIZG7r/Ru2mpk9QEclv9dkwug9PgWoDstp11Ty13Yflu5Lual4zeGc8E
 M5oOcDgR1LukyivEhRbgbI/w5wDuncLysu06t8D5b0uTT1AiN3RhbCCUlvyBnCGOEuNO
 bA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uR+TnU8HEefWGi/zEwE4Jo0YoPCKUB5XdXVRtx0kN6k=;
 b=cgb+ZRLWgzVwyDc876na9L3JD5Us1BUMfY/TfdMjuxTWVk0pu3pEHM3JSmIqrg544P
 ppo/KzLic6y3PPyHR0aSqo+ysdojE1zwuiW5/VwbdC8HREDLICPy9GMuQsbmxDKfbtV/
 M6A2Vb6EnTFfQQiZOoBD9l5VJEyjnZg8/N9WfmPdKlmCczRtztl+DAQp9AM8NgXG5wv6
 Y7eu08qwlafM2pYY/MTSk/Vq2wOQBhviCqW3SODO/NjQ/YILGfNlMx4+2Qg7rmZQbrHM
 mKb3j6xLLqW0yJ16WZqvOtEHmqkpJmFKkNE9TLk/REp3utnCgnqr5YgQYgj9mTeHU4Jw
 PCOw==
X-Gm-Message-State: AO0yUKU8ggXMoW4JxdEhKtUSYMzJ0H6chyIMEOyjsY1h5TjfNEcAv8y9
 HFw6v1wDsuEalNxjdzPOuWKf8URI3GssOT+wV7c=
X-Google-Smtp-Source: AK7set81sNJePcgLpM/1byYFvgZg2aETsGw7+vKp1sG0Y1XuZ7R1H+fOuw7sCJqfL7gT/lyYY9KLv40aEj9AxS5L4qQ=
X-Received: by 2002:a2e:a49b:0:b0:290:6d38:98be with SMTP id
 h27-20020a2ea49b000000b002906d3898bemr586869lji.4.1676470284306; Wed, 15 Feb
 2023 06:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20230215085102.415053-1-dbassey@redhat.com>
 <CAJ+F1CL0_OAj5-jsyCVY5aF=qoSoPx2Mu=q8Z7mpp3mesRi6=Q@mail.gmail.com>
 <5159868.WgR6L5i3FV@silver>
In-Reply-To: <5159868.WgR6L5i3FV@silver>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 15 Feb 2023 18:11:12 +0400
Message-ID: <CAJ+F1CK6kCbhAbpK8dmS3qMHnRptJiiU-FeKy3qT2WjQUGyekQ@mail.gmail.com>
Subject: Re: [PATCH] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Dorinda Bassey <dbassey@redhat.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com, 
 armbru@redhat.com, pbonzini@redhat.com, wtaymans@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x229.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Wed, Feb 15, 2023 at 6:09 PM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Wednesday, February 15, 2023 2:18:50 PM CET Marc-Andr=C3=A9 Lureau wro=
te:
> > Hi
> >
> > On Wed, Feb 15, 2023 at 12:51 PM Dorinda Bassey <dbassey@redhat.com> wr=
ote:
> > >
> > > This commit adds a new audiodev backend to allow QEMU to use Pipewire=
 as
> both an audio sink and source. This backend is available on most systems.
> > >
> >
> > Hmm, I would rather have less audio (and ui) backends in QEMU. (for
> > audio, if I could introduce and keep only one, that would be
> > GStreamer: to remove the others..)
> >
> > What is the main advantage compared to using the ALSA backend? (I
> > assume pipewire depends on ALSA anyway on Linux)
>
> I think it does make sense to add Pipewire. Apparently it gains popularit=
y.

My point is that pipewire has ALSA plugin (and also pulseaudio compat
library etc). So why add another back in QEMU?

> The main advantage of Pipewire is its interoperability: It allows you to
> connect apps with each other that only support a specific audio system. S=
ay
> one app that only supports JACK, another app that only supports PulseAudi=
o,
> another that only supports ALSA and so on. So it tries to provide a unive=
rsal
> plug on a system for all.
>
> Best regards,
> Christian Schoenebeck
>
>


--=20
Marc-Andr=C3=A9 Lureau

