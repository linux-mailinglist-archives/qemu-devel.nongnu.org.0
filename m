Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85755399D98
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:19:55 +0200 (CEST)
Received: from localhost ([::1]:35394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojW6-0007GW-HE
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lojVA-0006Q4-7V
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:18:56 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lojV7-0002LB-Bp
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:18:55 -0400
Received: by mail-ej1-x631.google.com with SMTP id c10so8134650eja.11
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DqVQzqcTJHgEovXWufo2ZLAulEmw6zmTSYrtNAcDa/8=;
 b=WE4sZyn2CubqkHSFxvSAmkpHJLbp8m0w12ZQ9tI/Z7SAgU+YFyeoULnWEUmXm/VDxZ
 8pTrg3IHiuRS1QQ4LlmOwMe1W7y/M8E+vpTHykEXzEqt7UZ+6eAysVZ/XWPbO+uTE8Bz
 +IrZaxWh7js4QaCliU3Q2UYAuNp3/Y6NXXHqXP+SIQRpUUK8SSg0PHQlVk7p5pKMANHw
 AfDo4biJVEi/pVBDjgpGxq3TanNJ524eslpfyv8Eo0jZXfW12lng8MLmHQUbzvR6yi2a
 mvesH/1h6NPh7R0hZI8Lop6Peio+GYAvI7fQ/51grvj2NhatjdhIt2ky9Ii1z6/2fueQ
 0cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DqVQzqcTJHgEovXWufo2ZLAulEmw6zmTSYrtNAcDa/8=;
 b=NIPdkCtJTOTABvCd2KVzzPYWY3n+f0s11/nvKFWcG/+PodLUK9Sy35A9U8uw8zTart
 tz1XLxK9WYQQai02ueSQDVWjxxJFBNBpOlyr7e5OYHTzLv/9evJj1z9SYZhC+zlc24KJ
 76hxH80I9yh17gEVwOWIk+g52n2NwxL5fY7Jm1jDf/5AyGMFPo3jIJIAFMek/aiQcZ5v
 We10K2sqhoPXwqqeJEGQkvES5kkjdf925bs3x5TZHpRVN9HbPLoZfkSJomZXcWF0c0uk
 ytZuhq2vJQbQT6Sp92wBMFcNQVMPfO79Hf5Axel0A25VzcATwijVlzkDJO+hnfNn3Ddv
 jE3w==
X-Gm-Message-State: AOAM533uTzk6nYi+enVaABx0V5HpN4QcEjZ2bQmNPm2vNbCkYmN/uPSg
 qBVDf11/GnNI4nGB0Jgy2QoNQKVfg+qThUzLYLBTW3A1fsA=
X-Google-Smtp-Source: ABdhPJxz8ZKwsPjqjwy87fEOwdOeDNCrGruNISpfi2MQH39qMIkuvFjsMBJb4wcCQgBmTCjYq505m8vLrLV9xepNZbU=
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr25813394ejc.4.1622711931280; 
 Thu, 03 Jun 2021 02:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210503161422.15028-1-dgouttegattat@incenp.org>
In-Reply-To: <20210503161422.15028-1-dgouttegattat@incenp.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 10:18:18 +0100
Message-ID: <CAFEAcA9xmF4V_r1HburngKXWKJgU6vFoKkpJ8QbsRSi3wG_sOQ@mail.gmail.com>
Subject: Re: [PATCH] docs: Fix installation of man pages with Sphinx 4.x
To: Damien Goutte-Gattat <dgouttegattat@incenp.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 May 2021 at 17:14, Damien Goutte-Gattat
<dgouttegattat@incenp.org> wrote:
>
> The 4.x branch of Sphinx introduces a breaking change, as generated man
> pages are now written to subdirectories corresponding to the manual
> section they belong to. This results in `make install` erroring out when
> attempting to install the man pages, because they are not where it
> expects to find them.
>
> This patch restores the behavior of Sphinx 3.x regarding man pages.
>
> Signed-off-by: Damien Goutte-Gattat <dgouttegattat@incenp.org>
> ---
>  docs/conf.py | 1 +
>  1 file changed, 1 insertion(+)
>
> FYI: For more information about this behavior change of Sphinx, see the
> relevant issue: <https://github.com/sphinx-doc/sphinx/issues/7996>.

Thanks for this fix; sorry we didn't pick the patch up earlier.
I'm going to take it via my target-arm tree.

-- PMM

