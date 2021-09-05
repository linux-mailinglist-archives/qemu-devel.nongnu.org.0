Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7166340115E
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 21:28:54 +0200 (CEST)
Received: from localhost ([::1]:48094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMxoz-00031E-C7
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 15:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxQu-0003Qg-0h
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 15:04:00 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:14577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxQh-0006OE-DF
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 15:03:58 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 38A2E85D1D
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 19:03:46 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4H2gtB0nh1z3lnZ
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 19:03:46 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id E4DBE9A37
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 19:03:45 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f179.google.com with SMTP id bk29so4764564qkb.8
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 12:03:45 -0700 (PDT)
X-Gm-Message-State: AOAM530ls/zPaLX4E3x73xHz2HUW7D+TfhLxIoZqJLrqgPZZxvQwBCIT
 USnCs3venuvc08O0KJfCO6ueeMyN27l17IcmZjQ=
X-Google-Smtp-Source: ABdhPJxH3zhMMrEvT8ljSZ60wP+1MG6a/DUos9fR+iM+umANSnuvikF8NCcAWfn1wmY8zW9mSBkqjZrJmj64uAv57cA=
X-Received: by 2002:a05:620a:1474:: with SMTP id
 j20mr8124750qkl.305.1630868625584; 
 Sun, 05 Sep 2021 12:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-22-imp@bsdimp.com>
In-Reply-To: <20210902234729.76141-22-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 5 Sep 2021 14:03:34 -0500
X-Gmail-Original-Message-ID: <CACNAnaF8dS5mWw1XE3NBAxtTNsCebKhT0Ffo-pMoFgEOFXHz-A@mail.gmail.com>
Message-ID: <CACNAnaF8dS5mWw1XE3NBAxtTNsCebKhT0Ffo-pMoFgEOFXHz-A@mail.gmail.com>
Subject: Re: [PATCH v3 21/43] bsd-user: pull in target_arch_thread.h update
 target_arch_elf.h
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 6:55 PM <imp@bsdimp.com> wrote:
>
> From: Warner Losh <imp@FreeBSD.org>
>
> Update target_arch_elf.h to remove thread_init. Move its contents to
> target_arch_thread.h and rename to target_thread_init(). Update
> elfload.c to call it. Create thread_os_thread.h to hold the os specific
> parts of the thread and threat manipulation routines. Currently, it just

s/threat/thread/

> includes target_arch_thread.h. target_arch_thread.h contains the at the
> moment unused target_thread_set_upcall which will be used in the future
> when creating actual thread (i386 has this stubbed, but other
> architectures in the bsd-user tree have real ones). FreeBSD doesn't do
> AT_HWCAP, so remove that code. Linux does, and this code came from there.
>
> These changes are all interrelated and could be brokend own, but seem to

s/brokend own/broken  down/

> represent a reviewable changeset since most of the change is boiler
> plate.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/elfload.c                   |  4 ++-
>  bsd-user/freebsd/target_os_thread.h  | 25 +++++++++++++
>  bsd-user/i386/target_arch_elf.h      | 52 ++--------------------------
>  bsd-user/i386/target_arch_thread.h   | 47 +++++++++++++++++++++++++
>  bsd-user/netbsd/target_os_thread.h   | 25 +++++++++++++
>  bsd-user/openbsd/target_os_thread.h  | 25 +++++++++++++
>  bsd-user/x86_64/target_arch_elf.h    | 38 ++------------------
>  bsd-user/x86_64/target_arch_thread.h | 40 +++++++++++++++++++++
>  8 files changed, 171 insertions(+), 85 deletions(-)
>  create mode 100644 bsd-user/freebsd/target_os_thread.h
>  create mode 100644 bsd-user/i386/target_arch_thread.h
>  create mode 100644 bsd-user/netbsd/target_os_thread.h
>  create mode 100644 bsd-user/openbsd/target_os_thread.h
>  create mode 100644 bsd-user/x86_64/target_arch_thread.h
>

Minor message nits, but otherwise:

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

