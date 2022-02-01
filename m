Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F6A4A63FA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 19:34:21 +0100 (CET)
Received: from localhost ([::1]:36212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExyt-0002IT-Fx
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 13:34:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw6H-0003PJ-6E
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:33:49 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:64302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw6E-00007t-JQ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:33:48 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 608DB7E544
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:33:44 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9VH6CG5z4ctS
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:33:43 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643733223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wi5+GSn0Pb7vbA5WTJ/CKGXeeu3XirPe1GPwumeq9iA=;
 b=g5K/6Zprnfvcf271IucJilcWhL3agYLNsn8kNqSMZKqwdVNRj6tdOzoaPTtesXkEhHY+55
 rsg5n+fq9PWit3qGLqwMX5wYW/oarOVDWm5700nPfBvILSNfqpNprujB6c7p0+aUYCoujS
 4pVy7QSCIoXUgEykyG2RfmObhi7gxJTB9pvklPv8kU5isRb9PM6FMntkR/2Ayp7bbLOSrJ
 xNawYh1ZaGDAj9XHdzuqH1jVJvCU1gEgghBtQnuGcu+J5jWNLbd6PkPVm61zvuIDq53uXh
 MvCl7nVotWxYSZ5ecfXym1/D997aDFOne9O03iLs1W8vxRQx/RcQ6seM+MNpMw==
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id B70222F10F
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:33:43 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f170.google.com with SMTP id 71so15599760qkf.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:33:43 -0800 (PST)
X-Gm-Message-State: AOAM533IMvH/X7JR5xYk3W1G3FXM1+UJAA4sNtmPhb2pEKQNHr8EYVXh
 zoVubJZyZZwFJKUL8RkCRaAbi92wt1iGRXOSiAs=
X-Google-Smtp-Source: ABdhPJxgHEky/k49PQCfSKBzvkbNdyPLdWNkJbBj3NWc0ALGZhhfvr0EYJulg5PG9W6CAXeSzenTKDlReFaSZ38MNn4=
X-Received: by 2002:a05:620a:f0e:: with SMTP id
 v14mr17312077qkl.365.1643733220908; 
 Tue, 01 Feb 2022 08:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-7-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-7-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:33:29 -0600
X-Gmail-Original-Message-ID: <CACNAnaHuHhBwz+uBL=vBhDWthajyH2Rf9BxyuzyCFrHP3VzSVg@mail.gmail.com>
Message-ID: <CACNAnaHuHhBwz+uBL=vBhDWthajyH2Rf9BxyuzyCFrHP3VzSVg@mail.gmail.com>
Subject: Re: [PATCH 06/22] bsd-user/arm/target_arch_thread.h: Assume a FreeBSD
 target
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643733223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wi5+GSn0Pb7vbA5WTJ/CKGXeeu3XirPe1GPwumeq9iA=;
 b=YtOPthckkt2YGeXJGIcZ4DAFt7zR2EmhSKOfpOouKJGZ9lwhmn0pq7AqDd1E5flgNJUmyG
 2di2skWeN+cN9Cdfzq01K6A8SrbI84v1C1Cxk1GSdMqVKshS7rGd6w0IPBlAGy8hbak5xj
 78CsXSJ5WC9m8zNRiw7PI1v1fNsLcqk3FlhL6U+G5j42MkP64hB4WxtrtCGR0FasQ5/8OW
 UFfpkTJyWFTy9a2hZueBN4DCrlrNGYaDf3iALVF4ynbJG6xQFdSfYLp4NCAOGulYHlYyJx
 fuuHR6FPjkxoohuDvTLWl1qNPFvHuTc0kgqwwi2QqDnsJnXP/58B1MDOI9YT4w==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643733223; a=rsa-sha256; cv=none;
 b=d3osE0pRahmcM2XtmHJjQsC5GifP+b46DY3buztjwKIu7GYDBywCbBUg0ONfbs+fIWY0BQ
 A7MzwvPYLHjakBan1fg41HJcBfu8636i9rRp1Humn0OCPKzfxFgclKsd05QJOErJOTFl4Z
 zCk8igW/GWx3iGCgQ87qnuCl7EnJ7WBbRqtHmx1xipwoSL/zOvCbRgveXgkAxFN8yFhZHJ
 5HtsbjLIBefUaUa79aGuqYYUQkbff+4xEm0t9fkvvbZ3Pxf5Mb4NulwepzjrF62ag4kjXs
 cw77a2g9M5FGkGCuOAlbqEVORO1W3nGUhJbHBZ8ZSt1VUpMfz3GV7DQceo4FgA==
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

On Tue, Feb 1, 2022 at 5:14 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Since we can't run on anything else, assume for the moment that this is
> a FreeBSD target. In the future, we'll need to handle this properly
> via some include file in bsd-user/*bsd/arm/mumble.h. There's a number
> of other diffs that would be needed to make things work on OtherBSD,
> so it doesn't make sense to preseve this one detail today.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_thread.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

> diff --git a/bsd-user/arm/target_arch_thread.h b/bsd-user/arm/target_arch_thread.h
> index 11c7f765838..fcafca2408c 100644
> --- a/bsd-user/arm/target_arch_thread.h
> +++ b/bsd-user/arm/target_arch_thread.h
> @@ -62,9 +62,7 @@ static inline void target_thread_init(struct target_pt_regs *regs,
>      }
>      regs->ARM_pc = infop->entry & 0xfffffffe;
>      regs->ARM_sp = stack;
> -    if (bsd_type == target_freebsd) {
> -        regs->ARM_lr = infop->entry & 0xfffffffe;
> -    }
> +    regs->ARM_lr = infop->entry & 0xfffffffe;
>      /*
>       * FreeBSD kernel passes the ps_strings pointer in r0. This is used by some
>       * programs to set status messages that we see in ps. bsd-user doesn't
> --
> 2.33.1
>

