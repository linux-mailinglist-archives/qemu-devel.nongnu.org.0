Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7B06E09CC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 11:10:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmsyF-0000B9-Sr; Thu, 13 Apr 2023 05:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmsyD-0000Ak-F0
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:10:21 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmsy9-00043v-Pd
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:10:21 -0400
Received: by mail-ej1-x630.google.com with SMTP id ga37so36050599ejc.0
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 02:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681377016; x=1683969016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Do4v+4gSZeDj6LuHJ8qdjlM3TTHlOiF+w4OATSLeFHM=;
 b=wGEP9wcTBajPafFO4L3RzrwQHHWrL+ZU6umu2uZGYSrXLPRSkdnGU1d65GUly6zZRq
 eT5qK00lxgi99YdAnBIOcG/PH83oNEnVkA0xsIOQS+EswUmmr2F+lluejQirkr9aF6N4
 2VDk+Fsz2QFbCWmSmlXB0hYER+MXHNCtOZSolffaY2IJ9owFQPuWjt+cfjsDpAJ6MEmC
 lDlrwyZRtVlkmzOEey5kzjgRgOvUj2wQmWeMy6SyFISVS3qd3YcTRCKgDC79OMf7GZ1T
 S3btuB1ODhmxglf2hpZTVM0MzrYorI2jz7bT8HxaSgYjbXpV79K4SG50b3eyTs1JKthu
 TcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681377016; x=1683969016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Do4v+4gSZeDj6LuHJ8qdjlM3TTHlOiF+w4OATSLeFHM=;
 b=SvKuVd0ST9uf/ie+YMSw0ZUK9mCYiZddXAgZgvmChRtcuwBR5reCNUQrbCyWKxzRdF
 fjyalML8btYu8OVXJtuoQphHeQah10ax4MBFUGieEtmJUrFWQn3HH/J9fRjGuB0nzcbB
 2WYnkVVj6ZALXTq0s90VjUu2u5g8hS/XbWunnM6tJo/Xo6qCW/GBOI9dnm5rfDto62kz
 crJqVR+iPT6jaDy5nwXtFLj7f+EQERkJPRR7n+3hLWahcgkRmtBPdyZNk0yN/i4DMSi7
 jw2XtOhPwwyRAEv7g9BAeNyjkd8055tULbPD8Pp+NpeXiIj1+YewDIjp4Ng0ti3DenmZ
 ofjg==
X-Gm-Message-State: AAQBX9fQTTmJtWq+xM5S8fjcOdKjFZA+fw1ktEyhFZyBj8sIdtnC+3IX
 GuTqR4kKezSuCTrMlUFI+oGTK4eEGcmoAezrjtYB7Q==
X-Google-Smtp-Source: AKy350byjrmiwhEHWnHNrUEegIDr5idiF0lEE4xD/k/48btffTUnjrwf7orRfE/QIRyTnbVQIaHIDqnClr3J21bxCL0=
X-Received: by 2002:a17:906:3c52:b0:94e:5c27:dc5f with SMTP id
 i18-20020a1709063c5200b0094e5c27dc5fmr883617ejg.6.1681377015834; Thu, 13 Apr
 2023 02:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230412185102.441523-1-dwmw2@infradead.org>
 <CAFEAcA9G0KpkOivD8fBvEQwGcTsUQz53z5W53YcjcHmZGPHkmQ@mail.gmail.com>
 <ac9417c017a2f1bda399d831b100e9b009f8d4c2.camel@infradead.org>
In-Reply-To: <ac9417c017a2f1bda399d831b100e9b009f8d4c2.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 10:10:04 +0100
Message-ID: <CAFEAcA_UoiM5vFqvyia3tU0Kb9xCMkFUoRiDPrcqX9te33Ot+A@mail.gmail.com>
Subject: Re: [PATCH for-8.0 0/5] Xen emulation build/Coverity fixes
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, no Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 12 Apr 2023 at 20:01, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Wed, 2023-04-12 at 19:55 +0100, Peter Maydell wrote:
> > On Wed, 12 Apr 2023 at 19:52, David Woodhouse <dwmw2@infradead.org> wro=
te:
> > >
> > > Some Coverity fixes and minor cleanups. And most notably, dropping
> > > support for Xen libraries older than 4.7.1.
> > >
> > > I believe there are two issues that remain to be fixed. The x32 build
> > > fails, and I've seen patches which attempt to detect x32 and disable
> > > the Xen emulation. Along with assertions that we just shouldn't care.
> > > I don't have a strong opinion either way but it seems to be in hand.
> > >
> > > The other is the question of what Xen *actually* does if you try to
> > > unmap an IRQ_MSI_EMU PIRQ. I don't think Linux guests try that, and
> > > I'm fairly sure Windows doesn't even use MSI=E2=86=92PIRQ mappings in=
 the
> > > first place, and I doubt any other guests care either. I'd like to
> > > establish the 'correct' behaviour and implement it, ideally before
> > > the 8.0 release, but it's going to take me a few days more.
> > >
> > > David Woodhouse (5):
> > >       hw/xen: Simplify emulated Xen platform init
> > >       hw/xen: Fix memory leak in libxenstore_open() for Xen
> > >       xen: Drop support for Xen versions below 4.7.1
> > >       hw/xen: Fix double-free in xen_console store_con_info()
> > >       hw/xen: Fix broken check for invalid state in xs_be_open()
> > >
> >
> > This is highly unlikely to make 8.0 at this point, FYI.
> > If there's anything in this you think is super-critical we
> > might be able to sneak it in.
>
> Nothing is super-critical except maybe the double-free in
> store_con_info(). That could lead to a crash on startup if the QEMU Xen
> console is being used.

I've cherry-picked that double-free patch to apply for 8.0; thanks.

-- PMM

