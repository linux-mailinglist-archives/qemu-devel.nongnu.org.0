Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0332448E8B2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:57:40 +0100 (CET)
Received: from localhost ([::1]:36504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KH5-0003JS-2Q
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:57:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8K2y-0003ZU-Aq
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:43:04 -0500
Received: from [2a00:1450:4864:20::330] (port=38869
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8K2w-0008OC-SZ
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:43:04 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso7051232wmc.3
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 02:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ALJWSH5nyw9jJloamgeYQoQo1tt/V8/eHP3HNFwC6g=;
 b=bfvujrMaLH5j0Lvj//lBddHHycIngR5UofWYZ1KmEuhvmE3KLdLioRYdrblop0eflw
 LlXPfHMl13XKwQUofPxzL3AyxDjRuquuDhv8BoZSWPX0WL28BeJgiP1Prfp8151Eqcd9
 xMSxGUhsFXjt+/Lxi8RcEW5IZD4CiuVmDCYhdQhT/nsnS+mt4usjZcOmqv7uFgQBN7Dp
 aOGOxud+lT7vvKLn3eYKgb4Rd9IVxfGlnBVgPDUDmWW1S/SxxmRP8ftksbLZwPzesjh7
 nEPqLYKlfb27WoKMrDeRj2jQYawkdWAueo1kkcJ9t+od8XTWvdh/OMfmJazfMWnIAHOk
 idUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ALJWSH5nyw9jJloamgeYQoQo1tt/V8/eHP3HNFwC6g=;
 b=dng0v2ERc0FpRUTh7FH0tpcNnxGYQr22bebu7vmxNvvGa4nlwIeHOw5TP+ovKnrmtw
 99ilb6OYXCwkqW9+jhiJzkk/T//RluBPW+ZOT9nXQlc1XVW2Pox8l/t/xIYiPJw05qMI
 E6A+DReFFl4tU5ZoIO0eJf/3/IRryLaJfPGuUdicEMdK5FoHalMU8CPteKQOZmwYfzpC
 Sf1tveeub+kkiv5D+5XyeeLpNvTGL7qJWx+E24l3uJ9QbrYS36eC4bDvxUyzft16GFS6
 FJiyJiywd/bSiKKkXTfDJ7cn6zO314htZnl5LpYajjmZluBJNfQ073QIGUrLquS0qBUt
 PDbg==
X-Gm-Message-State: AOAM530W5/dV7K/JcQuYBlawZTur3E49MFl01bX2dtfqXk1LDMZcLP9z
 +9qLbfgTQCGxcScIS2xR7mffDsAxRr/Zy9IFkCZjmXovH4A=
X-Google-Smtp-Source: ABdhPJy5R7feUG3Z80WmmJ+06WOpCEBsRYbXmXH11I7oyl71vYew6yz4n2tP81a5dYggBC3l4GcSJOwBaipQpT2XRp0=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr7788363wms.32.1642156981629; 
 Fri, 14 Jan 2022 02:43:01 -0800 (PST)
MIME-Version: 1.0
References: <20220112141953.59545-1-pbonzini@redhat.com>
In-Reply-To: <20220112141953.59545-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 10:42:50 +0000
Message-ID: <CAFEAcA9r=n4CouqYyi_zCjm=UJ0zoKUkFNh_GCj2hmYXcKpCRg@mail.gmail.com>
Subject: Re: [PULL v5 00/18] Build system and KVM changes for 2021-12-23
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 at 15:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit b37778b840f6dc6d1bbaf0e8e0641b3d48ad77c5:
>
>   linux-user: Fix clang warning for nios2-linux-user code (2022-01-12 09:22:01 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 9d30c78c7d3b994825cbe63fa277279ae3ef4248:
>
>   meson: reenable filemonitor-inotify compilation (2022-01-12 14:09:06 +0100)
>
> ----------------------------------------------------------------
> * configure and meson cleanups
> * KVM_GET/SET_SREGS2 support for x86
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

