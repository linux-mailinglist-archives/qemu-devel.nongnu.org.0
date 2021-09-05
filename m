Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7486A401166
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 21:43:58 +0200 (CEST)
Received: from localhost ([::1]:40216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMy3W-0000qS-Nl
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 15:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxOy-0002SF-46
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 15:02:00 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:13362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxOu-00052M-KQ
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 15:01:58 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 14BCE85AAE
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 19:01:56 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4H2gr36wfGz3lC9
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 19:01:55 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id CFD2B9A35
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 19:01:55 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f50.google.com with SMTP id z2so2866927qvl.10
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 12:01:55 -0700 (PDT)
X-Gm-Message-State: AOAM531yqF98Py6tr97DHJYQ/pvK8OR0g9oCapN/3kpgUB1ScgaoIyFz
 y6uFSRY6LFFRlekfB31/Bz32fpyiOJ3W9p/Vwqo=
X-Google-Smtp-Source: ABdhPJz3sit1MD8NVkL/QcEOqWtDURdYrgCr2AeIPzSGrWJZQiWL53Vn9iAE5Zddctoa3Hhl3tN0traUyr+tE4UEJKw=
X-Received: by 2002:a0c:f9d2:: with SMTP id j18mr8924907qvo.49.1630868515598; 
 Sun, 05 Sep 2021 12:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-27-imp@bsdimp.com>
In-Reply-To: <20210902234729.76141-27-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 5 Sep 2021 14:01:44 -0500
X-Gmail-Original-Message-ID: <CACNAnaEks=-4TerKomqVDoOs3wRU-rp4gVN9mue5Lhzm5ZuyuQ@mail.gmail.com>
Message-ID: <CACNAnaEks=-4TerKomqVDoOs3wRU-rp4gVN9mue5Lhzm5ZuyuQ@mail.gmail.com>
Subject: Re: [PATCH v3 26/43] bsd-user: *BSD specific siginfo defintions
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
 Warner Losh <imp@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 6:55 PM <imp@bsdimp.com> wrote:
>
> From: Warner Losh <imp@FreeBSD.org>
>
> Add FreeBSD, NetBSD and OpenBSD values for the various signal info types
> and defines to decode different signals to discover more information
> about the specific signal types.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/freebsd/target_os_siginfo.h | 145 +++++++++++++++++++++++++++
>  bsd-user/freebsd/target_os_signal.h  |  78 ++++++++++++++
>  bsd-user/i386/target_arch_signal.h   |  94 +++++++++++++++++
>  bsd-user/netbsd/target_os_siginfo.h  |  82 +++++++++++++++
>  bsd-user/netbsd/target_os_signal.h   |  69 +++++++++++++
>  bsd-user/openbsd/target_os_siginfo.h |  82 +++++++++++++++
>  bsd-user/openbsd/target_os_signal.h  |  69 +++++++++++++
>  bsd-user/qemu.h                      |   1 +
>  bsd-user/syscall_defs.h              |  10 --
>  bsd-user/x86_64/target_arch_signal.h |  94 +++++++++++++++++
>  10 files changed, 714 insertions(+), 10 deletions(-)
>  create mode 100644 bsd-user/freebsd/target_os_siginfo.h
>  create mode 100644 bsd-user/freebsd/target_os_signal.h
>  create mode 100644 bsd-user/i386/target_arch_signal.h
>  create mode 100644 bsd-user/netbsd/target_os_siginfo.h
>  create mode 100644 bsd-user/netbsd/target_os_signal.h
>  create mode 100644 bsd-user/openbsd/target_os_siginfo.h
>  create mode 100644 bsd-user/openbsd/target_os_signal.h
>  create mode 100644 bsd-user/x86_64/target_arch_signal.h
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

