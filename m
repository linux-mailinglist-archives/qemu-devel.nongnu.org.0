Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22477213AF3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 15:26:47 +0200 (CEST)
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrLiI-00017O-7R
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 09:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrLfm-0006FQ-Lm
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 09:24:10 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:44197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrLfl-0001gA-67
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 09:24:10 -0400
Received: by mail-oi1-x22d.google.com with SMTP id k6so22601742oij.11
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 06:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mLQtZOxC5U4T7/DFPhLqovthHnrCnqa0NOzSRcmYbJo=;
 b=Ks/q/mYImfPYPk5qt54pQvg9VAekMtDe5aK2e7oWawFZi1OlzUEVrSZUIsA4gTJKZV
 JU1cFVuXqqEld47buVo0BkDoG3qif0r44DhcLAMxIC6+Kn2PNMUiUJC1qI3Y2ZD0OAPO
 G9jQzZETCFVINl1U31g9uZjUEZrHm8YLhz6qLX0yIfgyuP5yFaPj2U49goQA04wnWtk6
 AvuJYCfsNnj7LxmoVo9yiuVdktN22o/EMv4VFYSJpzErG+t9KTrDW5KX7eXqtgZi1kNu
 Lvkh76yMIuCI2ycx4Vrpc69AYTxm5XdPCf5jb2+Yd/B1DtyVpch5NwlkUgyM/TosIwoL
 SlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mLQtZOxC5U4T7/DFPhLqovthHnrCnqa0NOzSRcmYbJo=;
 b=eDECV5ZJ9i4uohxYorosODmnawuN5JbK2SExYZtknBI2/cc7ZaiVgFGkp0z2SM7E+k
 sv8+YTSiEt3O0Cfvdv8zKYdCkf8mxK4HZL0vin6M4Hi5g8mbb5NI6VajQG3VGq9778UK
 ftctMcBFgVspJ2qzLx3ktJxvHGvGYC+cVTiAj1eu3tYRJ6RB1lOzc8lW9PtYn4Lg8Xdj
 cjE5l5teCKqrm4vPZp4gtI7d1tSwTOHeRgazVK6qAZEZWg9cSxJCP7+f8qB14LiS+4or
 2xN2CLKkmx2GpUABsWwcuf03P1KRU/aZXy09ohGo7V5arw1Ds2wwPQZfD5B1MM1IH7nf
 L/4w==
X-Gm-Message-State: AOAM533o52VoRvME4yoADmpeDBIAJY/S5cBaG3ZKeFpPEzZ3dD5d/DjN
 529OvLE5l3bpq9+LklQ2boP8rztDCTo82jwNVyGr/g==
X-Google-Smtp-Source: ABdhPJzro+F7le3XtSD8PB4/TA0tzJsUo7SoLle4tgdf8PhbvE+KPENYhqHkQHoEoSE5cqN/daqc7uE6dCN3eEhkGa0=
X-Received: by 2002:aca:2819:: with SMTP id 25mr21111119oix.48.1593782647997; 
 Fri, 03 Jul 2020 06:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200630133912.9428-1-f4bug@amsat.org>
 <20200630133912.9428-11-f4bug@amsat.org>
In-Reply-To: <20200630133912.9428-11-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 14:23:56 +0100
Message-ID: <CAFEAcA9ksg9fgF5u4vunTAtmvFtmkb_EAhNJQDgh+XWa2h2hTg@mail.gmail.com>
Subject: Re: [PATCH v7 10/17] hw/sd/sdcard: Check address is in range
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x22d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Jun 2020 at 14:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> As a defense, assert if the requested address is out of the card area.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

