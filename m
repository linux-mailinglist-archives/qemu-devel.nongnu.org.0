Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2BD2B6855
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:11:28 +0100 (CET)
Received: from localhost ([::1]:43870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2di-00066W-QI
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf2c6-0004yC-VD
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:09:47 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf2c4-0004xt-Qy
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:09:46 -0500
Received: by mail-ej1-x62e.google.com with SMTP id gj5so2404863ejb.8
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 07:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xg3P1iM2VIw8YzK7brUP3xFVM80JOZluf1nHCQ3SAX8=;
 b=rkA+a6uNQ+7BxY2jxS+mcSQD83QCFksSK40KU9e0loaujOudK9tZSLXKixMRWWguf2
 Ly8Xo0hqpC48WQbLbSRk+Tf3LcOi5XyM0lyrbMp2OrMEOasihH+KhPO9cuXZ6M7xGK7w
 cAUzYVHYu9TnGbtBQUhn3OMirfeYsjh9fbXaBPMrD9t7Vd2+T9eJvLwDBik37bGI/VlI
 XAyxa21HQGV8sp1VXsV7LPcHasMuKOjBOT+kCXTi4nYHBSJNGr4+0QuKSytbXM8N5nAf
 cS+ysi14KFZM7C6xevVr9al+EYwSGwjp4stZzGuEJoqYqvxFMhOtm1BoLvOETZ1xLIMZ
 JYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xg3P1iM2VIw8YzK7brUP3xFVM80JOZluf1nHCQ3SAX8=;
 b=FB6JcRDZ8aHkFvW9TVoQ/yoOjMmHjWynC/GnBKCC61J3gPyEI/5oUnDOoa5jVWBkyo
 PrFIzlbhatl31b8xKFIsF/v20t1HbcXti5yS3dzwiG5FgHuoUBsfCtlpEY86kYse5+jp
 di0kBgmqJutF59N4/khMtGz4D0m9jqyh3hIb9CJUz3Qmpc1YFVBIW0NBieXoWggwQ5V5
 K/y9HD9Oeuseu2NIdGbHqo+OA3B5yQs7je8KbL7wUgkwXNNCGZSh6KWLO8AHivrIW8zh
 xkqCyxGElO/9i/+c8FCkBUKin3pZt1WFrJjlcoXnAso9gOE10bLB7QQp1uHCRstZUTh5
 aELw==
X-Gm-Message-State: AOAM530rSfAJdl3CQ49tJiyEWpbM3lHCbMc12q8yyBhGA93aX5lnvyQF
 OVBcWZCBDxMwIdGLKIVJ7dnj1W9bNO+/d3gjY5T3tg==
X-Google-Smtp-Source: ABdhPJzZdVw4wdxlFSCIeOO18prhzmASWpndtKLBb5VcYO06POjK7hGY0cxVGxJy2lhJvwEG0UutHs4WTV1IGVKzkjk=
X-Received: by 2002:a17:906:c084:: with SMTP id f4mr5656909ejz.4.1605625782637; 
 Tue, 17 Nov 2020 07:09:42 -0800 (PST)
MIME-Version: 1.0
References: <20201117095748.122371-1-thuth@redhat.com>
In-Reply-To: <20201117095748.122371-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 15:09:31 +0000
Message-ID: <CAFEAcA8iyZohvnPtQ23+hpUktS8ccc+7aG5cg_ja4Esghc8raQ@mail.gmail.com>
Subject: Re: [PULL 00/12] Misc fixes for 5.2
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 at 09:57, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit b17d3b7b77f043f0e76f0e6ce6def3c1b1d5ee8b:
>
>   Merge remote-tracking branch 'remotes/mdroth/tags/qga-pull-2020-11-16-tag' into staging (2020-11-16 20:15:57 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-11-17
>
> for you to fetch changes up to 46b42f715d1310cd80acfeb7c84337a128fd190b:
>
>   max111x: put it into the 'misc' category (2020-11-17 10:17:02 +0100)
>
> ----------------------------------------------------------------
> * Fixes for compiling on Haiku, and add Haiku VM for compile-testing
> * Update NetBSD VM to version 9.1
> * Misc fixes (e.g. categorize some devices)
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

