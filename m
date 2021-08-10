Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413453E7C66
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:35:58 +0200 (CEST)
Received: from localhost ([::1]:55818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTnJ-0004yn-Ai
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDTlc-0003sw-8I
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:34:12 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDTla-0004Li-DR
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:34:11 -0400
Received: by mail-ej1-x62f.google.com with SMTP id oz16so20044800ejc.7
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ycA2yArueEhhNIbrlMe9Wv9SdpGPkOk+1ckIjN5dHws=;
 b=SqDDlgU2I1nKSCaSBwknEyFcYcprof/4B88R8iq3pU35Bpwf6GCiDUDxEzcsqTxTtB
 lgtchWGGKaM2pefkSs2aT4j4Rru2jMMuhJkVYwHi5Gup85UnJxT+umgf0joGhaTNUJ0+
 9u/zHuQIOP8OzWHAWh4G5+B0Alaicc2gFR3P+SKQtLgEKOhTBSefajw31Muy9zrZ2fbm
 nR58Y0/n4JsJm8U4snaoS4PdI43M8rD35qCk0yX77NYUiWC1HO/m/OzElZbn5NrKP21g
 VijvzLX58M6BzeKWMz2nwiWwaHN6ISqh3AGTY9dW0H2YuZrA9uBuIcTc+uR4uTcQ1yQL
 sBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ycA2yArueEhhNIbrlMe9Wv9SdpGPkOk+1ckIjN5dHws=;
 b=GOrNyfBAD8ID8m8+w2VH1q6lfVDzcPluEhAVj5TaDP45ZKLBE+/mGIXKBtxXlJqqpb
 FQ7ZtnkGI+kdRJN2cCaMidzCc3wj0xS4aqKZLDedQJD+PKbabdbaFUVh7xGi31MRkmSw
 ESG1DmNom6cz9D+/NdoVNXNJv7ugQhuboHwpWMv6RFXeuOGC6Wjo8mVAXnSTtOCVi7h6
 F0E2ofDjCvg9g+Jcg9a3NXehED3UKzWd4/DgFSxJNSBnUdSl8z0EkwJmJAI1/seVpDzn
 5UHprN7Q7CqXRr19nBBzAkTC+9tyMy6zvT6KTDp6b6W1gD8SpXBiM0EBa04Ehup9SsEW
 E/6Q==
X-Gm-Message-State: AOAM531rqhK3ewNhFNRuTGwtRuxhB3doJ5aqKLCCH/ykY7Tro42A+APV
 RbdApsbyrUO7Eqig0yhYa+yVO2KEOdX6S+ibEv4jsw==
X-Google-Smtp-Source: ABdhPJyshYl59F9b1fx3Nm5td0WXPMVYfqoFS9ayuPPx6NDv0M8uNTy5WfHRU/SYxOC2mwxEEkxtv+Q9I85t8S7QJYs=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr29026769ejz.250.1628609648575; 
 Tue, 10 Aug 2021 08:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210810124403.771769-1-clg@kaod.org>
 <CAFEAcA9aHX53JkEW3hbjWfeK=LL8QKxWopRAx4pcV6V=PKv3QQ@mail.gmail.com>
 <b840d4f3-efca-feaa-3834-375c8e51eb8a@amsat.org>
In-Reply-To: <b840d4f3-efca-feaa-3834-375c8e51eb8a@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Aug 2021 16:33:23 +0100
Message-ID: <CAFEAcA9Yj=HwZcpg1S0tw7Oydnis2+_KR+5WimH6C43iWapxKA@mail.gmail.com>
Subject: Re: [PULL ppc] powernv queue
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 at 16:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 8/10/21 5:17 PM, Peter Maydell wrote:
> > On Tue, 10 Aug 2021 at 13:46, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> >>
> >> The following changes since commit bccabb3a5d60182645c7749e89f21a9ff30=
7a9eb:
> >>
> >>   Update version for v6.1.0-rc2 release (2021-08-04 16:56:14 +0100)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/legoater/qemu/ tags/pull-powernv-20210810
> >>
> >> for you to fetch changes up to 91a6b62df830d51f2b6b2ea00b3c92231d0ba9d=
c:
> >>
> >>   ppc/pnv: update skiboot to commit 820d43c0a775. (2021-08-10 14:18:51=
 +0200)
> >>
> >> ----------------------------------------------------------------
> >> ppc/pnv: update skiboot image
> >>
> >> ----------------------------------------------------------------
> >> C=C3=A9dric Le Goater (1):
> >>       ppc/pnv: update skiboot to commit 820d43c0a775.
> >
> > That skiboot changelog lists a massive set of changes, which
> > is correspondingly a larger risk that something in there turns
> > out to be a must-fix-for-release regression.
>
> There might be a misunderstanding here, per
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg828857.html
> I understand this pull request is targetting David PPC tree,
> not the mainstream one. David first queued this patch for 6.2,
> and later confirmed by C=C3=A9dric:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg829160.html

Mmm. Also as Dan pointed out on irc firmware updates ought to
be honouring the usual softfreeze rules. So I'm going to err
on the safe side and won't be applying this.

thanks
-- PMM

