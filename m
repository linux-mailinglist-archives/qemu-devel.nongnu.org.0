Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7A7459C29
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 07:06:41 +0100 (CET)
Received: from localhost ([::1]:58326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpOwy-00041r-65
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 01:06:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpOtH-0002xr-Kg
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 01:02:51 -0500
Received: from [2607:f8b0:4864:20::134] (port=41833
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpOtF-0004ZK-Ou
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 01:02:51 -0500
Received: by mail-il1-x134.google.com with SMTP id t8so10671734ilu.8
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 22:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ABxeR2qu+jzu5+xwA6ffSXuTycA3waFZmGruKNWf05U=;
 b=S9j3GVad3JFUG+2a6HuWlFB7hbjcCLj3Y+uhiS+YFI6Ps9gqkn1pqyk+HVZWOkdVmR
 +tEhmlKWAmNxLq2RUU9OVDwy8vLrlz7hj4mcP4jpFEyzPupjCSbi9c/52OHUdBPgux4B
 5fA8t3SavzSbVQYqCyPKnPj6nfkiusr1qfliOxwe2K5qz4KDC61Ub5uZeg1Op5vUeDU3
 4xD/J+YldC37vKnXkF2TXB2ms7mRwPoxfGjgHAhI1nRiuGifoyxzsuYae5VHpsJf1Ty/
 WvOHH45b7ZiVS/81Ve3YlfBItgrQIMaBpjAGy4BU2PfI0M0LOdV2Js6OH4Qqr5CSV6Rc
 Vjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ABxeR2qu+jzu5+xwA6ffSXuTycA3waFZmGruKNWf05U=;
 b=CmIb+3tuL1FL5TfIqE3QOifxhjeSL31sXSF9eDG053PKlnpu/Yq628TASAGE1L728g
 n+IBeIMCoo2Ppz76o3Q1qM4aAQIaMlbEUzfGu2cbbF0zv+c5qv8GlCKUJxZpV/Gr5Klr
 dI2AjWebcEqDGkAg0n6DZYqZVzep6z9Lf7yEcfJcvouYWx5O/mhOnlNZ31neaZ/H+x7U
 3FGV6jlGDHwC6Ka0lCwmEg9oKek93Ux9FZeBKpPFgOsRwipGbqp8xHbV/E1z7mwmAKiY
 84mid+h9WEZhK9si34SPtYQsJn7Xf7R46V8SrwzKODdajJtgWh7p5xrBe4iyY9ffRdwE
 HhiA==
X-Gm-Message-State: AOAM532jceNFL7Ud+FyGuqyp98BDDLO0vfqntxxL6spbCqQiS+5YSuqI
 S1Ox2gUJJflp6vDeXdzYjY9JNQWSOunVS9epOtc=
X-Google-Smtp-Source: ABdhPJz3GPeBk26thoS5QS+ala6/R52RqssQ9VgV4WwsWkMX/yADBNo5+HHFrKY/grBLBM/XMGAEXC5ojDkPm5FfuUg=
X-Received: by 2002:a05:6e02:1b08:: with SMTP id
 i8mr2584169ilv.74.1637647368014; 
 Mon, 22 Nov 2021 22:02:48 -0800 (PST)
MIME-Version: 1.0
References: <20211118122912.4051779-1-philmd@redhat.com>
 <02e7e56e-f80d-1e9c-13ec-0ddbe3b5b360@redhat.com>
In-Reply-To: <02e7e56e-f80d-1e9c-13ec-0ddbe3b5b360@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Nov 2021 16:02:21 +1000
Message-ID: <CAKmqyKPZiRxY5aFuKyQP4vh287F63-BcDhpT7E35w+BKd43FxA@mail.gmail.com>
Subject: Re: [qemu-web PATCH v2] Add Sponsors page
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Thomas Markey <admin@fosshost.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 12:12 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Cc'ing Alistair regarding the RISC-V foundation help:
> https://www.cnx-software.com/2021/05/03/the-risc-v-foundation-to-give-awa=
y-1000-risc-v-development-boards/

Thanks!

We have access to RISC-V boards for QEMU tests from the PLCT Lab
(https://github.com/plctlab)

Alistair

>
> On 11/18/21 13:29, Philippe Mathieu-Daud=C3=A9 wrote:
> > Add a page listing QEMU sponsors.
> >
> > For now, only mention Fosshost which requested to be listed:
> > https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
> >
> > Cc: Thomas Markey <admin@fosshost.org>
> > Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> > Since v1:
> > - move to footer (Daniel)
> > - only list sponsor who asked to be listed (Stefan)
> > ---
>
> > diff --git a/sponsors.md b/sponsors.md
> > new file mode 100644
> > index 0000000..1c097c8
> > --- /dev/null
> > +++ b/sponsors.md
> > @@ -0,0 +1,9 @@
> > +---
> > +title: QEMU sponsors
> > +permalink: /sponsors/
> > +---
> > +
> > +QEMU has sponsors!
> > +
> > +For continuous integration and testing, hardware is provided by:
> > +- [Fosshost](https://fosshost.org/)
> >
>
>

