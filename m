Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2715D401161
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 21:29:59 +0200 (CEST)
Received: from localhost ([::1]:48830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMxpx-0003Z4-Qp
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 15:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxRV-0003jb-Sw
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 15:04:38 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:16462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxRR-0006xc-KG
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 15:04:37 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 35F3585E12
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 19:04:31 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4H2gv30WVqz3lxM
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 19:04:31 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id E63709DC0
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 19:04:30 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f182.google.com with SMTP id l24so3836224qtj.4
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 12:04:30 -0700 (PDT)
X-Gm-Message-State: AOAM530COU0uJeCxJsPwSNOhB7WwiNOOrxiR0hRfE8bKdPIOSIsSC3zz
 eMvezRMb5sQ0cxnL593MgbA1V0WWabfnowqclDc=
X-Google-Smtp-Source: ABdhPJziu+TXw0eK1xUT190afyhlZ7OFKjP952qNhoH5gMGJlomalx8ZW/Ezv+RW15a4XDSMY4jeZ7RlKpSPuEwbqMc=
X-Received: by 2002:a05:622a:486:: with SMTP id
 p6mr7931962qtx.340.1630868670630; 
 Sun, 05 Sep 2021 12:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-19-imp@bsdimp.com>
In-Reply-To: <20210902234729.76141-19-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 5 Sep 2021 14:04:19 -0500
X-Gmail-Original-Message-ID: <CACNAnaEPK3ogD7YcK8hU49+Zc-rURStmFa3d5MwTtZkDZK5FMQ@mail.gmail.com>
Message-ID: <CACNAnaEPK3ogD7YcK8hU49+Zc-rURStmFa3d5MwTtZkDZK5FMQ@mail.gmail.com>
Subject: Re: [PATCH v3 18/43] bsd-user: save the path to the qemu emulator
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
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 6:53 PM <imp@bsdimp.com> wrote:
>
> From: Warner Losh <imp@bsdimp.com>
>
> Save the path to the qemu emulator. This will be used later when we have
> a more complete implementation of exec.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/main.c | 21 +++++++++++++++++++++
>  bsd-user/qemu.h |  1 +
>  2 files changed, 22 insertions(+)
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

