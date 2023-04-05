Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0434B6D83EE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:42:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk6CN-00042o-9X; Wed, 05 Apr 2023 12:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pk6CH-00042Y-LP
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:41:21 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pk6CG-0005KF-0Z
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:41:21 -0400
Received: by mail-ed1-x535.google.com with SMTP id cn12so142635544edb.4
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680712877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kEVLQxRCGbayY1ee797A9Nh4S5jHqZWC9kITSQOLLQQ=;
 b=Bpj1RJEVL5XdE0SBUorSxamlu7BxeFwKDkJnVjk6uavtZvHeUfNb60vQXGOfK/gPJ2
 k7AyULSn25IlPat32IlyA262rpg6PKyewg6T93Q/rVt/zR4wBvTSq4e3z15Nv88xX0k6
 JWOQacItx6pVXG/yr2imCBpnqiM3IkIqmoOcgj/aCigDkxzBWjXPhn22gI4EJN0GokR+
 AA3YuK6mP/cxMvSEReAUez6tEqI55NFe7Dcan60M+0IqrjAa0gr/rtGP40AT6zasuVTw
 nteoVdUjdvoO+GsBooWRKrYAg683srxDbFYX7NHvINSdVIjnFtTQReQ2g8dyRkovAtTG
 ygxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680712877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kEVLQxRCGbayY1ee797A9Nh4S5jHqZWC9kITSQOLLQQ=;
 b=YouWMIZPIubMkLBUoY+K1mlBxJ/NeJdMh9DmrNYiWyLfZCBsDYZNxWfDnRuvgBLAJB
 CyWcpjTyN/gWQDa0o2IyLQERUjM7183egI/yh5C3FgK91jW53duXNv54awn+Ngd2cNPJ
 KLq5cFUWms8gjlYDzL2V2AvTeO8bX2QgO1gZxMus1SPW3HyBWnlfJeFBBtrcHm0Mr1TI
 mI+7i2VkgfIbwJMmfxtAUxzEZuycHFDyU45L5dqly7gxe3iMQVG3Bm4s1aH/2E9q88n2
 Ihn2a724XtoZfqDhh7CHGXxSIn+droiDzBpjOGHKjbz8roGOZlV9tTYCw2nX5HxjsXzh
 0v6g==
X-Gm-Message-State: AAQBX9d08nHrElNgdDmz6V0IJRSNCJ07sm2v8Kme2seszaSRb1fW7JxD
 00ENmTQEXbH9aEAMZ23OlBbUKeqp104qfixm643Z4w==
X-Google-Smtp-Source: AKy350Z9a/USsH3CO79qMT8r1vHb+P2IFrAHTDtD3YQulBTpvSeUo1U0vuzcFX2pUAesHUI5VPCr4fyJOErDLodtjs8=
X-Received: by 2002:a17:906:5501:b0:932:446:b2f7 with SMTP id
 r1-20020a170906550100b009320446b2f7mr1944604ejp.6.1680712877582; Wed, 05 Apr
 2023 09:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230405125920.2951721-1-digit@google.com>
 <20230405125920.2951721-3-digit@google.com>
 <87h6tuqy0f.fsf@redhat.com>
 <CACnJMqrf-YH6P0zBC4FSSp_LcO=pxDOrx-P3MGGFDj_uWbWjvg@mail.gmail.com>
 <87mt3mxr2v.fsf@redhat.com>
In-Reply-To: <87mt3mxr2v.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Apr 2023 17:41:06 +0100
Message-ID: <CAFEAcA8_ki+4WeZLB4a3S8rQBs-OOsYynU0ci2k-HoNtsAjrXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add missing Linux kernel headers.
To: Cornelia Huck <cohuck@redhat.com>
Cc: David Turner <digit@google.com>, qemu-devel@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 5 Apr 2023 at 16:55, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Wed, Apr 05 2023, David Turner <digit@google.com> wrote:
>
> > On Wed, Apr 5, 2023 at 3:06=E2=80=AFPM Cornelia Huck <cohuck@redhat.com=
> wrote:
> >
> >> On Wed, Apr 05 2023, "David 'Digit' Turner" <digit@google.com> wrote:
> >> > The script has then been run against the official
> >> > 6.2.8 kernel source tree (current stable release),
> >> > which explains why comments in <linux/vfio.h>
> >> > have been updated too.
> >>
> >> I think we usually run the script against a release or release
> >> candidate, not stable.
> >>
> >> I meant that this was run against the headers of the 6.2.8 official
> > release, which was listed as "stable" on https://kernel.org/ (that page=
 now
> > lists the 6.2.9 release btw)
> > I'd be happy to re-run it against a different set if you can tell me wh=
ich
> > one (and where to get it, just in case).
>
> I think most people actually run it against a checkout of Linus' git
> tree, preferrably either the latest -rc version (or the latest release
> during the kernel merge window) -- people usually run the script because
> they want to use some new interfaces that were recently introduced to
> the kernel. (This also ensures linear history, although I don't think
> that's too much of a problem.)

Yeah, I think the requirement is just "it has to be against some commit
that is on the mainline of the upstream kernel", it doesn't inherently
have to be an rc or a full point release. The assumption we're making
here is that ABI is stable once a change hits Linus' git tree, and
not stable before that.

The other requirement is "don't go backwards", ie don't sync to a
commit that pre-dates whatever the last commit we synced to is.

The last sync we did was to ceaa837f96ad ("Linux 6.2-rc8").

thanks
-- PMM

