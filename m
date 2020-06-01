Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EB11EA1DD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 12:30:20 +0200 (CEST)
Received: from localhost ([::1]:47646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfhhz-0001sf-BD
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 06:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1jfhcZ-0004vO-3x
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 06:24:43 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:46935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1jfhcY-0000a0-CK
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 06:24:42 -0400
Received: by mail-ed1-x543.google.com with SMTP id m21so6823893eds.13
 for <qemu-devel@nongnu.org>; Mon, 01 Jun 2020 03:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J4KGZgU3t+vavzNKB8H0TCnOQJqChe1gJLtDETC21j4=;
 b=g5B+djrDIQfqRn/T0mqA+C+578nIFFRFaDiGYawkV22EAZ1hgVLB3YQkkuTd0nNh1U
 T5xxqJ125P90LYkcH8GAagDCZnOkejUyWuEEUJtqdeyuR+RPLf4MwBLD2XwWtYpCm9Dw
 t0yr6BrwgHob3K8MFy9Lx1bGc7nYJRu5h2k6ORdrGX8cpZ7Hg2wH9tXK/Szt8ROGJOiF
 KXWgS0gmkbzS2rf8oVLqBC3l9WdXT7hUIWyMsTU91tY/yaUjjdhHtMXdRhAv++DEHeGg
 hKWd5R8/N/hcP/vWllaaSrI+uPDZCe7MCBFtEdaSX8c9d306ofdJW8HrwqR6/4IpA8To
 HDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J4KGZgU3t+vavzNKB8H0TCnOQJqChe1gJLtDETC21j4=;
 b=q5cgviEBVFVkANpt+UgVZm1v4Hr5Q0BBa2TcArjiwtAgmpbZR6dDvQhX53dEFeg818
 /2yvB+eWzJ7T9tySM9oPEHslvfY8awzXW5orn4y+shHbu1ZhrmaiwLWhYFwi3SjJrwFa
 uE0MvvexSn4E+9iS3T4iorceYc3V2wMn88Th91USXIc+u56+Cu1QKMvzBnTehSnWX7MG
 9S296G8dF7XCeVKONismkprlxIa7WLSM1O7G0NbKfLSAERiljPI3Tm45A/xbLNUWH2Nt
 c/0zThF90lsRQlBZxkSA4wlUFg268JM/CjllmCVDCzkOTFbXhgJs19S4h0nOE8adW4ST
 FCpA==
X-Gm-Message-State: AOAM531dMojmZalhxCQUe2tGMM1g8jiegyomZ3UOpxIEoghH0aUkOtKQ
 I9/5a59OX/pvwrt0wacYhZQk3oKp1f4UIJDBVM6UhiSb
X-Google-Smtp-Source: ABdhPJylTI73H6IL2/0nhh4apVYtb3m/hmhKB1DjlY07XMXozouKZ57BzbRLcAC4TXAvHP8b+Yy2dIx2Eo/DjML7pmg=
X-Received: by 2002:a50:e08c:: with SMTP id f12mr20956900edl.233.1591007080845; 
 Mon, 01 Jun 2020 03:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <1588663771-5534-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1588663771-5534-1-git-send-email-chenhc@lemote.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 1 Jun 2020 12:24:30 +0200
Message-ID: <CAL1e-=iUOwbFP8oo-mTvRD2SutY7BmeFG2Schs_hhCkCX2LJTQ@mail.gmail.com>
Subject: Re: [PATCH] tests/Makefile: Fix description of "make check"
To: Huacai Chen <zltjiangshi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=aleksandar.m.mail@gmail.com; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, QEMU Developers <qemu-devel@nongnu.org>,
 Huacai Chen <chenhuacai@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 5, 2020 at 9:30 AM Huacai Chen <zltjiangshi@gmail.com> wrote:
>
> The description of "make check" is out-of-date, so fix it by adding
> block and softfloat.
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---

Applied to mips queue.

Thanks,
Aleksandar

>  tests/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 03a74b6..5d32239 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -4,7 +4,7 @@
>  check-help:
>         @echo "Regression testing targets:"
>         @echo
> -       @echo " $(MAKE) check                Run unit, qapi-schema, qtest and decodetree"
> +       @echo " $(MAKE) check                Run block, qapi-schema, unit, softfloat, qtest and decodetree"
>         @echo
>         @echo " $(MAKE) check-qtest-TARGET   Run qtest tests for given target"
>         @echo " $(MAKE) check-qtest          Run qtest tests"
> --
> 2.7.0
>
>

