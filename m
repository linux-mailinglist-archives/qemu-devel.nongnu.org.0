Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BFC2E84F0
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 18:00:41 +0100 (CET)
Received: from localhost ([::1]:46438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvNn5-0006Gr-TP
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 12:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvNix-00046a-95
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:56:23 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:32879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvNiv-0002DJ-DX
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:56:22 -0500
Received: by mail-ed1-x52b.google.com with SMTP id j16so20570333edr.0
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 08:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sgQWQYgm5I4ign76SGO8X/x1nysSyxuzenwo4LOXeBc=;
 b=UQm4KB3zHTZAaNpMWhPMmMjo4NCjaF3MFXAGYTFaLi5FEn5DFxxyXRHRl0aEPpFMaa
 0wHKymoQLxFRowJapxqzxRpwV4nsQioNanFa8GZIsR2vsAUQQnb7fjFwA98OXVK6uzNF
 6m72/PcsF5BYrAGiZfyQFCLCHOG9+qWTOHgmj5ihATkCpn4lA/KsWBMpbizmZyA3yl8h
 VIitnXfSNiYc7EfbE/F4VNk/zkBI+svaTN0SbWm6FRWyX18qayrS5V7dsHhvc0DUGL49
 38rY7zrB4qz+c/BRJ+NJ5hQdkBQN8rdouXHZ2xQCEy9sSFKGaKs8RpuXEeRTPJMFnned
 Gb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sgQWQYgm5I4ign76SGO8X/x1nysSyxuzenwo4LOXeBc=;
 b=ZxC9bISNwXgdGd1c+CQygL0ubeeKgrUqbuTskHBpEkIQCV2cWpJ6Vq1hyiTQ17oDqN
 5ZnswcXMvnHGGfUC5vm6MruZj+H+zLEdHr9aH0lRETQvBFMevuAoIikvjTSFaA7nHlGD
 s0uSUtUm710/qwlaKm9jalPe9NcimFvQjijoT5T2q1FE20WEnmJmZ0pkfWXldgs0EZOd
 +N1DgLs/GOkWAlbeZb0OAOM29fT7DHxmkwbfE53uRkqjMyNKpIy6+C8eOByFZZ/sniUw
 GzbZ5fCs9I6YHBoIvxnUuw0EvFIV/OgbB0wBvwWpgC5VLFXun/obDQ1p6aDIqk1Wkhd+
 GlHw==
X-Gm-Message-State: AOAM533ejNHA4xeXvbXgo99XdQ1gzQQUJDOQKGrxo2JzN4jo43z0IW1x
 ublP3qrja0H8fOn8T9xe9DrtySEkeyoDAF2fYKkaAg==
X-Google-Smtp-Source: ABdhPJywBHWfKUobnKjI7COUpsvevKbfdCcbah/5aV8HifbUkbbVQr1Ja4wchfcnEbzHEXrJTHqpUxMEapSscbxGnUE=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr60228489edr.204.1609520179928; 
 Fri, 01 Jan 2021 08:56:19 -0800 (PST)
MIME-Version: 1.0
References: <20201219105532.1734134-1-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jan 2021 16:56:08 +0000
Message-ID: <CAFEAcA8e1PuPe3=GyKBwe=PZ_OJWBezAjG0UQ7fSGhXnxwwMeg@mail.gmail.com>
Subject: Re: [PULL 00/33] QAPI patches patches for 2020-12-19
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Sat, 19 Dec 2020 at 10:55, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit a05f8ecd88f15273d033b6f044b850a8af84a5b8:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20201217-1' into staging (2020-12-18 11:12:35 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2020-12-19
>
> for you to fetch changes up to 4ac76ba414ecb94f086d73621775d8b38b6f0a43:
>
>   qobject: Make QString immutable (2020-12-19 10:39:41 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2020-12-19
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

