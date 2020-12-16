Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714B02DC6CD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:58:21 +0100 (CET)
Received: from localhost ([::1]:50940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpc0C-0005Dv-H3
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpbzI-0004kO-FC
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:57:25 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:34339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpbzE-00062X-MX
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:57:24 -0500
Received: by mail-ed1-x529.google.com with SMTP id dk8so26002905edb.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 10:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eF3aXop0uYVMrDEt1AO7eAefMb+zk6D8ufN+A7dufPs=;
 b=PxljgIi/dBWLkDwKpZ29LedMuBXtvoTwAlE7QKxAzxsHBVi4zj+mJ47Xn1qFrPhcg4
 LIYODJzE2QMVSrBAyE1/M6oT5dXFy9jOYCPGsVOWdWSfkaN42wnfwp2u3mHXHJ6iLwSD
 mjZOUJMzvfNTAdUBpnxufS7Nw8ozcG8gr254i7I3Gb0atBK+TnFJZPjz7eWql/cgwNHJ
 BPfBHN/2g1Ru9W0wpmRC4DFW9FIo8yA7sCeU3DkPejqMmDEIlYjzcC33MQO322pxmhOc
 Tol+yzzUmdR0uB2VhWRQdFRrYpuIsgrefyZ0dTQrZe6X8KzoRSWaY3IbMvXPPlzm1v0d
 1gGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eF3aXop0uYVMrDEt1AO7eAefMb+zk6D8ufN+A7dufPs=;
 b=tv7XXz70DA0GvI09tDn/OHjJfU4gIcNEKC9dPbg5bh5JpLkfM8MRVsYO/b8Sj1sJio
 ekAlTrAJAtPRmuZ2b6xnSJRlxBt3Lbz/+dugMHizUVAzZlz7XM0TetJzDrugdydJRMM7
 CIeDIwgTuTw4u+uYLCramn/yGwaGH7jq8OocLhd1UZJxQ2O5GxhXRAcGoiR2XZ5MBV5a
 Nqwo1GZM1vMB2GxwdKU4xUYc2uD+Zc0RxLrnuUzc4bnbRdbhR2F5d2sYv5hQZ4sNCELI
 s6o/JmcwXU8lOJ+BmQgrPQjlS1GQJb4x25IVn0iG6RISlGX4n06IpQOaTLveqYpvsm1i
 9+GQ==
X-Gm-Message-State: AOAM533Q5zVj5rq4Un14tTx5AhEsmgrHgLYITbeeyhSXPDFbrJAH4eyt
 snDkYHsm6AdhpEPPPohIdGRlf5CS8jppNLzYvAgQXQ==
X-Google-Smtp-Source: ABdhPJy1msP8NBXfcFe6x1y8jamw9to4kgCKuZ4bUhDHI7rm7RXccSyThQu8IE18f72G4cZBmJvpca9SzUIv8D5445E=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr8068315edq.36.1608145037695;
 Wed, 16 Dec 2020 10:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20201216164827.24457-1-alex.bennee@linaro.org>
 <87ft45sj61.fsf@linaro.org>
In-Reply-To: <87ft45sj61.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Dec 2020 18:57:06 +0000
Message-ID: <CAFEAcA9iXp8z_L-t6Y_kVfRMJf9a6MGMJVsLNVwzq6VfO9-Xmg@mail.gmail.com>
Subject: Re: [PULL 00/11] testing and configure updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Dec 2020 at 18:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
> > The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a=
4b6f:
> >
> >   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstrea=
m' into staging (2020-12-15 21:24:31 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/stsquad/qemu.git tags/pull-testing-161220-1
> >
> <snip>
> >   - hotfix for centos8 powertools repo
>
> As you have noted this requires the cached copy to be deleted. I'm not
> sure if it's worth handling that in code or if you just do that manually
> before you merge?

I would prefer it if the gitlab CI infra Just Worked. I don't
want to be manually messing around with it...

-- PMM

