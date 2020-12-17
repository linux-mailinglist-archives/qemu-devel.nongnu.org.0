Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA512DDA4D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 21:49:56 +0100 (CET)
Received: from localhost ([::1]:39812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq0Di-0004cQ-S3
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 15:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kq0C7-0003oS-Eu
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:48:15 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kq0C5-0000Dh-II
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:48:15 -0500
Received: by mail-ed1-x536.google.com with SMTP id h16so87005edt.7
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 12:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RnAgmJQWcXQ2U6xRqPgqoibj7Cpi9jEacSj5iW4E2uA=;
 b=VzfvgpYY9fOw7APldWNwVjWgCmX2AxfOyDTGmVL6M8jGhFyC5lokdfWcwq7KXw23kA
 tZbumAcyJOaay0VhZwjinWZtYfMN/vlLnCt35bjRDZxXIMDObmlhO7DE6LSejs8FjRz4
 jBcr93kyRl8F+/M1yHzez0vw3RZxKqUIam1+MXTDTU09Qw2u2VBRzaasKlV1hjVcfra6
 N3XbBo35l/2drfKCyTHs3YQu2GB6f3aYniNEJMQKqMOL04sOmC1Wb57rxZELt4yCH5sw
 4PC77rctqdjxM8Pe0xL4qFTWdkzT7dvEto7WFctJXpcnNHgp9A74mkBC6N7GmyTdkX90
 8Jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RnAgmJQWcXQ2U6xRqPgqoibj7Cpi9jEacSj5iW4E2uA=;
 b=IbpCsK/PxEKeqrX1nQ23o0RhOSFTbhJSYrnAjlsRsWAACfPH5Rsd44npAPHu7fUFb6
 9G/wUVit6GhOoSAum2XwldRuZx1lNqUoVRtF7QEdYx1D5rXMpieW41V9vfl/UOPDgS3H
 OLSrB9OPMUPHet1oB1Dgj/hsYM2cHiayQBr56ZfFK9BzUmtRwQfbLZvy+K7o3pqXNvu5
 N/2ijh1diy6GEX8Z++5i2Y6eHex/8ySJ9d/+TZUM8ewdP58zJmxsi3vVFQ57DoYqWVmh
 3kovAMgFM9ddOPNuFwzJk3etMkpsSJqebzgNiucMpwx303E18G8Ov46zTDkE3hoVY+hC
 zqSQ==
X-Gm-Message-State: AOAM531Y0p+KYXpk+osAUAjAVWv6b9NtEgJIqAhvP1L21tJbFqkxd7LG
 PSpPVxq1kmCt4XyReBUFEW/6y/ukad8kYPBqmGY5vw==
X-Google-Smtp-Source: ABdhPJy3FXuAsmRDUdTn2hDSzGNZc+zKHXB47nFf+IQTOsSrgwDTL+yP4YsikgqND7sfuNf4cTKDt8+sc9GyVnnhbEY=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr1241016edw.44.1608238091599; 
 Thu, 17 Dec 2020 12:48:11 -0800 (PST)
MIME-Version: 1.0
References: <20201217184620.3945917-1-ehabkost@redhat.com>
In-Reply-To: <20201217184620.3945917-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2020 20:48:00 +0000
Message-ID: <CAFEAcA_-So0cL8AXdet5zaDwo_5L_JqHstp=UbDysu4W05Vh+Q@mail.gmail.com>
Subject: Re: [PULL 00/17] x86 queue, 2020-12-17
To: Eduardo Habkost <ehabkost@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 18:46, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Note that this is using my new gitlab.com repository URL, which
> was updated on commit f953c100693d ("MAINTAINERS: Update my git
> repository URLs").
>
> The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-12-15 21:24:31 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request
>
> for you to fetch changes up to 9fb75013d864489a91ba05e6009ed79c250d4064:
>
>   cpu: Remove unnecessary noop methods (2020-12-16 15:50:33 -0500)
>
> ----------------------------------------------------------------
> x86 queue, 2020-12-17
>
> Features:
> * AVX512_FP16 feature (Cathy Zhang)
>
> Cleanups:
> * accel code cleanup (Claudio Fontana)
> * hyperv initialization cleanup (Vitaly Kuznetsov)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

