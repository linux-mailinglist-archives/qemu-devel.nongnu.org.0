Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E7F4C6F12
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:14:19 +0100 (CET)
Received: from localhost ([::1]:40218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgn3-0001ZY-PK
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:14:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOgkH-0007CN-SZ
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:11:25 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=38565
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOgkG-0008CV-1s
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:11:25 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id u3so20743568ybh.5
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 06:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B5d5msIFGx1HjfhBhxyVTL5iGoQDzjnp43Drgtpwj6I=;
 b=ALEMk5M6NVPo7o6CdTOdn5+shEkJzZ43/5YC7O5yzFx6uSfeW60IAFPZmKRVUnEHcb
 xn93IfX6yuPbf0ah6n7dPUpOzyoYv/hb5d7/NUBoKugU938ag1ESe+MUgThMX2my2+Vz
 iRVkyt4gwxiIWJ0MEZ+8tfAYGA6LAGuVx4W0VBClh4DpLBXy8PwNuXvTgUqxHDSlSb0F
 EN6TQgj1I4xn0874+CIFqeOefjZkkogsf4lSRGWho8LDYNxrG5/VlDqQUMPtEEPCw2Z7
 FWFmtbLnUVbp8GFFjuYf604Jym/DdpbpeyXr9dJjwraQeMxVVs1H+vxIMwlXuly51xvp
 /iZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B5d5msIFGx1HjfhBhxyVTL5iGoQDzjnp43Drgtpwj6I=;
 b=cNnt0DtWxVKbE2xNfBilLH/Qwenuq4s7Hx35G8EKNB1x8+3vnXtHXG0dyU2bfkXu2R
 92bJil8LMEBrl0Djxbs02zPs5NS8xP6jw56CnZANvxaGjTFIe1FJZQ8odb6JM0k/vluJ
 q2GIQmSo0JenBNJihtFmdIuCeweU0A7ctajFgu7xnV7hjcVZdnURrFGeD+iUEqnhS3MX
 V+ZwpiJvKA52enzMVjlJ17tAVpuTeZNwC9UsaUGFOV0dZ33iVEgNhWXqkcFKg4dCmCa2
 67W7IasDQWBIfaPtBKmureize5IydxTeSZo0go9KM+Vd865QqEHkMA8koFiGLUHiFwYZ
 V88g==
X-Gm-Message-State: AOAM531PIoBDxMpYdHDOovQ2xeyGpIgjOAHKJRU4GKWkGy+1f6IAupoB
 rKAjX1YNEUcEICvmBBwwcdMmGz4yNBhtl9nx3d7krw==
X-Google-Smtp-Source: ABdhPJyMqxsbaUPIQ0wJOgIveAzZaM/9YGTbe++6g6Qz8+WH5hmx8kaf20G3x6zy8gAr8vGjGYGwujYMnLi2iU4/2VA=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr19148766ybk.193.1646057483040; Mon, 28
 Feb 2022 06:11:23 -0800 (PST)
MIME-Version: 1.0
References: <164603074537.20094.1732342403585879912-0@git.sr.ht>
In-Reply-To: <164603074537.20094.1732342403585879912-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 14:11:11 +0000
Message-ID: <CAFEAcA8hWy3rfGtYkyQjJSGgsX448_t01xmM4cwyCO0op4h1xw@mail.gmail.com>
Subject: Re: [PATCH qemu 0/7] Many improvements to HVF memory-related codes
To: "~ubzeme" <ubzeme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 14:07, ~ubzeme <ubzeme@git.sr.ht> wrote:
>
> I recently bought a Mac with M1 Pro chip, and use QEMU to setup a Linux
> virtual machine.  QEMU crashed when I started a VM with HVF accelerator
> enabled and with the device, bochs-display, added.
>
> After digging into the source code, I found that dirty-tracking in HVF
> did not work properly, which made QEMU crashed. Therefore I made this
> series of patches to fix the problem.

How does this series compare with Alex's patch to enable
hvf dirty tracking for target/arm/hvf ?
https://patchew.org/QEMU/20220203142320.33022-1-agraf@csgraf.de/

thanks
-- PMM

