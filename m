Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A273E2E08
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 17:56:40 +0200 (CEST)
Received: from localhost ([::1]:40076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC2D9-00036S-Br
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 11:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mC2CD-0001Fp-1j
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:55:41 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mC2CB-00075b-7H
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:55:40 -0400
Received: by mail-ed1-x529.google.com with SMTP id ec13so13738294edb.0
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zBRGYA921cO2/6Tei4mSQTFujTF44jhAjb9d/tumvC4=;
 b=ThUjZvbQkOyzityJyFSpr8rmmijR7OEGvLGOvxLSN/K8safbVzIV50Gx1+gnwxwlHI
 jbM5AbBXJtWVNF6/YtOmiW2CeOJ4R/FIUjhI3WqCOUn2+5yEsy0eFU5Fc+iTgPIl/lPf
 DOyngr4nHw7NcWvA0FxvsN3m+0lNafCFwHJWrtwBenXbsI7wIV4q3V5YGt5J8zjWLCoy
 wmimHINwJ5yewRYw2QLLLjkg95jYKgkW5wwoBM/v/xzUNHPosA9Yu1qAKUgJ6ycOC57G
 gERlTMGFqWbYtWZuyV+Vd7kVCG5KqDE34WvNEHHhaLaY2tcT+DyMUWw/4aqVSakfTR9Z
 5Z+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zBRGYA921cO2/6Tei4mSQTFujTF44jhAjb9d/tumvC4=;
 b=WsRwjOBm6ATlV7sueCzSLqnQ7o3QjvYphFOsfBWiMsf5d0AzkVCI4ukfFxEB4t+ab7
 HNGwRYQ3OYigQ9D8pENYZinYSZcFDysl+T51rNeENDNxov7BtDs6g1fuBEQY5k36D7GR
 38hggfFO/tym9qQNeFFmRjUSXRdYcNA4vi80t6+PKI5G9JL25ObKBlxOhcSAXkEawBqA
 CY6OSz//cdzIIb4/ubgwBIyqHbYJgeNtrlh413vaa6KaUA/pezF0nVhqKhRZxU9V/SjE
 qxJ63pWna/WC7mDChJGy57QbYGGW9rX4txsoH+nHGO+aurwDCy95ihOY/5xMOwim+dWP
 pk1g==
X-Gm-Message-State: AOAM530dNYT/h/rNTWd2Qj/0mseOJhMZD0b5fTdY7kOTBori11Ha1Ykj
 oi6RhcZHonzf63rYTYALjicDXh0h6uN3SA4Ez/X9nQ==
X-Google-Smtp-Source: ABdhPJz7gkuhl0qqL1qu4NcqyHrPjadHEKIjp1oGyem5B74ygYSrnoxGoEBM7jK/JmSaWXsvuW5MXhY02SnZ8aqQV5s=
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr13707115ede.44.1628265337635; 
 Fri, 06 Aug 2021 08:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210806155132.1955881-1-jsnow@redhat.com>
 <20210806155132.1955881-7-jsnow@redhat.com>
In-Reply-To: <20210806155132.1955881-7-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Aug 2021 16:54:53 +0100
Message-ID: <CAFEAcA9ARWATdzooGteH99e4xe=hrhG4YnpgtMHqOWtkzJ5DWQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] docs/devel: create "QEMU API" section
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Berrange <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 Aug 2021 at 16:51, John Snow <jsnow@redhat.com> wrote:
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  docs/devel/index.rst       |  4 +---
>  docs/devel/section-api.rst | 10 ++++++++++
>  2 files changed, 11 insertions(+), 3 deletions(-)
>  create mode 100644 docs/devel/section-api.rst
>
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index b146ce00f7a..9f9e96204fc 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -12,14 +12,12 @@ modifying QEMU's source code.
>     section-community-governance
>     section-development
>     section-testing-debugging
> +   section-api
>     section-tcg
>     section-subsystems
>     control-flow-integrity
>     s390-dasd-ipl
> -   qom
>     block-coroutine-wrapper
>     multi-process
>     ebpf_rss
>     vfio-migration
> -   qapi-code-gen
> -   writing-qmp-commands
> diff --git a/docs/devel/section-api.rst b/docs/devel/section-api.rst
> new file mode 100644
> index 00000000000..d62b614fe3d
> --- /dev/null
> +++ b/docs/devel/section-api.rst
> @@ -0,0 +1,10 @@
> +QEMU API
> +========
> +
> +.. toctree::
> +   :maxdepth: 2
> +   :includehidden:
> +
> +   qapi-code-gen
> +   writing-qmp-commands
> +   qom
> --
> 2.31.1


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

