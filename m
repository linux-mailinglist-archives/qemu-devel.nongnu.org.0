Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ACFE4A2
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 16:23:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL7CF-0005Q8-HJ
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 10:23:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL79l-0004En-RR
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:21:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL79l-00015l-1K
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:21:21 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:34119)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL79k-00015I-TQ
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:21:20 -0400
Received: by mail-oi1-x22d.google.com with SMTP id v10so8442032oib.1
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Pqo2m9x8JkHtQeu1aC2S9fR5vqQT4BUp0+MpsO9Wglk=;
	b=cw8E9dsGY+8RLYbY6+PyZH2mbWwM7t0YCwxbEVll0HnIXOjoOAUnglfLcwhUOHCTv4
	Rf6KVSQLDoGLnYM0WEmHFQCy+r9RL7uTBa9Ey1H4klWItrHesGUoRLNxrJkMzQ2pbvTe
	YxKyrTqbLNBEqom9vFycDo00POgn0h4/fqy2nPcZ7ftQ8rMvndaNElxwRcwgVb1YShyT
	WgbT2wDg8dWhu3OjuT9RWKoAXFewCjqI7mghDuzJrNJfrw/8JGcQbFMKetKis37HvXjX
	f55sePXdQj7qw6xdradfmnlx5EcrGPe16ca33LDwNgaWiNhyKCsP4OAkqhwJVLMR+seh
	pf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Pqo2m9x8JkHtQeu1aC2S9fR5vqQT4BUp0+MpsO9Wglk=;
	b=bXJ7y6BH8XzRhm3VMYLniJnrkXl+tAGKGb+Vxcgv6nHiZrLn2Fnrz2tn5+G8W+WAIs
	o1LvcC759SsCyR/p1qUgEvWVxIyJV6ewDAyzVwkJd7iuRWP4o0LCDajOV4XVW1D24CCd
	qoduVeF80+RoxX3akmK9JWprQHSnt5yA3ucKuweNxp3N21gM8n01H5Z4yUinNoaH5FCL
	OOWGHyM4cAEBlUd42DxfCHhQsWxkEgs+syNK3u12UGzVUNVpwFHLrTaRrGteM8GYyqod
	IvpjgTR1qrohLyaa10SReYiyVZgEmWnbEp+prGjp/fBTV3ROkny5XlyPNPDveLZvnv4C
	RCtw==
X-Gm-Message-State: APjAAAU2KVLJZ6DPON+ZZsX09kqwu78zAFGCuie13T53NyuwbFUD+etK
	qa+dSgWlVbnxyO5F+76GQDxJVtnln36xwulIoMWPGQ==
X-Google-Smtp-Source: APXvYqwS11vzljG1lakDUdaV6A0ZzMjlsfAhRETF1RNzc5c9ojF3DYFb5W+tOaOKBQ+ZWb4iEUIS3n+6JOjVl94CJBI=
X-Received: by 2002:aca:e054:: with SMTP id x81mr15782588oig.146.1556547679618;
	Mon, 29 Apr 2019 07:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190328230404.12909-1-richard.henderson@linaro.org>
	<20190328230404.12909-23-richard.henderson@linaro.org>
In-Reply-To: <20190328230404.12909-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 15:21:08 +0100
Message-ID: <CAFEAcA8phrZnNDN7aFJfMXDbBoyWFA4-=bORFemYY6yQNfKWsQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22d
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2 22/36] target/s390x: Use env_cpu,
 env_archcpu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Mar 2019 at 23:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/cpu.h          |  5 ----
>  linux-user/s390x/cpu_loop.c |  2 +-
>  target/s390x/cc_helper.c    |  5 ++--
>  target/s390x/diag.c         |  2 +-
>  target/s390x/excp_helper.c  |  6 ++---
>  target/s390x/fpu_helper.c   |  4 +--
>  target/s390x/helper.c       |  7 +++---
>  target/s390x/int_helper.c   |  3 +--
>  target/s390x/interrupt.c    |  6 ++---
>  target/s390x/mem_helper.c   | 28 ++++++++-------------
>  target/s390x/misc_helper.c  | 50 ++++++++++++++++++-------------------
>  target/s390x/mmu_helper.c   |  8 +++---
>  target/s390x/sigp.c         |  4 +--
>  13 files changed, 56 insertions(+), 74 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

