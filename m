Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22B6401148
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 21:14:42 +0200 (CEST)
Received: from localhost ([::1]:39728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMxbD-00050i-5x
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 15:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxGv-0005NR-UC
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:53:42 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:43286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxGt-0006di-Id
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:53:41 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 059E8842AF
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:53:39 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4H2gfV6Bzpz3k7T
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:53:38 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id ADBCA9DB9
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:53:38 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f172.google.com with SMTP id y144so4761825qkb.6
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 11:53:38 -0700 (PDT)
X-Gm-Message-State: AOAM533jxEaHT+ikyvpkS+zfXAroRfWMB02l6iqQvV4uOadaPVvhBhrZ
 oll5WvcLPt7xJTsT5MrBeCSz/M3gZXaGTPlr84w=
X-Google-Smtp-Source: ABdhPJwmaCS2XE58saJBIySED+AYlvLW0D96ZIzHQEF+aSTPS0p2sSmezw3B0Iof0BOMM+EUY8Yu7ksH+pwg+CAWFFs=
X-Received: by 2002:a05:620a:2185:: with SMTP id
 g5mr7988181qka.244.1630868018283; 
 Sun, 05 Sep 2021 11:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-35-imp@bsdimp.com>
In-Reply-To: <20210902234729.76141-35-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 5 Sep 2021 13:53:27 -0500
X-Gmail-Original-Message-ID: <CACNAnaHGAT1iddrqdcqEAjXAs_+xM-mqOedhnP2YoShmoRvm1g@mail.gmail.com>
Message-ID: <CACNAnaHGAT1iddrqdcqEAjXAs_+xM-mqOedhnP2YoShmoRvm1g@mail.gmail.com>
Subject: Re: [PATCH v3 34/43] bsd-user: update debugging in mmap.c
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 QEMU Developers <qemu-devel@nongnu.org>, Sean Bruno <sbruno@freebsd.org>,
 Warner Losh <imp@freebsd.org>,
 =?UTF-8?Q?Mika=C3=ABl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 6:54 PM <imp@bsdimp.com> wrote:
>
> From: Warner Losh <imp@FreeBSD.org>
>
> Update the debugging code for new features and different targets.
>
> Signed-off-by: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
> Signed-off-by: Sean Bruno <sbruno@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/mmap.c | 55 ++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 38 insertions(+), 17 deletions(-)
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

