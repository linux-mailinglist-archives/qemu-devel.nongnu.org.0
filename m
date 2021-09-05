Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32392401163
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 21:34:10 +0200 (CEST)
Received: from localhost ([::1]:52636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMxu4-0006Ya-Fw
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 15:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxNT-0001kb-6O
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 15:00:35 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:11769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxNR-0003oG-MC
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 15:00:26 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 1D7C68545D
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 19:00:25 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4H2gpJ6v7Mz3lKR
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 19:00:24 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id CE95E95DE
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 19:00:24 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f170.google.com with SMTP id g11so3829229qtk.5
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 12:00:24 -0700 (PDT)
X-Gm-Message-State: AOAM533cW8uksk9vGQbhu1xppNCSKnXAL8litwOQYSsHvghKLo+/Oxf4
 TkDxxXm9qg4/tudT/tC+FgiQmO+oDXWwko9hofA=
X-Google-Smtp-Source: ABdhPJz6FwDrs2oNeHOKpc6/HFhSSkvNH+gtsSJzaXSr3XF8R17XbQZbLAU/1v9Zhv5Ic1HMdR8wmw7OR0IHNwh/ZSo=
X-Received: by 2002:a05:622a:1451:: with SMTP id
 v17mr8060249qtx.83.1630868424539; 
 Sun, 05 Sep 2021 12:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-31-imp@bsdimp.com>
In-Reply-To: <20210902234729.76141-31-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 5 Sep 2021 14:00:13 -0500
X-Gmail-Original-Message-ID: <CACNAnaE2JHUvXK74c9+=mOMfaAKa8oktzX=gBxdEPbuxY63SMg@mail.gmail.com>
Message-ID: <CACNAnaE2JHUvXK74c9+=mOMfaAKa8oktzX=gBxdEPbuxY63SMg@mail.gmail.com>
Subject: Re: [PATCH v3 30/43] bsd-user: elf cleanup
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
Cc: Stacey Son <sson@freebsd.org>, Justin Hibbits <chmeeedalf@gmail.com>,
 Alexander Kabaev <kan@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <imp@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 6:56 PM <imp@bsdimp.com> wrote:
>
> From: Warner Losh <imp@FreeBSD.org>
>
> Move OS-dependent defines into target_os_elf.h. Move the architectural
> dependent stuff into target_arch_elf.h. Adjust elfload.c to use
> target_create_elf_tables instead of create_elf_tables.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
> Signed-off-by: Justin Hibbits <chmeeedalf@gmail.com>
> Signed-off-by: Alexander Kabaev <kan@FreeBSD.ORG>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/elfload.c               | 191 ++++---------------------------
>  bsd-user/freebsd/target_os_elf.h | 137 ++++++++++++++++++++++
>  bsd-user/netbsd/target_os_elf.h  | 146 +++++++++++++++++++++++
>  bsd-user/openbsd/target_os_elf.h | 146 +++++++++++++++++++++++
>  bsd-user/qemu.h                  |   1 +
>  5 files changed, 454 insertions(+), 167 deletions(-)
>  create mode 100644 bsd-user/freebsd/target_os_elf.h
>  create mode 100644 bsd-user/netbsd/target_os_elf.h
>  create mode 100644 bsd-user/openbsd/target_os_elf.h

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

