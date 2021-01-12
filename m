Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB042F2DCD
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:22:20 +0100 (CET)
Received: from localhost ([::1]:34310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHkh-0002lp-Gh
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzHQR-0004Yu-8v
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:01:25 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzHQN-0000J0-TX
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:01:21 -0500
Received: by mail-ej1-x62a.google.com with SMTP id ga15so2905476ejb.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 03:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u+8K2zcW0rAit1MIWP3pUR093yDY2o57ZBQkt7l4vBA=;
 b=jnEqSc50IduDwubwcQr8x3ZLj8ws69CMm9TA0m3KVwY0zFCStVDJMkpfUo00mj3HpA
 2W0IfAoCzOagukfu3h+HyZ5IWtWV0QA9i2FsqRw0C7J4AESILxH9C4Cqoxct8sDbQYsy
 kzrmsXG1bAukgnVBTRUilisP+zP/zN/sgSS0tIm9/Dwco/ZshtcFo3x2rogcT0aDMPdj
 QF8z3oX0EJUgSnFNKoDkvkerM+CbkJpQiidznIzKuT5nHNyW1PfR/aCdRACZjm/Sb0QD
 dl/ZHdDyvDC+zjZmbrvRCW+0/04cq6pw/BrlCMwcsnRk/8o0nJ8l0KBDcF0xe9j2mYqR
 cNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u+8K2zcW0rAit1MIWP3pUR093yDY2o57ZBQkt7l4vBA=;
 b=fjzmshx16K+URFAuUbEnGoIs9rEUsBCLwztanAutpXEJm5YO1Zp1TWByv3T6rlP5oS
 EcHvD7wV9cBO0AypzRtGufLCMyV5QZdl7r43Abb/QQjgtNJTW2hbqbBHJImFByTM4O+z
 eKN/zhWGgAh4Q0lM81XljNwN2FPeyqhUcir27pehZzw4cQ/3G6LafmGtT6wIFJMHgsHa
 LxbR4FZkE09gK1ycZ04WcYLrfBUCTszvouTubs92YHMarHm+vaB7onbDQekxXjeIK7hz
 dCW7M4SLpCV/VKro47HHujibvATxpMOL/6IuMjOwM5iP9Tyv05B6qGF8sFXocoD0Hl04
 SsgA==
X-Gm-Message-State: AOAM531ajnxVY8i7r5sl9qF/PK6srURGmxxZNciyPM6UgDANuo6y7rPO
 7TXMmDkKvj/SV31GUfPTk02moTEDo2JiZc48zSn7gA==
X-Google-Smtp-Source: ABdhPJxpLVytyyjILYjlgnfKdY6jheevjIjvI+60HpGcWdcdCt+nGA8yRTFXTcGLmXYtne912pDqIJOL5TrFYTtKrtE=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr2818544ejf.85.1610449276076; 
 Tue, 12 Jan 2021 03:01:16 -0800 (PST)
MIME-Version: 1.0
References: <20210105022055.12113-1-j@getutm.app>
In-Reply-To: <20210105022055.12113-1-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 11:01:05 +0000
Message-ID: <CAFEAcA-w5iCXJ0QwdvfZ6f3tyVRusKmCeAKRrAyaO-Dg3KK1cg@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] iOS and Apple Silicon host support
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Jan 2021 at 02:23, Joelle van Dyne <j@getutm.app> wrote:
>
> Based-on: 20201214140314.18544-1-richard.henderson@linaro.org
> ([PATCH v4 00/43] Mirror map JIT memory for TCG)
>
> These set of changes brings QEMU TCG to iOS devices and future Apple Silicon
> devices. They were originally developed last year and have been working in the
> UTM app. Recently, we ported the changes to master, re-wrote a lot of the build
> script changes for meson, and broke up the patches into more distinct units.
>
> A summary of the changes:
>
> * `CONFIG_IOS` defined when building for iOS and iOS specific changes (as well
>   as unsupported code) are gated behind it.
> * A new dependency, libucontext is added since iOS does not have native ucontext
>   and broken support for sigaltstack. libucontext is available as a new option
>   for coroutine backend.
>
> Since v6:
>
> * Dropped the Apple Silicon JIT support patch (superseded by another patchset)
> * Changed libucontext to be a Meson subproject
> * Cache availablity check for preadv/pwritev on macOS 11 and iOS 14

So is this series now purely iOS support, or are there still
some pieces of it that are needed for Mac systems with Apple silicon ?

thanks
-- PMM

