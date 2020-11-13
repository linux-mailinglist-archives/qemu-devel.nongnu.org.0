Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D72B195C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:50:27 +0100 (CET)
Received: from localhost ([::1]:38296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWew-0003LJ-LU
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdWe4-0002sl-NU
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:49:32 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdWe2-0007KO-UI
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:49:32 -0500
Received: by mail-ej1-x629.google.com with SMTP id za3so12708467ejb.5
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 02:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FzsYiye54QudKUd9f8hjvGiKfAkJ1zrny+g+N554+BA=;
 b=OdC4dqrqX3nHgGB034vmau/k6SFdUQDiUNFT915GpwAObA5sQ4vjoKAQEmF2m2tJtM
 2x20Ceeh4VtNFH9fu+KDSGbCMBfcmcxDq73JHJwFkl/ESh1OnP259sanBHSKGSQau2uE
 q47v0yLIln4wwG3gpTNlFTljaLnLqmR6j5vfC9wPAshiAMPq7JhMfhYjgUO5mYKl2nBD
 b89IHCEVLkomcISyHDXy92vvjyv1Bb1H9PU3t1+PheaKF01/BVxSLZ3gk2zkOGIQu4Gp
 TBbuRWrTd/yvFA/jKAOkaT6Em1zYUfr1wwrSmuP1+CCd0yoKbP0nh+xIZd/Mf3cUnJTu
 5Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FzsYiye54QudKUd9f8hjvGiKfAkJ1zrny+g+N554+BA=;
 b=ICxCkvVdzL35KEg+nIowQjiC1cxfBLJoneb4wnVc4oFsPwZvMKwsI21QEdVN56JxpH
 j6rTzIdoa5X2FpE4n6ogu/4rr4qdyGQbRZgGwj1/ymQwagvlH4OFfoXe4CzQW9Nba3zZ
 W4I2NMkmL9nN63LhGPYhDhHUwOAu/rwqtfRoXjAMasGTpjGVo35I4xZtN1eChuvC6SHv
 M3MhMxidVxezXqPniO5jiYrv7GPTHBsen4z2vq2/ymgtBA7nrGmK79UKiv7BjADQvg8q
 mPbBh27/zedOr4IcfgdsYmnKROfz7UhwGPdlsykVBl61H49CdWkpbKKtWuBt0Y6xarzn
 Y1sQ==
X-Gm-Message-State: AOAM530ZelMnSAd4yl0KxEscGS6XAWHAvVm0sdOaudXg+Y5+ospB1LJ2
 N0LZYIIz/kKxcJeWDAdw1dNWRp5/ko7Vixzm+dwnIw==
X-Google-Smtp-Source: ABdhPJxObM270BKHAw8dtOKKLYHAMnG+EsmYqT8fWGQcA3z8HaC2G7/LlL4HXGqCHk20uPYYt/GufYDqOUuwbrftwqA=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr1410069ejr.56.1605264569329; 
 Fri, 13 Nov 2020 02:49:29 -0800 (PST)
MIME-Version: 1.0
References: <20201112183758.203176-1-dgilbert@redhat.com>
In-Reply-To: <20201112183758.203176-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2020 10:49:18 +0000
Message-ID: <CAFEAcA_AjFLTOate619c9mxR7-ciCaU4C10_v+3_0UDNZUGS4w@mail.gmail.com>
Subject: Re: [PULL 00/11] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peng Liang <liangpeng10@huawei.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, lihaotian9@huawei.com,
 zhengchuan@huawei.com, Stefan Hajnoczi <stefanha@redhat.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>, Longpeng <longpeng2@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 liuzhiqiang26@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Nov 2020 at 18:41, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit cb5d19e8294486551c422759260883ed290226d9:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-macppc-20201112' into staging (2020-11-12 11:33:26 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/dagrh/qemu.git tags/pull-migration-20201112a
>
> for you to fetch changes up to 7632b56c8f880a8f86cf049a3785069e1ffd2997:
>
>   virtiofsd: check whether strdup lo.source return NULL in main func (2020-11-12 16:25:38 +0000)
>
> ----------------------------------------------------------------
> Migration & virtiofs fixes for 5.2
>
> A bunch of small fixes.
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

