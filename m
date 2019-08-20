Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7A795AD4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 11:21:07 +0200 (CEST)
Received: from localhost ([::1]:35262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i00KA-0002Kc-FL
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 05:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i00J0-0001fC-PJ
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 05:19:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i00Iz-0003VI-Be
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 05:19:54 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:41758)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i00Iz-0003Tz-57
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 05:19:53 -0400
Received: by mail-oi1-x22a.google.com with SMTP id g7so3566618oia.8
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z2tiHunDR1SB6uAkT9X4weYEpM3uwRbTBhJLmrnBzBc=;
 b=NxxeeUQNilmf6zIOvnRe0//TIeVd6G2aJ0x2DxICmhWebJtsvVML6sNgthTkiSgIdy
 MNvPp+dZ4SChqIaJ82QPsPYcmpB58hblVNBcuNe8Wf15j71IdaaRlOzu2FrabdPLlG3f
 6+juUkZN4MipfKQC3onNJisXKBTM38Av5qP2V46qb7sEv8y/WhPhAEDHeFdsSqrRSUB1
 Q5MSSVJHKfpFjZul1iygE9OZaWI7nbjv9/8bVK5fAvN+W06Z18s4ZI59sPaeP2TJJJmM
 /DH8706gMIhoj90QFSCJVeK5PQtG5ux4BI34V7zgx4NSXUWZL9U7S8NyO+sXtbm2aZ9x
 3lKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z2tiHunDR1SB6uAkT9X4weYEpM3uwRbTBhJLmrnBzBc=;
 b=FWU7srsQ4D9Pyc1yx++7rJmlUB06oO+wg2iStAlQGtWuyv+Wmcu84WaM+oCVxDk0U8
 jgvP9PVhgCukUSggeoql/b7n7yirlvCxYPceLasbnFwyY+6tDHEegEQm9lq/ztb9XCcx
 TobUf9m17RuWRxeahfwsv6PmsEE4tx1WwCncETNLd7a8HerXOnIhZHHllDiuzN4DdRFX
 BzgcQcKnwvlqDFVnufOLyvnm3lFR+CicAK6s3NB6R1fHKi4ieZNV+o8YmFLnPEpK+xZL
 A3FCBmdpu48SU+gQ+m+ozP0o8W45XbjJmthdb+c3gHcs/MnxMCFsfXzxHx/zQE1nzFc5
 p2QQ==
X-Gm-Message-State: APjAAAUtrKYUazh3hPorMu2Zhro+zKw/FGwK1GFIcdCUoFOI6vBm8kKR
 Y30T4t8/FMK1aPWPz0tXACi0QLXXQjlzjUZ6C0rsXw==
X-Google-Smtp-Source: APXvYqwR237HsyzU9vTMPuHumt/64ELcu640cwhJT8/2FO1fOB2qY1OlLCIyhFMPXJ3rIekNyL894k/jQFhxAqh3vPA=
X-Received: by 2002:aca:4a57:: with SMTP id x84mr16795042oia.170.1566292792170; 
 Tue, 20 Aug 2019 02:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190819151743.17267-1-richard.henderson@linaro.org>
In-Reply-To: <20190819151743.17267-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Aug 2019 10:19:41 +0100
Message-ID: <CAFEAcA95hD44RqrBLSrnPiTBUCWcKfm4YNxfdvGUWt8wrx2eig@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22a
Subject: Re: [Qemu-devel] [PULL 0/3] decodetree improvements
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

On Mon, 19 Aug 2019 at 16:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 3fbd3405d2b0604ea530fc7a1828f19da1e95ff9:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2019-08-17' into staging (2019-08-19 14:14:09 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/rth7680/qemu.git tags/pull-dt-20190819
>
> for you to fetch changes up to 59a3a1c0c211640e18b058a1b0444154c4eb6f99:
>
>   target/riscv: Remove redundant declaration pragmas (2019-08-19 08:13:14 -0700)
>
> ----------------------------------------------------------------
> Implement parameter fields.
> Push warning pragmas into the generated code.
>
> ----------------------------------------------------------------
> Richard Henderson (3):
>       decodetree: Allow !function with no input bits
>       decodetree: Suppress redundant declaration warnings
>       target/riscv: Remove redundant declaration pragmas
>
>  target/riscv/translate.c          | 19 +----------
>  docs/devel/decodetree.rst         |  8 ++++-
>  scripts/decodetree.py             | 71 +++++++++++++++++++++++++++++++++------
>  tests/decode/err_field6.decode    |  5 +++
>  tests/decode/succ_function.decode |  6 ++++
>  5 files changed, 79 insertions(+), 30 deletions(-)
>  create mode 100644 tests/decode/err_field6.decode
>  create mode 100644 tests/decode/succ_function.decode



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

