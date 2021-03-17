Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245F933F13F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:35:48 +0100 (CET)
Received: from localhost ([::1]:40232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMWKx-00057W-5h
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMWJv-0004Q7-6a
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:34:44 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMWJr-0002oD-35
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:34:42 -0400
Received: by mail-ej1-x633.google.com with SMTP id si25so2656996ejb.1
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 06:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/9IDaVqdrjiyV6VZii1YscIqxakdcutPOJ4wdQmUh9U=;
 b=T3LArWwO5YlzDmQql3hQuMd1xAIRd5Xiixtb8sKKrIqBjVliSLP44u6PqSvSNjyEwV
 6unjJAHVfpnv0kOu1Eko3BtP7RgQ+vdekLCcT+/zg6w2+JLF93aiIfXN7+GR7zNg1Urc
 zIfy5/EO/p9OzEvXycHnYb5bvsK8HQv7Gkkj+ScqTEM1B4tYEn7avtH7bxg+wyNhE9H3
 /8/XbAehSrR29+8B3JeZEiQIKx98BUKOPinAZTUPgsaAKRCSxQbfSwp2i9EtuVBz0+uw
 2GBYo8FzuaktTLJXtGX4SI/+/24qn8fKnk6y1OZd1QFtOUe7azj6B7MtJiNiP7BtJOGl
 uVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/9IDaVqdrjiyV6VZii1YscIqxakdcutPOJ4wdQmUh9U=;
 b=MP2W8wJjlHVeCRNhttUT+XFluEVhYRftRANYFmNsSE1DfNmOc5HOgehqvtrLr/5/iR
 oIuMqRatvJNRVpsfLLe8F4wAoqj+UqZS6oRzUM4RH+OCszKZrQ3QdEedLOLpwyJVQlx8
 +2tDXMpMxfhGlChgQnBltNEeiCQwjWZn49O+neAOC9pXlYv8uocoxBwLab+aSY3MuXSP
 gcgJx93ni3lSpKU18lVNVtz+1QV2nKJ/78G85kpoSJyPbwMt8/TqzI0OjPyQAn+C0Xbm
 tAG5O603Rpb6xg15qzRHBu9IoDPryezmD64VdDWtDe7kBzNT0nybbXCNiyWzYqhNQvbQ
 WKLg==
X-Gm-Message-State: AOAM532Of6eg/l2RxFxuKLKpLiuW79oGr83gqwoHLDGrqw2Do6bBKW4n
 3BlhyBoyv1FVMLlU+E+VkpZdSXvZY8iYi44HYnHoOrUN1UAPSg==
X-Google-Smtp-Source: ABdhPJxn+/6eJYXhKQj9msQAA+nv09VAfgusxXXzE787fh5ug4yHDBfAeBiaEw20cKpD1NK2nA1ANvfrdZowDGl2OdY=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr35092969ejj.4.1615988077617; 
 Wed, 17 Mar 2021 06:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210315204226.3481044-1-laurent@vivier.eu>
In-Reply-To: <20210315204226.3481044-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 13:34:14 +0000
Message-ID: <CAFEAcA-uxpQ6LDQzZTWaJdfYpCu=migVNY1Gez=bM8vWows8fw@mail.gmail.com>
Subject: Re: [PULL 0/5] M68k for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Mon, 15 Mar 2021 at 20:45, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit e7c6a8cf9f5c82aa152273e1c9e80d07b1b0c32c:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/avr-20210315' into stagin=
> g (2021-03-15 16:59:55 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu-m68k.git tags/m68k-for-6.0-pull-request
>
> for you to fetch changes up to e1cecdca559d552bc5ab282696301858a97c3e8c:
>
>   m68k: add Virtual M68k Machine (2021-03-15 21:03:06 +0100)
>
> ----------------------------------------------------------------
> m68k pull request 20210315
>
> Add m68k virt machine
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

