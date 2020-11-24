Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB22C3258
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 22:10:00 +0100 (CET)
Received: from localhost ([::1]:46016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khfZX-0004cH-6h
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 16:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khfXc-0003fq-3E
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 16:08:01 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khfXX-0002X4-O1
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 16:07:58 -0500
Received: by mail-ed1-x532.google.com with SMTP id q16so248821edv.10
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 13:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e4Ai6GesJS2bVhurSId7yyJMUo/2nmIRvdN/WHFfPmg=;
 b=xaG5XNbevdl9epAspJAeh7v1xio5FSKaEHam78/M1JyfsYuzsu9yV338Wc0ObSUq8m
 jrrnNM4NR6Xq9HCsLl84mO7EPFkxLhP3ySBVBQPd+aPswDGNu/u1t5P+khsiDroxm4eU
 MtIiQAvnKCpmWF6O0/kS67q1iFXmVnHwBXTQazEPAQKNV5furC/vgzTkEqSO5QxPmAx0
 5Sb4Kl82BZH4dMOqrtFAZE0t0XNypU0vPEo5JAmRaR1XKtj+BLip6fk0Swm8GQ+kaqWU
 YD1nGkD3546mnZIwco9FIBlwEs4vOcD2Cv908TgZncqUPSWbEa7tqDQtvYGVeNNPD2jJ
 tZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e4Ai6GesJS2bVhurSId7yyJMUo/2nmIRvdN/WHFfPmg=;
 b=YY4Bv+gyH9ctoJwtwzyOvZOElxwhn89Lo6xEY6YLCYA3y+yDc1I5NOBWDW07y1KXv1
 IjVDl7X81cct/sirGMHyOKUqzOBIibv8AkWw4Pph7OeVSscGKDqC84Hyt2kfwDmExje7
 2ukg0r43+GRodx+xh1J4hklqn0dS8blt4X/su/4cSdzj8xe59LemPrZChQ9JIVNzkrjo
 kTZW7XHuJ4XLYHbFEzKRydT3CgBB13rxGYZx01kb+Cm+k/YGIIoiUj5en3nyBwHaWQMx
 vlHUUruSqRfWp3QvsKGMBcqHn+/W/JSmG8hfSxCEUFphx2NDuFyUKo5EYNwgkz98qCnB
 7DrQ==
X-Gm-Message-State: AOAM5330cSZJdMx2o9VxnVXckrDgJwn2X4v7JkRAdXN0KTzhC5jzqARM
 dCbESWfXfxc1LXHiFFBcYsbM98EBlDqtALp1s+CELw==
X-Google-Smtp-Source: ABdhPJxM6ygePhGJwrLL6OVF5uFoZeeZlz/cn+KuVaTn0a8YkXL4wkfcvXpI7Z8YBzFtYUl5yU4OfJNs8ToVav7lytE=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr463317edb.52.1606252073826; 
 Tue, 24 Nov 2020 13:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20201124142459.298166-1-kwolf@redhat.com>
In-Reply-To: <20201124142459.298166-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2020 21:07:41 +0000
Message-ID: <CAFEAcA-ugaSxumbW720sJHBNP4fnJgchhqp1TWE-KkJ8NvxG3Q@mail.gmail.com>
Subject: Re: [PULL 0/1] Block layer patches for 5.2.0-rc3
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 at 14:25, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 23895cbd82be95428e90168b12e925d0d3ca2f06:
>
>   Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20201123.0' into staging (2020-11-23 18:51:13 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to c8bf9a9169db094aaed680cdba570758c0dc18b9:
>
>   qcow2: Fix corruption on write_zeroes with MAY_UNMAP (2020-11-24 11:29:41 +0100)
>
> ----------------------------------------------------------------
> Patches for 5.2.0-rc3:
>
> - qcow2: Fix corruption on write_zeroes with MAY_UNMAP
>
> ----------------------------------------------------------------
> Maxim Levitsky (1):
>       qcow2: Fix corruption on write_zeroes with MAY_UNMAP


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

