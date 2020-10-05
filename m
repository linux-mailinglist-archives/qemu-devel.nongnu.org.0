Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27899283A63
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 17:34:01 +0200 (CEST)
Received: from localhost ([::1]:41142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPSUx-0005k4-Uz
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 11:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kPSSq-0004jP-3t
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:31:53 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:41531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kPSSl-00060O-U9
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:31:47 -0400
Received: by mail-ed1-x542.google.com with SMTP id l24so9833637edj.8
 for <qemu-devel@nongnu.org>; Mon, 05 Oct 2020 08:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wrumF7t0BWyBWmcw42tF3Amm71V4fc4xYAQ8HJ06CIg=;
 b=B8csTdgPDqO7OQQKNvb2bnuARmbG/AV39r6aUSBW/qU+PNOFRk0d5zGVphx2E0IT0o
 b2efpvgcHOYStUNjm22VcByP0NtaKoL0mnsGCrjxAqSKhfuf0SrcyvLtiSj7t28j5w0L
 vC6E650QhMXooQ17EYYB/jRxtsPCV2d1aTrn7v+sh3OYNAJlMUO1uOKjOAy4uC/yFGE/
 ky6WHdiBZ9hdxTis/LS2eVZOrV0nZ8Y9QNEw83gd0CkLGmvav6N8ZMm2zkO7nEjYYC1n
 cUAQVgh1MiAdp55vNNHlJRCHCYQXlYtRQ9esSNkHV+WtOm7m+uPpT9bUwiGk+8p2GASg
 4JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wrumF7t0BWyBWmcw42tF3Amm71V4fc4xYAQ8HJ06CIg=;
 b=qh83r24YSR+kPeXYqDmWw3+arqOgPrDNRi3ukp4s6E7zJ3YlttfPadVHvr4iC3w3WE
 Vv+ZoCUnx/HThTEf98zxFtCBjFaQ5Styl6+fzuRWB4NwIq+x2qZB6c9R8B7kGXfjnlJ1
 DEkMbFmB4+wF6bBzAYd3fcVCpQa4Ch0Bfb8m7vQtaF1EFqLktDE1vgrz97Jz1drptmf4
 ON/ak3IWor/M1kbt2XrmQUY+Ds1wyLq7cIMdJZQ1JEJ472tkaqF7AstG8UZa/Q5egq6Z
 z2dkbaY7mT92yuh190SHVTQrvaf6rqQDcmzThZ5sLK1mmiE2IIsZRoONSEKUkV1CitdK
 w7og==
X-Gm-Message-State: AOAM531mcCv6Dur4xa1+ClRKVm24RkMXSglSKFNFObZytce02Hf3v4G2
 dusWkHckneYAci+XGzxa7AivDk9Y/Q7yKcAwxg3Yit5M/EeC8A==
X-Google-Smtp-Source: ABdhPJzQii/niDwO0ZkSfHlucDogXbwygxqfzwfkhLQDnvd7dMDnIUuNuzIa1ld/NStNE8yeFz1DmtPXkc8l4Ebs3D4=
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr233361edf.52.1601911899983;
 Mon, 05 Oct 2020 08:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201005150122.446472-1-pbonzini@redhat.com>
In-Reply-To: <20201005150122.446472-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Oct 2020 16:31:28 +0100
Message-ID: <CAFEAcA-bWoya2pkqw1f4v_s2M2T6byfFgZSkgve-xE9uS5vxkw@mail.gmail.com>
Subject: Re: [PATCH] readthedocs: build with Python 3.6
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Oct 2020 at 16:01, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The readthedocs build is failing because we do not support Python 3.5 anymore.
> Bump the Python version in the configuration.
>
> Fixes: 1b11f28d05 ("configure: Bump the minimum required Python version to 3.6", 2020-10-02)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .readthedocs.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.readthedocs.yml b/.readthedocs.yml
> index 8355dbc634..7fb7b8dd61 100644
> --- a/.readthedocs.yml
> +++ b/.readthedocs.yml
> @@ -17,4 +17,4 @@ formats: all
>  # we require for other Python in our codebase (our conf.py
>  # enforces this, and some code needs it.)
>  python:
> -  version: 3.5
> +  version: 3.6

Applied to master, thanks.

-- PMM

