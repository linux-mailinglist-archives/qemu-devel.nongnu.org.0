Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1915C430E9A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:17:59 +0200 (CEST)
Received: from localhost ([::1]:42762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcK62-0004eK-2E
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJRS-0006vv-Jp
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:36:02 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:28352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJRM-00029n-MQ
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:36:02 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 0BE759D7D6
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:35:54 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjFj6Z0Rz3GWM
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:35:53 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id C3579CCC8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:35:53 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f178.google.com with SMTP id a13so4489005qkg.11
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:35:53 -0700 (PDT)
X-Gm-Message-State: AOAM530bQl03lDGbxiJaN8GAhoJRFQcSiLv+m45Ff0ztqiTYAfvKE7d7
 PfgOxGODjMk8e3Q71LOf7ULUP9pxms58eqmKeR4=
X-Google-Smtp-Source: ABdhPJyN1TBhqOkijnXKCYIMMIyDSF+DjzOfY4AyvQeXNIKIB2ful2UupRzCaW2WwO5HbfA5i2/dMdvP3MEK0oCodWg=
X-Received: by 2002:a37:a956:: with SMTP id s83mr20674249qke.244.1634528153496; 
 Sun, 17 Oct 2021 20:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-11-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-11-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:35:42 -0500
X-Gmail-Original-Message-ID: <CACNAnaF84jVBit9RExKmNML+KLTh9BYecWnzQpD0P-BV+ctdyg@mail.gmail.com>
Message-ID: <CACNAnaF84jVBit9RExKmNML+KLTh9BYecWnzQpD0P-BV+ctdyg@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] bsd-user: Remove used from TaskState
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> The 'used' field in TaskState is write only. Remove it from TaskState.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/main.c | 1 -
>  bsd-user/qemu.h | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 48643eeabc..ee84554854 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -210,7 +210,6 @@ void init_task_state(TaskState *ts)
>  {
>      int i;
>
> -    ts->used =3D 1;
>      ts->first_free =3D ts->sigqueue_table;
>      for (i =3D 0; i < MAX_SIGQUEUE_SIZE - 1; i++) {
>          ts->sigqueue_table[i].next =3D &ts->sigqueue_table[i + 1];
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 3b8475394c..c1170f14d9 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -92,7 +92,6 @@ typedef struct TaskState {
>
>      struct TaskState *next;
>      struct bsd_binprm *bprm;
> -    int used; /* non zero if used */
>      struct image_info *info;
>
>      struct emulated_sigtable sigtab[TARGET_NSIG];
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

