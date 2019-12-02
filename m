Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50C910EEE6
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 19:06:44 +0100 (CET)
Received: from localhost ([::1]:42704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibq5s-0003b6-0D
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 13:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibq4y-00031K-PY
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 13:05:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibq4x-0000s6-HP
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 13:05:48 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33255)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibq4x-0000ry-Bg
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 13:05:47 -0500
Received: by mail-oi1-x243.google.com with SMTP id v140so389052oie.0
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2019 10:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9oo49+/8h5pIujpRbbL7WqnenIBdUgzrQdbl7AUJwcs=;
 b=lPLb5Hsr96qmzHmCI+2xuoqnFCOC+5t/+obfrYHgEthDBVjF3gG4RI2ECpoXjGlLHW
 dhlK75yFN2jKv4dWeUBvoaVKe4HBdLwJGramQaiMbth5dhnsmuRYP+jLKFQ7GTkNXqnQ
 5ngctgFofJy709iWJCrONACioqEwZx2IT/f22Hjze+shwLM3BPEXU+4gEi9LytDFJAVb
 pNk5cZcfW8t2Hwwvhuo3wPA3mwrVaEdwXZaTQjX6MQBBCID8MHGSzBbPlUDWX4cg2OZb
 WVxPkvsrIejwHKwdM9VtJVWKkMaFOuyIxrTNJXFHaQmrmB5Lu17L9QTALzlQi3rw7+rv
 KzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9oo49+/8h5pIujpRbbL7WqnenIBdUgzrQdbl7AUJwcs=;
 b=bhMK0/GiqSW4B7sBoTeXzU9XTz+QGErAMQ66OkI7LtHujZlJkIRmU3lmedrDgMDdaW
 1VbpSUnvJdNXflwkMjKrQuF45Jh3KiA8CtdINeVUlrUMCYLcL3x20OjyZ4rRnlzjso61
 jXMKRWhjVrJ7rXhoIzhcBHXzDHbcbkwgJkCUPLn9fOswKhrOgKk/GzmYhz18ME4XiMBE
 qIEVAg9LJ3CFA6Jse2OV6YL3851P8mwgZzVkkWdKILOOvRj6YwROuwh4Dh0GBnkjkXN8
 9J71cYxlxhPY4Z6jAaThGQob/hCWNGIZLDX/TL+L3PlI0tiRvRdHT5haR4MGXVfnZCAk
 6DWQ==
X-Gm-Message-State: APjAAAUyz3UOxjlxqluJO3I/O6Jce0HyxD9RM9axSIo2+FLiDd8Pg/QQ
 xm3wiXJNWQRPxYjkPV+T3/YeEqkvFvlCGvcCLxiULPNqD3c=
X-Google-Smtp-Source: APXvYqzbruO1SCAMcCpLpjfiJprzjz28ABjg7JPHXhm6z5q5sGFYH/otOONFhFli/b7n+Xz/dnsf+dvmB90ZxN06iQw=
X-Received: by 2002:aca:f5cc:: with SMTP id t195mr220686oih.163.1575309946377; 
 Mon, 02 Dec 2019 10:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20191129140217.17797-1-pbonzini@redhat.com>
 <20191129140217.17797-9-pbonzini@redhat.com>
In-Reply-To: <20191129140217.17797-9-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 18:05:35 +0000
Message-ID: <CAFEAcA-e4Ha5Nr-tO+tv6gwZy1z92YdsTxEnMY0_y58FcYD6LA@mail.gmail.com>
Subject: Re: [PATCH 8/8] docs: add memory API reference
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Nov 2019 at 14:02, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Add kernel-doc directive to parse and include doc comments from
> include/exec/memory.h.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/devel/memory.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
> index b6a4c37ea5..5dc8a12682 100644
> --- a/docs/devel/memory.rst
> +++ b/docs/devel/memory.rst
> @@ -361,3 +361,8 @@ callbacks are called:
>  - .impl.unaligned specifies that the *implementation* supports unaligned
>    accesses; if false, unaligned accesses will be emulated by two aligned
>    accesses.
> +
> +API Reference
> +-------------
> +
> +.. kernel-doc:: include/exec/memory.h
> --
> 2.21.0

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

