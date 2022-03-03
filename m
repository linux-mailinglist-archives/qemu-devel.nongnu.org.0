Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668C94CC1F8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:53:30 +0100 (CET)
Received: from localhost ([::1]:41644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnlg-00013B-Ld
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:53:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnKp-00068i-R9
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:25:43 -0500
Received: from [2607:f8b0:4864:20::b33] (port=42766
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnKo-0007QG-En
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:25:43 -0500
Received: by mail-yb1-xb33.google.com with SMTP id f5so10896254ybg.9
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F4Pd4zgL3ZphLGuElPrBXwzIYBsAkfmNo8Woam3gQsI=;
 b=BzHJkGI9Yx4bAETAvo+3btS0AobOcF8ElmT/xDM4gjf53NOpPziBjEgWHwmjqwwx/1
 M7YFq99xXi0V0MaVuqo3/HgT1SD487vEdGTOnZGFG7a/HP7QDBja8flQAmveN8H2XOWd
 ThpW6T7SGCR2rRRSbk0TWxiNnuZ1nht50463djXyuI9+15/UbGqfIewSzhm9S31lo6px
 /SDDneSZWp1UsvM4RC1DnPmcPipFu76xpA9ZNP9fRGeBX3lrOg9CXMx843Fb/UE4uD29
 dFTOJSA0zrue0kMbG+ZPPFD/vcfFf+AdgYIhQB4RP0oCzpPyDGdGM/FWLEBnXH2W55U9
 PJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F4Pd4zgL3ZphLGuElPrBXwzIYBsAkfmNo8Woam3gQsI=;
 b=N7ioi1/fwQbZhRDxe9MF5vnPXRw5S639kaLcrpr1jyoZSxoLkmA+r6xKEWa+njYYcH
 fyuYIR4PTElvLDuLZ6g+SnJAc/J3He37LKWYK3k4UqBykjpeRsEEyaWPNX0Ke78jzzQt
 c32V5OUbdktWFHYxWYuWyED6rZelBoGYNFg1iH8+pH4E2hNdZm8BCQ/ek9NlAqgZ0XxA
 Lh5ie3dJwYvH+HCP4VDWvSBQexKWgJ/cgMf65kVTjSNzEDVlmzWGL5GKGW0j/kqQ5iXT
 2Yibl2xkrW/zVIIMfqoFhEdfjSWpeiU8YJE2zoRj0mcRBPesf8MpMP7lpeDyDuVCV4ca
 5V4Q==
X-Gm-Message-State: AOAM530/UFAXGqotTiclqslQ0uQS0q16neSkLns1G/vrzDyaFs9ItHBp
 5mNwzeNnUYc0IDytfQcI50eW56RxJTCWb+52xzD8gw==
X-Google-Smtp-Source: ABdhPJyHvDV7xx+vTvidF32geNwn2ytd3X9VV4y2T1RqlBo3nnjqtjBBj5mFsn8Ocq/FlZ89UTD88Lwjt27eC/iuYIM=
X-Received: by 2002:a25:dad5:0:b0:628:7b94:c196 with SMTP id
 n204-20020a25dad5000000b006287b94c196mr12756119ybf.85.1646321141212; Thu, 03
 Mar 2022 07:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-4-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8-_khhe0999QB=wsUi=HEcPa6G3C7p_P63UibkF6FNUA@mail.gmail.com>
In-Reply-To: <CAFEAcA8-_khhe0999QB=wsUi=HEcPa6G3C7p_P63UibkF6FNUA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 15:25:30 +0000
Message-ID: <CAFEAcA98y92fVEyvQTUnOYDLtszS40eX9NAnULHugRMW+gPFdQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] macfb: increase number of registers saved in
 MacfbState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Cc: fam@euphon.net, pbonzini@redhat.com, Laurent@vivier.eu,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 at 15:25, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 2 Mar 2022 at 21:31, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
> >
> > The MacOS toolbox ROM accesses a number of addresses between 0x0 and 0x200 during
> > initialisation and resolution changes. Whilst the function of many of these
> > registers is unknown, it is worth the minimal cost of saving these extra values as
> > part of migration to help future-proof the migration stream for the q800 machine
> > as it starts to stabilise.
> >
> > Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

> You should either bump the vmstate_macfb version numbers here,
> or at least note in the commit message that although it's a
> migration break we know nobody's migrating this device because
> of the bug we just fixed in the previous commit.

...where by "previous" I mean patch 1.

-- PMM

