Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C98242DEA3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:49:54 +0200 (CEST)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2zR-00019j-Dr
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2Ra-0006Ko-VE
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:14:56 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:52383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2RS-0004bo-DA
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:14:53 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 54FB6AE1B5
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:14:44 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HVXxv58Wlz4hYL
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:14:43 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 913FD3E91
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:14:43 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f169.google.com with SMTP id ay35so5720539qkb.10
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:14:43 -0700 (PDT)
X-Gm-Message-State: AOAM533TfLMojZnR1XT81EsJkiVKi2PUjVT2roJWRM6+9X4t6q3ewAM4
 I/OeT8Oj+T+uWJuZr0EXLuWFlHx9oDLh3RgJOXw=
X-Google-Smtp-Source: ABdhPJx3uM/mklVY07QgUx3fXOSXXPAAIH6hwu1Tgouz3t2sOyV36ayQckIicjyWP8shXn/oGZQ1PE4D9dCgkebHbZ4=
X-Received: by 2002:a37:9f02:: with SMTP id i2mr5262936qke.305.1634224483275; 
 Thu, 14 Oct 2021 08:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-4-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-4-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Thu, 14 Oct 2021 10:14:32 -0500
X-Gmail-Original-Message-ID: <CACNAnaH3TXjid+s5ELmtnDiGDWZdm6vsKY2aOBvXOLD1nzLo_Q@mail.gmail.com>
Message-ID: <CACNAnaH3TXjid+s5ELmtnDiGDWZdm6vsKY2aOBvXOLD1nzLo_Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] bsd-user/strace.list: Remove support for FreeBSD
 versions older than 12.0
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 6:15 PM Warner Losh <imp@bsdimp.com> wrote:
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/freebsd/strace.list | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/bsd-user/freebsd/strace.list b/bsd-user/freebsd/strace.list
> index b01b5f36e8..275d2dbe27 100644
> --- a/bsd-user/freebsd/strace.list
> +++ b/bsd-user/freebsd/strace.list
> @@ -33,10 +33,6 @@
>  { TARGET_FREEBSD_NR___syscall, "__syscall", NULL, NULL, NULL },
>  { TARGET_FREEBSD_NR___sysctl, "__sysctl", NULL, print_sysctl, NULL },
>  { TARGET_FREEBSD_NR__umtx_op, "_umtx_op", "%s(%#x, %d, %d, %#x, %#x)", NULL, NULL },
> -#if defined(__FreeBSD_version) && __FreeBSD_version < 1000000
> -{ TARGET_FREEBSD_NR__umtx_lock, "__umtx_lock", NULL, NULL, NULL },
> -{ TARGET_FREEBSD_NR__umtx_unlock, "__umtx_unlock", NULL, NULL, NULL },
> -#endif
>  { TARGET_FREEBSD_NR_accept, "accept", "%s(%d,%#x,%#x)", NULL, NULL },
>  { TARGET_FREEBSD_NR_accept4, "accept4", "%s(%d,%d,%#x,%#x)", NULL, NULL },
>  { TARGET_FREEBSD_NR_access, "access", "%s(\"%s\",%#o)", NULL, NULL },
> @@ -49,10 +45,6 @@
>  { TARGET_FREEBSD_NR_cap_fcntls_get, "cap_fcntls_get", NULL, NULL, NULL },
>  { TARGET_FREEBSD_NR_cap_fcntls_limit, "cap_fcntls_limit", NULL, NULL, NULL },
>  { TARGET_FREEBSD_NR_cap_getmode, "cap_getmode", NULL, NULL, NULL },
> -#if defined(__FreeBSD_version) && __FreeBSD_version < 1000000
> -{ TARGET_FREEBSD_NR_cap_getrights, "cap_getrights", NULL, NULL, NULL },
> -{ TARGET_FREEBSD_NR_cap_new, "cap_new", NULL, NULL, NULL },
> -#endif
>  { TARGET_FREEBSD_NR_cap_ioctls_get, "cap_ioctls_get", NULL, NULL, NULL },
>  { TARGET_FREEBSD_NR_cap_ioctls_limit, "cap_ioctls_limit", NULL, NULL, NULL },
>  { TARGET_FREEBSD_NR_cap_rights_limit, "cap_rights_limit", NULL, NULL, NULL },
> @@ -146,9 +138,6 @@
>  { TARGET_FREEBSD_NR_freebsd11_kevent, "freebsd11_kevent", NULL, NULL, NULL },
>  { TARGET_FREEBSD_NR_kevent, "kevent", NULL, NULL, NULL },
>  { TARGET_FREEBSD_NR_kill, "kill", NULL, NULL, NULL },
> -#if defined(__FreeBSD_version) && __FreeBSD_version < 1000000
> -{ TARGET_FREEBSD_NR_killpg, "killpg", NULL, NULL, NULL },
> -#endif
>  { TARGET_FREEBSD_NR_kqueue, "kqueue", NULL, NULL, NULL },
>  { TARGET_FREEBSD_NR_ktrace, "ktrace", NULL, NULL, NULL },
>  { TARGET_FREEBSD_NR_lchown, "lchown", NULL, NULL, NULL },
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

