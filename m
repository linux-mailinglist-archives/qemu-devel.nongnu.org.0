Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658AF430E9D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:19:07 +0200 (CEST)
Received: from localhost ([::1]:43114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcK70-0004vM-M0
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJa1-0002BC-V5
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:44:53 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:63222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJZz-0005cG-8d
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:44:53 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 2E0B79FA61
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:44:49 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjS10Rt0z3Jnc
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:44:49 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id E48F5D720
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:44:48 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f180.google.com with SMTP id y11so14166199qtn.13
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:44:48 -0700 (PDT)
X-Gm-Message-State: AOAM5318hWQC9HyfhDNOENs4dhfTl4KMwI7DjkHTPpQyHQPEaqDR8ySD
 Niz1WrfQS8PG2LGmw6XX7oKxX6nsLODccCRIm90=
X-Google-Smtp-Source: ABdhPJyr4Wwvn3HK/ZTUJ2dy18fSBlXF+9H8/LdJqW7v8S6wKFxperFPpVUNsyyEQCTGp4H/PAy6Hs+xzLUNi65N1HY=
X-Received: by 2002:ac8:5747:: with SMTP id 7mr27115973qtx.11.1634528688578;
 Sun, 17 Oct 2021 20:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-12-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-12-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:44:37 -0500
X-Gmail-Original-Message-ID: <CACNAnaGSuYs21sxCxvWiBB09kgx36iDVw9=fanCgnJNqyKK9BA@mail.gmail.com>
Message-ID: <CACNAnaGSuYs21sxCxvWiBB09kgx36iDVw9=fanCgnJNqyKK9BA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] bsd-user: Add stop_all_tasks
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
Cc: Stacey Son <sson@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 6:15 PM Warner Losh <imp@bsdimp.com> wrote:
>
> Similar to the same function in linux-user: this stops all the current tasks.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/main.c | 9 +++++++++
>  bsd-user/qemu.h | 1 +
>  2 files changed, 10 insertions(+)
>
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index ee84554854..cb5ea40236 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -195,6 +195,15 @@ static void usage(void)
>
>  __thread CPUState *thread_cpu;
>
> +void stop_all_tasks(void)
> +{
> +    /*
> +     * We trust when using NPTL (pthreads) start_exclusive() handles thread
> +     * stopping correctly.
> +     */
> +    start_exclusive();
> +}
> +
>  bool qemu_cpu_is_self(CPUState *cpu)
>  {
>      return thread_cpu == cpu;
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index c1170f14d9..cdb85140f4 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -103,6 +103,7 @@ typedef struct TaskState {
>  } __attribute__((aligned(16))) TaskState;
>
>  void init_task_state(TaskState *ts);
> +void stop_all_tasks(void);
>  extern const char *qemu_uname_release;
>
>  /*
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

