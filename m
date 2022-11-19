Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7E5630F3E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 16:20:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owPcj-0000Sy-7r; Sat, 19 Nov 2022 10:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1owPch-0000Sk-IJ
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 10:19:15 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1owPcg-0001uf-6G
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 10:19:15 -0500
Received: by mail-qt1-x831.google.com with SMTP id w9so4886649qtv.13
 for <qemu-devel@nongnu.org>; Sat, 19 Nov 2022 07:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GE9jSno3asdy/QenyrWiBM9NnadDKeNbNv8c/yXnWbA=;
 b=eLIn+M3EoEmxQ3YoP71xTDO07d+MVGfIXk5xQXLYcqSfaAJsYlNKbiRV0Hb7lc1J0T
 8aHlSAtHjGxJ8T9e5Sa+R4XgEfDdiAAk/AqCVNSXCwrzJYU9UXc16SvOUUQKNyrocgOI
 MmSLeWTc5l/sRHfgmhtmVzxQRb4jqr+t0m0WSNIYqxHeP755O7xDhxL9MsI+g11oY85x
 GZ1+Pthc/EptIwCtGHVdq3DT2V9NwUnM/vH/wFTydgHPu6qpQcjXNEyx67FZGIuttcAc
 J2yX4LVNdPTrTdt/0YCPMPRS8zsr/9xpX+Jv9UUv0T1y8t7JnYmSPjp1kcB2dMaNrdk/
 urFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GE9jSno3asdy/QenyrWiBM9NnadDKeNbNv8c/yXnWbA=;
 b=qcvn63/LAUAFZppbjVUsKiezwjrKCUhtA2CNV9/aPCXgh8xSzGmePJ5yiXIiAmsq/J
 2Tgj0oe4fY13U5J+RL/1nL39Yhk8WcVhmgpiDCM+2cSD8kM3A2fkf65gDLwUBbNdWNmp
 iz2TATMGKEufo0/jh/LdXjd/wTbnKHKbbrscEFnhpN3k5Lj2fohH2mRuC13h66r9D2Pk
 tJHep2jQqeo/dc4MGs0S6KiNrjRTmRBpnuZOv7YNXiH0r9lwDTGcWSNw5jQvewoYHFwU
 CyE2F10X6gEIiKZvM9Bymo6JGheOHr65mg5gbpRrgYLOyiPaWPLORPESk2E3U5pmP/Bd
 6r7A==
X-Gm-Message-State: ANoB5pn0L1zlKfOuWMiWbXyinMgiUAGvN9u1G2rDKn7LtHf4SlG0+lBd
 XAoPpcjnVKZlskxsVkymXAdlb+vBJPg+8UZVN8o=
X-Google-Smtp-Source: AA0mqf5d1JCaOg5/rsul9qo3W/eVbt3QwVykiPWcuweRT7h00qJwR9H99ZWW2mQkRAYTcxjac8CE7ikyv7UqMayc6Kc=
X-Received: by 2002:ac8:5299:0:b0:3a5:3623:17b2 with SMTP id
 s25-20020ac85299000000b003a5362317b2mr11079675qtn.543.1668871152920; Sat, 19
 Nov 2022 07:19:12 -0800 (PST)
MIME-Version: 1.0
References: <20221025141015.612291-1-bin.meng@windriver.com>
 <CAJ+F1CKueW5uhTe8CCdnthJmmaLO7vvHtANqZ4N6wUjGc9qpGQ@mail.gmail.com>
 <CAEUhbmWhWhhXJeCuWGLS6JCHg-LoRiWKFCq7KRjGNA1cENYA8Q@mail.gmail.com>
In-Reply-To: <CAEUhbmWhWhhXJeCuWGLS6JCHg-LoRiWKFCq7KRjGNA1cENYA8Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 19 Nov 2022 23:19:01 +0800
Message-ID: <CAEUhbmXpmf6onx3XQLTPZo8xRcvkn=SwD3hGRYb2dvr-L6_Emw@mail.gmail.com>
Subject: Re: [PATCH] chardev/char-win-stdio: Pass Ctrl+C to guest with a
 multiplexed monitor
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x831.google.com
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

On Fri, Nov 11, 2022 at 8:11 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Oct 26, 2022 at 3:39 PM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > On Tue, Oct 25, 2022 at 6:15 PM Bin Meng <bin.meng@windriver.com> wrote=
:
> > >
> > > At present when pressing Ctrl+C from a guest running on QEMU Windows
> > > with a multiplexed monitor, e.g.: -serial mon:stdio, QEMU executable
> > > just exits. This behavior is inconsistent with the Linux version.
> > >
> > > Such behavior is caused by unconditionally setting the input mode
> > > ENABLE_PROCESSED_INPUT for a console's input buffer. Fix this by
> > > testing whether the chardev is allowed to do so.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
>
> Ping?
>
> Who is going to pick up this patch for 7.2?
>

Ping?

