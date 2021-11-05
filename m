Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095214466DE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:19:19 +0100 (CET)
Received: from localhost ([::1]:50146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1vx-0004sq-NM
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mj1XI-0001Lu-Pf; Fri, 05 Nov 2021 11:53:48 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:34830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mj1XG-0006Ol-NA; Fri, 05 Nov 2021 11:53:48 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4F51992AC7;
 Fri,  5 Nov 2021 15:53:37 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Hm4md0lM0z3Dwc;
 Fri,  5 Nov 2021 15:53:37 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id DB8B97C3B;
 Fri,  5 Nov 2021 15:53:36 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f177.google.com with SMTP id u7so7558883qtc.1;
 Fri, 05 Nov 2021 08:53:36 -0700 (PDT)
X-Gm-Message-State: AOAM531d/t1LMgI+3NEmhixd/vN0VR3dCOnbd3Cz8GAatKLKQxIsZfio
 wvEg/3HsZXhuMWNFRWEm1Ty3irMufBFwDVg3s3E=
X-Google-Smtp-Source: ABdhPJxa0YamnKliklD9UrbAU+Ajg2MgVA2shT3C/lmRTt0TLRahQdvlSpeooqlPy7QoHd/zjUSAgYvlx5oDrZhefrw=
X-Received: by 2002:a05:622a:13:: with SMTP id
 x19mr61576957qtw.83.1636127616314; 
 Fri, 05 Nov 2021 08:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-2-imp@bsdimp.com>
 <0901cff3-28ed-4a80-90b2-d2e4966e667a@linaro.org>
In-Reply-To: <0901cff3-28ed-4a80-90b2-d2e4966e667a@linaro.org>
From: Kyle Evans <kevans@freebsd.org>
Date: Fri, 5 Nov 2021 10:53:25 -0500
X-Gmail-Original-Message-ID: <CACNAnaFzT7iytnoNMTNM_O9oUskpMrXH35Yk4cO1GsCMkNLM+A@mail.gmail.com>
Message-ID: <CACNAnaFzT7iytnoNMTNM_O9oUskpMrXH35Yk4cO1GsCMkNLM+A@mail.gmail.com>
Subject: Re: [PATCH v4 01/36] bsd-user/mips*: Remove
To: Richard Henderson <richard.henderson@linaro.org>
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 5, 2021 at 10:52 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/4/21 11:18 PM, Warner Losh wrote:
> > FreeBSD has dropped support for mips starting with FreeBSD 14. mips
> > support has been removed from the bsd-user fork because updating it for
> > new signal requirements. Remove it here since it is a distraction.
> >
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   bsd-user/mips/target_arch_sysarch.h   | 69 ---------------------------
> >   bsd-user/mips/target_syscall.h        | 52 --------------------
> >   bsd-user/mips64/target_arch_sysarch.h | 69 ---------------------------
> >   bsd-user/mips64/target_syscall.h      | 53 --------------------
> >   4 files changed, 243 deletions(-)
> >   delete mode 100644 bsd-user/mips/target_arch_sysarch.h
> >   delete mode 100644 bsd-user/mips/target_syscall.h
> >   delete mode 100644 bsd-user/mips64/target_arch_sysarch.h
> >   delete mode 100644 bsd-user/mips64/target_syscall.h
> I'm somewhat surprised that sys/mips/mips still exists on the main branch?  But anyway,
>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>

It's slated for removal here within the coming month or two-

