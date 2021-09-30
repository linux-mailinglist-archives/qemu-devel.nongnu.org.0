Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0DC41E296
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 22:18:01 +0200 (CEST)
Received: from localhost ([::1]:46154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW2VD-0003ym-NQ
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 16:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mW2UB-0003FG-0h
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:16:55 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mW2U9-0007hX-6r
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:16:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id m22so6566508wrb.0
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 13:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GmkDvPL04FvesZj70C8Bh1QPWqcxeRqls9Hwy9LOCjA=;
 b=SQJTQ2lmb+90p6diQToGUcagD0WrE83+aGDW5aVuYii3m6qagRUo/j+NDgpVQn4e90
 GXTmtU9EJgX1SkYvBqfowUBj4eyMX15TRjjIc1sr1RSER1HhvqG+sNl2qfeuMTgGGMqD
 G9mu9Y6ift4t/d9oSWPApJ3oG4g6b2NQl9FSyz46hoCrx8CQ8XiehpogKouf8ZfwxA+Z
 Jo5+AQtatDjeHlgXTrFrL2qyKrx57ifzJ8L/opvsKVBTe8pXl392Si4C4PQdQg3DSLh3
 i/h22CuSQeTgq3NFpFlbPx6Q1TJamNxt1U5tYN9dcBKDstYBJQsO5gnUMEPIIWMZIOwo
 l6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GmkDvPL04FvesZj70C8Bh1QPWqcxeRqls9Hwy9LOCjA=;
 b=EOdIliGdZsD2bki1JYa5c8THc+oE+dhOffzM2nhOJN+7XwzKaXIDsF7lD4scAzVlLy
 qn4Bg7YWpzmHEIRo7PRFnXkEPJRUTPLGIe7DPsUQaEag+KcHWopXvb0PnkI+9t/i2USS
 VvKfh2Ap/7gsqPgbpl894vHFlCnQengOBjn2bSKWi+Cnu6cFCRSxejY52Pz/Ne+0JciZ
 7qipT5by/2H4X1cP/1RfMod75rwurdiMOgx7vfVIfaw/OeMEI0X00dKCcUG5S0Dc6wjm
 Vxyj+KVVwDITzdu0fGo2R2kF1Yr7cX7YDDQY7klGzreJaNb5pFASYBrMDAhv/6p3M1Su
 Fbyg==
X-Gm-Message-State: AOAM532sz42LKgdVFjkBHD68MlxU2hy9O5unvQjebOrH6Ssk49TNU7PT
 ZKvEE2FjO+OI36TG4JF7oMQsBKI3++6Wz87QIEvMkQ==
X-Google-Smtp-Source: ABdhPJytdbA1DXdmgjigXwoAGJNAXHWby9OHGcLbrG8t46pz6S6X4fAsURz9SOw3oD1DzuHNYBgfGP07d91ibFZGv1Y=
X-Received: by 2002:adf:ee48:: with SMTP id w8mr8542672wro.263.1633033011238; 
 Thu, 30 Sep 2021 13:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210930145722.184577-1-pbonzini@redhat.com>
In-Reply-To: <20210930145722.184577-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 21:15:57 +0100
Message-ID: <CAFEAcA-Y43vN5ie6dmnu8iJVWGKjqwW_D_1+-+SQfQwnDaNHBA@mail.gmail.com>
Subject: Re: [PULL v2 00/33] x86 and misc changes for 2021-09-28
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

On Thu, 30 Sept 2021 at 16:00, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit ba0fa56bc06e563de68d2a2bf3ddb0cfea1be4f9:
>
>   Merge remote-tracking branch 'remotes/vivier/tags/q800-for-6.2-pull-request' into staging (2021-09-29 21:20:49 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to c1de5858bd39b299d3d8baec38b0376bed7f19e8:
>
>   meson_options.txt: Switch the default value for the vnc option to 'auto' (2021-09-30 15:30:25 +0200)
>
> ----------------------------------------------------------------
> * SGX implementation for x86
> * Miscellaneous bugfixes
> * Fix dependencies from ROMs to qtests
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

