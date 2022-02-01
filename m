Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836854A6526
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:47:42 +0100 (CET)
Received: from localhost ([::1]:36622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEz7s-0005FF-QL
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:47:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEwEi-0008Nu-DL
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:42:32 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:35968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEwEe-0001i0-VL
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:42:32 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 5DC2F807FC
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:42:06 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9gx72LCz4gCk
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:42:05 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643733726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/RMnXExM83sqyrY2qMGcl1q2Ez0Pc52x43a+FRP4WM4=;
 b=aG3RejBZ/uA0f5Y8+QC4v737La+MoD5UKyB56UKbsL4xTG49hNzpPHUei9GjZNTndYhqWP
 mj00x+q0z15BfjkuXVlQQTjmVq3P/n7R09/1KJwTx6ayekViATz41hwUba2+jp5jqogCmo
 DAUQ+omSoXU/T4SuFQxWC1yAQM9j/cIo5YQJTlu2Ff5Rks/zSliHjz6nC5OC6n2MFbnp8M
 pCI+6MEQeA2Kdy+jOU0yWiod8ENQgEqplG+Pv9Z3C+iS5MO3zWSy1Tvzgug6GQyrCccqPd
 Uf/YwoT0KBuKWmNJ8E917Wq6fjY9SSjTe9XRe8iOlZotlLXxQO/AXafRMBHeOg==
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id CC4AD2E936
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:42:05 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f181.google.com with SMTP id bs32so4230036qkb.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:42:05 -0800 (PST)
X-Gm-Message-State: AOAM531BuW3mE5NRW5IJOFlFU8raA2CiuFzR7R4swyO1S657w0SztLFI
 J/QB0alGKqLlnvH+z+GxIww1eq2h+Msr5APKNvc=
X-Google-Smtp-Source: ABdhPJyxCFxpTC4QcIfs+YdAUebkp45Lo5tjXSp4UYtlEmxnrkt4/f65/Ndgy4WmihJIZlwSd8PJi4nEzfCcOpVsb9A=
X-Received: by 2002:a05:620a:1997:: with SMTP id
 bm23mr17373930qkb.488.1643733725503; 
 Tue, 01 Feb 2022 08:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-19-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-19-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:41:54 -0600
X-Gmail-Original-Message-ID: <CACNAnaGjPO42cm6sJVYbiSZU3a3bX4vNQH6AFxNacj4-+QA8Cw@mail.gmail.com>
Message-ID: <CACNAnaGjPO42cm6sJVYbiSZU3a3bX4vNQH6AFxNacj4-+QA8Cw@mail.gmail.com>
Subject: Re: [PATCH 18/22] bsd-user: Define target_arg64
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643733726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/RMnXExM83sqyrY2qMGcl1q2Ez0Pc52x43a+FRP4WM4=;
 b=BBtR1Gjb1rlXdTmJPqF2YIdlhOAaznZCWVbO2vQwAamOLmxxo5eQS5pMzlIOpO5tjCQVf8
 x6owhG0+ZX+VC4pjbb8O1U2OJtBfqg3bpS26oqXVsgdNNsU+nMRUqMq5mX/7K5jGIBhh6o
 m2E7U2D1ghqrIgeYFypkVRhge56SczdfoNz604RjfiCAEUpcawbMIPJBi0NkfViaiJpRvs
 cbJEgUrb23jsGkRU3mUt51e1yfTaLa9UjqYOdyhjQ3eqf9OI0HGTDXZ6i5zytFUcQZ1Spy
 yGsm2PCt3sojsKgZE4tFyriQBFNJD9e7m/S1e7V5XvVfvBzEJ3GyRoU+TGxE7w==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643733726; a=rsa-sha256; cv=none;
 b=yebmmPUsucyu3Rm0arn9Wo1Y3dxcLj01/KbDGUxq7dwzVH7mX2tkU4o2mJEtJOW73Eo5Ip
 076Dko3NEvTTmK9DCYCfBcsGoiqOXZjrBDSZnHpD1w1jKOguHiaEh/wWot4SmR9250AEgS
 i01WS4n11EAV6cBZoPeJgO/roty6hPswJv7xpLH9GKW+wZf0sDADFJTbcX/vQrBGZN7aA+
 5W2uyrHNlDrulMd1PdwGgkFhFOu5AWPXJa3+Z6RmIV9I2sG4wcHe60MD18nvQT/kBst3Qw
 miXsiJrSFm6K5fac352sd1DcETnlZPcyhn231EG5PK+Cs8lq5Nag/68/ziJNmA==
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@freebsd.org>,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, def@freebsd.org,
 Jessica Clarke <jrtc27@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 5:15 AM Warner Losh <imp@bsdimp.com> wrote:
>
> target_arg64 is a generic way to extract 64-bits from a pair of
> arguments. On 32-bit platforms, it returns them joined together as
> appropriate. On 64-bit platforms, it returns the first arg because it's
> already 64-bits.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/qemu.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index a9efa807b78..af272c2a802 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -462,6 +462,19 @@ static inline void *lock_user_string(abi_ulong guest_addr)
>  #define unlock_user_struct(host_ptr, guest_addr, copy)          \
>      unlock_user(host_ptr, guest_addr, (copy) ? sizeof(*host_ptr) : 0)
>
> +static inline uint64_t target_arg64(uint32_t word0, uint32_t word1)
> +{
> +#if TARGET_ABI_BITS == 32
> +#ifdef TARGET_WORDS_BIGENDIAN
> +    return ((uint64_t)word0 << 32) | word1;
> +#else
> +    return ((uint64_t)word1 << 32) | word0;
> +#endif
> +#else /* TARGET_ABI_BITS != 32 */
> +    return word0;
> +#endif /* TARGET_ABI_BITS != 32 */
> +}
> +
>  #include <pthread.h>
>
>  #include "user/safe-syscall.h"
> --
> 2.33.1
>

