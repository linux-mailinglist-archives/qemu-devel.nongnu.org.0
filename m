Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDF716C385
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 15:12:23 +0100 (CET)
Received: from localhost ([::1]:57400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6awg-0003RM-J3
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 09:12:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6aHT-0000HI-2P
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:29:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6aHR-0000Aq-TU
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:29:46 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44446)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6aHR-0000AX-NP
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:29:45 -0500
Received: by mail-oi1-x241.google.com with SMTP id d62so12501520oia.11
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 05:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZfEM8rOFCGsvykAozSN8UdElVXJHaSuSaBxSr4C9cIM=;
 b=oHmSl6iJnEJ3puueP+l8Zv2sT0O2fSIixP7VMr4ayOzGJmTL93XgjAxE5psTBkoE2S
 7n0ox57OZgv7BCZBv80MsRyUvn3yuEWgg10zwIwQXQ62rDSUR/mzpZsCGuM/camzqJgB
 sUs62eO45twZl5ZqrxPozpDuLRMA29mhWC8gE4VEcbMAGD8vTo5e+0HFpqi4rd8TwDjf
 BtY4wxb+kvhlHlEg9d07nBbyftw1R1Ly5IwWMVHB6eLATz1ldeTlhqU/jM7200eUhGbH
 bZgAGad24yx8krkiUG8NK/Pm50XkGwjgCfe3VIreZrJxvYfNhW3usRInc1yUapn3nMfz
 +KNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZfEM8rOFCGsvykAozSN8UdElVXJHaSuSaBxSr4C9cIM=;
 b=Q2ALN1JEMXT9QQbwu6p39M3JIKrvSAsx1gyJpaINbJ9BRIxHCOSnLoqZPSwySIdzQu
 jTBoPTM07PndfpYliLaZpQbImmo0lESI4uEPXtlp+yKPfc2hWB14mJ/SBi0qDcLwISES
 tzdYM5L9QePTcRkgq7f+i9FSJ6+mvaCFRMkkbpik1HDPLL3+XeHiyzAPp7QZOqM0PIw3
 7ToE2APyvfRR3jbMnrk5a1JKkCpnp48CG4M8uTqT9UhTEjIQ11GZz/rdrL3Yij7n2XGS
 yPqdMJr+ec6V/Gib3DPEk3Yldfey/V3IOEFuDZryaDP0C2mckvAQ2pcEKx3+3fLDf9T5
 IK9A==
X-Gm-Message-State: APjAAAVfOYw7uKZtvKmDxBh1xjdHKUdo95McTQe1AzYxpkSz9zt1ik7D
 BtjWZCEblQ2vFLBgogCuhOQ+iadOI+2baPuC2Vd4Sw==
X-Google-Smtp-Source: APXvYqwAYEb0+DpVuiL68R92i3EYQ8GF3opxXO9EkesDjhcn8jAszGoyE7mm6sJgU7mQGLZfXL51A+KoY2D4T25sQOo=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr3418809oie.146.1582637384967; 
 Tue, 25 Feb 2020 05:29:44 -0800 (PST)
MIME-Version: 1.0
References: <20200224222232.13807-1-richard.henderson@linaro.org>
 <20200224222232.13807-13-richard.henderson@linaro.org>
In-Reply-To: <20200224222232.13807-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 13:29:34 +0000
Message-ID: <CAFEAcA9chntRNogbqTz-imd1=2JJ8mzL=-dhnNQ8nG9Q10y8Rw@mail.gmail.com>
Subject: Re: [PATCH v2 12/17] target/arm: Move the vfp decodetree calls next
 to the base isa
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 Feb 2020 at 22:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Have the calls adjacent as an intermediate step toward
> actually merging the decodes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix fallthrough in disas_arm_insn vs vfp insns.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

