Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731FA4EAE62
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 15:25:38 +0200 (CEST)
Received: from localhost ([::1]:57992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZBqp-0001j2-6V
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 09:25:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZBpK-0000zQ-K3
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:24:02 -0400
Received: from [2607:f8b0:4864:20::1130] (port=34748
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZBpI-000382-Ox
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:24:02 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2db2add4516so183406617b3.1
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 06:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i76GTjuWlyybnQ6gqk0V4lbPK4sbYKsGcr/GDrkfRsI=;
 b=Md5my8ayEk9NGKcA5pw2nbs+ku025UB5YL/DiVS8TnVEJTkVsn8hFz28hVUpiYCFBB
 m1zRnyNHCuBYEFbuYyeo2k3XJ58N5eHmzjGXpTtKcnGZaU9rf0XKkr3O5eU7uInc+rCm
 RBunEHGSAliPnECZMJ4wF1o2IsqoeOzaanzD2VjbDr6RRPYdsmzY3ywzD4QPxxpnEn35
 NPYZxhoJR70jOJwCka+V5W6lzdjWABx4yyqcMOhwUuZ7eYd8yph33i7NMIdRPElAaDh3
 DDcPCcmsZtnea/A3KoZqdN6gq3xWRW4OYNNOZVmFqvsTzi6shgVmuHAi7rG/L1UfxzNW
 aLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i76GTjuWlyybnQ6gqk0V4lbPK4sbYKsGcr/GDrkfRsI=;
 b=kPLsQJNzQ0bKuqOpYGSG0pENQI3/wr4w9cFvs5Lduuao+Sq82nN3wRdMmfQcmaQKmz
 AfCaElkp0HvryNSZ4PAIQove6s49cMSsPuONw9C1k0dZMj2nuU0idMkbL79nVWRYPX5M
 yyPaU+jN8O1Uret21aYzrSOn4s8DB+Z2O0hxrm7Ane/k/nhiTERKlX6gDjEHcb4WjqO6
 sV5X2MQEXA3oiAqJWWSW4FYs6Eq/nSf5x1G/MkAG8a8Wzm71xevJXzERw6iHyb7o8Q3f
 vtPxI8teC/plZpFR1RWMfoHwObd2csKirt6LImoyFDNwrtxl0KZ3tyf0ktwX9QrgUvGY
 YaPQ==
X-Gm-Message-State: AOAM532gcjXJc/p5Cag39RNtGZQHPWFiXVH0uIv767tmLL72Q45tlet3
 FXZ4l0rQ2odORayPVdPRlf1rHz0QfER7ZrU8u5R3Ew==
X-Google-Smtp-Source: ABdhPJx1SWTTlhpIJmBijC6Pc4SASc3GsSSGYIRYgCPndbvww/1gvviRVQsYnON/1f/GRAsZ5tRY8wiQDnAZOUrQbCQ=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr31702676ywb.257.1648560239547; Tue, 29
 Mar 2022 06:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220329124259.355995-1-lvivier@redhat.com>
 <f329f744-e807-fc0c-69f6-52cc3d10ab9e@redhat.com>
In-Reply-To: <f329f744-e807-fc0c-69f6-52cc3d10ab9e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 13:23:45 +0000
Message-ID: <CAFEAcA9=Gjavrm3_2zOL_yeXE72KaSVP7EhjJg3zGeZKJX6epA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: failover: fix infinite loop
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 at 13:47, Thomas Huth <thuth@redhat.com> wrote:
>
> On 29/03/2022 14.42, Laurent Vivier wrote:
> > If the migration is over before we cancel it, we are
> > waiting in a loop a state that never comes because the state
> > is already "completed".
> >
> > To avoid an infinite loop, skip the test if the migration
> > is "completed" before we were able to cancel it.

> Is this still urgent for 7.0, or can it wait for the 7.1 cycle?

It's a test case change that fixes at least one hang I've seen
in "make check". I prefer those to go in, at least before rc3,
because the CI loop being unreliable makes the whole release
process slower and more annoying.

thanks
-- PMM

