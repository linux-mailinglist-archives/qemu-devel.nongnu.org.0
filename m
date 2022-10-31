Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5264161334B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 11:09:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opRjH-0007Bz-K9; Mon, 31 Oct 2022 06:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1opRjF-0007Bf-Uu
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:09:13 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1opRjE-0002P3-Gd
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:09:13 -0400
Received: by mail-lj1-x22b.google.com with SMTP id b8so16158313ljf.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 03:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qnHJjGgDRBP42UD95hRvtg8R0/wduVDz1nyw/mOAGA4=;
 b=Ak2CK8MjXAOvqEFCUm6fsXLycdOLHP6odrgaMQjKsbZQuIJn2Cq6l/WNtYPELvsJoN
 0iZ1Tdf+EFMWFYHkKyPT+8WKesepH70bdfNyDlbq5UQAWjDQr7zMMUdTf2v8ojgF1e4T
 2ete2YsQOfnhiVim1mt6KCSOjp1FGZuUmzWryY2kP3M1v/A217AqMgtAV3dXSzz1MleP
 OltPfj8O9dkgkv3oHHV0rwUTwL7Abqs+awrCu08tVd/AwWiVjRj7smq0PI+Im2FCahJ2
 9FYsr6Ol9blv06AW/VWAR89yCOmk0+puE00UOKFe2W0SuKi9thrGwQvVo0uYNUsrfsVl
 h25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qnHJjGgDRBP42UD95hRvtg8R0/wduVDz1nyw/mOAGA4=;
 b=wjsNtvvRkXFlKjBRhvKMEwNONGwur6aa+qpiS72hYKsOW8MPdz27WZpNXvuMyt1OXX
 5NM1mDTbmoPNCzMi3JfQFy4Anm+IdeYKubUIvTFemMw9wlPwWBaipY3vTC+HvswGevbh
 HaK2q4SuZSNncKk0/94v6Es8F4hDFrG+0qlHbAdasXKVFz1DoFvmiSijNIrskj7fGp0Q
 rIbCGt9MicnwMZOOSJc7NOFv59Q9I8tUcGotsDF+Ki/kOmV68sBIuhu1GzvwinjX3UjX
 QiFoMTTPxWPG1IJjQYYCKIiBGrC/E7Zyxc5TmlyF1Nk3GpNDAiXmRCcuJFYByvAR2Rwq
 eckg==
X-Gm-Message-State: ACrzQf3tYZWRKkkXH/lJ6QxTkCrxT8OKhb9GigzK5wiHM8cl0iAcubBM
 cA5ewAzFJDApYJu6J6Sd0auKSLfa9qa3dDbC/VM=
X-Google-Smtp-Source: AMsMyM4taW4ZFcHQZS77LK3mySIgzbHNuvDzDMR9EMHOYFrb4yl2w43E0wY9Ko/TgZVoXOhFxuI/miSFgZiopbcUEjs=
X-Received: by 2002:a2e:a7d0:0:b0:277:499c:1062 with SMTP id
 x16-20020a2ea7d0000000b00277499c1062mr2981626ljp.449.1667210950467; Mon, 31
 Oct 2022 03:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221031095701.383874-1-sw@weilnetz.de>
In-Reply-To: <20221031095701.383874-1-sw@weilnetz.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 31 Oct 2022 14:08:59 +0400
Message-ID: <CAJ+F1CLwnJRHx70mwVHJasgrn64s=j_gs=1ir9c1vsJuqibLwg@mail.gmail.com>
Subject: Re: [PATCH] Add nsis.py to W32/W64 section in MAINTAINERS
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 1:57 PM Stefan Weil <sw@weilnetz.de> wrote:
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

thanks
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 64893e36bc..534b1b8a63 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -548,6 +548,7 @@ F: */*win32*
>  F: include/*/*win32*
>  X: qga/*win32*
>  F: qemu.nsi
> +F: scripts/nsis.py
>
>  Darwin (macOS, iOS)
>  M: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> --
> 2.30.2
>


--=20
Marc-Andr=C3=A9 Lureau

