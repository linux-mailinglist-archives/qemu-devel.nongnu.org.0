Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F92B0DB2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 13:21:44 +0200 (CEST)
Received: from localhost ([::1]:32988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8NAV-0006do-BJ
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 07:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i8N95-0005HG-7P
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 07:20:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i8N94-0001wY-0z
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 07:20:15 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46011)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i8N93-0001vs-R1
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 07:20:13 -0400
Received: by mail-wr1-x441.google.com with SMTP id l16so27922525wrv.12
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 04:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=NWZJulbafzGqgTXHDDvNuqov14fJ+mdxykxRgopdKG8=;
 b=cJRz5JELe+Ss1qRiEn7w/48etkoXtLG8WynGT72Xuh+QacQgodG2faz46YPAkmn/ZF
 Jd/pHhVtJWcTEE5TVSesJ7VWIqXneHIUyQu2kJBRKBxhz19BHIK0TuA2c1obORmJeSUU
 VXPGnDkFmaGoITKcc9ieIt1ixE8KYSyoIErhTyjL23o/RZitJNIurqWEyJ33ZHNS1XDD
 z4RPPiEMQeiz0GXF/kFQTEisME8DDstUPAyoQeXIiDsJb8/ujICCVUcnUIpHSZ7kSbxa
 mI0t2cyIS56I6hGg4Wd3Hy7/xbzqqWl31PEEPO2tzFvE03RJoNctFtH5qB5OjjHprtZl
 G+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=NWZJulbafzGqgTXHDDvNuqov14fJ+mdxykxRgopdKG8=;
 b=fQOwxATVzd5nGoG6P8K4V2Vwt02CjfOgvwmfeiEmxxCitiTUojN1CzepPXL5EORLag
 BS0Gw7rFxB5KcZ4EOsZMA3sC+qNMxd7y0GQxCTEKzbuzeMRwMG4c3SKVvYqsL3q7x8+w
 iJiUDC6EE/y4JTmnDEXD5932PFLu+UypHgQuKYCS9MPWTLl38j2DnJXaEx0SkyaHX/wj
 lrMH2oDhpdHMUgHftm1rbDT7yNvqjBhZ7Llq8aRmDomvLfQJWSqrHE2LHVcveW4Wzp4b
 Q6SEGVgJ2EhWUaRfWmB0Kf3lk3Akj7q3f/B4xPtbfZrnf3r2IYv5qx6bs+tKu2DARTu9
 YBsA==
X-Gm-Message-State: APjAAAU5FUXXgtvXKmW6c1fMhVjGYYhkvB/QGP/6yoLzOUbQAzMEivaS
 QStMd9U3KTlKTsTK8seKcal24E9eiGI=
X-Google-Smtp-Source: APXvYqzg8hGjJsrkUD7KamjWguuPmzqzrlXBgIbhXOFLh7XsfmfZZUwqHhFn+H17Dz584XMq4agSzg==
X-Received: by 2002:a5d:4405:: with SMTP id z5mr34516668wrq.158.1568287212758; 
 Thu, 12 Sep 2019 04:20:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y72sm9235897wmc.26.2019.09.12.04.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 04:20:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A0AC1FF87;
 Thu, 12 Sep 2019 12:20:11 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-9-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
In-reply-to: <20190910144428.32597-9-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 12:20:11 +0100
Message-ID: <87impxzrpw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 08/13] target/arm/arm-semi:
 Factor out implementation of SYS_ISTTY
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Factor out the implementation of SYS_ISTTY via the new function
> tables.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/arm-semi.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 48a10dd3c3a..64ed39fc075 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -349,6 +349,7 @@ typedef uint32_t sys_writefn(TaskState *ts, ARMCPU *c=
pu, GuestFD *gf,
>                               target_ulong buf, uint32_t len);
>  typedef uint32_t sys_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
>                              target_ulong buf, uint32_t len);
> +typedef uint32_t sys_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
>
>  static uint32_t host_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
>  {
> @@ -399,6 +400,11 @@ static uint32_t host_readfn(TaskState *ts, ARMCPU *c=
pu, GuestFD *gf,
>      return len - ret;
>  }
>
> +static uint32_t host_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
> +{
> +    return isatty(gf->hostfd);
> +}
> +
>  static uint32_t gdb_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
>  {
>      return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
> @@ -420,10 +426,16 @@ static uint32_t gdb_readfn(TaskState *ts, ARMCPU *c=
pu, GuestFD *gf,
>                             gf->hostfd, buf, len);
>  }
>
> +static uint32_t gdb_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
> +{
> +    return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
> +}
> +
>  typedef struct GuestFDFunctions {
>      sys_closefn *closefn;
>      sys_writefn *writefn;
>      sys_readfn *readfn;
> +    sys_isattyfn *isattyfn;
>  } GuestFDFunctions;
>
>  static const GuestFDFunctions guestfd_fns[] =3D {
> @@ -431,11 +443,13 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>          .closefn =3D host_closefn,
>          .writefn =3D host_writefn,
>          .readfn =3D host_readfn,
> +        .isattyfn =3D host_isattyfn,
>      },
>      [GuestFDGDB] =3D {
>          .closefn =3D gdb_closefn,
>          .writefn =3D gdb_writefn,
>          .readfn =3D gdb_readfn,
> +        .isattyfn =3D gdb_isattyfn,
>      },
>  };
>
> @@ -600,11 +614,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              return set_swi_errno(ts, -1);
>          }
>
> -        if (use_gdb_syscalls()) {
> -            return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->ho=
stfd);
> -        } else {
> -            return isatty(gf->hostfd);
> -        }
> +        return guestfd_fns[gf->type].isattyfn(ts, cpu, gf);
>      case TARGET_SYS_SEEK:
>          GET_ARG(0);
>          GET_ARG(1);


--
Alex Benn=C3=A9e

