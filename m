Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6BA4CDD0B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:57:14 +0100 (CET)
Received: from localhost ([::1]:54516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQD73-00084q-CT
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:57:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQCxG-0005Fh-Fk
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:47:07 -0500
Received: from [2607:f8b0:4864:20::b34] (port=39689
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQCxE-00012y-7U
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:47:06 -0500
Received: by mail-yb1-xb34.google.com with SMTP id x200so18630495ybe.6
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 10:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CyK71/U2CuHBZlHXpaQFAIJqawy12G3ZhOMbKyCzQ58=;
 b=d0G94R4VnKNc64NMzhdvUKxVkTDOIy5TOjiRVQwgoROng3RmmjjvPgXHbDNrqZYEy5
 xwn0yso2WVf9XZONXSlrDoj+7IB0jDv3LAOIAbIPqSK/c3nd6KAHMfE8WfD4dKdpG34+
 ZI2qJnktwMulDBCmu1pBTeMu0yM93x6VOxKXYS+PgoyD2SoKuWxrLGxPHHqIZpStOJfS
 I/HLvwSGsS7mjyZJucyYFZMVW0geXeY56tKSrZrmnU6NUpITeND7H5/LfsDL+FnOLzVA
 J7Tf+lPyj9otPesrJbgNBzJNQsUDRFztgfxPBqVySx6OQXjG+qd+S+GYkIy+1oIpN39o
 njmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CyK71/U2CuHBZlHXpaQFAIJqawy12G3ZhOMbKyCzQ58=;
 b=3jqI8QbJQ26nooqtQQBX4aT20hYIesdwwpy2b3zBLfb1RaFnOh9dNqijL7f2dJTUuO
 riullo2wXZdYnQiYwyg1m1HgYm7pFDLo0pE2j13ZgnL2/pV9nI6U4Fp0/6OOjZccFHI7
 uC5cboRiAbG34lW2fkk4ZKyZiytDW6v1OOKYybOBPNB1SFx82bmlrpCBQWljRpb/mEvO
 /pUWHX3XgcDsGXrSXgLDDyuz3TB/HUaLXzsubyhfskEkt6RHjxKMMzT4jeLt7pdFUmBk
 lCqi1LEmM5hEHYlAqSAH85pGVGhr6rWhAlBDtsXur2fZ5I9M0bC747Yyy1p0VQ7G+3d0
 JkqA==
X-Gm-Message-State: AOAM532J2Aj8KTbpliJwjHfURO+rj7KAO/b7Wa1uTyaaVkzh57lyXoTT
 AEiP7NIkIER7nnfy4+ti7Nh9TNOC7THPWViazKwmid/L2KjuVA==
X-Google-Smtp-Source: ABdhPJzc+fiXiT7pj5yR4s6F2hQSNvYkKqyiRPaZ+M4KB48/LydXV9SO/GuAYIlLdKuZKlAb1tXBaDjEfBMvq8B8bxY=
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr1845429yby.193.1646419623138; Fri, 04
 Mar 2022 10:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20220302181134.285107-1-pbonzini@redhat.com>
 <CAFEAcA8=8tiqmFTFPaNXcqjXy6Rb5xR59Q2VYUXOTbN91rbYuA@mail.gmail.com>
 <088024f5-7066-e6ec-953e-f55d7ff83b96@redhat.com>
In-Reply-To: <088024f5-7066-e6ec-953e-f55d7ff83b96@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 18:46:51 +0000
Message-ID: <CAFEAcA--dtmffH4FJUuuE1d6yR-4Mweu481p_y-EsJKEtPRjTw@mail.gmail.com>
Subject: Re: [PULL 00/11] QEMU changes for 2021-03-02
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 at 17:41, Paolo Bonzini <pbonzini@redhat.com> wrote:
> The test seems to be flaky, I've been fighting with it all week---trying
> multiple versions of this pull request and removing patches until
> build-oss-fuzz passed.  The set of patches that triggered it or not was
> completely random, but I'll not that it did pass with this exact commit
> I'm submitting (https://gitlab.com/bonzini/qemu/-/jobs/2154365356).
>
> I wanted to look at this today again before replying to you, but as you
> know I was sidetracked by work on the qemu.org infrastructure.  So, I
> can look at this but I really need to ask you one of two favors:
>
> 1) decide that the test is flaky and merge this pull request, and then
> I'll send before Monday the changes that I've omitted here (which again
> have nothing to do with qos-test).  I'll look at qos-test during soft
> freeze.
>
> 2) accept that I'll send another x86 pull request (not a large one)
> after soft freeze, so that I have more time to debug this (likely
> unrelated) build-oss-fuzz issue.

Either of these is fine; my requirement is only that either:
 (1) the oss-fuzz gitlab CI job needs to in practice actually
pass at least most of the time
 (2) we need to switch it to ok-to-fail or disable it

so I don't have CI failing for every merge I make.

We seem to have several intermittents right now (including one
which makes oss-fuzz hang, I think) which I'll try to find time
to investigate soon. Plus the CI infra in general is flaky:
some of the intermittents are clearly gitlab issues (like failing
to manage to git clone things).

thanks
-- PMM

