Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A9CA868A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 18:24:10 +0200 (CEST)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5Y4n-0004Jj-Kq
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 12:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40917)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i5Y3G-0003rd-0X
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 12:22:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i5Y3E-0004RM-R2
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 12:22:33 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38061)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i5Y3E-0004R3-Ik
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 12:22:32 -0400
Received: by mail-ot1-x343.google.com with SMTP id r20so21202253ota.5
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 09:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zuOxzbX8vRy2ci/SRRiktaK9mIop4krPfCORA36C1QA=;
 b=uSK8MHP4vVQCeHdXhKfJHL/e1eegSxSitojGNbKPG9EnB1DcyZDNDP2TNdXSfsapkn
 Hmp7LLEGN4zVz1xvuEYk5WuvDMXzkEKlD+KjGCCd39Lrh3v72ro2pg9PfeU+w43CWgaA
 E4gllwpI43bG6Zcl/A7NWV/+jpbU8HyfoUQu5b76Z7gMd23XQzMj3hTGcRU2hNPo/lvo
 Jf0HsPZiD2SlF2tms4HdsG2PlekYXZLYIqdhW3Ceu4kOYcavNRQHf+51y8tDsihh8TFW
 sl07QRTVaCDcnlwWxqOI2jD8sMQRG2sjhEHvNDw4Gl2YPJnlZj0GnQdVSZzfFvapBqrj
 zbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zuOxzbX8vRy2ci/SRRiktaK9mIop4krPfCORA36C1QA=;
 b=IBmIFev2Q7l8SYtNMY+noWg+MZZZZzpJ50DM2i7X1UpSB6sb4OX7k91fuSVzXjJnSI
 GizwqCUZv3X6tRnc7yyn7SIXGMuo8UlrhkNjgqWgLawKrOHD0nW2ylyE/1tat6E7p66u
 egr8b8xFPdJkpGboc5GQN/A4TMkNYPbBGd6XrMVMi+K8bMP2NQzL6eh3uLgL1zDx1rKW
 KObUYOddokXM1EIhKRd4j/5ygvGBvHvHALflz4nIYoItomWO5RoTPvcpCZFsnLQSRjIm
 gvwTFo8fs3ABiQmAgVOGv5NcGMBaMgzSz70/8vAlZVfGklyNCqJBnyOA381u597RUQw0
 ULZw==
X-Gm-Message-State: APjAAAXtUhfAjBBB7jTYrhW0yE+a4WP4pjD3p5uFYhq3HfIzPNhR6mtm
 NLZj0B3N+CLN8lI+uVkmOREpo4+Xdw76EbV2khRRaa0Fnqo=
X-Google-Smtp-Source: APXvYqxvEgmWgxYCkvQSx/dg8W6ngi9/b3v2CiBpnkbOOjDCDGXyDrRQPudBrhPYrGBTUcf2vPTCsEdEON4116y5KTM=
X-Received: by 2002:a9d:7504:: with SMTP id r4mr15834776otk.221.1567614151697; 
 Wed, 04 Sep 2019 09:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190903160858.5296-1-richard.henderson@linaro.org>
In-Reply-To: <20190903160858.5296-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Sep 2019 17:22:20 +0100
Message-ID: <CAFEAcA-pJYWNSRjAAnHk7Fcq4foU6vj9EHwz=m9oOOQtOWFr6w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 00/36] tcg patch queue
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

On Tue, 3 Sep 2019 at 17:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit fec105c2abda8567ec15230429c41429b5ee307c:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/audio-20190828-pull-request' into staging (2019-09-03 14:03:15 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/rth7680/qemu.git tags/pull-tcg-20190903
>
> for you to fetch changes up to c25c283df0f08582df29f1d5d7be1516b851532d:
>
>   tcg: Factor out probe_write() logic into probe_access() (2019-09-03 08:34:18 -0700)
>
> ----------------------------------------------------------------
> Allow page table bit to swap endianness.
> Reorganize watchpoints out of i/o path.
> Return host address from probe_write / probe_access.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

