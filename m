Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0BD4A6580
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:14:51 +0100 (CET)
Received: from localhost ([::1]:41622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEzYA-0003CD-PQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:14:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw8y-0005uE-Q7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:36:36 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:26756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw8x-0000cp-AZ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:36:36 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id EB3F17FE4B
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:36:30 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9YV5mwkz4fCw
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:36:30 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643733390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jrZUmTexJ4TLGlUbRdQYTcWnu1+5dsfT8vOaOUaAI9g=;
 b=WijX7K3gnbtp04nfixfReUBDNYnYSxgqQM+Zy91kBqKvYwuGIGg4Uz/7VPEpcOmdb4zODF
 dkSE5wYvXx7wSwmkxTgkgVXgt+J/Lzt+wwBipCfEqR9YfGRSgsHgoGGxco3jNgeGw8f3Si
 5G7IaT5iyeB8G9Zat4qCIyvYWxUwZrmPGdD+O+tMX/AqQq7twjvLsBWZ6+cPJyfhrc8NVt
 FqZ3V0Wp4JdIAUNtJHC2tH5CCmEWHLd2nMyAICOqoBYpMkTi04xNq66jxWrJPg+VfhseVO
 jDDOb4bKy6l43jdCVG0fWHLA/VPSuWqp+OdKMaoLomxE8hfR8LwwKnDiIyyTGw==
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id A77692EBD3
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:36:30 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f178.google.com with SMTP id s1so1727538qtw.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:36:30 -0800 (PST)
X-Gm-Message-State: AOAM532L2tY1zeIseU4qX4f6eRAZeYoiP/SxkpVayopBl4mmO17yqG/L
 8VTpKlTxu1HXxd+cyQ1MwtnWNRA9SBUqKHi998Y=
X-Google-Smtp-Source: ABdhPJwb9omOdp6ROG9/T7mu36yBri7qhbu4y3eKiFkh0bWkB7CDiOM6fWf9pfPMnwUYG/7E5oqsO6/zdkS0EDMf+4k=
X-Received: by 2002:a05:622a:ca:: with SMTP id
 p10mr14596499qtw.123.1643733390190; 
 Tue, 01 Feb 2022 08:36:30 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-8-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-8-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:36:19 -0600
X-Gmail-Original-Message-ID: <CACNAnaEz+D4cPJocCKGe0+QmkQm=KCx1c1_4b_O4yRhW46UJQg@mail.gmail.com>
Message-ID: <CACNAnaEz+D4cPJocCKGe0+QmkQm=KCx1c1_4b_O4yRhW46UJQg@mail.gmail.com>
Subject: Re: [PATCH 07/22] bsd-user/x86_64/target_arch_thread.h: Assume a
 FreeBSD target
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643733390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jrZUmTexJ4TLGlUbRdQYTcWnu1+5dsfT8vOaOUaAI9g=;
 b=sYL3oA2WLkwQrY0zTsnaBBnzxI3Q7uQ6euuogyF7G2HZ5ATkOBZU7V9+wpUevVHXlas0fU
 5eJPxx/O8ATO8YIkWszepVyKLiTgtok64JLMlURfddPmLszXjAKSwKj398Bl+PgC6NqcWa
 0SMwAUiGhHMNR3ZayMcSo8ESXwDD1p9PLv6EC54TZjkuDO290z/2lzzr1CAW/mRLWMbAAM
 Y8zO8J0UjSc/6pjSmuyW6G0xkA4gKcE5+G50ELs4FVZNbdO6bPefRsy4k6W6LiESomAfQg
 CjKNWgU+plCkZLgLj1QgqqOzECPzPFAN5QyJjWr63jr6LPj2gwWpNu0ZhOBctQ==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643733390; a=rsa-sha256; cv=none;
 b=d8Sd2KiXA8Cs/1ZzTA3Jj6YSJe1k/6Vzwr9H3lvec2F9NohGFatRUNZ+gx/tXbjc+F96AX
 Jg0Gv/Ar+5cAmGuONP6G90LRyrKumrhNReu/KEiPdZqDafLldtQZU/9kY1+lQiK5tB5iqC
 A9rs4OAW8XsYnLcOFB2Fln8HsPKQGkbLnlb5ssyFJx2idVsAR9usy1gUgENQnxYmOzPhbm
 ioL4R/j18qVQvv6VXcgMoyQ3m7JPwbB3o4RrfZiuVBv0PtR01G+3aNdln/hnj+Gi95jcky
 sBDCeXk7WM0AUfsfO/TrrvWRNPicqZVboeGzTnWGVvFTcwL9jzr8LNQyQvfGdg==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, def@freebsd.org,
 Jessica Clarke <jrtc27@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 5:15 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Since we can't run on anything else, assume for the moment that this is
> a FreeBSD target. In the future, we'll need to handle this properly via
> some include file in bsd-user/*bsd/x86_64/mumble.h. There's a number of
> other diffs that would be needed to make things work on OtherBSD, so it
> doesn't make sense to preseve this one detail today.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/x86_64/target_arch_thread.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

> diff --git a/bsd-user/x86_64/target_arch_thread.h b/bsd-user/x86_64/target_arch_thread.h
> index d105e43fd35..b745d7ffeb7 100644
> --- a/bsd-user/x86_64/target_arch_thread.h
> +++ b/bsd-user/x86_64/target_arch_thread.h
> @@ -32,9 +32,7 @@ static inline void target_thread_init(struct target_pt_regs *regs,
>      regs->rax = 0;
>      regs->rsp = infop->start_stack;
>      regs->rip = infop->entry;
> -    if (bsd_type == target_freebsd) {
> -        regs->rdi = infop->start_stack;
> -    }
> +    regs->rdi = infop->start_stack;
>  }
>
>  #endif /* !_TARGET_ARCH_THREAD_H_ */
> --
> 2.33.1
>

