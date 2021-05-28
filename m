Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6009F3944FE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 17:26:33 +0200 (CEST)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmeNb-0002ds-VM
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 11:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmeMM-0001u3-AC
 for qemu-devel@nongnu.org; Fri, 28 May 2021 11:25:14 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmeMH-0000gg-FN
 for qemu-devel@nongnu.org; Fri, 28 May 2021 11:25:13 -0400
Received: by mail-ej1-x62f.google.com with SMTP id e12so5973541ejt.3
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NcI62fw2RSwJxUv48PxrpMWkxm9JwIsXezt2OQpmZm4=;
 b=gRJhC41vIP5BfAhvkmJlGkfF8nFmQ0Z/3Fp5fCdtxtMKLGHmw76QzKl6wDd4szl3Ss
 CQJCNHOLKnwl9dvoWSoit/F9Aa4ws32ls5metTtDbg+ErF5/fj0X0qkWW64hW5WJE51x
 333By6DKMFfsbmjFGjDgxTsgLk9b5IA0u5OdjviH/1ObF5rQeM7qt/YJfzzrK6VqQJRE
 3KoHZT89s7hK1xmzfPaRR449lK7SxrxL8iwRUFswM4XLEYmrJkfkqO9nROYgVVhKpeaR
 4Mrj4yPZUus3cMTmkS6y2PenoJdRwfr6BVeIse+Gyklsz+N9ek7RQ1vuc4JFxjvE09MB
 vBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NcI62fw2RSwJxUv48PxrpMWkxm9JwIsXezt2OQpmZm4=;
 b=MNBNPWseRRSjyRTmQuDRkNLTsTFZceo1k96b10nX05JJQOrxnanPVQarLtvJbGgSYx
 rnDZeknE533rj1nAI+hbnIvJrOeFbjNWXUtslgKNOq18YfNzhdtf3ikFU1K630g2MaOi
 Sxk2SzgsnO0wLqpCKh7rG92z+ka60DmT3lAZMLoxSYmmN6ox/zpoOQzycBnEIcVv+7VM
 abrKmnAs42GKylUTlLQqA9d/Kk+17fmDBhSR8YHzN/k97h+KsdhW5O5DzsEtWxUyXCZS
 hFYPcC3nNrGS4Um/ON8dK0f0Osuj7jW+ik3upqJNvypipL8AcgE8xqheMAxAjKWWwJ0d
 6Bug==
X-Gm-Message-State: AOAM531hTYpREax08/kIUbNY/xA2LEB2OIpNmB4Qbxatd4l0UcK34TQv
 GNLmjWP8FqRUP521QZom39UwM1Ss8XoH/x2EhA9Bag==
X-Google-Smtp-Source: ABdhPJwxEowfQRLaKkwavRDUZ64fhbkCnSSSm7t8gF0rA3V3fMOoOYb87h7bI54bfxdKbkH/eCLtsY0aOhEwwFhin5M=
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr9744329ejb.250.1622215506875; 
 Fri, 28 May 2021 08:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210526195744.227346-1-laurent@vivier.eu>
In-Reply-To: <20210526195744.227346-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 May 2021 16:24:40 +0100
Message-ID: <CAFEAcA_ACMTvZWK4qVJBZwa3tdZinp37q6ot7j22Q8sEowzMyg@mail.gmail.com>
Subject: Re: [PULL 0/4] M68k for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Wed, 26 May 2021 at 21:15, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 0319ad22bd5789e1eaa8a2dd5773db2d2c372f20:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-misc-updates-250521-2' into staging (2021-05-25 17:31:04 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu-m68k.git tags/m68k-for-6.1-pull-request
>
> for you to fetch changes up to 5e50c6c72bf8575f124ec9397411f4a2ff0d0206:
>
>   target/m68k: implement m68k "any instruction" trace mode (2021-05-26 20:45:18 +0200)
>
> ----------------------------------------------------------------
> m68k pull request 20210526
>
> implement m68k "any instruction" trace mode
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

