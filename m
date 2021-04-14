Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DECE35F484
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:09:41 +0200 (CEST)
Received: from localhost ([::1]:36238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWfH0-000587-U0
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWf5N-0005iV-6I
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:57:37 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:43637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWf5L-0001oB-FR
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:57:36 -0400
Received: by mail-yb1-xb33.google.com with SMTP id o10so21990221ybb.10
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 05:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T0SLtZB4sKGOyIimVRWe7qabVcxzutAFEbhXPlhVaeM=;
 b=j+sFAe6SI0bzYx4/Ji4U+i0mzNnuOY78ve3IvYoqx9YgQno3i6a3wJwdBwH7vLTOwk
 rn/43oXzP++dgwW3n+ODcUkszSRj+9G97qUyCOZaQsCVa+k8Hq/r3opqwyChdNXMFIT8
 LzvXb42U14sOLRNZU2YjflXN2ieqPWWfiZhfPjp9BlX77OjsvQAuuS9CNArr0Ximai8g
 9cBxnoI6wu2SEiAseFawW8NoJuZn+IFbb+vGm6xrvGziqiz1nOOswwfaBCi5/QAePTJU
 QmODfCJ1v2cRm8d0rGMLMrZ5Te6qJbFE9lWVW7uXHw4oOPGzbIkcDI6uSgFpP9M/G6p2
 7soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T0SLtZB4sKGOyIimVRWe7qabVcxzutAFEbhXPlhVaeM=;
 b=nltcrQH871mTpDrjz9nHR+Ha0WDWQTL57iTie7j8jP69NlrzZnbyWGDY2uFRHnIb/B
 3S/g7gX+jjAbsEJY2vkRizNfvICUu13sm7ZMj0L5fVpS6tYJ49VP+VkvHfhVQyPRU+2I
 iY94AqeD7QE7+jx/ID6SyCioHLJVfQDTycH1xhSaaQEbe3T8t1WlvvekqoVc4nQX9pIH
 Z/ohb9wLlsBDKcYaBJ8ZDqZalFh3/AisMmMV2FFmlD8TjfLRfBsmG5683dMQALKfulbR
 c8e6qMLPzQXWhy5NRtgWHC2RFjJTThE4PQSzYmrXnbS/IFKFLOJ28OvpSIdpujVadcgz
 OWAw==
X-Gm-Message-State: AOAM5339RPyYqRaZHKCoDo4UCD+JAepQ0nX4WcRUBcSfNE1u9WR8Kyc5
 NdNwHochgRuw30XDEowENdDczlLPH0XfsdFhicA=
X-Google-Smtp-Source: ABdhPJxW3ChNJfWOqnmvHfhevEcj/1KFYV+dxrNuOj/3PsfIbUFKeFjqQcNLEbmbrTrQ5Xx2zDD/uiuOkh7Owe1VeI0=
X-Received: by 2002:a25:cf8f:: with SMTP id
 f137mr17780295ybg.122.1618405050741; 
 Wed, 14 Apr 2021 05:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <CAEUhbmWsBfhub-+hMvucshCRH412fuvz5_=fAU_y7UmYJ4_=dQ@mail.gmail.com>
 <5445e140-94f1-dfcf-4652-0e47494e8c23@weilnetz.de>
 <CAEUhbmWJ3kGk4sVM3+TsHmZrDrekqSYcFebpztedU4jkw1DoWQ@mail.gmail.com>
 <CAFEAcA_XOeoXDVGgMHYXmWj2=pQXsS4__izzOrucYP+ZsbyO1Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_XOeoXDVGgMHYXmWj2=pQXsS4__izzOrucYP+ZsbyO1Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Apr 2021 20:57:19 +0800
Message-ID: <CAEUhbmW5pnzWdmCbhcsfJAoZX1uax1ohP3h-ebTp6VzZPB7Dew@mail.gmail.com>
Subject: Re: any remaining for-6.0 issues?
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 14, 2021 at 5:35 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 14 Apr 2021 at 09:31, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Stefan,
> >
> > On Tue, Apr 13, 2021 at 2:19 PM Stefan Weil <sw@weilnetz.de> wrote:
> > > That patch is based on an older version of my personal QEMU sources and
> > > not required for 6.0.
> >
> > I am confused.
> >
> > I see https://repo.or.cz/qemu/ar7.git/blob/HEAD:/qemu.nsi still does
> > not contain the fix.
> >
> > Or is this qemu.nsi file not used in the latest 6.0 installer?
>
> In any case, that is a branch, and so any issues in it are not relevant
> to 6.0 unless they are also a problem for QEMU master itself.

That's why I mentioned in the patch notes, that I was not aware of the
Windows installer patch process.

The QEMU Windows binary download page [1] says:

> The installers are generated from my latest QEMU sources and updated frequently. See the build instructions for details.

which refers to Stefan's repo.

If this is no longer true, which means QEMU Windows binaries are built
from the mainline, please update the page to avoid further confusion.

[1] https://qemu.weilnetz.de/w64/

Regards,
Bin

