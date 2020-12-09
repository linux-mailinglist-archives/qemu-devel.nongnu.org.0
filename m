Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1415A2D4B96
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:23:15 +0100 (CET)
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5zV-0001rz-Jp
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn5xM-0000jp-H4
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:21:00 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:44483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn5xK-0001K0-Kw
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:21:00 -0500
Received: by mail-ej1-x641.google.com with SMTP id m19so3986923ejj.11
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 12:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aK0O6Cw1oeADRcE2fDIkx0Ub989jlKNAvqt9X/LiIpE=;
 b=wgbAK18+9b1vK3JJF81I/Nwg4DI8tjhX6atfMMbH8BQix9hS6qZbnian2u25s8isk5
 +WXu0Wuta9uxWc4RRnfqCNGrpEABKTAFbpX8Q31uxiO6QV7WyBuvZq8lJ9K5edstFVwh
 b0etdTgVT/PX9jX+1vCTzheRAC+qTqAbX1diA0FzmWWA8Byo2IviV0riMe0ojeZlaG+W
 wAeezKaYVTIftEyHbqIfSDbtJm4MzYMUiB9xT0mT5K9G2DponrIgjRZ0YuWWFI0A9HeI
 UvEWhcQ+pzgjsEBdROyZw88jZ3iMdzOV3xh32QqzySzSRHqQX9LUOpMKKy2jefUkTkDS
 S58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aK0O6Cw1oeADRcE2fDIkx0Ub989jlKNAvqt9X/LiIpE=;
 b=hlNiuYK0QzzDKicIDMe5iCJQct+OZRETNed6ZMdYZ0tps9XDXPsokZ/Roit1R3Q1vZ
 q8we4vFGGf7IzU3A58ogq0DNhvNss7Y0v7/MJNNmJ4cgjIM5DR9lrM5ge5PvwPkRyIYZ
 /Q4ahzNSxevAje876f1kGa4oSXdaFtaK/NVeG4jSor4zIDrCIlQWh2OB4CnPl6d/Hc2E
 GQRPVLDPKs7uUbK9tzWWbOHJfP2fjn3Jsr4AE5drU9Y/gm2VNi6Gy1hk9YWCq/lWYF2D
 EJeWIdrdbxHHf2c6EIVXvHju88NB9FmTMFNB587k1Q7Az987P8FPxVaget70qTXC7p+p
 EJVA==
X-Gm-Message-State: AOAM530uUDKNDrhlYB8oBK79OWWPpVs2WXKjE9JRWda7fwUuTJUTr4+I
 TS0bcy0Jct/83Sugjlx8Yc2+az42W0XztfyugTLW0Q==
X-Google-Smtp-Source: ABdhPJxFXWxOGOdhpDOrfVLjnnzWmt/2E9U/6arUwQ4eTGf6ajZviI+L9zmeo+Ab8rs9gcK2GwhjI2yGPdUc0D7xUh0=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr3471397ejd.382.1607545256827; 
 Wed, 09 Dec 2020 12:20:56 -0800 (PST)
MIME-Version: 1.0
References: <b975422f-14fd-13b3-c8ca-e8b1a68c0837@arm.com>
 <0d0eb6da6a11f76d10e532c157181985@kernel.org>
 <20201207163405.GD1526@gaia> <874kkx5thq.wl-maz@kernel.org>
 <20201208172143.GB13960@gaia> <7ff14490e253878d0735633b792e1ea9@kernel.org>
 <20201209124443.GB13566@gaia> <ef14a5158fc65c00f6c3c842cfa83b2c@kernel.org>
 <20201209152741.GC13566@gaia>
 <8c39b104-39c3-7cca-82b9-2e47d7cb9a9a@linaro.org>
 <20201209183920.GI13566@gaia>
 <6b9072fb-1232-e9fb-0b97-e69709980f99@linaro.org>
In-Reply-To: <6b9072fb-1232-e9fb-0b97-e69709980f99@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Dec 2020 20:20:45 +0000
Message-ID: <CAFEAcA_K47jKSp46DFK-AKWv6MD1pkrEB6FNz=HNGdxmBDCSbw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Haibo Xu <haibo.xu@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 at 20:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/9/20 12:39 PM, Catalin Marinas wrote:
> >> I would have thought that the best way is to use TCO, so that we don't have to
> >> have dual mappings (and however many MB of extra page tables that might imply).
> >
> > The problem appears when the VMM wants to use MTE itself (e.g. linked
> > against an MTE-aware glibc), toggling TCO is no longer generic enough,
> > especially when it comes to device emulation.
>
> But we do know exactly when we're manipulating guest memory -- we have special
> routines for that.

Well, yes and no. It's not like every access to guest memory
is through a specific set of "load from guest"/"store from guest"
functions, and in some situations there's a "get a pointer to
guest RAM, keep using it over a long-ish sequence of QEMU code,
then be done with it" pattern. It's because it's not that trivial
to isolate when something is accessing guest RAM that I don't want
to just have it be mapped PROT_MTE into QEMU. I think we'd end
up spending a lot of time hunting down "whoops, turns out this
is accessing guest RAM and sometimes it trips over the tags in
a hard-to-debug way" bugs. I'd much rather the kernel just
provided us with an API for what we want, which is (1) the guest
RAM as just RAM with no tag checking and separately (2) some
mechanism yet-to-be-designed which lets us bulk copy a page's
worth of tags for migration.

thanks
-- PMM

