Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41353219A7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:04:20 +0100 (CET)
Received: from localhost ([::1]:38468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBox-0008Ke-Q3
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEBkb-00053Y-Rs
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:59:49 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEBkY-0002rx-Ta
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:59:49 -0500
Received: by mail-ed1-x52b.google.com with SMTP id s11so22062214edd.5
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2IoMD+5snC7ix3pEttmE6VM9/HP+CzHaCbawNnnrF6Y=;
 b=G6sisrro+jUbw17JFlHFbXuxXhJAw8AaFFD0RYQKjUUMHO5k3eGjUsBPLrKBb3EAnR
 vqOqOm4W1pxW04yTxAsN/UgnvrsLo7NigrN6UNTiiGFzl9myQ01eENd/BCKC2P9mQha/
 8A6adQM2avkuJPzRwNmxoyMFB35nWj6dHdCH7m6FNvIO0dN0rA3PxN4FtwH/Af2c0yDc
 SFhHYb0x5toxVOPdPA5Xx9Ytc+7XDNPjLDHJzCay52RVw/5/mwt2SnhHOLi3twwrx2M+
 5Sw2RRbf4apbVJHbN2vcaXqTBfXPMuDpgk8vO4IGsA0VtjaMs6POji4+IKO/PSpHfEmW
 jfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2IoMD+5snC7ix3pEttmE6VM9/HP+CzHaCbawNnnrF6Y=;
 b=HaVPkRjX64AlJ5SRANsOFCGm01rkwMN9KpttiBYPp2RvcLCo4aZ0omqgu2Rk940o3I
 ud4zStKEQQ2VdQJKiZTOwo77jIWE+EERjltauXGkb6bCIyW47G65OiMLO9g1yxrxL890
 /5w2VIgYwj0hnUqUVvLdWNpxn2RK8nsk/J1E1Xyf73CZes+WKPhadC7izEaqMTLRZQTS
 LfLWuHYx9r56WrKv+TkKn+xgnXUuR6dMlYmFSjjjGZMDhkz3SwppRHXh6dOZGJ2BvADs
 y5h96BJKvSugKGJHEO4GnneKjfyTml54JcVPE88/mxoBOT7NW58XqFV9vqL6gaICUGBh
 TdOg==
X-Gm-Message-State: AOAM530sZmwCqtj6X1N97v9vIEHbSCTMpfowiiu/2M9waf1dQ3cmEThV
 QEUuf3RXpqNdrUxqE+MJlXY7IS8eq7oNWqGiaDCjzg==
X-Google-Smtp-Source: ABdhPJzIPojWqCqrNLo+1J2tgREdS/rHeH17314JyX7XKbGwZGIxrVQAEEU34LcbrsTp2jRAdRqRLM+vmKQCZpFJ9Js=
X-Received: by 2002:aa7:dac7:: with SMTP id x7mr6105304eds.44.1614002385498;
 Mon, 22 Feb 2021 05:59:45 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <99af17f9-10cf-7c9b-8222-2318b464f5b0@redhat.com>
 <20210222082137.1b3f8b3b@bahia.lan>
In-Reply-To: <20210222082137.1b3f8b3b@bahia.lan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Feb 2021 13:59:34 +0000
Message-ID: <CAFEAcA8oqPR=PbqWaoBGfDKWik6Jv5TuE-PZqTc0W3TsoktvsA@mail.gmail.com>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
To: Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Thomas Huth <thuth@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Feb 2021 at 07:21, Greg Kurz <groug@kaod.org> wrote:
>
> On Fri, 19 Feb 2021 17:51:02 +0100
> Thomas Huth <thuth@redhat.com> wrote:
>
> > On 19/02/2021 17.26, Peter Maydell wrote:
> > > Does anybody use the ozlabs patchwork install for QEMU patches,
> > > either occasionally or on a regular basis ?
> > > http://patchwork.ozlabs.org/project/qemu-devel/list/
> > > The admins for that system are trying to identify which of
> > > the various projects are really using their patchwork instances,
> > > so I figured I'd do a quick survey here. We don't use it
> > > as an official project tool but it's certainly possible to
> > > use it as an individual developer in one way or another.
> >
> > I think it might be used by some of the ppc hackers ... so CC:-ing to
> > qemu-pcc ...
> >
>
> I do on a very regular basis.

Thanks for the reports. Do you use the features like assigning
patches to people and changing patch status, or do you mostly
just use it as a read-only archive-of-patches ?

-- PMM

