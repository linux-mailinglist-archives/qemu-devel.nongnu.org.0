Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD712EF6C7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:51:39 +0100 (CET)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvvG-0004Bu-H2
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvtS-0003M4-Bu
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:49:46 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvtQ-0003DX-Fs
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:49:45 -0500
Received: by mail-ed1-x536.google.com with SMTP id dk8so12103389edb.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 09:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Dw3F4bW01gMZAAFuqJYaHKMqEjIeyopzEUtx6he13O0=;
 b=GGyz0mt2x54quZ2QC6HIiKls7qs2vGmvbbl1lVGwjmCZNi0pbo+OpUV2CoSlxtYQv2
 v77NiNYS1G0alvpMweJWgjfybaKSIOvkXm5tYl84W5lRZmPkSV3D4uk/aR9dPDyS0Hha
 rG4sou8ih2f5Uz0S3oFbxsbbxMlVku0wG0FJxf9m0ZryJyPKLsz/MYhuePR8qk6vOpvZ
 oPROUYb/nrx46rHe8yoHfE5JY6z0LF2dIgSYvfjLVGZOEw6epkIGysXy3lGiPTiUGlSK
 Qq32CKFkxU8ZwJG62Vuzbs2k48XG/9OvOHpXs18Eh6l8n/jcrpp7pwgiYlgB8hLQr4MP
 NKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Dw3F4bW01gMZAAFuqJYaHKMqEjIeyopzEUtx6he13O0=;
 b=heQlmUM+dJhnKBMLKfde+5gy7V7J5FuhjffblvayBP1hNWp8AsYl9+VVWTyB1xCTdx
 6duOmV9eRlNwjLoSn3/JLJDncuwF5SVHH2GBTwP5kKB/wVsmENvsPbdc7nQnVbcc9ec0
 pB0LDbm6pweVPeWxbAeBxM5YiAeMYrZ7naphmW7ZVPpjTYusgLTVAQl1z31D7dtVGRs/
 OhfbfKODn9j2TInjMs/Ji2/7NQK/CVQQwwMacO/OmGGg7ZSq+PrkZ4Bbfs6OHQetF4zK
 Nriz7BGJd/Hr6YIPzIbEpTvcotJjFXgV3WXT7F5sE+ghblxjEKadfUvabB9Pwr5Z3QPv
 HAPA==
X-Gm-Message-State: AOAM532O2FA6Yph3yZnc+XvCybSSMCryU11WDcm21EoG+vgtuAJVlJ9g
 9AtG6fGvTJlhzuA87ePKEQPqr1prbJXTw0/1EKVIBkAWx+c=
X-Google-Smtp-Source: ABdhPJyRHB8hOxocIdt0gv1GqBlJqkyuIxu/dpOLqbi+jy7fQ9ExgpIaona/2r/CbPbodm/H2wUBVnIDug25RlsnQhU=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr5985402edw.52.1610128182244;
 Fri, 08 Jan 2021 09:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20210108153621.3868-1-peter.maydell@linaro.org>
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 17:49:31 +0000
Message-ID: <CAFEAcA93-13NZY_om35rRYOXimWDHMndGdxjY8NwGarzbgDwwQ@mail.gmail.com>
Subject: Re: [PULL 00/23] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 15:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Nothing too exciting, but does include the last bits of v8.1M support work.
>
> -- PMM
>
> The following changes since commit e79de63ab1bd1f6550e7b915e433bec1ad1a870a:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210107' into staging (2021-01-07 20:34:05 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210108
>
> for you to fetch changes up to c9f8511ea8d2b80723af0fea1f716d752c1b5208:
>
>   docs/system: arm: Add sabrelite board description (2021-01-08 15:13:39 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * intc/arm_gic: Fix gic_irq_signaling_enabled() for vCPUs
>  * target/arm: Fix MTE0_ACTIVE
>  * target/arm: Implement v8.1M and Cortex-M55 model
>  * hw/arm/highbank: Drop dead KVM support code
>  * util/qemu-timer: Make timer_free() imply timer_del()
>  * various devices: Use ptimer_free() in finalize function
>  * docs/system: arm: Add sabrelite board description
>  * sabrelite: Minor fixes to allow booting U-Boot


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

