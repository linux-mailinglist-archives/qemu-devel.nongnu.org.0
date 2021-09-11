Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E949E407920
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 17:40:14 +0200 (CEST)
Received: from localhost ([::1]:49292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP56z-0005WS-Vj
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 11:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mP55t-0004n4-Gb
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 11:39:05 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mP55r-0000vZ-Pp
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 11:39:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id y132so3344881wmc.1
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 08:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fTJ6x9Yjfz+LUsHZ06kWykvAAog/meLy97eJ3kHsHjM=;
 b=aWh6gW1nwX1kpiNpRXioSH8EPA7lgSO15QiaITOvE3Yi327lExzEHb0Ik5vmzdegie
 wEDLXnLxZp5OmUUVMexdAmiW1P3PM3EgTajqjii6fDELaOmS+S/rnWpl/0wLLY3sqaN0
 Ev+IagPk8WWMhUca4h3SJ5eOztt8SwtjKcwaZBc+H+9MsLPoP/f8hD5XOwK3gTsjZ0pS
 mDTiSSbiT3a4cbIBh4pRngdtIA2z2cs7zj1MozQ9/Y5T3/YmFTMh1mnuOn1vx1AJhbBe
 6un9Wh0v8ShAG4524yYoPBtYlAKTvW+Xdw2VpXnPzZV8ItrJOjpVL+Eihc25Zne2e04t
 t8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fTJ6x9Yjfz+LUsHZ06kWykvAAog/meLy97eJ3kHsHjM=;
 b=R+zm1k+JBSSRQKYSRxdX7e5lKAnU2qp1cDjxs/igeX33YbMAnxkXBHGvzjPU48ND2O
 39Xqc3AtJKpYhErLGd98lclrgo+xEgVXLA4fAQxHSTouTiIA43FWfb5+tYXPVsxeDgZ6
 YxVHfJEfUPTp2G0dRwGBEbGoaXZTX/1uXPvXEXu5uCUtZUi+Hkjmn6/03mG7L7YGbmqQ
 CGhrDiQNzULbEckmlx0R9o3kjnpf9aWgkHmxrCvSxig7zdM5dpFreWX6MxBLGqzMluQ5
 TRjAcak1q2PMiFmK8FFjSENjeDSETsy956yEuDcROCfcDNQu3utVNZLzAXk2aQSYhgKy
 4VVw==
X-Gm-Message-State: AOAM530KPbv3D8rdbEDwF8XtxkYM3oK+dIKJNIYGj/fVWEM9IlDBj5lP
 kg27SWwOdMDXxHEepkHEpRp5eM7fNVah9RNSxKYYhQ==
X-Google-Smtp-Source: ABdhPJwkO1mfgsRb7+4yD2V/TsfeLZXLMQI14iv78enziu6UR1d8R6xlHzyKIGPr5FTAN4yf2ktlxlMMUi7znUMHzhk=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr3161515wmj.37.1631374742077;
 Sat, 11 Sep 2021 08:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210910203011.63003-1-imp@bsdimp.com>
In-Reply-To: <20210910203011.63003-1-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 11 Sep 2021 16:38:12 +0100
Message-ID: <CAFEAcA9eeaBQ5CPyd824xnFGdhkicUbtJByajdTe_Hd1d=H7tg@mail.gmail.com>
Subject: Re: [PULL 00/42] bsd-user updates to run hello world
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Sept 2021 at 21:32, <imp@bsdimp.com> wrote:
>
> From: Warner Losh <imp@bsdimp.com>
>
> The following changes since commit a61c30b8c8c3c8619847cfaa289233cc696f5689:
>
>   Merge remote-tracking branch 'remotes/mjt/tags/patch-fetch' into staging (2021-09-07 10:15:48 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bsdimp/qemu.git tags/pull-bsd-user-20210910
>
> for you to fetch changes up to be04f210f954bed8663943a94ece50c2ca410231:
>
>   bsd-user: Update mapping to handle reserved and starting conditions (2021-09-10 14:13:06 -0600)
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

