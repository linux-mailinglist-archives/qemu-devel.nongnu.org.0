Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E1D48ACDE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 12:44:00 +0100 (CET)
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7FZH-0000NW-Lf
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 06:43:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FVz-0004a6-Qp
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:40:37 -0500
Received: from [2a00:1450:4864:20::331] (port=43566
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FVy-0007ea-9Q
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:40:35 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so1628485wme.2
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 03:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kUoxzNDlInR/xaQkKpR351no2VttIycXOBwe7zPoGy0=;
 b=npVZLgsGfQAIxjSyBvTGpmq5FDUoOT2a+vFPJ6o/GKhHKw8UfKewmtl6l1Ml6y2oZj
 K8R4S1H6B7tBDmUeJjXpHMCrj+a5OCAV3z5qBAhglo5zCFvSG1ERcsf74sTosjPXXVWx
 0P6/2yMiKNVWDdoBnjZA9pVFIa0v+83sgmVt5b87sdKsqG5bWBo6CJq2dpMyuZ8ITgoG
 wzy+s3LMjG1vo5sE06Jdcebh6Kn8RL2E6rcaJMrFzS7CyAeYt5DzCFbLFxntERN+yhbA
 +NcGvT/FeCipym50TSFzirLG+GD1qh6hkxI/Lr6fG9D1qhqxzXJF8NGi/dyfOr94h/+J
 6v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kUoxzNDlInR/xaQkKpR351no2VttIycXOBwe7zPoGy0=;
 b=zvwyxC1ijKsdgs68+rCA1jSYw+N7M29woejRROktFiMTc3a37CBfVzh9/vVEsRIdAK
 3KUMEXFG39p07kih2rJ+1uzoYsL40jaeipJ0uvaRAQWfJKU7p5dpWeaXGJp67fyW7jb+
 ksgA0xk1nelvOwqv+sUoHu2nX8cnu1+r6POx6/9vlMDFxxia8YW9IYpbgORCc49U31MJ
 em4jHOuhXzQ+stzSzl1RhscFsXB+9JVwJlC1Wm9cSbyPCAj68AlD9lTvveTggjR8J7df
 PDnP8Yyqa/zSqsxDgvn66EDvJ8axr3qvlrEr5LJcnbp+x0HQtAp1xvvjy6bsmMBe6sDQ
 YRjw==
X-Gm-Message-State: AOAM5312YB/fBl6oAeqsD+OqAI18Lh3p8wrtZzzwUh13i8GAXW9VN7fE
 82E6FsFi13NX4eDh4KwOf7lEZFKs5e0hXqhBQhWucGA98SU=
X-Google-Smtp-Source: ABdhPJxOH8jIra1IpX+ptBHZO0/MUBqVWvEga/S5M787gVGnvVPrlHg2JtiMZ6gJtbrhVULNNMFvvBdma+DRslLQ7WM=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr2134161wms.32.1641901225249; 
 Tue, 11 Jan 2022 03:40:25 -0800 (PST)
MIME-Version: 1.0
References: <20220108215815.551241-1-f4bug@amsat.org>
 <CAFEAcA_K4eRewn7cpCrcM6FbvLMz8O1w1BqF0XN=XDQVTZM39A@mail.gmail.com>
 <e945824e-ee1a-821a-6f00-dd03f68e917a@amsat.org>
In-Reply-To: <e945824e-ee1a-821a-6f00-dd03f68e917a@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 11:40:14 +0000
Message-ID: <CAFEAcA8W-td82PDSGZrUcpOY-L_FY6UQ_nFqQvqLMBkDdQRDSA@mail.gmail.com>
Subject: Re: [PULL 0/2] SD/MMC patches for 2022-01-08
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Jan 2022 at 19:20, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 1/10/22 17:02, Peter Maydell wrote:
> > On Sat, 8 Jan 2022 at 21:59, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> >>
> >> Hi Richard,
> >>
> >> This is the SD/MMC PR that ought to be sent previously.
> >>
> >> The following changes since commit b5a3d8bc9146ba22a25116cb748c97341bf=
99737:
> >>
> >>   Merge tag 'pull-misc-20220103' of https://gitlab.com/rth7680/qemu in=
to staging (2022-01-03 09:34:41 -0800)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/philmd/qemu.git tags/sdmmc-20220108
> >>
> >> for you to fetch changes up to b66f73a0cb312c81470433dfd5275d2824bb89d=
e:
> >>
> >>   hw/sd: Add SDHC support for SD card SPI-mode (2022-01-04 08:50:28 +0=
100)
> >>
> >> ----------------------------------------------------------------
> >> SD/MMC patches queue
> >>
> >> - Add SDHC support for SD card SPI-mode (Frank Chang)
> >>
> >> ----------------------------------------------------------------
> >
> > Hi; gpg says (my copy of) your key has expired:
> >
> > gpg: Signature made Sat 08 Jan 2022 21:56:02 GMT
> > gpg:                using RSA key FAABE75E12917221DCFD6BB2E3E32C2CDEADC=
0DE
> > gpg: Good signature from "Philippe Mathieu-Daud=C3=A9 (F4BUG)
> > <f4bug@amsat.org>" [expired]
> > gpg: Note: This key has expired!
> > Primary key fingerprint: FAAB E75E 1291 7221 DCFD  6BB2 E3E3 2C2C DEAD =
C0DE
> >
> > Can you point me at a keyserver I can get an updated version, please?
>
> Sorry. It is on pgp.mit.edu and keyserver.ubuntu.com; which keyserver
> are you using? (so I can upload it there too).

I use those two servers; for some reason --refresh-keys wasn't pulling
the key, but --recv-keys did. Anyway, I've got it now, and am testing
the pullreq.

thanks
-- PMM

