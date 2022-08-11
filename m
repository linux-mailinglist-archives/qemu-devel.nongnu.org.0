Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E3858FBBA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 13:58:19 +0200 (CEST)
Received: from localhost ([::1]:34786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM6pO-0003eU-AP
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 07:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oM6mF-0008Jb-Ph
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 07:55:04 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:46870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oM6mE-0005Ft-54
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 07:55:03 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31f445bd486so169572597b3.13
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=gZ/spJQV6kqeSHCWbWhGtuL0uupDpyaPh3AVYavUODM=;
 b=TFhdu4lHu9j5YxsClQJIxagjATFOpAZZdk60ND9MzdVH3yOe7LGrduGNi1Ka3kRLx7
 9MOTdpHI/SGIiYeRmqVL/y3sURcBKAY2MLK5rEXd3vywGYZUqWNggJlKZ+uVaCXnDK2S
 0X4IfCrQyRzkuyTs7O2vBYHZGL3AnBl3oOFmv2x6PXU03PEotwoDW+LrVDNuj2AYFdJt
 cCDTZ8HeIuujU3da48VMl4GJRLzgkcR68RClTSAl5dpbB1774hZPl8T6seD+qHA6yoGB
 lHBpfDJkzZmYFgCEnoQpdSEFNWmraAA2w8qz38W18MaWqReGlJL+ArkYZ0UEgnIldulq
 RcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=gZ/spJQV6kqeSHCWbWhGtuL0uupDpyaPh3AVYavUODM=;
 b=a0t5ZRwGu0CqGQMSWaQHj9RRXYIWxVUj8Hz37RC3vsZ4IS7R09JWSF20lxBFRQjH4f
 LlA+UgPCRTLNw/Egis8V+QEGRoWBMr7dKPsDUfEFn5i5YtVviUWa+PSSf/bbzQ4TXjrJ
 PjoY45NaDgHni5lHlmg+HHUQIncvMe+gIaT7irvyCd6NVfshRoP4ehqZKnu7y8R68rtB
 K+lwPIzvl9rhGyJ/U1COePd/5Si2PNgZn4vK5yGNZ9hpDyBb3ikcz4dDJIlsm9JPvE0B
 AMwAkVFyroKuhM6dYFL3Hgx4VL489Is1oLcbeJVKxzNnxUZOPShFtUtM/j8kzAGuGgIc
 B9xQ==
X-Gm-Message-State: ACgBeo2vMUA3VHhph13K1cYH85jpqFDrIWa64Yv3ZblOzvsVpfl/B4ek
 6TYEeuQzTBfcayxH7jYDtSzqrrYkzWNqmtYH/QQ75Q==
X-Google-Smtp-Source: AA6agR6cS9FoHBHwvyy3zqqQ55JVbDX+A0YU7KED0BDEdVwPDDCsTUHALiZ/8KZv09poxhmSv/2NIOWq6lU+H43g7tc=
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr30940972ywf.455.1660218901084; Thu, 11
 Aug 2022 04:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
 <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
 <8b32824b-4dc1-3d1a-1916-918a3fffab26@linaro.org>
 <67a42d65-8289-b26c-26f6-275ea0bfac98@vivier.eu>
In-Reply-To: <67a42d65-8289-b26c-26f6-275ea0bfac98@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2022 12:54:49 +0100
Message-ID: <CAFEAcA8AXodRV=eG2Ra4Sf9rsap499zDJEu6hC=c+V9gE2KjfA@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
To: Laurent Vivier <laurent@vivier.eu>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Vitaly Buka <vitalybuka@google.com>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 11 Aug 2022 at 09:29, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 10/08/2022 =C3=A0 22:47, Richard Henderson a =C3=A9crit :
> > On 8/10/22 13:32, Vitaly Buka wrote:
> >> Sorry, I only noticed today that it's not submitted.
> >> Version is not critical for us, as we build from masters anyway.
> >> Richard, do you know a reason to consider this critical?
> >>
> >> On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.org
> >> <mailto:peter.maydell@linaro.org>> wrote:
> >>
> >>     On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com
> >>     <mailto:vitalybuka@google.com>> wrote:
> >>      >
> >>      > How can we land this one?
> >>
> >>     Pinging it a week ago rather than now would have been a good start=
 :-(
> >>     I think it got missed because you didn't cc the linux-user maintai=
ner.
> >>
> >>     Is this a critical fix for 7.1 or can we let it slip to 7.2 ?
> >
> > It's unfortunate that it got missed.  It's not critical, but it would b=
e nice, because support for
> > MADV_DONTNEED is new in 7.1 (previously, we ignored all madvise).
> >
> > I'll note there are missing braces for coding style on an IF.
> >
> > Laurent, do you have an objection to merging this for rc3?
> >
>
> No objection.
>
> Do you want it goes via the arm branch or via the linux-user branch?
>
> If it goes via linux-user I can run the LTP testsuite but it takes 1 day.

I think we should definitely run the LTP testsuite on it, so
taking it via linux-user probably makes more sense.

thanks
-- PMM

