Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A631D7F5E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 18:58:04 +0200 (CEST)
Received: from localhost ([::1]:47430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaj5X-000256-GX
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 12:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jaj3K-00009N-2z; Mon, 18 May 2020 12:55:46 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:39129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jaj3J-0001iC-4R; Mon, 18 May 2020 12:55:45 -0400
Received: by mail-io1-xd43.google.com with SMTP id x5so11374433ioh.6;
 Mon, 18 May 2020 09:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ol0ORCGLTTuGNMRHjrIAOAqtx3daiObs8nq3fxwOcNM=;
 b=nSu7d5PQzivLEqe9GLyI58sGSC+c4/nr9FoJRlSQL/URJ+/d1tzuMFlUHDh751Ibnr
 TuvYBNcinysfWXV3l7ccigQoznczl/Goqh0+Rwvmko3bdZxKUECaQx0H/xr24gVhYFX8
 6A1n6U8irBGKf08Ms+FXNs736swCn8mvDmD9AgNHl3+XTDKSCU3OWsE0NmH57wVF97Zl
 jyHJoEDr3Jbp4XE/sswKlj2b9SzroC+bh+XNdn8JNIQ0VsZXS+neb7dZA8bHx/km83jN
 ZhQ+o6DorX8miuy15g58k1kObZLlyHS6QNcpKeJ7jeKW/9BGEPi89Ny5BReyXEcXNhGj
 V+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ol0ORCGLTTuGNMRHjrIAOAqtx3daiObs8nq3fxwOcNM=;
 b=j5gEAwQ+tpMlTINGA+AcdLkeO+pospSKBIeLinqdR6YOfpdK9+sFW6q2xXai2VJIpP
 bNxGSHYbYf+3OQZ2UTRLYxgz1lMt4jjtzblU5dt7YHfcCQwByAd2eVBgTEpd22Ty/lb/
 dvqO/vNl75PrWNeD8mfN6oYJ3MBGkPaLtzVdeMQU2e7fJwIh3QpG5tjPYkg+3llBibRp
 lV1TQ1JFn2YYQYLm6z1hHFh/qP9bVgr9PIAtOUA3EIlD2JiXslI58v8fOAlF9XXYk2Uk
 w+GECVHm9lf20m2KFrfz8IOFG4iF5wFUawY8SpXDB2+zUNAz2KDex9HlTkcumGs+M3Ua
 xHTA==
X-Gm-Message-State: AOAM531Tnw5+WXOl0aB4mjHNDo/IlEhcygI0st1/qfrIAtNLf5iZHtNz
 E4WEAmcG8xtFpmZQBH8sfA1B7yCa9V4lwZpU260=
X-Google-Smtp-Source: ABdhPJwFXLE0/NAwksdqDOgpM2P+9Afs7WHw0wRXDp6XyaCC7/YsedlKzPh8y9jVqesoR/WPbnIx9mxgMLxJ+qZMvyE=
X-Received: by 2002:a02:a118:: with SMTP id f24mr17042201jag.8.1589820942980; 
 Mon, 18 May 2020 09:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-6-philmd@redhat.com>
In-Reply-To: <20200515170804.5707-6-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 May 2020 09:46:52 -0700
Message-ID: <CAKmqyKPAcizLC=wmNpmatpcxXtp9YcaruJGCC_=SpPgSYP-BHA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] Makefile: Remove dangerous EOL trailing backslash
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Walle <michael@walle.cc>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 15, 2020 at 10:11 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> One might get caught trying to understand unexpected Makefile
> behavior. Trailing backslash can help to split very long lines,
> but are rather dangerous when nothing follow. Preserve other
> developers debugging time by removing this one.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 34275f57c9..84453789f9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -420,7 +420,7 @@ MINIKCONF_ARGS =3D \
>
>  MINIKCONF_INPUTS =3D $(SRC_PATH)/Kconfig.host $(SRC_PATH)/hw/Kconfig
>  MINIKCONF_DEPS =3D $(MINIKCONF_INPUTS) $(wildcard $(SRC_PATH)/hw/*/Kconf=
ig)
> -MINIKCONF =3D $(PYTHON) $(SRC_PATH)/scripts/minikconf.py \
> +MINIKCONF =3D $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
>
>  $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MIN=
IKCONF_DEPS) $(BUILD_DIR)/config-host.mak
>         $(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) > $@.tmp, "G=
EN", "$@.tmp")
> --
> 2.21.3
>
>

