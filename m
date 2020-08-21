Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F6124D75E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 16:32:42 +0200 (CEST)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k985w-0004LO-ST
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 10:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k984X-0003ex-I1; Fri, 21 Aug 2020 10:31:13 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:43984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k984T-0007hI-78; Fri, 21 Aug 2020 10:31:13 -0400
Received: by mail-yb1-xb42.google.com with SMTP id m200so1130202ybf.10;
 Fri, 21 Aug 2020 07:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fwmcGgpy7zYpUj6vH7790xWC0W3FelXOa9GYLrVPXJo=;
 b=O/HvhXFneFv7p/X10S127Ey9FP0lux4WeHTDJ8q9zs5zEnIKoERwCOYexdPksd9TsK
 sJzP4JVkhrgojo3zQLFQx7aLzgOBR/nOBLALcXgEtsQe94YldqF2Hrc7e2uQYpwJz3HN
 S+/ieVxW1nkLqA2NY1Ix1vMX8G2ptuI3+swaLG5eCnPIsbmCUy28zvrHj/Rj4a3dle6P
 UTvdDprv5EJ+zy37+Hs0pIO/kqvdesJtUQn7sGBmgjoy+Om9oOGAsW87A5wjIBhfn1Bb
 I3F9k27NaUqt+TzTL6WKpyyYSTRS30MnDuNkUVroCuGS95GkEDu1kw3rR8SaNOseFhM7
 P9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fwmcGgpy7zYpUj6vH7790xWC0W3FelXOa9GYLrVPXJo=;
 b=fCrfq62kxoNca3NQMW5ZWBbKBpvMVVbsQWQ4hDOskfFAEfcJIHGY2mvmqEqokbwej0
 EcyxfHBtR3xcul5Gnc9t2MqunBi3nNahQCH4SIjDxsWhPHudDpUfJJAYXx6p83JGOqm4
 8L1cu8fqPYUKRtvoPK8Xj4g6n54O2kCr0uq4wI6Sgj+GryOXLBdUjfAByRuBDsddwoEw
 tyPX1tcVfw+V/QM7wkS/yqBXVj9Kap/cX/KsyT6tBm0275f8jJrvZxgjHKtlEXEAtNRB
 o/qk5kA/zbGqjTvuUkdvN064cNzlQiDw2J9wiieQGC9fyhguCIurbsEpS9W/ie2VZA6R
 uoeA==
X-Gm-Message-State: AOAM5320UoN9xBxvGxLkpGQEUKTBtDA5k1Z+aLDMhcc26F6UPPj70VYD
 eeVGwmOsMrDtOYxxQ0gKMugyWqHVSLJ5Y/ihBKs=
X-Google-Smtp-Source: ABdhPJyBzOBx9MKuVQS+n7a/kayDmBT5pdBv3hoiYDKnTYuoMSbbobDMTkps+qYW9U1p/q3E8cxjD72abce+uyQYbdI=
X-Received: by 2002:a25:8290:: with SMTP id r16mr4111052ybk.122.1598020267782; 
 Fri, 21 Aug 2020 07:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <1597658633-12802-1-git-send-email-bin.meng@windriver.com>
 <d57faf7d-3cfa-55ac-649b-59ca06dd11a8@amsat.org>
 <CAEUhbmW02-fc=+ccWSn5bXGN+d7cCZNg1m2Z7wx3smN_YubWiw@mail.gmail.com>
 <81ae05ed-a91f-9303-91fe-d6d5d29b3174@amsat.org>
In-Reply-To: <81ae05ed-a91f-9303-91fe-d6d5d29b3174@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 21 Aug 2020 22:30:56 +0800
Message-ID: <CAEUhbmXu9i2h4ePnNfGOpLBg3=PU8J8-MwKFoDEAM-C2OFsOAQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hw/sd: Add Cadence SDHCI emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Fri, Aug 21, 2020 at 10:21 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Hi Bin,
>
> On 8/21/20 2:54 AM, Bin Meng wrote:
> > Hi Philippe,
> >
> > On Fri, Aug 21, 2020 at 2:04 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>
> >> Hi Sai Pavan, you said you were interested to test the first 2
> >> patches. FYI I plan to queue them and send the pull request tomorrow
> >> or Saturday the latest.
> >
> > Have you got a chance to review the v2 of 3rd patch?
> >
> > "hw/sd: Add Cadence SDHCI emulation"
>
> I'll have a look at it, but it makes sense to merge it via the
> tree using it (so the RISCV tree).

Thank you. Sure I will include the Cadence SDHCI patch in the
PolarFire SoC support series in the next version.

>
> Meanwhile I'm queueing patches 1 and 2 to my sd-next tree,
> adding the Tested-by from Sai Pavan from:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg732027.html
>

I just noticed that the v2 patch has the wrong author email address,
so I plan to send v3 of patch 1 and 2 to correct it, with Sai Pavan's
Tested-by tag. Sorry!

Regards,
Bin

