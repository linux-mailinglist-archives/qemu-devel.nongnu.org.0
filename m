Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9F030FB8D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:35:08 +0100 (CET)
Received: from localhost ([::1]:42896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jTA-0000ws-12
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:35:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7iXs-00087p-Ls
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:35:58 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:44011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7iXh-0004FE-DL
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:35:56 -0500
Received: by mail-ed1-x52e.google.com with SMTP id i5so5180427edu.10
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 09:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YO2VMB9K19ykYebpzakKmfsmkkJzJivV56cce40PQ4c=;
 b=h/5vwfZRjsulhm0wMh1d5bwgeIh4yTsrFgWWvOdZHTPgfiSXVQuDxaigcSVV09Dmmo
 BRkXYfLHBBR1fcZrTY6M6nZNQFfJnIrXMnWcX259DX9KnnqQ7UmTEaZpwhRl+5I5ireB
 igf0rgUzOz6qfGDQLSZroh/jNOMffKZyol4uRdi/R0qM5f4oW9DbpH0W1n2HjM89nxCg
 4kl5NlQdtxumbGi9RBJBmYEq1cbKKD3PiPthwQldh8hPDUt+qbM70Gpsp2n5qtWp6ORf
 eSy6eEcLfKs9CmYqOChPpOKKdtVx/RiXLu9NUwsNYu/O4Qd2lDz3O7iJt1MJlBqJHrq/
 vXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YO2VMB9K19ykYebpzakKmfsmkkJzJivV56cce40PQ4c=;
 b=UXr+j5sl/xB+DGm52TyGU1LrZqtjPJSOVj1cYfJM86L2Z5Ca601y9NhzhO68Tyj9/Q
 x0Vx9RmflZfhvxcPaW8xKkNcSUZ0PAyFBg+3AL8lgX2GM39KbCWOTlqiE5gCJHVNUBuO
 lRAC6G9p0qE/mS5EVCBi0vaW2diw41ipVRf33AaeMiasbNQao78A+5oZC8mOvBAzZdN9
 uexziT8n8ySMfPF4ZUOHwrfy7dMfRhRPCz8cmowphybxE5tptHoDjNDqA3f3wYXfr9be
 o6dCfO8XCUKTRn0JhiSaQ0DLAl+UrcwTB3pJtrQewUY93Y08yZ5PC2PWEkmv4ibkRoT4
 Q4AA==
X-Gm-Message-State: AOAM532n8zXGb+qhAp0dRcVGvrLWya8RR0Pmz1s2Zm1xm+8Lyu5RvyJj
 dqyAWBN0NLCp6biTG9GA0v+MPtpeiu32WCCS4xENnw==
X-Google-Smtp-Source: ABdhPJzIcry7JesNTiM9EHICwRVm5KNN9ZkBQR7qIUmn254edcwN6IiyZWlTfZQdwtIlG/a6qrQ53/nR23sJ92OtFRs=
X-Received: by 2002:a50:e80d:: with SMTP id e13mr35570edn.251.1612460143120;
 Thu, 04 Feb 2021 09:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20210204154327.386529-1-stefanha@redhat.com>
In-Reply-To: <20210204154327.386529-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Feb 2021 17:35:31 +0000
Message-ID: <CAFEAcA9krQPfgzLSEimNdN7dUQJbqUObGtoiK7A9ZOGKxanR+g@mail.gmail.com>
Subject: Re: [PULL v2 00/27] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 at 15:43, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit db754f8ccaf2f073c9aed46a4389e9c0c2080399:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210202' into staging (2021-02-03 19:35:57 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to abe42229db7b87caa11b3c02835ebf9d384e0bd4:
>
>   docs: fix Parallels Image "dirty bitmap" section (2021-02-04 15:17:10 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> v2:
>  * Rebase to resolve memory_region_init_ram_from_file() conflict due to the new
>    offset argument that was added in qemu.git/master in the meantime [Peter]
>
> ----------------------------------------------------------------

Fails to compile, clang:

../../hw/remote/mpqemu-link.c:40:29: error: suggest braces around
initialization of subobject [-Werror,-Wmissing-braces]
    struct iovec send[2] = {0};
                            ^
                            {}


Don't use {0}, use {} -- the former may be the C standard thing,
but the latter is the one all our supported compilers accept
without complaint. (cf eg commit 039d4e3df0).

thanks
-- PMM

