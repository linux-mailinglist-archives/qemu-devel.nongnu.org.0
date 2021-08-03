Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B43DEE7E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 14:59:36 +0200 (CEST)
Received: from localhost ([::1]:54198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAu19-0004vn-7N
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 08:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mAu04-0004FQ-PR
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 08:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mAu01-0007i8-9i
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 08:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627995503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dBrJwiD+VbKL1oAJb/XH5gWZ8MV5saXHNkegI0NygHs=;
 b=bvdUe3u+/BY+VvYpLFuWe/q5Df9ygUi/BouVLLMK3+IN4cukwai09lyBfQn69tS1IBjHLI
 apHPYuuS/XGR1BZeBjToOPkPm+8JmBu4M43brOWO9TErZJCUbh235VZ91i1q5o/jgDcRuC
 WOOuWEEIvqdi4B0dU2xLq+utAoZB0Rg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-RE4r1M_JM9CMuL5EwkNGuA-1; Tue, 03 Aug 2021 08:58:22 -0400
X-MC-Unique: RE4r1M_JM9CMuL5EwkNGuA-1
Received: by mail-ed1-f71.google.com with SMTP id
 k14-20020a05640212ceb02903bc50d32c17so10492381edx.12
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 05:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dBrJwiD+VbKL1oAJb/XH5gWZ8MV5saXHNkegI0NygHs=;
 b=U2F50LJHm13j2ARpwlzQC53zuJHupEDlErqimSm/4pwufWZAhfIAN5EfsUWETuRkc+
 sHefJGbYg026g4/7tlwTrZXU253vCqUZGFFZJrMk0ZuMyoqzi6V8etq5zPq9gMs2MQ9r
 ETB0t3JKTDEucGfvOtunFTZuo9lqsQNuEpWEhAb6t7lwqi2Opg5G6kLOk9vBMReXMI4J
 LsDcg/wz4mBS5BA76anqr3DclR1R1At6wCN1N5Hj70Omjf1EZ9+LqXoedzkYyJ2LqVE+
 62plai/kfL02PpM7Fm3LZUHH83KVeNjfXvpUJmSIduX4U862P9aHUeHFu8DGR12+H6qo
 hbbg==
X-Gm-Message-State: AOAM530Nza/oweWbuRyGzxY4Qj4HlRC1rcKCzYVxhguibCF2DSHyXsze
 MNOl2zznA9452/32qnIRx7AUR381p1H5gxXwlnZ1m4sc7oKAGLonnX3a8Jys8gupM4BTn68FNHb
 mnT9fOqvz9+Zzg/f0D04dO+kvc9pz60g=
X-Received: by 2002:a05:6402:1011:: with SMTP id
 c17mr24508793edu.144.1627995501339; 
 Tue, 03 Aug 2021 05:58:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+joFKwmTFwsq2R0/XQBLYHreFDGldHOrtfYkNszbDod2SQuw5XB5wu/lMFxo+0mmuLGxNj8UpEySzRH+FCck=
X-Received: by 2002:a05:6402:1011:: with SMTP id
 c17mr24508775edu.144.1627995501122; 
 Tue, 03 Aug 2021 05:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_g8F26bV6wHFRUt7TSZMjt8hs6Pip8kHw=s4-WXy_AXg@mail.gmail.com>
In-Reply-To: <CAFEAcA_g8F26bV6wHFRUt7TSZMjt8hs6Pip8kHw=s4-WXy_AXg@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 3 Aug 2021 08:58:10 -0400
Message-ID: <CA+bd_6KanUEpDxVv4-T1mxvFMeCsG7XGXv9t06-b-AL3UxK0-w@mail.gmail.com>
Subject: Re: 'make check-acceptance' eats lots of disk space and never cleans
 it up
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 3, 2021 at 8:43 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> It looks like 'make check-acceptance' creates directories in
> build/clang/tests/results which are huge and which it never
> cleans up. For example one of my build directories (configured
> just for arm targets) has over 350 'job-[timestamp]' directories,
> many of which are 2.5GB or more in size.
>

Every "job-[timestamp]" directory is the result of an "avocado run"
invocation, that is, one "make check-acceptance" command.

> I assume most of this is artefacts (disk images etc) needed to
> rerun the tests. That's useful to keep around so you can manually
> run a test. However, we should be sharing this between runs, not
> creating a fresh copy for every time check-acceptance is
> run, surely ?
>

They contain results and files needed for debugging the results of
tests, not artefacts needed to re-run them.  Everything that is
shareable is in the "~/avocado/data/caches" directory.

> I just freed 72 GB (!) of disk on my local box just by doing
> rm -rf build/arm-clang/tests/results/ ...
>
> thanks
> -- PMM
>

There's the "make check-clean" rule, which will clear everything too.
We can also add a flag to *not* save the results from the beginning,
but I guess one would miss them when needed.

Any other ideas?

Thanks,
- Cleber.


