Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA371CDD1E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 16:27:56 +0200 (CEST)
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY9PP-0007AA-23
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 10:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY9My-0003c6-53
 for qemu-devel@nongnu.org; Mon, 11 May 2020 10:25:24 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:38309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY9Mw-0000Mm-Hi
 for qemu-devel@nongnu.org; Mon, 11 May 2020 10:25:23 -0400
Received: by mail-ot1-x32a.google.com with SMTP id m33so7668693otc.5
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=aZwFDVbHU904wCVZyfQz7WB2DFphUp9CR8nLdLFaFoE=;
 b=Dd6H688zoxRH5GJ5t208xwlbdCS4w7GZKDbjKfW/R6oEpsB4ibpNV4k0tFNnf/+moZ
 hBFzLB35Z23mWoySq8uYk9AeB0+MXK/6CDDAqh5ww0/YPBOFD12lngMEYi7zc/ErAQzB
 8NOAAu44/yrrkfgbf4gGqv0pq8jgGrkTwwjeCDUrhRBRuYHf6LzxFYzJg8zAfgDNiu+f
 MtYfRNjBf8tDg/DRDuo4LWg/DshkS89cN9URgup5E7xPWWZE8Aq9eB6YAjvighcbbeZs
 YDUuPeZp1HiMigBjFLiTAnb7ZGCp35mQgFJzncWTbOwz+RJipr0j/1aixTyMfqSjDbr3
 Qaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=aZwFDVbHU904wCVZyfQz7WB2DFphUp9CR8nLdLFaFoE=;
 b=i+iEYXtkqG/KpQQ6Hbnq7deULW0IGDETc5XWi+ZKngiDqOP6w5z4zylYy2f4bCH5dW
 jCHwRAbhu3zG9RkMyAIxCnyGo4zpuqbLxofEjB5RaV0iJNVLLf3dkSaPIVuXpYHxB/XS
 6rFbfFlskRR9lCI+V1rsgS6h+UVNlv6RmdQGu2/b7UdUAMXIbrxChY5ULyJIr1YKb8Zo
 Xee/AslMg0W9YheqjqpEcErn6M+mIdO6FP91yektPZWP3Ng7NYuc+TVrZCKZcfTMEXxt
 Ei9sei9/+QnoNx6WanX3mGJdoOhuKcTOfn/FWHyDG9Vc1oNgOYrVxrJjmqumy5YlxkG8
 XVlw==
X-Gm-Message-State: AGi0PuYevsRj/spjTXR2OOJrGSLdDQxfr9OQFXIJcJGcYqe3NSlImlT/
 khzGyQwKXrebdAX4Dxwo+gIH8viSlB0Cgr7N9jhWdC/I
X-Google-Smtp-Source: APiQypJIiwSegUUUURx3boZ4SXLJyyHQIALigZoVbGypIP9sDFeaKY5ZHtQ5usOqEGks525c3q/8cRGpQjpi2oOsPL8=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr12217793otc.221.1589207120062; 
 Mon, 11 May 2020 07:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200511133405.5275-1-peter.maydell@linaro.org>
 <CAFEAcA9PZ2S1uiC7dOorOW19m7hkH7b0JmYiO4ay8QSrTvp3kQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9PZ2S1uiC7dOorOW19m7hkH7b0JmYiO4ay8QSrTvp3kQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2020 15:25:08 +0100
Message-ID: <CAFEAcA8r61ohVvm1QO2kZUk0veA2yvU60KS2pHWuqA8ALK5KMQ@mail.gmail.com>
Subject: Re: [PULL 00/34] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 May 2020 at 15:03, Peter Maydell <peter.maydell@linaro.org> wrote:
> Hmm. I get this link failure, but only on non-x86 hosts
> (aarch64, ppc, s390 [aarch32 ran into a temporary connectivity
> problem and didn't run]):
>
> linux-user/vm86.o: In function `do_int':
> /home/pm/qemu/linux-user/vm86.c:224: undefined reference to `cpu_ldl_data'

This seems to be because we're using a stale vm86.o (if you touch
linux-user/vm86.c then the build succeeds), which is in turn
because the build tree has i386-linux-user/linux-user/vm86.o but
no i386-linux-user/linux-user/vm86.d so it has no dependency
file to tell it that the header change means the object file
needs rebuilding. I have no idea how a build tree could get into
that state -- half the .o files in the i386-linux-user/linux-user/
directory have no .d, but half do...

thanks
-- PMM

