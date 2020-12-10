Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0D2D5DCB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:32:04 +0100 (CET)
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMzD-0003VO-8p
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knMtv-0000gU-G8
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:26:35 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knMtt-0007Iu-GH
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:26:34 -0500
Received: by mail-ed1-x52a.google.com with SMTP id k4so5705125edl.0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Qd9tqFc3kBjJeEdjXXzn/RGO03VkYOGJSIArfPRQi4=;
 b=w45Jo96WSVOrDi9mM2eQKRA6HwUJvh0zzIWhHVAZ/MCdq9dnQshKeyxubB4OdYZA1w
 YIQOAkaC1ZvwEloL+jIvOJwmKmb1C5X5eE9o/3WM4sbBzCRtpGLp6QgSdV0+DN84xpYQ
 bmgtOqeHg5gXfatoE9xJvt8F2/jRuK3y4DM9pfEdQQvGTtjKON7BfoU44sYu0a8sh1zc
 gxBhwqar3Cg/BPEhBohO1hCFqR8PDvNGzaz65yCpvZPq1Mw06moi6mC6UVXza8s7P7lr
 +sdTumXrG4pGki5fq4yetIDcHGiWnuh1acd6MM4yUpeC5xqeKYD0rOM3zwoDfpxtp5UP
 lKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Qd9tqFc3kBjJeEdjXXzn/RGO03VkYOGJSIArfPRQi4=;
 b=l+62IKBascY5MXC28s0dWe8UOmsAc++IVf8GlVq1CN4TeE5GsIhUTc4SLngiLjnhkn
 M9oR4Xso11LZu+xCJyeDTY/K7JHmLNAywxjuIAQYSij+ArNouxIrtua1d6Ib9Thnsst8
 4lXKbs/pfclpOa58vAUCTCh6EFpiI/cgnmel5iROMO9DQepzf8AQ89jCYWNCP7Ii/o8Z
 t5tB1hJxeqNiTw9Voo1VJzI8EkZ0aqH61G9Z//K+UTyc6H4mdONHjIj6seziI8x4Lopw
 ht+800+bFY1OrYeJ7vNKSL11iNpy+onT5jWwI8OQLL2Bl0pxUwISNIHmcnJTO9leZILl
 2GZQ==
X-Gm-Message-State: AOAM530gpXmSpDXTYH3rjkEZhuVB9fgjrXAgi9e9i3GAFUQfYg0YL+kf
 W7u4VjE2adEe2KhESp+Mv4ByOTSGYPwYtZ57GT4KNg==
X-Google-Smtp-Source: ABdhPJy8gZetabHyOLb8dg4gsbtA8hNs5nroaDDJnuo6gpQBJxh67Ux+1fCM0ET26gk6C+ZczrBuikR9bYTRGkzjf08=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr7154359eds.146.1607610391722; 
 Thu, 10 Dec 2020 06:26:31 -0800 (PST)
MIME-Version: 1.0
References: <20201210121359.18320-1-kraxel@redhat.com>
In-Reply-To: <20201210121359.18320-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 14:26:20 +0000
Message-ID: <CAFEAcA8Z5JvwrDfge2LsQoAJQb5vCX+n8RELdQ97ubsN1MNffA@mail.gmail.com>
Subject: Re: [PULL 00/11] Microvm 20201210 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Dec 2020 at 12:47, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 5e7b204dbfae9a562fc73684986f936b97f63877:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2020-12-09 20:08:54 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/microvm-20201210-pull-request
>
> for you to fetch changes up to 08af4e13f8d4db099bc444f83879c32459df7f3a:
>
>   tests/acpi: disallow updates for expected data files (2020-12-10 08:47:44 +0100)
>
> ----------------------------------------------------------------
> microvm: add support for second ioapic
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

