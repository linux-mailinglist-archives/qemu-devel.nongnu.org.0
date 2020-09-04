Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B725E3A9
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 00:24:48 +0200 (CEST)
Received: from localhost ([::1]:51400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEK8V-0004ss-8J
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 18:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kEK7e-0004RS-JA
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 18:23:54 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kEK7c-0007mr-VT
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 18:23:54 -0400
Received: by mail-ej1-x62b.google.com with SMTP id q13so10483337ejo.9
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 15:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3SI8tRdFcqEaru80X7B707qYluiulAKGUujyCqRkplU=;
 b=tmQWbSGV+SUt8RMpdcfBLQV+wnQp2Dam4Qan5wKqO2FJN9fYG25Rtd42Pv3gGL6IyL
 HvOrZctqW0bEBuhEHugxIEnKTpO4v5MKzOTb3taD0bmak5AfUCIN24qhWs1x2JVx/OCA
 0HuU0KHFaCsSrZNJ+jmu+kgyqx58ZxBrwMuv/mKNq4TrcVnxgrLtRMKODHMrtGeo0JuC
 wYCWZg9HH/0tGZ/QEXTqUf/uVueq15WUljLhpZnws5UFUI8nBIK1XtAOGOo3Gjwwibbq
 FxaMHfyaYIYxX5vqcbpl8uUQviLMtIjCIghSOoRF8VjlQiSoYda6eXC+T3gqmxkKGkan
 TcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3SI8tRdFcqEaru80X7B707qYluiulAKGUujyCqRkplU=;
 b=fWrF+pyoGtndhFVSTQ6vv7iM2kwkDERe5HwAQcpLhvEHym3ntUJk47796WRqTPsMVc
 dPj5h5WU2e2/w3GrVeyD9TvUsybO6OKxLbndI87fESNuh9LQ/UaSO++HhR4w3zIwiS/Y
 9QJEg2HwWk/g2FrvMgnE5wKZ8IrTSJlsaqyI/vqDKW5fOxsr+PzVQzTGLVdA8ChnrEO+
 EnL3uO1rNnPitrKm1ui939dJBExWkOJBIs6IW86gjOYNAbYz7W6rd2JeYnFP1/MyO9+W
 klPFF77tcNyAE8RNmyownkHBtCMX5k4mKZXGxAFM/eEwukzsIYiwSEZhe8y0PRCGuN9Z
 dFew==
X-Gm-Message-State: AOAM532/Fqj7Ei3/zg1kpwiNRvQIoUrUQPm5EFQqvwYn3cRY+84jMdd1
 E0473u/Bf26daoUzrecLFEouBtWIfI04su9/pVaf1g==
X-Google-Smtp-Source: ABdhPJwFfEY3C5ObP7oIDa8+bsJq/Nj+jYgMdk+z/bd6YYAM+oC44fURC/0QGEO0AhjuVPP075/qcRBaAFbIAQDH34c=
X-Received: by 2002:a17:906:24d6:: with SMTP id
 f22mr9465645ejb.85.1599258231193; 
 Fri, 04 Sep 2020 15:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200902232701.13299-1-laurent@vivier.eu>
In-Reply-To: <20200902232701.13299-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Sep 2020 23:23:40 +0100
Message-ID: <CAFEAcA_Aci2VZQOG7xherNKKntnXV8_5WTUHf3tuC_fEF7QTMw@mail.gmail.com>
Subject: Re: [PULL 0/9] Linux user for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Sep 2020 at 00:28, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 887adde81d1f1f3897f1688d37ec6851b4fdad86:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' int=
> o staging (2020-09-01 22:50:23 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-5.2-pull-request
>
> for you to fetch changes up to 9a5a5a05523651d4c887388a6e0d0e446ffb279d:
>
>   linux-user: Add support for btrfs ioctls used to scrub a filesystem (2020-0=
> 9-03 01:09:35 +0200)
>
> ----------------------------------------------------------------
> Add btrfs support
> Fix MK_ARRAY()
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

