Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id D14833896A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 13:53:04 +0200 (CEST)
Received: from localhost ([::1]:48888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZDQe-0001JX-1l
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 07:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44465)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hZCSO-00062M-JH
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 06:50:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hZCSM-0003p3-NI
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 06:50:48 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:37174)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hZCSM-0003kA-77
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 06:50:46 -0400
Received: by mail-ot1-x335.google.com with SMTP id r10so1428385otd.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 03:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+x7xkoWQEYIxrbBaLBi9h8htyoNe3EOdGXd6ySFlr8U=;
 b=HvTdEW1DyIi0m5MZLGVgYMqLk6IOBSY2ImX4gSbcvziSMqpOfDA4cz3CAEhaLen7yf
 k7TP1o0eEnoNDy/6Rgy3tY6xhwWgsxZ4lr9cuXW0t5FfeVOKpTyDJLs2QlyAJxGGZeZY
 pdL5Swr6HL5DYdt/i50+mpNq3ICrvxrlDdtCKlHKzQZGVBZNRAEwv6mvrTR6Lj9SVVaq
 Hq6NFg4bR6lJ+2a1UdXoCM1uvC8T1MdV56G2gN3WAxrjaeevn+h6n3DCEwpK8/fuUumT
 utrR0UsuvqHc0gONlhLTBJDfV+of2AYtIKjDCFoinkW+3WDzBQx9dTxgB0Opt557yBde
 98CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+x7xkoWQEYIxrbBaLBi9h8htyoNe3EOdGXd6ySFlr8U=;
 b=hoIXXJ0YgbF1RYPFng22a43/KKnor1HXvD8Ap2a77W7MrsngZGmoTVahCO/jSutOtm
 U375ndRpfZGRICDYoxYGmr+WFYA+TrhPuxvQ7nWfLCHvi7IqK/QpR22IQ1MWDkJEX/8e
 jVXPICObKXxd1u4WeNwIHC8C/+umkBUREDfl0Q3z3wzn6pAnslJn/5V3hV3NCV/TwA4/
 ONJ3geAJHQLAlB77k5JSY1POvatjKMutUgDt9pOMxWLZUR/2Kx4Oa80KGXje43IYTdTm
 srNSmYEJ7CFC9U3muXdJ36Z5zOOCLYf486cqMJRevWjTKRdT93bGUf10stkrVOyCuviX
 ZfVw==
X-Gm-Message-State: APjAAAUaZD2oeO5FcI/5+zRJbpfrRBIP36QektDYyNIy8Suo14B83doO
 gfqeeFSEi3WrlT88ArbVuUER6HrClewyZJayj4q8/g==
X-Google-Smtp-Source: APXvYqzIWq7geHPPpFrcfbuuJ4ZFsnc0O0Er2nInsHH8LD7c/1LmPrqNJKx5Tx+q3aJY9VRrDXT0L5pYq3CI+Xa/kv8=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr19156839otk.232.1559904644207; 
 Fri, 07 Jun 2019 03:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <1559901944-4578-1-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1559901944-4578-1-git-send-email-aleksandar.markovic@rt-rk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jun 2019 11:50:33 +0100
Message-ID: <CAFEAcA_T-oNmk0pJbUUzEhFQaEZqffXJ0txjHPtYMt81saJLfw@mail.gmail.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::335
Subject: Re: [Qemu-devel] [PULL 00/10] MIPS Queue for June 7th, 2019
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Jun 2019 at 11:05, Aleksandar Markovic
<aleksandar.markovic@rt-rk.com> wrote:
>
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-pull-request' into staging (2019-06-06 14:09:14 +0100)
>
> are available in the git repository at:
>
>   https://github.com/AMarkovic/qemu tags/mips-queue-jun-7-2019
>
> for you to fetch changes up to 88e34ac062c995df540a4d0ee80b8f8b62353072:
>
>   tests/tcg: target/mips: Add README for MSA tests (2019-06-07 11:53:07 +0200)
>
> ----------------------------------------------------------------
>
> MIPS Queue for June 7th, 2019
>
> Notes:
>
>   * Four checkpatch warnings on updating MAINTAINERS can be ignored
>
> Highlights:
>
>   * Various additions to MSA core and test support
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

