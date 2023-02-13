Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC95694D05
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:37:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbnr-0003sI-9f; Mon, 13 Feb 2023 11:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRbnk-0003rx-VB
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:35:37 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRbni-0002H4-8A
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:35:36 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so17558218pjq.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4eiOANjcOPrGlNYJNCPfNFOaVVBwquXKj/iPMoMLi9A=;
 b=esLQrXx2crH0eaEhI4ckDM05+ZyqiqEqsjuPxGAzUQR0X+G5C0alEB4NMWJcnOMmOs
 Ln9m2q2HCGrp8NVQ5CaWbZWQFw/tg7krlpmkacET/83AW5hsTwUe7RglFqGbIxZ/sA39
 MklQHufepBSXKltzwgdMPgQi23Vpdu9bQILuPsyb/Z3yFbaiEnKWCmAHlD44fj564dK9
 4pAXbwykrK0z4xDvcSJjyftr6q8wXkg7xocQIm/5KjDeqdeBy3bssCXO4Q2SwgmEGyUe
 FAOlYoYE2nMRCf1ZAoaXRn9nrNqVXJqep4f/a5EJaDRcsJKoaA4LgeFdQgNP9ZHlqeAE
 ci2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4eiOANjcOPrGlNYJNCPfNFOaVVBwquXKj/iPMoMLi9A=;
 b=hBvxGQBZwzfIKssgg15S02iip5QedHinEc+LTbmBlQs1zr3OG/SBo0V0oL6yPVADfG
 PlPeZQRkkB/Fpzhro13Uq6mmA1F4N5AyuRccXX02DjLaawL0KLKuHFCHkVoiozr8P/2p
 O2MIIvpHeLOSU4plOO8mlTjFih5lrwgr/hpisvmeOvzgsz5ngiGs21am01Rs8ZIcxmvj
 6lexjH7niJY6r38pPxbQhvD8jud/M6hlus9/TUEnT8car7i+/JC+VRe2pIM3EghjnxYZ
 GBbx3+SceaL0eIUvDmKrd0KrchVs4vQaSjVVJy6ihuTNhJ+8gXHxBM4D5pVsuE7L2YGE
 UzyA==
X-Gm-Message-State: AO0yUKWnUZ+VYoQ7lpxplusU7vjgGDPX+S2tRok16Uo8PGPcRxPh1j6M
 IATPMRmhluaIYBXV65wB1KejuOG6GRUQjy/nbn9JgQ==
X-Google-Smtp-Source: AK7set+beKITcMdcKCuRVDmUZNOrMymtP4X2wdBD06Xp5V3T4nVgjBfq4+YSu6Q8bNtTD/fNbyizMCuxpS8dvwsEjR0=
X-Received: by 2002:a17:90a:384a:b0:230:bcbd:b871 with SMTP id
 l10-20020a17090a384a00b00230bcbdb871mr3880707pjf.75.1676306132668; Mon, 13
 Feb 2023 08:35:32 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-2-fcagnin@quarkslab.com>
 <CAFEAcA8cOKCDF5_oxNLDd7JzvwUCC4_g_8RRmwPK3C2axLHuAg@mail.gmail.com>
 <CAF8_6KmYyCwKEoNx626uEKUJZAFB_MgLRHrTyeAkDdC4C2YfMg@mail.gmail.com>
In-Reply-To: <CAF8_6KmYyCwKEoNx626uEKUJZAFB_MgLRHrTyeAkDdC4C2YfMg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:35:21 +0000
Message-ID: <CAFEAcA8U6GKNHx0wrY3V6kx5nLc4OWXUExhb-WprXZ2kn5ES5w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm: move KVM breakpoints helpers
To: Francesco Cagnin <francesco.cagnin@gmail.com>
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Feb 2023 at 16:28, Francesco Cagnin
<francesco.cagnin@gmail.com> wrote:
>
> > New files must all start with the usual boilerplate
> > comment stating the license and copyright. Sorry I didn't
> > notice this in previous rounds of review.
>
> Pardon my naivety, since the new file only contains code from
> 'target/arm/kvm64.c',
> should I just copy the license and copyright comments from that file
> (and adjust if needed)?
> I'm not able to find any particular procedure to follow.

Yes, if you've taken the code from somewhere else you should
use its copyright/license info.

thanks
-- PMM

