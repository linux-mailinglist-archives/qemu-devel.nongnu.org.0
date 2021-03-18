Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854723402B7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:06:58 +0100 (CET)
Received: from localhost ([::1]:44890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpYP-0001pi-KG
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMpXB-0001Gl-N7
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:05:41 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMpX7-00079u-70
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:05:41 -0400
Received: by mail-ej1-x62a.google.com with SMTP id jy13so2970522ejc.2
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yjGyVExPAWRxSBiLtFUMnZL8zzq629livM0MpP9mo8w=;
 b=mlPl0GzaelAhZJxxr8R6JZJINQgvu1e6bvoquiOnZSUj4USZXkv3ESKm3XGyAYwozK
 jzuusFLnvcGVzK81JDJl7TWywOiVgIdeCHQsoXX9P0vlqtpUfY86rlLrUU0TjBUCraEW
 Wed/ZIX0VyBp3T6w3Uyxstdht2ohPHOcl3xPeapkSnuVrq0quuldgO52dBu6ZOjG6mYW
 hHdFagg+mrTMe2XGEFTMZQLfmRQEsuhdJgBvcvUpE/gbTLJaWvycRdNxkDmFPsHwqFFS
 YPaSzusRPpRmNMjC1Qow6vPFy2kg41gEirVlj3zbxN2CFGxOVYeN/ErBnC3VNCXNIHWf
 LvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yjGyVExPAWRxSBiLtFUMnZL8zzq629livM0MpP9mo8w=;
 b=InPI1N9b5tvZq6CE9QuY1DyhhTKKhXFX6S4ErPPvQfBKR+f0CYjW5SEZIGP14gmrdr
 zX7Ct+377snuL2BR3tML8xYuloLCbV/BqAht18VZU+o4ZamM/0RgTt0AjhdU9UzbaHzn
 NVGhwFM9qRQm3PrbeKQZQ9NykqFqhVJ9zYpQllNOnroBpDowrNUElEph3/FoNm8zg9Wn
 cbi+/8x677PCkx02DCqpW4h2dgWy/COL/l5PzWKUGvhG9CSjGxE13PqjpXB9X2tJ56OH
 v7j10QyZaS/aGnUWxdUVMeStu+1EUXaPiKtpGRvbm6hKB31t6deTyfVm4JebHchb1CYJ
 aKow==
X-Gm-Message-State: AOAM532MJxcl40niRDNAM9gmLOhi04fuZAm3xxopH7fL+YlRV3S7ThOw
 T16sFeQitwt3c1Cd7UWCQxcYXeCWS5MlaI8PoE7DnXvhIoRuaA==
X-Google-Smtp-Source: ABdhPJyWbJwo+mjIIijnQDeVdHYXPuYaS+K0JYYOIy20mghSU6zGAyGoMec7OUL9ufDZLCPpI/JElYhkMO+XKO/SRPQ=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr40386184ejg.482.1616061935321; 
 Thu, 18 Mar 2021 03:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210316211531.1649909-1-pbonzini@redhat.com>
In-Reply-To: <20210316211531.1649909-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 10:05:11 +0000
Message-ID: <CAFEAcA_Aq68A3GWDSy54ikxSfU4EoYedHefw5gyt2WXLPysatw@mail.gmail.com>
Subject: Re: [PULL 00/16] Fuzzing + bugfix patches for QEMU 6.0 soft freeze
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Tue, 16 Mar 2021 at 21:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-03-16 10:53:47 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 8b858f9998a9d59a9a7188f2c5c6ffb99eff6115:
>
>   qemu-timer: allow freeing a NULL timer (2021-03-16 14:30:30 -0400)
>
> ----------------------------------------------------------------
> * add --enable/--disable-libgio to configure (Denis)
> * small fixes (Pavel, myself)
> * fuzzing update (Alexander)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

