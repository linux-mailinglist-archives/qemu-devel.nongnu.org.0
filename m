Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E1A6E76A9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 11:48:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp4Pp-0007a4-6W; Wed, 19 Apr 2023 05:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lwhsu@freebsd.org>) id 1pp4Pi-0007Zh-C9
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 05:47:46 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lwhsu@freebsd.org>) id 1pp4Pg-0006gg-CA
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 05:47:46 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4Q1bYm5cM2z3LGy
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:47:40 +0000 (UTC)
 (envelope-from lwhsu@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Q1bYm4ZNhz3G0h
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:47:40 +0000 (UTC)
 (envelope-from lwhsu@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1681897660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9CMABc2ylj5AQhoGadByrlxIuE3OPuDGbTjyLdbxFcY=;
 b=QsPN2d6hgiAKoDxgIxGhI3NpRrW/mGfT1Xwo8O5/qynu2r8Q0PakaPUhnwFjvzEcz68BLL
 j0L6/U/PO4W2CDAWeflETQUZvtQHg7ZvPLpWnLgnKF6JCv30cAZh3DeXa+nxsabpqtc4MK
 HfTz6nkywy4uIvXL8D+reegTqR1Tr99KZcCnJZjMFS7MmlLQNDnZ+Y7sXdF/i+B+GOE1mw
 HyQfD1fb/UERKa6fsx2xXQS5vUK2r/HRaqF4rAHL9zZJeZZjNo5aEIxmzH34Tt8u4YycmF
 o7hVjdBmpdA6C6LTdr3adbiU9/p6niduAI9XHxLLH6O5xhMNs3dLIzYYteffZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1681897660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9CMABc2ylj5AQhoGadByrlxIuE3OPuDGbTjyLdbxFcY=;
 b=GMdVPNdeiledyhhVr+cBM5Jjechq6j19fG9UxURam5F8e/KouS55NONzHivH/lgc82YWk0
 XPoJ9g8oXwTy8Ys6b28YaWhUNtmZ9t8SVB/n7mYBVkEcN2y3538JvoHxjQFE6ZS1U+kn2L
 TX66FwOfqO+siiz8oewZEb34IzrUAacffmyHBF1uS85Y6mVFouORjCUZoxOfLao19i/AOg
 KUlRSxgFYrZ7FK0YhiRct6Lbl/0iaM5ap96cKV/1ULbVNXLLCFPn93Re303qmV/Ngjouna
 KY/twjsOb551PIpAWvUzMrsL2Jt60/4vKWoo2L8UJUS/90VWSIabriApsOsXHg==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1681897660; a=rsa-sha256; cv=none;
 b=TQa6LIU6mpP+62gA4fE5GNwsCo3Yj7TlLn1T7Bbv2UC45VVc8DlA74Su6lpG32XNbT0oIc
 VXGDI8fIBjAR5p6tjvVL0pYagsXTKehqFaIz2I1mknkJeh2mTFz3DqYMDDeztxKD7K0z4l
 ZRwxyOGF+YVB9NqEIoiGaae8FTfgG/K2l2Fr5uxTYCG4xdr4un1J34SIIt4T8jI2gptWBC
 Fl939iHTaxNP7KoZH8q6pmbPkkvSExYuoeke3gt/iQVGQ9iAV3e5IL/lQWhtvFREZDAFKX
 KhsFNrESnioS+07kLxxcR2EAkiDnqrR+Gwi9wHVIMFB1Ilspp6+5aDYjOhSEbA==
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: lwhsu/mail)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4Q1bYm3b1Bz1RSJ
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:47:40 +0000 (UTC)
 (envelope-from lwhsu@freebsd.org)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-51b5490c6f0so2312675a12.0
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 02:47:40 -0700 (PDT)
X-Gm-Message-State: AAQBX9cLHwuin+B7ZJZKh3TMXp367N+46BAIsXinssRT6oOk48KxiMuH
 PNRkkd7ddGQ3E/ThnvII3/Qwkz3gw3EalyPKyYY=
X-Google-Smtp-Source: AKy350bwJKwzMjyuOdt050MLCfXMkRPSkmQ4TpAoho05SNt27hTkR5RefF8pPpePEaZsNStSLsbUembhN9hiwSwNIZM=
X-Received: by 2002:a17:902:d4c6:b0:1a1:e33f:d567 with SMTP id
 o6-20020a170902d4c600b001a1e33fd567mr5741241plg.52.1681897659235; Wed, 19 Apr
 2023 02:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230419091840.603503-1-thuth@redhat.com>
In-Reply-To: <20230419091840.603503-1-thuth@redhat.com>
From: Li-Wen Hsu <lwhsu@freebsd.org>
Date: Wed, 19 Apr 2023 17:47:27 +0800
X-Gmail-Original-Message-ID: <CAKBkRUwijPcGTHUd8eOnAUhAF7S3LYX3b-BNnP=wDa+oYdx=1g@mail.gmail.com>
Message-ID: <CAKBkRUwijPcGTHUd8eOnAUhAF7S3LYX3b-BNnP=wDa+oYdx=1g@mail.gmail.com>
Subject: Re: [PATCH] tests/vm/freebsd: Update to FreeBSD 13.2
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=lwhsu@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Apr 19, 2023 at 5:18=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> According to QEMU's support policy, we stop supporting the previous
> major release two years after the the new major release has been
> published. So we can stop testing FreeBSD 12 now and should switch
> our FreeBSD VM to version 13 instead.
>
> Some changes are needed for this update: The downloadable .ISO images
> do not use the serial port as console by default anymore, so they
> are not usable in the same way as with FreeBSD 12. Fortunately, the
> FreeBSD project now also offers some pre-installed CI images that
> have the serial console enabled, so we can use those now, with the
> benefit that we can skip almost all parts of the previous installation
> process.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/vm/freebsd | 101 ++++++++++++-----------------------------------
>  1 file changed, 25 insertions(+), 76 deletions(-)
>
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index ba2ba23d24..9435e9aa2e 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -28,15 +28,15 @@ class FreeBSDVM(basevm.BaseVM):
>      name =3D "freebsd"
>      arch =3D "x86_64"
>
> -    link =3D "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.4/=
FreeBSD-12.4-RELEASE-amd64-disc1.iso.xz"
> -    csum =3D "1dcf6446e31bf3f81b582e9aba3319a258c29a937a2af6138ee4b181ed=
719a87"
> +    link =3D "https://download.freebsd.org/ftp/releases/CI-IMAGES/13.2-R=
ELEASE/amd64/Latest/FreeBSD-13.2-RELEASE-amd64-BASIC-CI.raw.xz"
> +    csum =3D "a4fb3b6c7b75dd4d58fb0d75e4caf72844bffe0ca00e66459c028b198f=
fb3c0e"

FWIW, the "/ftp" part in the URL is not necessary now. It just works
for the backward compatibility.

Best,
Li-Wen

