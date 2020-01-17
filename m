Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A202140946
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 12:51:55 +0100 (CET)
Received: from localhost ([::1]:55952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isQAM-0005nY-Ag
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 06:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37357)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isQ9H-0004xT-45
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:50:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isQ9F-0004CE-RT
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:50:46 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45655)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isQ9F-0004Bf-Kz
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:50:45 -0500
Received: by mail-ot1-x344.google.com with SMTP id 59so22274351otp.12
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 03:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iDytm4TfZbY5oMmfZHzGiEQQcHLYD9MXz+DIQoueERs=;
 b=wI0m4sxNvbm7kjpw41olUT6lrYS4NLnKwPgFkxnop5WRGY15XoQspOE7HWiTQGN+40
 Hrc1k9esqY+X+d6lxw9s4DWqlyFWzHGJiDssVEa1rCumYDnZN+yArnFydppCHlp9pHLu
 YUGkZBw5SLv1EkzGmdvYHk8h/6yiaw3J5xFi6WMxLROQOIRuVOHGn+fgNKRJE3Lswaa+
 p2EeD2h6WHV30PgGhhlJsLDicjOj17VUO7D55BR9TdAuekdcbSgvS4Toj3rxJCPjdogG
 TIl4vLn6oOtahbJBFFLmTr79YFdyWKnLmk6KZcbzEAqBALJ7AAj/djPgrWd9qXuUTF9i
 rUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iDytm4TfZbY5oMmfZHzGiEQQcHLYD9MXz+DIQoueERs=;
 b=nAWkGCAdu4xSSpnTdWdc1ysSZLMLc9h5fC1QBpngw4oHiQbAUEEuWscGqgiCTqIFos
 PghFjgHHTD5QVm/e9uDOkk5JA4tMpd9dIaAlXURyzAiBGVjUPILwvBjyag5XpN+d0PwG
 QA9Lv5cTZYIW788EJSQz0K8+RLGtQl6CmHSrdhBvzTYjd8JwGxXubQldwMPiQcrozWQm
 6LtfFTMKEap6Om1n+QmTbWQRasft1KpqMLAzqfK+L8XN9P/cv+3VoeNiHW/QT9y6/Q/Y
 5qBpu8vIsMmnK9RbOqSUTAcfLygntYfHDuqShRyXROcaGBadZZtYAd1a2j9AEIIEwKfW
 SZFA==
X-Gm-Message-State: APjAAAV1r6WSPwODKn6ByLb78iS2L/QIXULwq9VrY+ZI9CB6CXzak0bF
 TelDgjI1UrgTGBI2WB9aDSifjVJrlh8t/CeX2gc/IQ==
X-Google-Smtp-Source: APXvYqznTo3qqyC+aPlCw4uEb42nRqdw3eWjM2c251Vfyx+z2XZp5X708DW4NhrXR2rmaiYu9TXygRzXp36b/v2UO3k=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr5466797otq.97.1579261844377; 
 Fri, 17 Jan 2020 03:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20200110161626.31943-1-alex.bennee@linaro.org>
 <20200110161626.31943-2-alex.bennee@linaro.org>
 <CAFEAcA9nNH9pu+8E_YYkiNtzePjZdrEBjK_9zJv+XJaSvcnhmA@mail.gmail.com>
In-Reply-To: <CAFEAcA9nNH9pu+8E_YYkiNtzePjZdrEBjK_9zJv+XJaSvcnhmA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 11:50:33 +0000
Message-ID: <CAFEAcA_0hHjkhKtVsQEsN=Xow=W6vPvGJPJdzHh=O6RG1=_mAQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] target/arm: detect 64 bit overflow caused by high
 cval + voff
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: 1859021@bugs.launchpad.net, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Jan 2020 at 18:45, Peter Maydell <peter.maydell@linaro.org> wrote:
> There's something odd going on with this code. Adding a bit of context:
>
>         uint64_t offset = timeridx == GTIMER_VIRT ?
>                                       cpu->env.cp15.cntvoff_el2 : 0;
>         uint64_t count = gt_get_countervalue(&cpu->env);
>         /* Note that this must be unsigned 64 bit arithmetic: */
>         int istatus = count - offset >= gt->cval;
>         [...]
>         if (istatus) {
>             /* Next transition is when count rolls back over to zero */
>             nexttick = UINT64_MAX;
>         } else {
>             /* Next transition is when we hit cval */
>             nexttick = gt->cval + offset;
>         }
>
> I think this patch is correct, in that the 'nexttick' values
> are all absolute and this cval/offset combination implies
> that the next timer interrupt is going to be in a future
> so distant we can't even fit the duration in a uint64_t.
>
> But the other half of the 'if' also looks wrong: that's
> for the case of "timer has fired, how long until the
> wraparound causes the interrupt line to go low again?".
> UINT64_MAX is right for the EL1 case where offset is 0,
> but the offset might actually be set such that the wrap
> around happens fairly soon. We want to calculate the
> tick when (count - offset) hits 0, saturated to
> UINT64_MAX. It's getting late here and I couldn't figure
> out what that expression should be with 15 minutes of
> fiddling around with pen and paper diagrams. I'll have another
> go tomorrow if nobody else gets there first...

With a fresher brain:

For the if (istatus) branch we want the absolute tick
when (count - offset) wraps round to 0, saturated to UINT64_MAX.
I think this is:
    if (offset <= count) {
        nexttick = UINT64_MAX;
    } else {
        nexttick = offset;
    }

Should we consider this a separate bugfix to go in its own patch?

thanks
-- PMM

