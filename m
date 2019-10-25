Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330D4E4764
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 11:34:08 +0200 (CEST)
Received: from localhost ([::1]:58036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNvyw-000847-NA
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 05:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57817)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNvx2-0006qA-1Q
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 05:32:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNvx0-0005Sw-Kf
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 05:32:07 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44462)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNvx0-0005Se-FJ
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 05:32:06 -0400
Received: by mail-oi1-x243.google.com with SMTP id s71so1127235oih.11
 for <qemu-devel@nongnu.org>; Fri, 25 Oct 2019 02:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NLCKzKiyQWgDkeNo/yEddDjXO9rI//60C6GY3eAjLxQ=;
 b=yHgkHngoVteFRbiQIYTeyw6FwInKfSVOCMnRMCPWLBGC72xt2tqiZkPDHao9pf/67f
 H5gORj8Ug8ciemVxiYAJIEF9u7xuXalyprbab1vK2nJSO5HPZ2KpJBi+KE+bRvOtZsQJ
 RSw+CRiChVBxY+lqNenugET58mDu2sb9MKn0d57G5OaCoSrNFDbWJLJUgN2iTmTvR+7h
 jeMoxqfKZhfJqsBWUCLPENKo/Vm4KI0ob35gs10rtwGPkrYf/oSM5onAyQ17j3T+vP2x
 raHjAVLI1nAOZm6uJYskQlSm5QrjWRVo6TN5eFxhFuZXFKlHnivvPclSy/igqDvhvW0y
 sWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NLCKzKiyQWgDkeNo/yEddDjXO9rI//60C6GY3eAjLxQ=;
 b=QbI+AGXMvXr4A4b3eU96HFOxIxTmQnkllwwPrqw97P6/+zgniqZCgKK9dYzED8qAq5
 YieBfD8rw0x4u02zCg9QTn1KSRWQmHh7wp7dXWyqQh53dz4kzX+XMmD5t/iL42geEzHJ
 x7J3bpDPbAduVJOupNhTtPQvzGs3CeMZimeHsR15xgTUgXO3FUIxdLJmhP1Vhbj4T70R
 EJyQIpWyL1IEGvFPrV1XBGAbgdW+Kaet/QXTkvPmOCvXjcb83yZ9IvxzDemAlfBtl86C
 JWyXehE54GryuP0g/9kO/cW2WP7ldmEh2nEclKz/dcyrWui4Qcf1ZnkFcGGPD57AWJrQ
 YGZA==
X-Gm-Message-State: APjAAAXmLJ+LjAOHNYwbiNHCnJ1/sCTkbz9mKxV8l3B7nFGv5ou0SCBP
 7kMdLNuG+epW3iEV74fxREGAlBOqo9OOfx3d764ihg==
X-Google-Smtp-Source: APXvYqyvInUhLsjilN7WHKlF4fG3PhLxO/FNqcVVKTdp2/FnVAauNkvcHan2P62c474R/Lot4aAw4xbz4GrBp50EUHA=
X-Received: by 2002:aca:2312:: with SMTP id e18mr1094540oie.98.1571995925203; 
 Fri, 25 Oct 2019 02:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <1571915195-4381-1-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1571915195-4381-1-git-send-email-aleksandar.markovic@rt-rk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Oct 2019 10:31:54 +0100
Message-ID: <CAFEAcA-Eawy4t-aGG7u7jR389bUqHab8KX7VSmZUEUjZxbABCQ@mail.gmail.com>
Subject: Re: [PULL 00/11] MIPS queue for October 24th, 2019
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Oct 2019 at 12:07, Aleksandar Markovic
<aleksandar.markovic@rt-rk.com> wrote:
>
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
>
> The following changes since commit ea0ec714d3109e0d0523b9dacb38030e4cb142a8:
>
>   Merge remote-tracking branch 'remotes/xtensa/tags/20191023-xtensa' into staging (2019-10-24 09:55:01 +0100)
>
> are available in the git repository at:
>
>   https://github.com/AMarkovic/qemu tags/mips-queue-oct-24-2019
>
> for you to fetch changes up to f4d200d0e55ebc4e9c9af50cb9317e2f6ebe9d0c:
>
>   target/mips: Add support for emulation of CRC32 group of instructions (2019-10-24 13:00:37 +0200)
>
> ----------------------------------------------------------------
>
> MIPS queue for October 24th, 2019
>
>   - added emulation of R6 CRC32 instructions
>   - added several mostly cosmetic leanups
>   - a checkpath warning is a false positive
>

Hi; this fails to compile with 'implicit conversion' errors
on clang (OSX, freebsd, openbsd, and linux):


/home/petmay01/linaro/qemu-for-merges/target/mips/op_helper.c:359:44:
error: implicit conversion from 'unsigned long long' to 'target_ulong'
(aka 'unsigned int') changes value from 18446744073709551615 to
4294967295 [-Werror,-Wconstant-conversion]
    target_ulong mask = ((sz * 8) == 64) ? -1ULL : ((1ULL << (sz * 8)) - 1);
                 ~~~~                      ^~~~~
/home/petmay01/linaro/qemu-for-merges/target/mips/op_helper.c:369:44:
error: implicit conversion from 'unsigned long long' to 'target_ulong'
(aka 'unsigned int') changes value from 18446744073709551615 to
4294967295 [-Werror,-Wconstant-conversion]
    target_ulong mask = ((sz * 8) == 64) ? -1ULL : ((1ULL << (sz * 8)) - 1);
                 ~~~~                      ^~~~~
2 errors generated.


thanks
-- PMM

