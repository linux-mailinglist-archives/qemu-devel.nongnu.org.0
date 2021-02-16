Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D03031CA4E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 13:01:18 +0100 (CET)
Received: from localhost ([::1]:42648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBz2b-0000Cz-FK
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 07:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lByzn-0006YT-RA
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:58:23 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lByzm-0004Ee-4F
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:58:23 -0500
Received: by mail-ej1-x630.google.com with SMTP id w1so6908430ejk.6
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 03:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ecgVB0WJ3IvWPKGS8u1fFBpEtXRcIE5H2aUPihKTHbU=;
 b=nXVnG6OhKPF+5g2En+NVfFl6LTCm4EP+jNLuaUSIq5Zl7U/bHBiLvqQhlGJkNrp2pU
 tBeonWeTjoJJ10BPGnGMg7hJW4KK/X3ff6xmUpbww4HodKYFB8jbDBcy2zmrMshhOJgi
 4ZnlsR46KQX41X9M7+zxVj0uexvCE9wftrbcovpBXJdiTYeGZpS1IUkGBKTDtxS30DIc
 cd/u59Ozn/F4j8dYX70eMqZmNcF2ezMFdT+1k8aH07PW9x+VAhjNZBbASJLSbZY7rz5G
 ifh3jxDn2BRhJiAmxjSUNYGJy8JrwTJ4Py6HkQZPl2qE7vR/VHg1sLaRM1ApBi9CerFV
 GlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ecgVB0WJ3IvWPKGS8u1fFBpEtXRcIE5H2aUPihKTHbU=;
 b=r6Cj2D/lzuBwqLWcyQy4WFbYR8a44bMbwPG1qv4lqQSeR9KIsXr3u9qAKWvcLQh90I
 REXNFjB2mVd+jbXiKmMYDASC2geNfhnvuJEEU7oh17h260pyWF+nPRsVe/R9CBWd5i1H
 mleFMMtCSLdlAQ6b77buHDClQdDfwv78hLy8EoixMgi18WRVNIeoiYeJLL3sy5WS2hNW
 aQ8bYSww1lY27mJQDzGwM+SwinbJ6BeiiaFlHiM9bNmX31FNZM/VHfwXwvWW5v6mqtck
 RIJA7gCFApKSh6zauViGaLTcWX0w1DITAWGzzzOigbGpJq+6fM7Btgu0odo4TyZV78s+
 jE5Q==
X-Gm-Message-State: AOAM5304MFNJ1v8/CWA0Z8ouAn08ltT1eU5iJqeMa3hJ2s04wQ/5sIRS
 01ZXwZRhn1YVXcKic13aNX37Gj61D5++kRpzZpV2LA==
X-Google-Smtp-Source: ABdhPJyiG1M5QJGsPt+jSFExxio5Ioe0nMgcepiFjX7K+gX1DHKkSQUicG/49XxYaTUOLBWE3yx2iOCjTJRfMX0B3pM=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr20204411ejh.85.1613476700029; 
 Tue, 16 Feb 2021 03:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-32-pbonzini@redhat.com>
 <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
 <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
 <CAFEAcA_6RiR+ud5U0Y9K3jNmEoQ-Ex8fZN3-o0MkLxpK8PROgw@mail.gmail.com>
 <378df6af-8383-8a51-4286-54739dba99e4@redhat.com>
 <CAFEAcA9-bOggKPjJiZNc3WXD9Uu-TxzDc7NMvUDGgoM7ERg3hg@mail.gmail.com>
 <1a8f0b62-0adf-9360-2365-e9881a6aef94@redhat.com>
In-Reply-To: <1a8f0b62-0adf-9360-2365-e9881a6aef94@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 11:58:09 +0000
Message-ID: <CAFEAcA8VCGmqbdLFLQ0R9Uun4MzxLTnOZExmYJZ65qZ_fjDUvg@mail.gmail.com>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Tue, 16 Feb 2021 at 11:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
> I agree, and that's why I have no plans to move -chardev off QemuOpts;
> warning is a different step than excising and sometimes years pass from
> one to the other.  However, that doesn't prevent introducing a warning
> so that users slowly move away from the problematic functionality.

If we want to continue to support the functionality then complaining
about it doesn't serve much purpose IMHO.

> Also, "-chardev" is not the way that most users will configure sockets.
>   The more common "-serial tcp:localhost:12345,server,nowait" will not
> trigger the warning; that was not clear at all from the the commit
> message.  It may even make sense to deprecate the *long* form in that
> case (which I am not planning to do, to be clear).   I'll fix the
> documentation for those uses that are affected, though; thanks for
> reporting that.

A bunch of my local scripts for running QEMU got hit by this new
deprecation warning; "git grep 'chardev.*nowait'" gets hits in
our documentation; if you google for 'chardev "server,nowait"' there
are plenty of in-the-wild uses.

Is there any other serious use of the 'no' prefix other than
'nowait' ? Perhaps we could get most of the benefit here by
banning the 'no' prefix and adding a compatibility 'nowait'
bool which had the inverse sense to the existing 'wait' bool ?
(TBH I had assumed that 'nowait' was already implemented that
way; 'nodelay' is.)

-- PMM

