Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5BB5E6515
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:25:07 +0200 (CEST)
Received: from localhost ([::1]:49888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obN8U-0007hG-Dr
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMyU-0005H9-2x
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:14:46 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMyS-0002k7-Ap
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:14:45 -0400
Received: by mail-ed1-x533.google.com with SMTP id q21so13793831edc.9
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Wpe8Rm1LCYp1PIppM3qIMN9gb8IlS19noOKgmgn1Wag=;
 b=ksVGS+kmMrH95aX0sAkzr9Cf8IWU0oHWOXaHRAVk8E4m6+gvSSPoUpeA/zuD2ThC04
 nHaM2a0cmqmYzTKo/GIPf365AiodBfXzNImrALsmOCbfkbKRYwzo656ql7U0kO2YOeGA
 V+6ls1RbpbSbAQtYBWYU/LuMhD2g6uw4fMcDvmlGpzDyRbecwPsXp8K2oXZIIKhJK9lr
 eUNAQPfb8YPsDB4pOyCAVUhJmDXGICBj05PFf7b0UROhDPW4IDq6i5RZSxdtBQeGJbqv
 KWX6KJXhq4OJtelCe1znSdqu9/lDmIWNugyawRBxTm1C4KukQ+6gN5j+IbkEMd/Betcz
 tpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Wpe8Rm1LCYp1PIppM3qIMN9gb8IlS19noOKgmgn1Wag=;
 b=gxOAMXlLJZf12OYvou6R7tkt1VIikdnPy9CWalHYx4fF9Ji+8KSRkwdN4EK1F768be
 EGM2HIi/u6T+5EQyTw7ojBH/j2l6aERHhzNulj+I747YWUF+YKTvByzyzWT9WkXPGJdb
 r523D29gnkB5bo1cb1dwzl1fQhbx/UeQOW4RtpsUilm0or7ZHDpZhl6GW96nSSh72Hlm
 5tCmgWd51nNKQmRgzfo3hDrAyRjo2pc1TKhOmW6Xq6vlT+3DDTUVqaLYNib39Ml4ZKeR
 c7TlP0/RhdM2DouLyKZRdlF5/bqtBaiEqlijviJo8/F+RrM7h1T0YJsl45aLM0GlPVfd
 S55A==
X-Gm-Message-State: ACrzQf1g7dtC8e8zlxo8QWpw26hfBPn9cDn67HzHML8iq7JJ+srmE7Ak
 khAeeWAiYsz1i+R2iEa7EJNOjE4ZARdaY3fz16Rnyw==
X-Google-Smtp-Source: AMsMyM4vp5Y1pkYqdlUOjqBRVTuvwVnqXoIO89vK/63pSBHP2fohIq0niupN8NUYqt9OLEHqR2nzRTioBbsNMA1zJOA=
X-Received: by 2002:a05:6402:11d4:b0:452:a97c:cd36 with SMTP id
 j20-20020a05640211d400b00452a97ccd36mr3583846edw.53.1663856082671; Thu, 22
 Sep 2022 07:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
 <20220825150703.4074125-6-peter.maydell@linaro.org>
 <1b56c62b-4a13-98f2-eb65-133f080c71b8@amsat.org>
In-Reply-To: <1b56c62b-4a13-98f2-eb65-133f080c71b8@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 15:14:31 +0100
Message-ID: <CAFEAcA9Xa4jB3o8Uwm56K0SGAhkxHqk55oT9c8UHuE1s_eEDxw@mail.gmail.com>
Subject: Re: [PATCH 5/7] configure: Remove use of backtick `...` syntax
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Tue, 30 Aug 2022 at 13:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 25/8/22 17:07, Peter Maydell wrote:
> > There's only one place in configure where we use `...` to execute a
> > command and capture the result.  Switch to $() to match the rest of
> > the script. This silences a shellcheck warning.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   configure | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/configure b/configure
> > index d5b6546ae81..5c1992d5bce 100755
> > --- a/configure
> > +++ b/configure
> > @@ -2317,7 +2317,7 @@ LINKS=3D"$LINKS python"
> >   LINKS=3D"$LINKS contrib/plugins/Makefile "
> >   for f in $LINKS ; do
> >       if [ -e "$source_path/$f" ]; then
> > -        mkdir -p `dirname ./$f`
> > +        mkdir -p "$(dirname ./"$f")"
>
> Nitpicking, easier to read as "$(dirname ./${f})"

That would be missing the quoting on the inner level, I think.

-- PMM

