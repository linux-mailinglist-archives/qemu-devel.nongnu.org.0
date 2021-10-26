Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB34143AD8A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 09:51:46 +0200 (CEST)
Received: from localhost ([::1]:56568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfHFG-0004ey-V7
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 03:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFpw-0001d1-MT; Tue, 26 Oct 2021 02:21:28 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:36846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFpr-0007MV-VR; Tue, 26 Oct 2021 02:21:28 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 467697D1A2;
 Tue, 26 Oct 2021 06:21:18 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HdhXt1CGPz3PSs;
 Tue, 26 Oct 2021 06:21:18 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 04FD3C1EA;
 Tue, 26 Oct 2021 06:21:18 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f169.google.com with SMTP id t40so226614qtc.6;
 Mon, 25 Oct 2021 23:21:18 -0700 (PDT)
X-Gm-Message-State: AOAM531mHch3i62t51j+mCvBfvym+fT1UhKf/w9vCy85zIOS/qUlIzz+
 2/6neOfT742fIZEnNG1kFHDNqJ26Uy2mEnWgpg0=
X-Google-Smtp-Source: ABdhPJyFpvTxVFzhdX2Ffag4EHUlqcRLfgxhTPwv7uRkbfOqYmG6r+wSTM+CnKHzna2+leX4yBNJ/oKN76/Nst2Bkiw=
X-Received: by 2002:ac8:57c3:: with SMTP id w3mr22313740qta.132.1635229277722; 
 Mon, 25 Oct 2021 23:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-25-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-25-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 01:21:07 -0500
X-Gmail-Original-Message-ID: <CACNAnaGiY2NSgCfrx7eTzhOsfXMK4ZZoMzM=GtMt5nFuj5-jGA@mail.gmail.com>
Message-ID: <CACNAnaGiY2NSgCfrx7eTzhOsfXMK4ZZoMzM=GtMt5nFuj5-jGA@mail.gmail.com>
Subject: Re: [PATCH 24/24] bsd-user: add arm target build
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  configs/targets/arm-bsd-user.mak | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 configs/targets/arm-bsd-user.mak
>
> diff --git a/configs/targets/arm-bsd-user.mak b/configs/targets/arm-bsd-user.mak
> new file mode 100644
> index 0000000000..deea21aaf5
> --- /dev/null
> +++ b/configs/targets/arm-bsd-user.mak
> @@ -0,0 +1,2 @@
> +TARGET_ARCH=arm
> +TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
> --
> 2.32.0
>

I'm not really qualified to review this one, but it looks basically
sane. I note that there's a gdb-xml/arm-vfp-sysregs.xml in the current
master that should probably be added to TARGET_XML_FILES.
Cross-referencing arm-linux-user and i386-bsd-user, this seems sane
and correct and I'm not aware of any other options that we would need
to consider setting, so let's call it:

Acked-by: Kyle Evans <kevans@FreeBSD.org>

