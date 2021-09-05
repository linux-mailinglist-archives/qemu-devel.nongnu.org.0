Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E61440115A
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 21:21:26 +0200 (CEST)
Received: from localhost ([::1]:43966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMxhl-0008L8-C7
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 15:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxKf-0007t1-LE
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:57:33 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:45932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxKc-0001PR-MO
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:57:32 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id A87DE84460
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:57:29 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4H2gkx3tw2z3k18
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:57:29 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 60AC79A2E
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:57:29 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f182.google.com with SMTP id u21so3815297qtw.8
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 11:57:29 -0700 (PDT)
X-Gm-Message-State: AOAM532oqXlHyHlRQb7idjy4Q4b+io+lrYKnJaSWYBlrcBSh06kFro5r
 vEbWdn2o1S8GhTm8zVeSzExFVwmdFmfYTtjv9JU=
X-Google-Smtp-Source: ABdhPJxlBkSlkgqPLbRl0C6tjiiG5+xppm3A/CWLrLxz1YmwqX9Vg54fNjLdGUm4u10GsBGaogVYmRr3qw3w4dgWB68=
X-Received: by 2002:a05:622a:486:: with SMTP id
 p6mr7911270qtx.340.1630868248952; 
 Sun, 05 Sep 2021 11:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-34-imp@bsdimp.com>
In-Reply-To: <20210902234729.76141-34-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 5 Sep 2021 13:57:18 -0500
X-Gmail-Original-Message-ID: <CACNAnaGJnkZPyG6NEjfgj9A3sp5TxF7z6prAN_dU3fdd=wrhyA@mail.gmail.com>
Message-ID: <CACNAnaGJnkZPyG6NEjfgj9A3sp5TxF7z6prAN_dU3fdd=wrhyA@mail.gmail.com>
Subject: Re: [PATCH v3 33/43] bsd-user: Make cpu_model and cpu_type visible to
 all of main.c
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
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
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 6:53 PM <imp@bsdimp.com> wrote:
>
> From: Warner Losh <imp@FreeBSD.org>
>
> cpu_model and cpu_type will be used future commits, so move them from
> main() scoped to file scoped.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I think we should reduce this one to just moving cpu_type. cpu_model
is really only used in main() to derive the appropriate cpu_type,
which we do use later.

>
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 71fd9d5aba..50c8fdc1e2 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -54,6 +54,8 @@
>  int singlestep;
>  unsigned long mmap_min_addr;
>  uintptr_t guest_base;
> +static const char *cpu_model;
> +static const char *cpu_type;
>  bool have_guest_base;
>  unsigned long reserved_va;
>
> @@ -201,8 +203,6 @@ static void save_proc_pathname(char *argv0)
>  int main(int argc, char **argv)
>  {
>      const char *filename;
> -    const char *cpu_model;
> -    const char *cpu_type;
>      const char *log_file = NULL;
>      const char *log_mask = NULL;
>      const char *seed_optarg = NULL;
> --
> 2.32.0
>

