Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078372C0E0A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:49:50 +0100 (CET)
Received: from localhost ([::1]:34012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDA4-0001tt-HF
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khD8Y-0001LC-Tc
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:48:14 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khD8W-0003IB-WF
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:48:14 -0500
Received: by mail-ed1-x535.google.com with SMTP id cf17so13798848edb.2
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 06:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G03zfpBJ1gx2z+xZPEk8uNItFGz1G7uc7ZApPGaDo+A=;
 b=dXxy73XhjfMCTJ1gT50nce5qWrZ7jyx3x5xAFeLvmEsLRKY+iNZ8FdpCgSnUMbtNRl
 v5S3fftvgB3FUxggK9PIqK3302xKyLmyEXu0j68IyRb6Kyxz3sheAy9TdJ7KP0uicoJ4
 oLYIqd4yT1ZuEK2ykuq+yb4wS1cUbakqc158KiMTW8p/eO97CbQFNrLrODEZyVs3FJaw
 0o+ycTCOJ/IUyo2+fmUiBknLYWGWWIqVtTb6PhoK55/UiHS2ta+Vo9Zuk+fIwZOLXs16
 3qqpG12/w98WeewWOkzcb2vc4Izfab39g57mI11ZWPPX5Q4rBn/1axMnIYpypgSPWRiD
 UweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G03zfpBJ1gx2z+xZPEk8uNItFGz1G7uc7ZApPGaDo+A=;
 b=Y5yM28lNvNVVpAn/a1WuuSJzAycOZ7tOqTg0nMUq4lbEoAUW6GcTT76MpByxnl/QWH
 7LiV4OIQwXDgKvXtfp52SM5i+141RE8GdRY2/R5HzjvMjT7Y/IHsoTznn1EZXHWxJFV4
 H2OA4QX1RSbNVuWs7fOVDOlK0BKCxBTE0iuRh72qE9xT2q5IXQ9sW2FX6LvExERoS1x+
 RlAsXSjXTVcNaV7VK1nj1JvUCMvuMUhR5X5080ou/GJwcOlyd0Uh4BzkqiraZYLuu03B
 W9Kusc57SRq+5x+TV7BaarQingn+kLpE6hxUh71/58O9QhqAR4Pjy4e5ph+VC0RKmdGl
 hLWw==
X-Gm-Message-State: AOAM531MGsSV9brrmsVZVDdH14RjEN5dgKV3gUT51Us2ieXcgcWYKpAP
 RkDim9WKDUO6EWhoHFqIcGQzHH1tl3XEI1rki9Kkfg==
X-Google-Smtp-Source: ABdhPJxHSokrMhPmnqp59fFO2f7Jpk5malGe0HxhSjfAHz3qIiAekqJLFgsZtN9uwOk3aufb0yILcABboltzaIPakYI=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr11334726edr.44.1606142891408; 
 Mon, 23 Nov 2020 06:48:11 -0800 (PST)
MIME-Version: 1.0
References: <20201104151828.405824-1-stefanha@redhat.com>
 <CAFEAcA_fer-r6tJLRgQwQ+X1bAe0ODSA5UNWxZbSCtS1VHDO9A@mail.gmail.com>
 <753aef6b-128d-e1af-b959-e83481749120@redhat.com>
In-Reply-To: <753aef6b-128d-e1af-b959-e83481749120@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2020 14:47:59 +0000
Message-ID: <CAFEAcA_eh_0w5jkU+DOnMU5+ynvqB74kxEC09V__tTsqrhxXaQ@mail.gmail.com>
Subject: Re: [PULL 00/33] Block patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 at 12:55, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 11/4/20 9:59 PM, Peter Maydell wrote:
> > On Wed, 4 Nov 2020 at 15:18, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >>
> >> The following changes since commit 8507c9d5c9a62de2a0e281b640f995e26ea=
c46af:
> >>
> >>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into =
staging (2020-11-03 15:59:44 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> >>
> >> for you to fetch changes up to fc107d86840b3364e922c26cf7631b7fd38ce52=
3:
> >>
> >>   util/vfio-helpers: Assert offset is aligned to page size (2020-11-03=
 19:06:23 +0000)
> >>
> >> ----------------------------------------------------------------
> >> Pull request for 5.2
> >>
> >> NVMe fixes to solve IOMMU issues on non-x86 and error message/tracing
> >> improvements. Elena Afanasova's ioeventfd fixes are also included.
>
> There is a problem with this pull request, the fix hasn't
> been merged...

Sorry, this must have been a slip-up on my end. I have
now merged and pushed this pullreq to master.

-- PMM

