Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9907B2F4F4D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:56:35 +0100 (CET)
Received: from localhost ([::1]:46720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kziVe-0000et-NV
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kziTK-0007lX-4R
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:54:10 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kziTI-0001H9-7t
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:54:09 -0500
Received: by mail-ej1-x629.google.com with SMTP id f4so3758670ejx.7
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 07:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MhtPsf+TMmCLjoTmCvTAhhs6Uu0b2LevSxTMxKLQU/E=;
 b=lUwI0vWtZjiCEC7jellPZL6m4WmZxDmRdeKFFkW1PnehhzZ2VHEOqGBp56jQSr5fpC
 cg9WnfR9YJFjHFVTPQkl12InhdOVIy8Sxq09hlE3IZE/O6AYFwrSXRAmxaweq9eD//dy
 W9XhwZ3DX1dmsUo+rfXVt5IIv9ze+u8dVetwUysEw6poEvlypqEaRyAzJLktYTbjnGYF
 oiMtGNjviyHDGbdNndVvjiQN43+xFW7zSMIOHko01wey1iFBjWnwgED3d1QH9k7NSAWo
 warfFh3C7bobm++YTMHpj4IBlY5p0mAvJeLUzu0orSgKKeNxQOTgXXuUs93QNd1Yp/pu
 64hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MhtPsf+TMmCLjoTmCvTAhhs6Uu0b2LevSxTMxKLQU/E=;
 b=Q6T950E5n2b+wLTb8KnoJCNm08QcUZ1wVKUlCpuYW1X89hWXKI2AYlN+mmnocCDBxj
 Q5oq54vHG1v6pOd4j8xfb2vOAmy9KwmjZ14QzTJ1fX+cHFMzaT+b/khDahsh6FsRPfx7
 sl5LX6Qm0vs5B2MGAFest77iM3BRkH2FfssxXc/H/1i1XHHwGjLeFwYpdg3OJTH8c1nW
 lX2MaXistwWyr787Ey+JOt3UIQR4Dla5Wbuyh0lyPJTiNjh7vIm15GB5C0o/AybqNOOO
 GHCh4jlW3p5mHbFgxTj2HesKEpJlTc8dPAmGl3qYus79zlSDQev5EGc+3nyUbfn9SRhs
 c8SQ==
X-Gm-Message-State: AOAM533MrJuU/z031xAOD/yHPI7F4dZQiAisjQ8YktLU1guzMZcqNmtY
 oUh6ivbSP5LiF1zK3lrEoqYYe0lUZ20UYsXrphH9yQ==
X-Google-Smtp-Source: ABdhPJzNI/imM6g7bG8AxgiqivjpshTj0vTyql1xuzTSY6E9RhHSQ03mX+NJ0Up4v5p7EOzFyrcikJh9TfcZ6gAvkjI=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr1991976eje.4.1610553246645; 
 Wed, 13 Jan 2021 07:54:06 -0800 (PST)
MIME-Version: 1.0
References: <20210113093101.550964-1-armbru@redhat.com>
In-Reply-To: <20210113093101.550964-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Jan 2021 15:53:55 +0000
Message-ID: <CAFEAcA8HmqWuzny9bmpXNLtsK7nuRaxPW3j6ZZougn7Y+tX7+A@mail.gmail.com>
Subject: Re: [PULL 0/7] Yank patches patches for 2021-01-13
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Lukas Straub <lukasstraub2@web.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Jan 2021 at 09:31, Markus Armbruster <armbru@redhat.com> wrote:
>
> This pull request is on behalf of Lukas.  Hope that's okay.
>
> The following changes since commit f8e1d8852e393b3fd524fb005e38590063d99bc0:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210112-1' into staging (2021-01-12 21:23:25 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-yank-2021-01-13
>
> for you to fetch changes up to 91d48e520a4a4f72e97aeb333029694f5d57cc93:
>
>   tests/test-char.c: Wait for the chardev to connect in char_socket_client_dupid_test (2021-01-13 10:21:17 +0100)
>
> ----------------------------------------------------------------
> Yank patches patches for 2021-01-13
>
> ----------------------------------------------------------------
> Lukas Straub (7):
>       Introduce yank feature
>       block/nbd.c: Add yank feature
>       chardev/char-socket.c: Add yank feature
>       migration: Add yank feature
>       io/channel-tls.c: make qio_channel_tls_shutdown thread-safe
>       io: Document qmp oob suitability of qio_channel_shutdown and io_shutdown
>       tests/test-char.c: Wait for the chardev to connect in char_socket_client_dupid_test


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

