Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2781D40113D
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 20:53:19 +0200 (CEST)
Received: from localhost ([::1]:55246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMxGX-0003eu-GL
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 14:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMx5x-0001pw-2F
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:42:21 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:52722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMx5q-0005tK-BK
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:42:19 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 95775817E2
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:42:13 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4H2gPK3QC5z3QVj
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:42:13 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 528FA99E7
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:42:13 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f182.google.com with SMTP id f22so4736959qkm.5
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 11:42:13 -0700 (PDT)
X-Gm-Message-State: AOAM531AbFtcXDfBVfIgluX7AwE+/X6xL0u6He4eDYvKDDrVfNDSW1Ls
 g6reYDvn2mTHbJ16T1vvjljRhj0+IkKQeqtPQlM=
X-Google-Smtp-Source: ABdhPJx52d4oo6B3VyrhxZHFWgaR53/yXFuzE2Jo67EfPgpG7DPDANT3UKe2Fphd+LDV11aVGzghu/f90GJ41ZKhtyY=
X-Received: by 2002:a05:620a:2849:: with SMTP id
 h9mr7721622qkp.69.1630867332923; 
 Sun, 05 Sep 2021 11:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-41-imp@bsdimp.com>
In-Reply-To: <20210902234729.76141-41-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 5 Sep 2021 13:42:02 -0500
X-Gmail-Original-Message-ID: <CACNAnaHFDWVPa9LA=YoRyK3pS8rTDLyY4uPgWYwScdJdgaDrgA@mail.gmail.com>
Message-ID: <CACNAnaHFDWVPa9LA=YoRyK3pS8rTDLyY4uPgWYwScdJdgaDrgA@mail.gmail.com>
Subject: Re: [PATCH v3 40/43] bsd-user: move qemu_log to later in the file
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 6:56 PM <imp@bsdimp.com> wrote:
>
> From: Warner Losh <imp@FreeBSD.org>
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/main.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>

Subject nit: s/qemu_log/gemu_log/

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

