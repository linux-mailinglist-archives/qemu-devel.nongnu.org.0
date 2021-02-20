Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678993206EB
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 20:29:09 +0100 (CET)
Received: from localhost ([::1]:40240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDXwC-0003Rz-H8
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 14:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDXuh-0002eD-1k
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 14:27:35 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDXuf-00017I-DU
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 14:27:34 -0500
Received: by mail-ej1-x633.google.com with SMTP id lu16so22221690ejb.9
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 11:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6TuWlQpREv3oEXQD7bNmOXAGMPsrhSJvs4A197Zl7vQ=;
 b=yMIq8xfCns9b+6p6y4FwJ9lxbdr4vRWRPS0xplnMUibF7d3d1ygORzxf5AiQ+Z+Tlp
 b6nvtG24Ae4ZSkt1nZcP5ckWtzalk2euVvo0pLx0zpFFrcO3pK6pvgQ/5KaJCZgSm5BU
 0xO2r+doe95zX4UfIsqZiVrBpdxC7JI/7LJZthufcCZ+ay6jVWsKtcPyQCcMS0kfdkAV
 jIHB6wvSdC6UvYggtm+JKxMbRdVnGWTtmgN6iyKNHt7KhZe2r3t98te8jNvjU3aLNqLS
 0bUJV48XjJ0JEVfX5Y8RGXFZauSfPqicFNW8gDhrjZDhWiHnFT39cezogP1KmXhG6rkE
 1S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6TuWlQpREv3oEXQD7bNmOXAGMPsrhSJvs4A197Zl7vQ=;
 b=rlqSFCGFKlXjEh4hqsCG7j2S/nsZuAP/NUoRlm9EoUAHdpFc6SdgxRmdCQkHw9sV9P
 swjyYT70ZF453uspV11fL8v/wDvD+VZzRxSLbgbmyW9ceuCHDr2QxSdQB8O22YQZYcRV
 CeeufSL3LSGCNKnksg97AoauXfCb6K+ybkvMmc2rIxVbjUK/kH1CY4Z4Kb7b55f+bnGj
 omgJwvaacxz+ntua4z1T+d6kCFq3BtOusr9gygSvRGHGLMf0gJGhcXSBuRmkSMHXyB8d
 kZJoanIhPytbAK5RnoAi1HkLnkD+nnLwuzZJ9gAbrWa998u9GQkgloen3OVEQgJ1GUqb
 kMBw==
X-Gm-Message-State: AOAM533HLS8yjI3ztdyNSUvhgD3kBE/g+YVIR1SYigjypNYLIE0u84ZW
 acch9VGcHGnrZ/dHPeKfpJebw1gRkbXN12fkkJqnMw==
X-Google-Smtp-Source: ABdhPJzUp1Y4orcrpTWkA0XtPJCvGPv8Da5hAm1rHshIM9trUoxewO5a4UMjzj/7DnSidqNTcVkHChIcZZGZWWq7yWM=
X-Received: by 2002:a17:906:4003:: with SMTP id
 v3mr10248049ejj.382.1613849251432; 
 Sat, 20 Feb 2021 11:27:31 -0800 (PST)
MIME-Version: 1.0
References: <20210219220036.100654-1-kraxel@redhat.com>
In-Reply-To: <20210219220036.100654-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 20 Feb 2021 19:27:20 +0000
Message-ID: <CAFEAcA8T4stcwp0XQhL8oQ28x=ma-RU=NjdBZQ9ZkcbAdvmwbA@mail.gmail.com>
Subject: Re: [PULL 0/8] Ui 20210219 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Fri, 19 Feb 2021 at 22:00, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit c79f01c9450bcf90c08a77f13fbf67bdba59a316:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210218' in=
> to staging (2021-02-18 16:33:36 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20210219-pull-request
>
> for you to fetch changes up to 075e7a5b7f3c640823fce76c8dab503c42f0d7f6:
>
>   ui/console: Remove dpy_gl_ctx_get_current (2021-02-19 15:07:14 +0100)
>
> ----------------------------------------------------------------
> ui: spice bugfixes.
> ui: first batch of cocoa updates.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

