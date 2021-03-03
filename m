Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6B632B77F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 12:24:24 +0100 (CET)
Received: from localhost ([::1]:49508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHPc7-0000dj-BT
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 06:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHPY4-0007xI-VP; Wed, 03 Mar 2021 06:20:13 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:35723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHPY2-0004eC-Vv; Wed, 03 Mar 2021 06:20:12 -0500
Received: by mail-qk1-x72f.google.com with SMTP id d20so22542076qkc.2;
 Wed, 03 Mar 2021 03:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=52Rw0xqIRl5JXozH0TEb5BpWfUxdB+TCzfKwJ6p5xks=;
 b=j8qDjxvJJ9sexWg3sIDjBPbXxk1lnQaydOjEc2nMHCEr5pff2F+MdonmD+HlS4dQO4
 3Kd2tlsbbO9X1gC/GxeWSLu03VIqmNitjLOtjuxDb09uIwxEvcMFe+0rUunY9dYUJGu2
 zzElaC3yLIVYVaWVNcqxSNJIXfJIVddx0rSfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=52Rw0xqIRl5JXozH0TEb5BpWfUxdB+TCzfKwJ6p5xks=;
 b=dNqMI2JWuxkwaw5gz3ssl1iu/84wWwYoIJvPJWEAkoimjMtwgfRG0eq7+zYNPNJ3x/
 JlLW2AiP6M86xOs9fvq72KKxDocGc+v0uQKkw4TbUxnuRJdU9ejpp90MEOhctBMu9kBO
 wpsbKuwCdvPqOQ2WzE8zEpXwMrwNe/n4ll9De90yQYgJmnJx9Cia9chfGfKvfbZhGYxP
 xgpcWs8/KDbYGyMk/lT2fFAa5LRO3ghLIGGe8JaxYSBbxMZAr5N5aunEKjOsqgBezAiu
 L7gmoLISiDsxMk3D6AnpUOAq+L8WqdLi9wffJ1waxIHykpUVAIqOHcKeJrYUTeexqaBm
 7jjA==
X-Gm-Message-State: AOAM533ZtXpi+ep6/u3EOR0YoxzzQ9E4lcR+NaNa+5HwVz1RtJCxpvEi
 63UneuOm+B/pF3CcsBaTvGh2XoO8+Km0lM0UAvI=
X-Google-Smtp-Source: ABdhPJwKxpNd9mG0iIz3ECt6CPxX/5c2gUStCj38ZymIjqs9WqWKdC3QJX5/cMJz2l6Px6puQ6E1qtf8I6Nl0x4EGnM=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr5857212qki.487.1614770409522; 
 Wed, 03 Mar 2021 03:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20210303012217.637737-1-joel@jms.id.au>
 <20210303012217.637737-2-joel@jms.id.au>
 <5c772df2-8291-ddd3-d289-1f564ec7c744@redhat.com>
In-Reply-To: <5c772df2-8291-ddd3-d289-1f564ec7c744@redhat.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Mar 2021 11:19:57 +0000
Message-ID: <CACPK8XddbgGgPtkK41MM5ZYeaar27RhnD4vQwh8DcXnFpgoUoA@mail.gmail.com>
Subject: Re: [PATCH 1/2] tests/acceptance: Test ast2400 and ast2500 machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Mar 2021 at 10:19, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> On 3/3/21 2:22 AM, Joel Stanley wrote:
> > Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
> > from ASPEED, by booting Palmetto and Romulus BMC machines.
> >
> > The images are fetched from OpenBMC's release directory on github.
>
> You need to justify here why this is safe to run that
> on anyone workstation, or use AVOCADO_ALLOW_UNTRUSTED_CODE.

I don't completely understand. What circumstances would it be unsafe
to run a qemu guest, aside from a bug in qemu itself?

Cheers,

Joel

