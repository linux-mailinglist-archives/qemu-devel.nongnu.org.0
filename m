Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C56630BB58
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 10:49:13 +0100 (CET)
Received: from localhost ([::1]:44190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6sJ6-0006TM-Ds
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 04:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6sHX-0005ai-O1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:47:35 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6sHW-0001Ho-7B
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:47:35 -0500
Received: by mail-ed1-x52c.google.com with SMTP id n6so22104537edt.10
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 01:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5VE+x6lgH3v8rT3Xncvy6p48ifG1tkcoT2LMwGEEmwE=;
 b=SWEL4Rm4XFxuveQIXKesYuV2LT/1sGO98lAlggYLqv88f4LRhi1XWJ6TjbWNqbGglb
 ZbPUwmVj2ZjVsPUVRuZXU2MlzM8DaLrHGgUh0H9hOFTZfC+kB8rn75tPB5mSKawPW3Ph
 0vm6xefdC9s2dG0NrxgNYR0s/liCqwcJz6kzPdNhXHIrahGqGECPC6mJmS8XTewSUd5u
 +EI2WGDHQnEJeeO9NgbhXfLhsbzKdTxEezoSCZlpBtqOgVNOWfbmpxvsO3QLkV1VL01L
 C/x07rTXW5imj3NrpwrZuOaWjENbBoqZfrg/xERDnEhh9m0MqB3Nv+7XviJKTb1dV+x9
 SFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5VE+x6lgH3v8rT3Xncvy6p48ifG1tkcoT2LMwGEEmwE=;
 b=IPUPOtalIbmJSXqQtAgE12Hu9QwdmRbG4r1SWQK/YTYmbQ3g65SO5AkIFmFklrqKSR
 Ld0nd07Whus/CcNP/Y1LRc+VrYKP85ABFssTaVzOwJuJSZokuZ/vA7xltOgRaXTNMvOS
 jAHqrfvHAUquFDWMtA+eO+T1Jdlq7a8wWH9zX6SoWcOJ3d+VwjqbuU/pjtYhew5gJRd9
 FrGKBK+VIjfRtAqBgjyr3tXjHuxBNvQfwcpnFhBc34Ea7ZiVXOSz2mqnqPThWoj0jOUJ
 YNZ5vkcsPp1zmkNZSEWpX8WGrGkdWJbRjXJ6+nx9SANBpBhXg0lPnZSNLXq4zbFnG4Pd
 cB0A==
X-Gm-Message-State: AOAM533om0lB5Ktwr+qH0UKA2EoypJXdpmmPZjyAoDJ0ffoKCbo5XwST
 p3EjYuc8VXgpsPnPURykLCQdejfPzveIqNXJ4EP2Qw==
X-Google-Smtp-Source: ABdhPJzwsfbGRM/pwN2aucu7ER5XjwrZc6uEA9XN6wl/NKGZMFPGGdM7S+94iGC//rlZdpsANdfLWXcnc/iJinyLqCs=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr22631441edd.52.1612259252705; 
 Tue, 02 Feb 2021 01:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20210129145240.34104-1-kwolf@redhat.com>
 <CAFEAcA_5ASnuNjWs8rdRid-VpjFaHX0Y_8cKFRY0ojJKLB7ryA@mail.gmail.com>
In-Reply-To: <CAFEAcA_5ASnuNjWs8rdRid-VpjFaHX0Y_8cKFRY0ojJKLB7ryA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 09:47:21 +0000
Message-ID: <CAFEAcA8y0G_sru10vmESAPW54JWPZRcboN7xSfc2bKDQFaqGNA@mail.gmail.com>
Subject: Re: [PULL 0/2] block: Fix iotests to respect configured Python binary
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 16:13, Peter Maydell <peter.maydell@linaro.org> wrote:
> This is definitely better so I'm going to apply it, but it seems
> to reveal a pile of iotest failures on FreeBSD:

> Failures: 030 040 041 127 256

It seems to consistently be these five. What do they have
in common ?

thanks
-- PMM

