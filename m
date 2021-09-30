Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C1641DE12
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:53:24 +0200 (CEST)
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyN9-0007QZ-C6
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxo1-0007I3-Tn
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:17:07 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:41485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxnz-0007pw-UM
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:17:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso4649439wme.0
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6KrZMjGQvu56GOergFLp7pYLh7OxAULi573ii553fU8=;
 b=Rui7ovDqiSh5T69WXRxrnQUMfRiNtLz+l90n+tR1ib4Kh8LdInmQeC1d1iC2BFXQ6d
 k12pon0gsDW20DSlDfn5n2latx0IaisOZKaPbBIi6d0Eb9c+HUlhTamyEDkEhaeIFzzJ
 T0PMgcMyhyVAXKAVrA4/IY7k77d8LXjE+cfUrJRFkUF7XJ6lZo9l/KnBiNPHdSC0i1Im
 UssrDs92RE8REwz5UxgpDfkAlnT/SpDAXOlLsO39O1jqJ+j9vlwDir2dbB9O/vf9y4hZ
 bRxN3PyLyaOzH9UFoUJf8XuR8qOgboOa0dLhNZTimv6mlk4+L8bMs8aMn6MlfP4itlX2
 PyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6KrZMjGQvu56GOergFLp7pYLh7OxAULi573ii553fU8=;
 b=SIxnluzAav/QPktWFIxg/4UPo8jo7bjvYq7r80whE+HCZpgzqKiHnM4pPuiwVvFWTk
 rkzdytqBCDPfEWB3IPpTd70IwxbzV738khFhv2860eUelCtlbAYYRVz2CRxRqk1kSVEM
 N0m37IMZ6k3Anbtyc5HaHjb5I5skfbWzfgw3n5vwukvOGMBQF7xQDmZm/p/TXyk2LVhv
 WIBVI/kP/l5ZqStNZeJ3vUOBKfCJg+nJZ2HUr4aqjsdPkSbVXOhZXx/IXISnq/UMAOFz
 rZ8kaYyniVty1UMvBSD70P+oUw89VDfBjno2+FuGmHgIRSgSjMOk3Z7FcOjeSZefLLH2
 469Q==
X-Gm-Message-State: AOAM532UxiHQYEeZ1k9MwBZ+QuUWKFqrkppUG6ms1N28Vsugh3UBpnia
 ql2EgwxEaET+lzT6b2A7fB7U4i3FyjvM4bYD4XP1PQ==
X-Google-Smtp-Source: ABdhPJyDR2RnE/6neFLUgk7PgA4sHgQy+D6w5Hpp5dgeW9FPfNYlSIfOCK7LnJHJ1aH5Xvr1rzciKz8xH1rj8ZEY9ZQ=
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr10859547wmi.37.1633015021981; 
 Thu, 30 Sep 2021 08:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210930133250.181156-1-pbonzini@redhat.com>
 <20210930133250.181156-4-pbonzini@redhat.com>
In-Reply-To: <20210930133250.181156-4-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 16:16:07 +0100
Message-ID: <CAFEAcA9FWpRbKk6vqwZwahBASKJxdKt2Xh418bPCtqGt3MkNOQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] docs: put "make" information together in
 build-system.rst
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Sept 2021 at 14:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/devel/build-system.rst | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
> index 3baec158f2..0f636d620e 100644
> --- a/docs/devel/build-system.rst
> +++ b/docs/devel/build-system.rst
> @@ -380,6 +380,16 @@ phony target, while benchmarks are run with ``make bench``.  Meson test
>  suites such as ``unit`` can be ran with ``make check-unit`` too.  It is also
>  possible to run tests defined in meson.build with ``meson test``.
>
> +Useful make targets
> +-------------------
> +
> +``help``
> +  Print a help message for the most common build targets.
> +
> +``print-VAR``
> +  Print the value of the variable VAR. Useful for debugging the build
> +  system.
> +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

