Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE131AD83
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 19:18:03 +0100 (CET)
Received: from localhost ([::1]:36976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAzUY-0001Hv-5R
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 13:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAzTH-0000p4-74
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 13:16:43 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAzTF-0004lD-53
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 13:16:42 -0500
Received: by mail-ej1-x634.google.com with SMTP id g5so1322239ejt.2
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 10:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AV25J0smM3dbI3CoBcwdFAgsDkR1+7ayXNXy/G31C4A=;
 b=BvQeoi+KY3P243sZ/pJsNAa5uCjDwnd/fyn/QONHIYSEvBCNm7zxlxoeFnVUBqi0QX
 gcp71Wcald8ZJxbQ6OerHrq3tZV7wgUhpc4QBSo46Lfs2RCrwvd0Bak0NtyTfkhCLB6O
 AgQxrAgXIghOi1pevnM+xeD79k64vrA6T+oMlwATQOf1bgzIA5PXlmaziwYMmy6UiHr/
 V9RGatdhBPdFIfw02c9LACcoa2C/EoAeUh0Vps6cMxomA3kWSqEl9SeFLMSGn5vV4Amy
 g/pZlxkoIYX/Iz/BmNkW94fGwq9O9u2cIDmNog+LvoZHUifAeyCredWSu5OakbBFqb+E
 AMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AV25J0smM3dbI3CoBcwdFAgsDkR1+7ayXNXy/G31C4A=;
 b=iIxwtsJY7TXsu5PD3BYYWlKWEVFMvJ+WyPze5PDVwyTMOHzzml8YUpnKHv9LXLeMWl
 uDI76bz8Nojmi/B3/z1tvS6LQYYnCEoD97xRzC/TRK2HsNbt8bR9kPdJs17nlEfLmzGV
 URSnMlVWd336fQAJsXUvR7g3dtwnO+2wM/bGcptwEOoIu4qe1vLGAuA+L0TcuD2b7rMG
 UNIwsMWi6euATOt+TiKiolvXQpbcGqy4npZkeXhQqYMvWAHB/L/hbEHVjvhSU+XL9D8J
 3h41Zo0vtrdvno2fEuGcEJ9iqErd/k0FF47SwDQbhQyclbjRLzD7J/7UjDLsJ/BugE84
 Vqnw==
X-Gm-Message-State: AOAM533Xca51kpoGpKd4gW6RPEO52w0CwjDsrWGpg/gnCF2TmqShXXgA
 5fMRmIS1m2p4drnFE70p56y+b4dg1mn/tDFULGk7RA==
X-Google-Smtp-Source: ABdhPJyrVTP2XiiG2OFDdni74JyjNP3SqZOevwmx2Lyb3wPGNFiGm3BZo7c/I7F9vjBiqKhwItZs/75sjrykygdBuaM=
X-Received: by 2002:a17:906:3a89:: with SMTP id y9mr8456055ejd.4.1613240199488; 
 Sat, 13 Feb 2021 10:16:39 -0800 (PST)
MIME-Version: 1.0
References: <20210212201619.1388255-1-eblake@redhat.com>
In-Reply-To: <20210212201619.1388255-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Feb 2021 18:16:28 +0000
Message-ID: <CAFEAcA-ciR2rOrki1Z9QP-vtaFWkC0PjT69fdwJSvYUbBJFEtg@mail.gmail.com>
Subject: Re: [PULL 00/14] NBD patches through 2021-02-12
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Fri, 12 Feb 2021 at 20:23, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit eac92d316351b855ba79eb374dd21cc367f1f9c1:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210211-1' into staging (2021-02-11 19:57:50 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-02-12
>
> for you to fetch changes up to 594427fc56758cb944a85914eefe722cc2c667b8:
>
>   iotests/264: add backup-cancel test-case (2021-02-12 12:19:46 -0600)
>
> ----------------------------------------------------------------
> nbd patches for 2021-02-12
>
> - let qemu-nbd handle larger backlog of connecting clients
> - fix a few NBD-related iotest failures
> - add block cancellation hook for faster response to NBD failures
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

