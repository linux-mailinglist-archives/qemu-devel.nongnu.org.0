Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1975FB360
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:24:13 +0200 (CEST)
Received: from localhost ([::1]:47252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiFEy-0007oE-43
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oiEW6-0003xg-QI
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 08:37:52 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:33391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oiEW4-0002Nj-Hq
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 08:37:50 -0400
Received: by mail-qk1-x734.google.com with SMTP id a18so5440066qko.0
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 05:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MSd+MHiY1e2MynKb0HjfKeF6GlyQZfJxZx9J2NqYVBI=;
 b=Iqt/G4rBEhc6HgZ7RdP2LAvDvzjJVO9xNIOFDlH23Liq3H/MFW37zorhjP05T+I0bY
 qSSxOoTcPhjmp3GrqhwtJd8tXPuvH2S4PBHvs6bYUljHscFAq/hz6Cw52IadA2XKeBRT
 S0Zqa6KpUmlSsC24hqioZF5P82TKoHmiPw/qujq1zOpJGwxJcHA7BVwbm3itBKMHyg8i
 LTlmI5skQd1ZMPxV2kDl9zQa5bbH4UEaXurfPwYwjkDcOjx+cJ3MYHusl38Bb5vIgbxp
 8CqE5VZEBgWBDHqSKV6Yg7t2OR1qTch/54Q5NKhdipoZsdB9ZEOMRFuU6a3LZQE8hyGN
 gD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MSd+MHiY1e2MynKb0HjfKeF6GlyQZfJxZx9J2NqYVBI=;
 b=WeWOggi3kE8KjlVVglR9l4M1sxIQKguwA+0OdThbERe8GnqSMVUI6wnIBohu6bn0VH
 OHiuJrgcfKsj7f4ay2h1mvxPislNxVlKhpybuMo6aF4wToh1MKAKgTr0IbzsXuXY+vm/
 +fLP4tR4IcWe8ehrcyjh537BlTLSspe5656bwyD6XE3sLdEzbjiLlXTnNnerOItlFSk9
 Mm91mpO2Ul/+EB+RI24TJM+zL2yvdCOHb+shXJJZIH0bw0MkQcbTa1vt6fEaS+hCoc4t
 v10yFzHH/w8tXU9xtKRgr2jRj3BFpDxlh/MNzXoHx48pkvUYpr5ib6IdwGpNSUqvE/Gk
 I1ww==
X-Gm-Message-State: ACrzQf11ZA10LsAaBSQ9PtJjVPfJYoHqJQ/VEx72s+5/NrYh/N3YuSW3
 4+gyTNUivf2FXESZwolNyeOyN+a6Ojort2SCnJw=
X-Google-Smtp-Source: AMsMyM4rfwlrFVfp5Y3XOKfAefXO52EHMxhX2YUSHN26XZnJHeJUw7TK8qIx4L+Hot4mIGN8bnkIMZKVoBVvZ6uDfMM=
X-Received: by 2002:a05:620a:19a5:b0:6cf:4a24:cccb with SMTP id
 bm37-20020a05620a19a500b006cf4a24cccbmr16115602qkb.376.1665491867546; Tue, 11
 Oct 2022 05:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-9-bmeng.cn@gmail.com>
 <493cbb25-94b3-46e6-65b0-a9f45b8bf248@redhat.com>
In-Reply-To: <493cbb25-94b3-46e6-65b0-a9f45b8bf248@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 11 Oct 2022 20:37:36 +0800
Message-ID: <CAEUhbmUgT=VyEMSAQ3G+Di-BwQcp_-5qDTFSKTxwKXO+bq9YdQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/18] accel/qtest: Support qtest accelerator for
 Windows
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x734.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 11, 2022 at 8:32 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 06/10/2022 17.19, Bin Meng wrote:
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > Currently signal SIGIPI [=3DSIGUSR1] is used to kick the dummy CPU
> > when qtest accelerator is used. However SIGUSR1 is unsupported on
> > Windows. To support Windows, we add a QemuSemaphore CPUState::sem
> > to kick the dummy CPU instead for Windows.
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >
> > Changes in v5:
> > - restore to v1 version which does not touch the posix implementation
> >
> >   include/hw/core/cpu.h   |  1 +
> >   accel/dummy-cpus.c      | 14 ++++++++++++--
> >   softmmu/cpus.c          |  9 +++++----
> >   accel/meson.build       |  1 +
> >   accel/qtest/meson.build |  1 +
> >   5 files changed, 20 insertions(+), 6 deletions(-)
> ...
> > diff --git a/accel/meson.build b/accel/meson.build
> > index b9a963cf80..b21c85dc0a 100644
> > --- a/accel/meson.build
> > +++ b/accel/meson.build
> > @@ -17,4 +17,5 @@ dummy_ss.add(files(
> >   ))
> >
> >   specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true=
: dummy_ss)
> > +specific_ss.add_all(when: ['CONFIG_WIN32'], if_true: dummy_ss)
>
> Sorry for not noticing it earlier, but I just noticed that this likely
> should also only be added for softmmu builds on Windows?
>
> So instead of adding a new line, I'd rather simply remove the CONFIG_POSI=
X
> from the previous line?

Yes, I think that should work.

>
> >   specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
> > diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build
> > index 4c65600293..a4876fc0f2 100644
> > --- a/accel/qtest/meson.build
> > +++ b/accel/qtest/meson.build
> > @@ -1,2 +1,3 @@
> >   qtest_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'],
> >                       if_true: files('qtest.c'))
> > +qtest_module_ss.add(when: ['CONFIG_WIN32'], if_true: files('qtest.c'))
>
> Dito, rather remove the CONFIG_POSIX in the previous line?
>

Regards,
Bin

