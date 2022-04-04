Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A0C4F19F5
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 21:45:59 +0200 (CEST)
Received: from localhost ([::1]:46024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbSeE-0006YJ-He
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 15:45:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbScm-0005cM-9q
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 15:44:28 -0400
Received: from [2607:f8b0:4864:20::1133] (port=47039
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbSck-0003x3-L3
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 15:44:27 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2eb888cf7e7so24216807b3.13
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 12:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lFSOtMCAUU8w8jKOFXKW1vWEbXY5JOfu/4kluzhoqiA=;
 b=uX8GBFhgDA8dhsybVUpbu+FWDMc8Wgi95apYDicrKi2kOGeWlH7vXUqYrV4DMaaTA9
 jtz3cqy7tYPdNA58S22GhWEhFcUcIUTA3168HnlUVgaeaumHq3dFMY0+MHIoDqvf9gn3
 uVTNUcm9V2dsdKDGWrqd08UYemHcVsQDfq1PO1TUK2EEp8lgPHC8YTLdnvTGEZ0bd8H0
 +at6oTDMZI5EW/DyDLm+xHKKlCH3omFwmeyl/TLQV2JoSbkW4HLNJ+xAsB+vsOgV/G+V
 Psi7WSUf2OgQUx+aNKX9MJY6yW4YpAuDwBG4qRiF/eB/elN3vx+u2G/EEXllS2G2CQRi
 fr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lFSOtMCAUU8w8jKOFXKW1vWEbXY5JOfu/4kluzhoqiA=;
 b=ihYknIJS6o/36LrX3a5mAXnsv5n8ItYY077vv4Qq0oRAjlnjutd0fm0BIw+NQpJfXM
 spT8k5ah/WCX3idF+TIW1tAmbhX+UVEnEvewDsNQmoM8V6HdXg7+LYU08HYPWT5uGFed
 TFyUzzNOmjk7//9hCAxwNbXAr9p4v2nc9HBWSZZnenPIWg0WyMSUqxNqg67B2Vy6tFoL
 ZVSQrK6sa5GzYKYlizmzZbnnxlWXWOuxJvbhmisUrdU0SivLA8M59WEFHY05Bx8vJGFI
 3IEWpIDJZ6xYanFkPO4gY5MfMS0yJ2enOTAipM5b4mpKMuTKcJCQTC1Gq+xkpbLUcFED
 hmPA==
X-Gm-Message-State: AOAM530Eqb0GvAHyS/vD4yzonYERVlCLVjEL8h8gXLn12YO5j/Oo4lj+
 p+wX1wNRdNooVScp4qCHvBsjx7Arop4eJ2KO/fpnJQ==
X-Google-Smtp-Source: ABdhPJzjvVIVRGbisL5veJHt4kb4waEbtJPeEpPWVWyyKkCO5b8PoHs579PttUy6/TGp6QEPPv4U+ioZdygQrdXS1/c=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr1528241ywf.469.1649101465645; Mon, 04
 Apr 2022 12:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220404143813.673262-1-clg@kaod.org>
In-Reply-To: <20220404143813.673262-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2022 20:44:14 +0100
Message-ID: <CAFEAcA9CDWf4pt902hKZkemm=RfcNT8YhKwojyPVqhptDUVbiw@mail.gmail.com>
Subject: Re: [PULL 0/3] ppc queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Apr 2022 at 15:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit bc6ec396d471d9e4aae7e2ff8b72e11da9a976=
65:
>
>   Merge tag 'pull-request-2022-04-01' of https://gitlab.com/thuth/qemu in=
to staging (2022-04-02 09:36:07 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-ppc-20220404
>
> for you to fetch changes up to 0798da8df9fd917515c957ae918d6d979cf5f3fb:
>
>   linux-user/ppc: Narrow type of ccr in save_user_regs (2022-04-04 08:49:=
06 +0200)
>
> ----------------------------------------------------------------
> ppc-7.0 queue:
>
> * Coverity fixes
> * Fix for a memory leak issue
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

