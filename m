Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3B02E2593
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 09:57:56 +0100 (CET)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksMRX-0004kG-MX
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 03:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alcho.tw@gmail.com>)
 id 1ksMPu-0004J9-0L
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 03:56:14 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:36371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alcho.tw@gmail.com>)
 id 1ksMPs-0006iT-6j
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 03:56:13 -0500
Received: by mail-il1-x12f.google.com with SMTP id u12so1472385ilv.3
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 00:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kYmikKlpBHVRmAjVbtP8nwH+CYB6QR5icqPwppfTK5Y=;
 b=Po6NjOaapxsgsDRl+Sdym2CZjlh5l+7DTOKXonIjF5OMldzE6q3PiZeRuZ1uFytMZv
 CdE653O8eu/glYRfN6ttfwgB+WOEXBA83IRFaK6es2ZH6gb2UB4A89YbquSIj0kc7BNm
 plCUS98ZggJWmDBUlrxAzjmZeWey81WvVOrt3kOXUroXZ5baOToZ1drJfFFGJo9k59RC
 O0D5W69hqDP7e4p9DeCXzVmYuG+v36ulxtgOvBrovNooLDav26PGCoFs2pshp7M3ZIku
 dfB1DHgWI7OZxDIgaGnMuE77/gCCmORxWcyKra8wWuzEAaMJXVLacxhlaNXrRkD2r1EN
 K6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kYmikKlpBHVRmAjVbtP8nwH+CYB6QR5icqPwppfTK5Y=;
 b=MXAucjQzRMAazkp/c9KAH5g3osY6NIvZd4ll6YMurdYBZQo//Dos/TbWaDpSH8eZdZ
 hrEj9SSuVTimTwVFLlDKudwBFog4nJyCDz7gA/SWI05IBdB0Ua0lKKYZi/VcmcBN25dP
 4Py/waBVDp8cf/W3+tATAKpAMCgt7DSXHiOfWmv63soZs/yjevGF8bHQcXDjnnGMpbwR
 1p6L5XaOLFVmU9UqqtvQNCQeS5dKzv7Z8i0edvSoTK/6YjBh8xxxERNRX7KsosRrTM9y
 FHkepM83LDof+RYGoM3p3FvbnKwFwIh/ArR8x1Dn6wb0jGxxzX/MVUl87BxQicZDiFjU
 zsvw==
X-Gm-Message-State: AOAM53154R2Ej8gr+UytMYnueu5rHOyhrgJZQVL25mNLBl6bOXINtkXm
 4njyyqdAn7pDg9cE2mh6d9dXQzgfEY6QBeW2fZ0=
X-Google-Smtp-Source: ABdhPJyTPYrC3d7rO3qr39AP6OZu4031m+c7UglnzsnPePTtTll3V8g1F2XVBi1PYBl/dFE7gHd+uUulJNQmkja8Rds=
X-Received: by 2002:a92:d151:: with SMTP id t17mr29707787ilg.108.1608800169542; 
 Thu, 24 Dec 2020 00:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20201116113046.11362-1-acho@suse.com>
 <20201124094535.18082-1-acho@suse.com>
 <d2a307da-d8c4-7ebc-cba0-abcd65e1c580@redhat.com>
 <ec5b267368e6b1936b697b8190aa04325f5aa673.camel@suse.com>
 <926da98d-e885-31b1-3e05-a06d37a24947@redhat.com>
 <7e4feaba-2c60-1118-955f-5c21bb586685@redhat.com>
In-Reply-To: <7e4feaba-2c60-1118-955f-5c21bb586685@redhat.com>
From: Cho Yu-Chen <alcho.tw@gmail.com>
Date: Thu, 24 Dec 2020 16:55:58 +0800
Message-ID: <CAKA8beXaEHVcKoJLBedc2nYFT9wdUxJsPCQ46RiS_xUhmB4+Rg@mail.gmail.com>
Subject: Re: [PATCH v2] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alcho.tw@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: fam@euphon.net, lyan@suse.com, philmd@redhat.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, brogers@suse.com, cfontana@suse.de,
 alex.bennee@linaro.org, AL Yu-Chen Cho <acho@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

Sorry for late reply,

Thomas Huth <thuth@redhat.com> =E6=96=BC 2020=E5=B9=B412=E6=9C=8818=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=887:14=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 11/12/2020 14.09, Thomas Huth wrote:
> > On 10/12/2020 10.32, AL Yu-Chen Cho wrote:
> >> Hi Thomas,
> >>
> >> I try to reproduce this failed in my repo, but it seems works fine.
> >> Would you please give it a try again? I think you maybe just hit a bad
> >> point in time...
> >
> > I just re-tried, but it still fails for me:
> >
> >  https://gitlab.com/huth/qemu/-/jobs/905376471
> >
> > Did you also rebase your branch to the latest master version?
>
> I just gave it yet another try to really rule out that it was not a
> temporary problem, but the "acceptance" job still fails for me:
>
> https://gitlab.com/huth/qemu/-/jobs/920543768
>
> Would it make sense to drop the "acceptance-system-opensuse" job part of =
the
> patch for now to get at least the basic compile-coverage in?
>

Yes,  I tried to fix the "acceptance-system-opensuse" error but still
got weird error in:
VENV /builds/huth/qemu/build/tests/venv
57Error: Command '['/builds/huth/qemu/build/tests/venv/bin/python3',
'-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero
exit status 1.

So I will submit the v3 to drop it for now, thanks a lot.

Cheers,
            AL


>  Thomas
>
>

