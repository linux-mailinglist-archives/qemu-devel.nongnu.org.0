Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA94AD514
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 10:49:36 +0200 (CEST)
Received: from localhost ([::1]:52986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7FMd-000188-EO
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 04:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7FLe-0000eM-Oh
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 04:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7FLd-0003s2-1h
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 04:48:34 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:46585)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7FLc-0003r5-RN
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 04:48:32 -0400
Received: by mail-ot1-x331.google.com with SMTP id g19so11644442otg.13
 for <qemu-devel@nongnu.org>; Mon, 09 Sep 2019 01:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Amagt2rPwiMr6gl9DCIWWIkSxvJw6n0bZMRv50TOAO0=;
 b=HxwiM6P3TYSsLMml8QKqZJ0Qz/ym+lciACCHNJ4sCIRkO9pHTZuWUcxQQf7tv93824
 KvwapAsU4ZMCjVoO6S1ubHWv8u3tjSeE3aB31N/Ec0HsyffQjnDUcFZ7IPzdKkfhH+kk
 hFJH05YLCJUKgHNcGObDQopVZ8PRSAQxG6ue05md420UmIr7s2+hXkMeQ3BBAW4zqwZi
 urdSCN03qOTpyh7o4FzTvT606n1lLGE0D135MajoqcY7748CC5HX4hf8YtTYpZ73ZCIB
 deQqVR61jyJOGqrRrDEcpIkG+cyw5yCz1s3owN7QMs8BGE4flVe4au6uEUmCRX4q2Few
 996w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Amagt2rPwiMr6gl9DCIWWIkSxvJw6n0bZMRv50TOAO0=;
 b=XDFM2cVOwTFFamXOQTXufeJ/AWR7mCI9Paa0HNe0rzlFFYPexhN1tZw8b858O9OusL
 OTN8AEsKMkMMthYE5oBi3VVFKJEeaaFG+iWCQcumdpyMiJw1gMfCza8gw4PUByBi5Mis
 ibLvfFERIKYABjUCRmjGBkaaoCp4isQi3Udaw9MRLtAihkC67TSPh65lLZE6esBKoYnR
 lLWEIS085evBmVJwHaSgqvzlErIkXHJxBzrlhAn9YETGFPNgXVpA2gQvdLIR9CFXF7wW
 e+XmHc33uJ+tzL4ANCZTitdu+mpn5jhhhCg7/94VVuiB7cnfjEdpwAif6IupLZCHghnc
 Lktg==
X-Gm-Message-State: APjAAAUsI5vTNszXMdPBhqvQ+D54ChpJyCdmn2qz9gYiAWEd/YktSKOG
 z/4OhzlBsRSNpouOHjlam6rP9Y3Gegkbf+qoGhvaXg==
X-Google-Smtp-Source: APXvYqyZLyQY5Gvx/brAGHmSbacojeOco2SLCvbpZDxAaGXOi0vGIcoEtdjn1a9dsNScjwBT5j7/tR0uIpdoWhh5YF4=
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr18928855oti.91.1568018911338; 
 Mon, 09 Sep 2019 01:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190905211522.2824-1-eblake@redhat.com>
In-Reply-To: <20190905211522.2824-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Sep 2019 09:48:19 +0100
Message-ID: <CAFEAcA_QLRjVrq-8D768yc-aTTRmst1HTwhWzH5r7p9_JD2M+w@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::331
Subject: Re: [Qemu-devel] [PULL v2 0/9] NBD patches through 2019-09-05
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

On Thu, 5 Sep 2019 at 22:17, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit eac2f39602e0423adf56be410c9a22c31fec9a81:
>
>   target/arm: Inline gen_bx_im into callers (2019-09-05 13:23:04 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2019-09-05-v2
>
> for you to fetch changes up to b491dbb7f8e09ef864770c205a3b5bce6c5c1881:
>
>   nbd: Implement server use of NBD FAST_ZERO (2019-09-05 16:04:53 -0500)
>
> v2 pull request: fix iotests 223 and 233 (only re-sending the patches
> that needed tweaking, per this backport-diff):
> 001/9:[0002] [FC] 'nbd: Advertise multi-conn for shared read-only connections'
> 002/9:[----] [--] 'nbd: Use g_autofree in a few places'
> 003/9:[0008] [FC] 'nbd: Tolerate more errors to structured reply request'
> 004/9:[----] [--] 'block: workaround for unaligned byte range in fallocate()'
> 005/9:[----] [--] 'docs: Update preferred NBD device syntax'
> 006/9:[0002] [FC] 'nbd: Improve per-export flag handling in server'
> 007/9:[----] [--] 'nbd: Prepare for NBD_CMD_FLAG_FAST_ZERO'
> 008/9:[----] [--] 'nbd: Implement client use of NBD FAST_ZERO'
> 009/9:[0004] [FC] 'nbd: Implement server use of NBD FAST_ZERO'
>
> ----------------------------------------------------------------
> nbd patches for 2019-09-05
>
> - Advertise NBD_FLAG_CAN_MULTI_CONN on readonly images
> - Tolerate larger set of server error responses during handshake
> - More precision on handling fallocate() failures due to alignment
> - Better documentation of NBD connection URIs
> - Implement new extension NBD_CMD_FLAG_FAST_ZERO to benefit qemu-img convert
>
> ----------------------------------------------------------------
> Andrey Shinkevich (1):
>       block: workaround for unaligned byte range in fallocate()
>
> Eric Blake (8):
>       nbd: Advertise multi-conn for shared read-only connections
>       nbd: Use g_autofree in a few places
>       nbd: Tolerate more errors to structured reply request
>       docs: Update preferred NBD device syntax
>       nbd: Improve per-export flag handling in server
>       nbd: Prepare for NBD_CMD_FLAG_FAST_ZERO
>       nbd: Implement client use of NBD FAST_ZERO
>       nbd: Implement server use of NBD FAST_ZERO
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

