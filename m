Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF142F8611
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:06:25 +0100 (CET)
Received: from localhost ([::1]:45654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VMW-00045p-HH
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VKv-0003dK-V3
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:04:45 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VKs-0004TS-CC
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:04:44 -0500
Received: by mail-ej1-x631.google.com with SMTP id q22so15040741eja.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=97dHAWC83mjrpdUVmmOjY9wfEUKOOIEQtmcsDO6G3N8=;
 b=mvv7MOTu2GjUUHAhz3uALKkCWOnkRWlOYgw/JCEEbIejChL6aQuKlhSniE9kbTt78U
 6HUNYpMsVo32gOtaxtYJ08gP9vBmJRKpshVDnYE3Y1ZqFeJQtD3XpX4QoDyx4uqQO/+4
 /H0bLEAA9/piUS5LbCRvu1HfUMEdCjOBBxg2e9kQCePZ5n+Clhwqt1nK4gmZru8AwMcQ
 Tm4rTGZ7bpe0ZyYcomVHrYk1k1fpjU6dsyamrV+LECZPIchswytLUCenb3oIgeUQUY+e
 6kM30x1Xt0fKFW4vlhkKf56QqxvcAdnF7KGAPwLwjoEpEdWhCgBggJfFRQVGjIbawPwC
 EDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=97dHAWC83mjrpdUVmmOjY9wfEUKOOIEQtmcsDO6G3N8=;
 b=FjbJOX8ZoBLb/qVVEehzA4jWFSfoTNX2K44xOe4M4WLE9e+zQRjq9INDEGsDCILJex
 PbwnbAwo2i2oTT95U4pD3D5DF7yKjNpoWhyAqYINJibRRUnMODIDDzw1ceyXILHYJ80R
 9mi3Lb7kR8hkyGbAQuSnsua3i3vcF18X4yAL3a5Eb3te0pmJjAiLWcI+Z7S2Bog0MM7D
 xdORREvmCk40WvvSeoVZsAMqWKIqZsh6og9DQqVrB7FqOsqe9PtgjRr0W7klsOBD/OGe
 1uNQaylhO2NcCWoIxZAMQ335lwo/8IIjFiPBne2slDoOod0tjQMXUKrclDiK9zlAEK7e
 lNuA==
X-Gm-Message-State: AOAM5326IsFbodwb4ic60E7ymiBdvFylzkou4l66CWgkXwL+zAlVZK3x
 11WCKkiCccqJrNw7G5Z1TWDLS9nt+JfuuM8GMCwHkw==
X-Google-Smtp-Source: ABdhPJysQUJDgQw/7FWUqTfyj9GR8iyM+8kbcW5xBJFa299meUIgfd/gwpb0PDDbFVCoGQZ4Rb48ZDl9vc4jeXgi1f4=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr9785102ejb.382.1610741080715; 
 Fri, 15 Jan 2021 12:04:40 -0800 (PST)
MIME-Version: 1.0
References: <20210115102424.1360437-1-kraxel@redhat.com>
In-Reply-To: <20210115102424.1360437-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 20:04:29 +0000
Message-ID: <CAFEAcA_aJUvwKhLgANkKSraAK574wfuw_u9R5kFev_bjWW=o_Q@mail.gmail.com>
Subject: Re: [PULL 00/11] Ui 20210115 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Fri, 15 Jan 2021 at 10:28, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 45240eed4f064576d589ea60ebadf3c11d7ab891:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-yank-2021-01-13' int=
> o staging (2021-01-13 14:19:24 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20210115-pull-request
>
> for you to fetch changes up to 763deea7e906321f8ba048c359f168f60d51c14e:
>
>   vnc: add support for extended desktop resize (2021-01-15 11:22:43 +0100)
>
> ----------------------------------------------------------------
> ui/gtk: refresh rate fixes.
> ui/vnc: add support for desktop resize and power contol.
> ui/vnc: misc bugfixes.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

