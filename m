Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0A43E5CAB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:14:47 +0200 (CEST)
Received: from localhost ([::1]:54116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSWj-0007hO-Uz
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDSVG-00066r-TH
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:13:15 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDSVF-0004yD-5i
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:13:14 -0400
Received: by mail-ej1-x62a.google.com with SMTP id o23so2541179ejc.3
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NVAzobUHLDjoXsNN5ZQQUmr9uzhic/LhrkYwYHIzw0E=;
 b=uw98StjCHCg8wF7UX2smM9+B9LrHCpFo47Klfz1unaZVPpz3RMOy06ug/NKzR0snFC
 PXl01/yp2zD8Fy0FgsMH/Zyi+9t/LzRFaixatCzXGaGDjlbvmSMh2qgDk7b+rVHco6fM
 RNwxmbpmpZJWOTHbyXiJ2+4XeBnY/63PrfcxHggHU8CkPHWOwzRLAip1Sgr51BiInfJQ
 AQResP8Ew6Iq3DIK2ldsdI1mWMHDmhsFGnW+2FduIQ/Tg6bfBbUikMiJhoSgpibRxZYq
 0JsqcG7wnbUEtr2lMUpnk1lVJDz/BC4YpUnBBfIZ0LrBu7Ct9Q2igCGktKC0nmCgdeoG
 645w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NVAzobUHLDjoXsNN5ZQQUmr9uzhic/LhrkYwYHIzw0E=;
 b=J7TsY32cNjnZsH9/jzZ+KV+H+MaLOdUSh1jnJKYAleBDpRfN7UMxX87mzVaGsuIuxz
 512+koGHg2olysn7RWCSq6iGEQEU3IH/FXlBfXMApOE4ti2ORtspLGmg/tTGzp3CbSHX
 +PuwNTcPQTtOcMrXs4BGBree1zNTQKqdgPs2ejXoAIx1EdKNIWVKlRTlStfX7ws9ovII
 jozzpJZlFDzmvBZ0KsXsV6wD3kSZubdyDLUj4tTlrN649MWMMS3mj8BK/XJFT9NhB3Tj
 BXVGedn5ZMPKu7eIp/hnNw+s8EpQJBWocxfY4fyCkLSxIlLdnBZkveTUHATGntUgmtGe
 zkDw==
X-Gm-Message-State: AOAM530eD80x9N+7TkOhb6hIeMNAjMBsQfepCNbR4EoErWIDAgNkSeOE
 5El3rRMi8NcFv5AnCUHAzs+KGXs22On6jZfrsx3xLw==
X-Google-Smtp-Source: ABdhPJxSvsRXkTaHTXR5GPZXLd2oFL1DMwjRtoz4GEsm3wGvr11W31P49RlhRt099OGVzV8OsVfphySns1XRS3QhuE0=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr27541180ejy.407.1628604791231; 
 Tue, 10 Aug 2021 07:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210810121840.2525726-1-kraxel@redhat.com>
In-Reply-To: <20210810121840.2525726-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Aug 2021 15:12:26 +0100
Message-ID: <CAFEAcA9QKd+fOpHenZsx1ZYtkovH9bSnrpbu0xfiOGhzNQezJw@mail.gmail.com>
Subject: Re: [PULL 0/3] Fixes 20210810 patches
To: Gerd Hoffmann <kraxel@redhat.com>
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

On Tue, 10 Aug 2021 at 13:20, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit bccabb3a5d60182645c7749e89f21a9ff307a9eb:
>
>   Update version for v6.1.0-rc2 release (2021-08-04 16:56:14 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/fixes-20210810-pull-request
>
> for you to fetch changes up to 6ff5b5d6d521001135d1bd5c609e8834099f01d8:
>
>   ui/sdl2: Check return value from g_setenv() (2021-08-10 10:56:39 +0200)
>
> ----------------------------------------------------------------
> fixes for gtk, sdl and audio live migration.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

