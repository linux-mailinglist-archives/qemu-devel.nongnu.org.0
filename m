Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E65743D186
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:17:20 +0200 (CEST)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfoQJ-0004Jl-6A
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mfnl4-0007Fn-Fe
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:34:42 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:42866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mfnl1-0007HM-AI
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:34:42 -0400
Received: by mail-ua1-x92d.google.com with SMTP id v20so6716489uaj.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7dNx7gETPiEfZGGmSdFoP/+TR3hcobx6Q9KQOEM2Msw=;
 b=VqaCPAnKo2HvnvuFn/Xq8FOWCa9yUwXxcUedwi+CU6i5t+Q/tmipd9BHA1oJa1tsXL
 4H4ZbUyncIEw+eNe+rV1o6q4dBcerYSIWo3JVESW9giwc7LKSuBkgN2N5ZgmEKtlCX2M
 qrDuMX9v7UFG/ZaeaB+Skqqx9CZOM+y2qD5JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7dNx7gETPiEfZGGmSdFoP/+TR3hcobx6Q9KQOEM2Msw=;
 b=dHDJG4hlbRMUA1zusLNSem/5I56yFbmgDVry/FILUv4X+Es/3x54B9+uy0GZip+rO/
 JGVjBlu1Y2NHbiqsPFImcr0I5j1mW2l2TGDPE5OWhpjw5RMQGOP7rCvjeAfAOccyZbEh
 gxWhP3QBwKf0pk3q+1V8LEbYjlVna8xQmSjzWtXWmKXLaMckR24XeFiTu4oP2/WGLZl6
 f7X4c1aSysgZx+qHyRYJVnAKPNg8ihS0BJ0rqu9U0zqyKLL9GvJUKNmXiPpr3znCitrT
 72PP3H4ZHZOqC7TRODK+cKCEgvSNZQLTFvEpr9H3UjAGRgTRvPFsN7cqeAa7LcZZJuTq
 wB5A==
X-Gm-Message-State: AOAM532ei021gECuQIMyeYLwN5s0G5ux3CqGsG2qQcEiY+RPV7MVzIsR
 gOaFoLFwlgbacY9klHAlHIVAsFR2OMxlVfBeaY3LuA==
X-Google-Smtp-Source: ABdhPJxP/K0zyLZZEVlf5nC3E+utfg6ByJTwAYzHNYrvdDax/SxrRJlqgTCafKfCq/DZBLr/dbAkgSA2AS5qv7LP97c=
X-Received: by 2002:a05:6102:34e4:: with SMTP id
 bi4mr26801442vsb.20.1635359677616; 
 Wed, 27 Oct 2021 11:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <20211013010120.96851-6-sjg@chromium.org>
 <CAHFG_=UDFn9MQfJz6oTAg15PiR2nt6QkoZS58+gsOMMVo31AXQ@mail.gmail.com>
 <87v91iwmoc.fsf@linaro.org> <20211027145653.GB8284@bill-the-cat>
In-Reply-To: <20211027145653.GB8284@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 27 Oct 2021 12:34:26 -0600
Message-ID: <CAPnjgZ1sKULC6wKuEWsdjzFsmDK3ECVUTiE7kjp18psgACREVQ@mail.gmail.com>
Subject: Re: [PATCH 05/16] arm: qemu: Add a devicetree file for qemu_arm64
To: Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=sjg@google.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Cc: Heiko Schocher <hs@denx.de>,
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Rick Chen <rick@andestech.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>, Sean Anderson <seanga2@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

On Wed, 27 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com> wrote:
>
> On Wed, Oct 27, 2021 at 03:44:08PM +0100, Alex Benn=C3=A9e wrote:
> >
> > Fran=C3=A7ois Ozog <francois.ozog@linaro.org> writes:
> >
> > > Hi Simon
> > >
> > > The only place I could agree with this file presence is in the docume=
ntation directory, not in dts. It creates a mental picture  for the reader
> > > an entirely bad mind scheme around Qemu and DT.
> > >
> > > And even in a documentation directory I would place a bug warning: do=
n=E2=80=99t use this with any kernel , Qemu generates a DT dynamically
> > > based on cpu, memory and devices specified at the command line.
> >
> > Certainly for the arm, aarch64 and riscv "virt" machines you should
> > always use the QEMU generated DTB. I'm not entirely clear what a
> > qemu_arm and qemu_arm64 def targets are meant to be in this context.
>
> Agreed.  We cannot include random device trees in U-Boot for devices
> that generate their own at run time or otherwise have the source of
> truth elsewhere.

Until we have a way of bringing in the u-boot.dtsi that people in QEMU
can agree on, I don't see an alternative. I will send a series for the
bloblist handoff next week and I think you will all see what I mean.

Perhaps all this will be easier a year or so, if we continue to make
progress on the devicetree validation/sharing stuff, but for now, this
seems like the only viable approach to me.

Regards,
Simon

