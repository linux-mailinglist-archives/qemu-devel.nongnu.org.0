Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFA3430E6A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 05:46:19 +0200 (CEST)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcJbN-0000Gq-Ob
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 23:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJOv-00062c-Ax
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:33:25 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:24841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJOt-0005iq-Nw
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:33:25 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 3F3EB9D33F
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:33:14 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjBf0qdYz3G4w
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:33:14 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id E1556D891
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:33:13 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f51.google.com with SMTP id z3so9496762qvl.9
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:33:13 -0700 (PDT)
X-Gm-Message-State: AOAM532sfW7rUCUiDThUKa1eMtfdlc6VQPLUKNigxzpQTSDyWBNhY1ux
 /ITs6RBKvts39nBmGSTB+aZapqSLT9HJFykCiDc=
X-Google-Smtp-Source: ABdhPJy/fwF2CSJbg5mlG1G5Z3wfv8X0rBZxfmd4gk+Wqi1eCt72CnZgZovgmMnmu4niGQPBeuH5QUvuR9Bofy6H81E=
X-Received: by 2002:a0c:b2c2:: with SMTP id d2mr23712012qvf.64.1634527993393; 
 Sun, 17 Oct 2021 20:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-5-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-5-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:33:02 -0500
X-Gmail-Original-Message-ID: <CACNAnaFDC+1q9mfnA7LzKr8t5-Ug0x5GGTSXd4jzssFgrUWCUw@mail.gmail.com>
Message-ID: <CACNAnaFDC+1q9mfnA7LzKr8t5-Ug0x5GGTSXd4jzssFgrUWCUw@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] bsd-user: TARGET_RESET define is unused,
 remove it
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/i386/target_arch_cpu.h   | 2 --
>  bsd-user/x86_64/target_arch_cpu.h | 2 --
>  2 files changed, 4 deletions(-)
>
> diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_=
cpu.h
> index 978e8066af..b28602adbb 100644
> --- a/bsd-user/i386/target_arch_cpu.h
> +++ b/bsd-user/i386/target_arch_cpu.h
> @@ -23,8 +23,6 @@
>
>  #define TARGET_DEFAULT_CPU_MODEL "qemu32"
>
> -#define TARGET_CPU_RESET(cpu)
> -
>  static inline void target_cpu_init(CPUX86State *env,
>          struct target_pt_regs *regs)
>  {
> diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_a=
rch_cpu.h
> index 5f5ee602f9..5172b230f0 100644
> --- a/bsd-user/x86_64/target_arch_cpu.h
> +++ b/bsd-user/x86_64/target_arch_cpu.h
> @@ -23,8 +23,6 @@
>
>  #define TARGET_DEFAULT_CPU_MODEL "qemu64"
>
> -#define TARGET_CPU_RESET(cpu)
> -
>  static inline void target_cpu_init(CPUX86State *env,
>          struct target_pt_regs *regs)
>  {
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

