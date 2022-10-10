Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7375FA279
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:11:22 +0200 (CEST)
Received: from localhost ([::1]:47408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwJA-0008WG-4n
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohw8J-0001JI-DQ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:00:03 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohw8H-0008EB-8K
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:00:02 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i3so1707164pfc.11
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jbf8aY2aUcuQreSF+YEmAg5LFbSRZ8zwkc/OmLCnCNc=;
 b=wGkMVDcUGAj11g2gdgSHzR10a7WKDHhm3CTh3UUYFNDEX+dMb4nyxf9PcxXaCMp6oV
 qY3zCoPReNr3aNwma69N/K7PhbSbeupxz2M84RnCT89mG6OfYy5272Dpis40qzvvlJQR
 qw9ofUD0U6+zFj4tD/gHIewjAzQNE9DNRUReuwCq34eCAApWX6tIESIBsZ2Uzv6xb/cv
 Xzf1BLOaCxT2lbd/Lkv1ZW15xj5nY07A9oLnS1z9JoS9PbLOD70Dn/SKkxfevY9adyy5
 T7FGW41ACMHWTV32pAzE14jwi8w5dI/EmXDM5bh9J7IBcloup4fp9R4eAdD44fHakVsU
 0krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jbf8aY2aUcuQreSF+YEmAg5LFbSRZ8zwkc/OmLCnCNc=;
 b=d5aaqBjA8vWdsQypX//olHIUv3LmVzpR6MWAW63zpr/NB0LotzYMtdd8Nu8eme0SW8
 sgFFaXUKoXpXR28Dand7XovOCyrj5S7Gev4Drolz57Et92LhwxdPZ4iyMdXyuZGA1xkZ
 2UxW8xOJYFTIEI5/N5UkbvuY54CsbqhBEXI/uQCzsGJYNliTDWkIpRpvETHCL37xNuQK
 8S1NC4k3BU/evbbCFItouVabmR+iZL6zfusIlqRACeAKhIEhqzmoz03qUQdo6YFL3dCO
 McxdvawzJsjEIxCcn9nntbIJgUxWWY9TWfmx5/SijdKzfFoZ1wrffBudH4Z9jA/36La9
 HtKQ==
X-Gm-Message-State: ACrzQf0/R7o3SXq9VzOnqJAGNlFQGrRMlryt1yjcITBGIwvDhN1Cu2Ei
 HfPY9qb+jkqdUJ8uJC0o7zN6fooH6YY50zxaR2l+Zg==
X-Google-Smtp-Source: AMsMyM6D9A++oHzTY7ndFrHyRYkBUrgG3nVD7JSiQ+rzx3gKTIdziUcYSXrsifGPdrCDRcFwXZxvDbpwsqp2U/RgldI=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr17277581pgi.192.1665421199519; Mon, 10
 Oct 2022 09:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <MW3PR18MB3532CFE7760D160B6F27F1E594209@MW3PR18MB3532.namprd18.prod.outlook.com>
 <87r0zfskm9.fsf@linaro.org>
In-Reply-To: <87r0zfskm9.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 17:59:47 +0100
Message-ID: <CAFEAcA_BAa8v30mjND5qm0Am7v-Hm+-oz0ofjciD_mKxCWq88w@mail.gmail.com>
Subject: Re: Building Qemu Error
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Yedelli Navya <yedelli.navya@axiado.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 10 Oct 2022 at 17:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Yedelli Navya <yedelli.navya@axiado.com> writes:
>
> > Hi,
> >
> > I am working on zynq qemu. Downloaded the qemu source from " https://gi=
thub.com/Xilinx/qemu.git".
> > Followed the compilation steps from
> > "https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/822312999/Buildi=
ng+and+Running+QEMU+from+Source+Code"
> > while executing the Make command following error is appeared.
> >
> > *
> >
> > Please provide working sources or any other solutions is highly
> > appriciated.
>
> You need to contact the downstream repository owners

Agreed, you should ask Xilinx about their fork. That said, this
looks like it's because you're building with a newer compiler
than that version of QEMU was expecting, so there are new (but
fairly harmless) warnings generated. Pass configure
  --disable-werror
and it should make the warnings non-fatal.

-- PMM

