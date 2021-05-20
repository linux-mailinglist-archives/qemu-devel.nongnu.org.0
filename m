Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A85338A08C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 11:05:55 +0200 (CEST)
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljecs-0001eg-2V
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 05:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljeY3-0006PV-DX
 for qemu-devel@nongnu.org; Thu, 20 May 2021 05:00:55 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljeXx-0001SO-VE
 for qemu-devel@nongnu.org; Thu, 20 May 2021 05:00:55 -0400
Received: by mail-ej1-x633.google.com with SMTP id u21so24004901ejo.13
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 02:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gph9QBLGq7MzueZaWzi/Cxqb6i/+uzLDlKKFVxqdhnw=;
 b=nalvt/uGaFHQtNmWPQI04H4GM/hRofO1J7YDQ2KAqkB0sYfGvWkS401rLTySellWUv
 15Ux8w7E6ojBEnNGmaaEtgudQ1AIV15gIL0z+Y/dPUS3bci6lTQU1YLYm0i9LSEjY3Rk
 7r+JO8RZrc9iHNSNcveaWvpWikoVIYBI1GWYhbQm5aqAM8QwQpyATdAknQ4mZ/VdXsiY
 VNxt0zlqsrZuoNUjD7OTAgzpDgZjGJk8DsQxXzPU8fbHRFoDiLp52uEroCb1AJbE0YSH
 yszen8tI4tK3W0ZNvJ2WzHQerDUb28mfkqrOILNx9MrfEXZl00ewhZlWv74p9F/D/pH+
 ahow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gph9QBLGq7MzueZaWzi/Cxqb6i/+uzLDlKKFVxqdhnw=;
 b=fphvUxKK/b0aB5DmJFXIqEqXuN1zKhdEABa872ezKJ+3CAzqW8Ocm5MnrS9Z0cEqiN
 I3kv5OHeXKKmUIgsh0ZyWwcHPSwcRxmI7WoF7Cyg7t+JHPdM9XDUgkgk24wn9tPTDGuv
 l35exNp1BYvuvOFR7YsvexBpH1EmrdnSJErEV38cLgwOky4WTiKVlulwwDqiX9lT0Nua
 CIBTf/rWWyyw/zbOKnmOXJXWs35Xr3oEmIX4J6/lGR+2Q01PpkQjiMtgxaqCjkFsJ1iz
 9VLTav348E57lYeUCng6m6B7UeifGhT23o3KYT42+Yog7EXW55R4Mo6mD7ZbbLQyQEeW
 xHqg==
X-Gm-Message-State: AOAM530r4qB18jqWpUWTqaunsDsz+1LP6zOnmKiUy9Krvpr57EBjFyBW
 zzbdZ8WMQ1uGQmygerL119Dk/+qY8Y3bORkYaIBUyA==
X-Google-Smtp-Source: ABdhPJzLEuCmyKdEb/d+w1qzIit66/PscGYBMpnqEMaycanG9oa+ridFy28XypB4c/3z0tqADi/aZ8Y+bTtnrS21pIM=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr3523423ejb.407.1621501247681; 
 Thu, 20 May 2021 02:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 10:00:29 +0100
Message-ID: <CAFEAcA8MqfNKX8EFO9ow_CqRN1FHmegFCa6auJJQUC_rNLGPqQ@mail.gmail.com>
Subject: Re: [PULL 00/48] ppc-for-6.1 queue 20210519
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 May 2021 at 13:52, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit c313e52e6459de2e9064767083a0c949c476e32b:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-05-18 16:17:22 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210519
>
> for you to fetch changes up to e543f946856da31c3a7a45ba193f106e042ad907:
>
>   target/ppc: Remove type argument for mmubooke206_get_physical_address (2021-05-19 12:52:07 +1000)
>
> ----------------------------------------------------------------
> ppc patch queue 2021-05-19
>
> Next set of ppc related patches for qemu-6.1.  Highlights are:
>  * Start of a significant softmmu cleanup from Richard Henderson
>  * Further work towards allowing builds without CONFIG_TCG
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

