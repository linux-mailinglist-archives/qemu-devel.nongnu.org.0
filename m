Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCB4401135
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 20:51:00 +0200 (CEST)
Received: from localhost ([::1]:54492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMxEF-00035Z-SF
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 14:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMx3S-0000at-Rl
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:39:46 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:45101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMx3R-0003lj-Co
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:39:46 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 2266B81075
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:39:43 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4H2gLR07sPz3QB2
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:39:43 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id D25FD9C08
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:39:42 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f47.google.com with SMTP id 93so2845460qva.7
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 11:39:42 -0700 (PDT)
X-Gm-Message-State: AOAM530NgBu7ICJZomtb827Lra4RctRD9g+m774e7666AqB3kO2kGJZW
 uRQvFi4MsyhUAsts3SoHRXI3Z4Y6TAprTnqhCoo=
X-Google-Smtp-Source: ABdhPJzHw/IzfWvFE8azspEuZOuG8lRGfpH9Coq+qn8MykOIofE6CUAkb2AejGizwJEgovMKGE53vWQPthJzu90b1RY=
X-Received: by 2002:a05:6214:20a6:: with SMTP id
 6mr8931645qvd.31.1630867182403; 
 Sun, 05 Sep 2021 11:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-44-imp@bsdimp.com>
In-Reply-To: <20210902234729.76141-44-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 5 Sep 2021 13:39:31 -0500
X-Gmail-Original-Message-ID: <CACNAnaGB2DSG6GyY65avcP_Onc6G4cgdBrftzLSXKLi2i_Mh-A@mail.gmail.com>
Message-ID: <CACNAnaGB2DSG6GyY65avcP_Onc6G4cgdBrftzLSXKLi2i_Mh-A@mail.gmail.com>
Subject: Re: [PATCH v3 43/43] bsd-user: Update mapping to handle reserved and
 starting conditions
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
Cc: Stacey Son <sson@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <imp@freebsd.org>,
 =?UTF-8?Q?Mika=C3=ABl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 6:56 PM <imp@bsdimp.com> wrote:
>
> From: Warner Losh <imp@FreeBSD.org>
>
> Update the reserved base based on what platform we're on, as well as the
> start of the mmap range. Update routines that find va ranges to interact
> with the reserved ranges as well as properly align the mapping (this is
> especially important for targets whose page size does not match the
> host's). Loop where appropriate when the initial address space offered
> by mmap does not meet the contraints.
>
> This has 18e80c55bb6 from linux-user folded in to the upstream
> bsd-user code as well.
>
> Signed-off-by: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/main.c |  43 ++++-
>  bsd-user/mmap.c | 415 ++++++++++++++++++++++++++++++++++++++++--------
>  bsd-user/qemu.h |   5 +-
>  3 files changed, 392 insertions(+), 71 deletions(-)
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

