Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475BC401144
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 21:05:09 +0200 (CEST)
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMxRy-00014O-0P
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 15:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxFj-0004oC-L1
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:52:27 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:35567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxFf-0005cd-M7
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:52:27 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4334F832D1
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:52:22 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4H2gd20zM2z3jVF
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:52:22 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 027A895DC
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:52:22 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f53.google.com with SMTP id g11so2886197qvd.2
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 11:52:21 -0700 (PDT)
X-Gm-Message-State: AOAM533T0p8zk1OPfy6f77QQmwzn7t8OFcRK7qofDgmo5En7vmsFWZ1G
 Iq9dEBsgymE9tOY6CMpIGBhOdFlfQCVXZDBmxgQ=
X-Google-Smtp-Source: ABdhPJyHRaTrIJNDUZi6tmBCyxkGQEERZhc45Oie0aG3AVMOj1YTEbahMf2pveeuWiNIwAlHztE1k7aLBe+6PUeGOV0=
X-Received: by 2002:a0c:9d4f:: with SMTP id n15mr9079453qvf.18.1630867941684; 
 Sun, 05 Sep 2021 11:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-37-imp@bsdimp.com>
In-Reply-To: <20210902234729.76141-37-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 5 Sep 2021 13:52:10 -0500
X-Gmail-Original-Message-ID: <CACNAnaFsOt3Jeprxj=wrTgwaqx2pjM5ed9mUYrzeA6dmfZoqng@mail.gmail.com>
Message-ID: <CACNAnaFsOt3Jeprxj=wrTgwaqx2pjM5ed9mUYrzeA6dmfZoqng@mail.gmail.com>
Subject: Re: [PATCH v3 36/43] bsd-user: Add target_os_user.h to capture the
 user/kernel structures
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
Cc: Michal Meloun <mmel@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>,
 Warner Losh <imp@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 6:55 PM <imp@bsdimp.com> wrote:
>
> From: Warner Losh <imp@FreeBSD.org>
>
> This file evolved over the years to capture the user/kernel interfaces,
> including those that changed over time.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Michal Meloun <mmel@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/freebsd/target_os_user.h | 427 ++++++++++++++++++++++++++++++
>  1 file changed, 427 insertions(+)
>  create mode 100644 bsd-user/freebsd/target_os_user.h
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

