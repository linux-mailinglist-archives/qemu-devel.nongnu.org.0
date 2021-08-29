Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B433FAEB9
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 23:35:43 +0200 (CEST)
Received: from localhost ([::1]:50826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKSSs-0001KD-FB
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 17:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mindentropy@gmail.com>)
 id 1mKSRp-0000eb-9P
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 17:34:37 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:44713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mindentropy@gmail.com>)
 id 1mKSRn-000865-VW
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 17:34:37 -0400
Received: by mail-vs1-xe36.google.com with SMTP id n63so1444774vsc.11
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 14:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kSr65+VBrZqk8MuYBZmLsPwDVd6ATeNcdiQFAnPFqGw=;
 b=sslUq8cFiBDLxlox0mCW5WcGqb5dXgXpTjEjPiuAqf799nDCUZjwOiKdfYN7zsfJPI
 3XN9nx3aXNh1arQyWmy3povGJR89izH7APVR7r53l26ZirHf+5ub/J0Jt7+dalyUWAMg
 WYfT9u1wt5Uuyn8JWG/xhSgfRt2hZ+J9ce6CaCLE753+sB96Ug3Eu8bLGmzE/dWXjDpQ
 0HE8+wSDYD+doAGQF91F0EDmpRLAnqBGmAB+FiFe6kc4Z8pLQFzszOAG1i8xWukkhA1M
 Ek1pAs4cN8fVB5Le8/e7xStAQCcU5SsIdlwcHhO+XSHCRAsc/1sXZN8+4HJYOKvsV3n6
 F49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kSr65+VBrZqk8MuYBZmLsPwDVd6ATeNcdiQFAnPFqGw=;
 b=EzwpVUbYwsU9fzy8kx1PbyVV27N4ROhSLct5GEpAsIFWqp/4YISxKnuNEuG49Yit4Z
 Qsjgu9KElEeonLoseLgn/qs1QwwLXkQawWl/28g6c53nnodIroGQDsPWUiSlQ2xn3+f5
 5oTMAuEiusspyn8iewFQnw3awKz93czS1Arh3CnzKdnly6uBiP/nLDgZ92r9ZMVcgX+K
 O1QBbzFz83LNW6JPQC7GSLahjZrJq0A/El+L3lk0Y4N3E9k33Ek316fnpHk/f6plDsQ7
 LMBGFcwBIUuPqdsUpHrRMKoR7CAhDjMIhjffAG+c28u6QTeZW2BWgHTWxlLNd/teIZcp
 RJoA==
X-Gm-Message-State: AOAM5329bL5CcBEjVkiQvhoY6gt7Wn0aQ3Wlcsf5N9S/qFnh7I/iVTwE
 que0qhHsDacm8qcsrNkMK5svEdQ44/T+aMD552s=
X-Google-Smtp-Source: ABdhPJzidYfaIGo1crMa+ELyNTXxkYNzIlh41UktNEFleAftYsPt3aeJc2mlYuxUM6JNLG5vY5puNNwty81lJXAkG8s=
X-Received: by 2002:a05:6102:819:: with SMTP id
 g25mr13222388vsb.23.1630272874137; 
 Sun, 29 Aug 2021 14:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAM2a4uwQ0M=TmFdWaaO-E_2J06fpH1ghXhYJJKBP6s5j90ASLg@mail.gmail.com>
 <CAFEAcA9SeTTcU_p+-KwGJPyYG7pKzSJGGb287tXYOvN13E6-iQ@mail.gmail.com>
 <CAM2a4uxO=DaspSeT0LPHTvKuH6crzzQC4_syAf=J+FOE_C_sbw@mail.gmail.com>
 <9984de93-0b83-ef88-8301-a8b74f3f6247@amsat.org>
 <CAM2a4uxp29QKMaLFOseS5dHRNuooVY6sghzD22NEtGE=3g5wVA@mail.gmail.com>
 <CAFEAcA_eQrd+Hiky+tUZSoNDkcmz5MwpM2=2RQp-gnCDTV4wvw@mail.gmail.com>
 <CAM2a4uwkY85PaPKBKbA1b_xc6LkeTkR4Me_S9d1HRi2y8TwOiw@mail.gmail.com>
 <CAFEAcA-i5RUxh9=jmz-hN+LLg6_nk3TaanUy-2DDvtfdF7wyeg@mail.gmail.com>
In-Reply-To: <CAFEAcA-i5RUxh9=jmz-hN+LLg6_nk3TaanUy-2DDvtfdF7wyeg@mail.gmail.com>
From: Gautam Bhat <mindentropy@gmail.com>
Date: Mon, 30 Aug 2021 03:04:23 +0530
Message-ID: <CAM2a4uwq8z043puuLG0WvzpBn0paa5sWeFeHUnwuysezXv67DA@mail.gmail.com>
Subject: Re: Testing a microcontroller emulation by loading the binary on
 incomplete Flash emulation
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=mindentropy@gmail.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Just create a minimal machine with some RAM in it, and use
> the generic-loader to load the test binary into the RAM, then.
>
> -- PMM

I should be using the -bios switch for loading the bare metal firmware, correct?

-Gautam.

