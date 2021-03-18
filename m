Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D4340476
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 12:18:32 +0100 (CET)
Received: from localhost ([::1]:56414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqff-0002Q3-3V
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 07:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqdJ-0000up-Vx
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:16:06 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:38429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqbN-0001sK-HO
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:16:05 -0400
Received: by mail-ej1-x634.google.com with SMTP id r12so3287660ejr.5
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 04:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F+fzVnqxNaiRn/XRmCaMjl1EEr40D4xROt0z9xgB5GE=;
 b=NquINsxE2l5FyFe3thTQ0k4EplUYEtU94fowiuIPZ7czie3kyXVGAGFwEWKkUhZSp/
 aLUTJXhxWlFtACsIjcaYkYouz61HUwYXoY4dqjXQKQvUQZBANiEIAhP3h4w+DlrTF8wk
 YN1tB1rAlRqImn+OZLhcc2MtltBzrgVws4IFmUIn9PflYDFEAl6tlqvlwT2Rm/2Ld4ex
 cuB3DuCZLpPvaAexxE2IXBxuga58+HBiX3LSuobmlAjH7miU9NkXjjp6pP2yevX0MaFM
 CwVbL1epetYYprUFtXdvZnRaNZ5HDjOnz3nH5he1NeXgwsviUvdSLf5fOV6O3c+rY8bO
 ft6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F+fzVnqxNaiRn/XRmCaMjl1EEr40D4xROt0z9xgB5GE=;
 b=K48YM3boQpb7FY6fv1edFsRF4A30M44P5ZHBnlpaPCE4SwHbQ3FV7kbMJoavqohySb
 dUwYHWXoviGNn3GFtfmNrGGX1szj8F1R6OYLJeVZItHPyqbee6NqOR86HwRRfnkHFxBi
 gO+RtfaSY4dh3OHgLOpzu49Dl34WNjWui1ZdbzCkPmtS/f9o2VF5CaDKSc9ocFjueHOm
 AcjAqTQ0ok9WRxlJTF7RgECH+s2qmrSjYoVzGLexJ+4jSiWXF9iRHaxUe/dxapvRSuP2
 gQxk+/FxutmMdCGMZNBrHhHZH9jTFPVuya93gPRQOMJvrIfCj1vaty6xaqA5+urPvs+D
 a4XA==
X-Gm-Message-State: AOAM532Ww+lVIPuUOk/UOL5mE31LKwUFX1uPuwibEcHW3SoTs/ztZ3f3
 WYn+h3yJYkpdfoJM7wFpORHsoL4Q/JtyA92BtRoSpg==
X-Google-Smtp-Source: ABdhPJzvgswipue/zhbTXkJKcaKAQTm3/RPI2EEHhGHze4LPeOD6Mn61grTLDq7MLA0OylzFaDa8nF2xaaIr5Ap9DjA=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr39621255ejz.382.1616066044014; 
 Thu, 18 Mar 2021 04:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210316211631.107417-1-laurent@vivier.eu>
In-Reply-To: <20210316211631.107417-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 11:13:40 +0000
Message-ID: <CAFEAcA8Kq_e7rnc_utwuBcqoZjgyxueNfPAPTQ5hdE9xdJSZHQ@mail.gmail.com>
Subject: Re: [PULL 0/7] Q800 for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Tue, 16 Mar 2021 at 21:27, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into =
> staging (2021-03-16 10:53:47 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu-m68k.git tags/q800-for-6.0-pull-request
>
> for you to fetch changes up to 30ca7eddc486646fa19c9619fcf233ceaa65e28c:
>
>   mac_via: remove VIA1 timer optimisations (2021-03-16 21:41:37 +0100)
>
> ----------------------------------------------------------------
> q800 pull request 20210316
>
> Several fixes for mac_via needed for future support of MacOS ROM


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

