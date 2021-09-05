Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C5C401147
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 21:07:57 +0200 (CEST)
Received: from localhost ([::1]:36952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMxUi-0002q1-4i
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 15:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxEB-0004IX-QL
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:50:51 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:21718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mMxE9-0004EM-9t
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:50:51 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 83AA682CBB
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:50:47 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4H2gbC2wy9z3hdx
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:50:47 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4092B9B79
 for <qemu-devel@nongnu.org>; Sun,  5 Sep 2021 18:50:47 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f175.google.com with SMTP id t4so4737987qkb.9
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 11:50:47 -0700 (PDT)
X-Gm-Message-State: AOAM530WhoC/u6JnP9CahFIF8RpR9YmskRmTzCWwwhbOhTRaEYDpNbaP
 TAnr11X7kgSzygglKZjhiwC5bRNcg2GCB20C7Do=
X-Google-Smtp-Source: ABdhPJxVJcT1LdzZonPs/hUODePCINV4+mAfkl26ysnNm6kNI8UlegPBwPR/uUmCL9gimWfg6ZzF4qYN7wsLQbVomMw=
X-Received: by 2002:a05:620a:2849:: with SMTP id
 h9mr7743018qkp.69.1630867846898; 
 Sun, 05 Sep 2021 11:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-40-imp@bsdimp.com>
In-Reply-To: <20210902234729.76141-40-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 5 Sep 2021 13:50:35 -0500
X-Gmail-Original-Message-ID: <CACNAnaFe63cO9x5DZ2b3KcAHRFUiffXSBXbbLDa_XX+dYLvdng@mail.gmail.com>
Message-ID: <CACNAnaFe63cO9x5DZ2b3KcAHRFUiffXSBXbbLDa_XX+dYLvdng@mail.gmail.com>
Subject: Re: [PATCH v3 39/43] bsd-user: Refactor load_elf_sections and
 is_target_elf_binary
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Mika=C3=ABl_Urankar?= <mikael.urankar@gmail.com>,
 Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 6:56 PM <imp@bsdimp.com> wrote:
>
> From: Warner Losh <imp@FreeBSD.org>
>
> Factor out load_elf_sections and is_target_elf_binary out of
> load_elf_interp.
>
> Signed-off-by: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/elfload.c | 344 +++++++++++++++++++++------------------------
>  1 file changed, 158 insertions(+), 186 deletions(-)
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

