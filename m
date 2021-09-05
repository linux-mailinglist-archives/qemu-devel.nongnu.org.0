Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010FB401149
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 21:16:30 +0200 (CEST)
Received: from localhost ([::1]:40648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMxcw-0005gx-Ib
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 15:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxM4-0000Tk-Ry
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:59:00 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:57779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxM1-0002W4-IN
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:59:00 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 094DF84DEB
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:58:54 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4H2gmY6VRZz3kc4
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:58:53 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id C159895DD
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:58:53 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f45.google.com with SMTP id e18so871189qvl.4
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 11:58:53 -0700 (PDT)
X-Gm-Message-State: AOAM532cXyDDYQhYaOTSCJfpLZ7HVPDh1s8HdUMxjuDenrJiim7Oe3QJ
 vX/R1t23wj+c4bJNNTWju1m4HX5H1pwruKf/Y4I=
X-Google-Smtp-Source: ABdhPJwpTQkHJXPpFF6VhSkGXMn9Cc+5MJfDXgsbiqOVjkEGU/brLYjl0vCzC0Hr4JDTf3NdVYUvuPXNPDvaANd7ygQ=
X-Received: by 2002:a0c:9d4f:: with SMTP id n15mr9095093qvf.18.1630868333401; 
 Sun, 05 Sep 2021 11:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-33-imp@bsdimp.com>
In-Reply-To: <20210902234729.76141-33-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 5 Sep 2021 13:58:42 -0500
X-Gmail-Original-Message-ID: <CACNAnaHs6VEPcT3xJ-24JdGkH++zx6YRN9xrxeByTt09gTOmiQ@mail.gmail.com>
Message-ID: <CACNAnaHs6VEPcT3xJ-24JdGkH++zx6YRN9xrxeByTt09gTOmiQ@mail.gmail.com>
Subject: Re: [PATCH v3 32/43] bsd-user: Rewrite target system call definintion
 glue
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 6:54 PM <imp@bsdimp.com> wrote:
>
> From: Warner Losh <imp@FreeBSD.org>
>
> Rewrite target definnitions to interface with the FreeBSD system calls.
> This covers basic types (time_t, iovec, umtx_time, timespec, timeval,
> rusage, rwusage) and basic defines (mmap, rusage). Also included are
> FreeBSD version-specific variations.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/bsd-mman.h     | 121 --------------------
>  bsd-user/mmap.c         |   2 -
>  bsd-user/syscall_defs.h | 247 ++++++++++++++++++++++++++--------------
>  3 files changed, 162 insertions(+), 208 deletions(-)
>  delete mode 100644 bsd-user/bsd-mman.h
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

