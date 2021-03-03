Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AFD32B5E5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 09:20:06 +0100 (CET)
Received: from localhost ([::1]:34142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHMjl-0000cw-Mv
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 03:20:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lHMif-0000Ca-Sa
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:18:57 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lHMie-0006gL-CM
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:18:57 -0500
Received: by mail-wr1-x433.google.com with SMTP id j2so9783441wrx.9
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 00:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HVmepXob9ZmbChWjLZW0mKAsVatZgsD82ynPeBTwbrs=;
 b=Ajxz6crYt++MLn+OYn1V1QcGFO2DLXDyLQSi4dZi0juOMzIOU2tcxQO4F65hQ9sSVi
 1xB7mii3hMyowm5T/LBq9PlvjpyX8RBH/nGHXqPlhsrBAtdN90h/iyzUhhH30yAkczNc
 cZVpF/yBzC6qX3qtawnvVtgbpjqK5p1VEtC12C/05t+ZJgxjAe8PKpuPIfYoqlTwV+7u
 dlFUr5z1JZ+nRKKxy1TI2lHqgP6G0iFv/Bg3F1LzrRlYog6OZ58kAPNyZo3glv1vQS4G
 LqiTdTtflkMm0crB+lirvc9VJ4/vJVs9D2W+5XBwc/GW6BdW5hX2uAn7RvxKgAnzOTd+
 DwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=HVmepXob9ZmbChWjLZW0mKAsVatZgsD82ynPeBTwbrs=;
 b=RYRaFCfaPCbRBhtZ9i64V/Tb/l9RBfHpOh/czuXtFdZ0BDAQDqVFXucTM9V/CBBH3/
 n/JHE+za4RN8oR3/cBd/pizm+Bat2DekourK1zZnOUcF0r6E2cbvkdIoITG4OLY25vqH
 RE7fqWZxYjdqfskcPyAYHPKKllqXvU3ieuqZStpZqCasgnE3RjBeEI0jzrEoYBOe4rJQ
 3xz84oGI3qCvKkz9xW7XLvbpJVlQ8Xvz70PNIvW4HWBEYzkR9LO8jHzgrc7c34faW4ye
 U4RryhiByA5A17iaDMMiuZRbbqVV/BMwaZUkP11PyByYpmz/kL8pOUXeJmbqchQJ9CaD
 Gmqg==
X-Gm-Message-State: AOAM531tmbOohGc+/XbzEKCY15lxyKNUZEK+IqsHgjuJM1H/NulcblRH
 wqnILCW78/Hv2EuVEyaEz6vbpw==
X-Google-Smtp-Source: ABdhPJxrQ4cZoTlw003L1bHOnI/dfUa2KLOa2FUxulV3W8Lore3VwTbVZ/11/lszj2WSW5APFxOAXA==
X-Received: by 2002:adf:f584:: with SMTP id f4mr26544826wro.311.1614759533522; 
 Wed, 03 Mar 2021 00:18:53 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id o14sm29334847wri.48.2021.03.03.00.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 00:18:53 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 1dddac4b;
 Wed, 3 Mar 2021 08:18:52 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/elf_ops: Fix a typo
In-Reply-To: <20210225181344.3623720-1-philmd@redhat.com>
References: <20210225181344.3623720-1-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Wed, 03 Mar 2021 08:18:51 +0000
Message-ID: <m2sg5clkes.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::433;
 envelope-from=dme@dme.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, 2021-02-25 at 19:13:44 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> g_mapped_file_new_from_fd()'s parameter is named 'writable'.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <dme@dme.org>

> ---
>  include/hw/elf_ops.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 8e8436831d2..304f266bf3b 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -417,7 +417,7 @@ static int glue(load_elf, SZ)(const char *name, int f=
d,
>=20=20
>      /*
>       * Since we want to be able to modify the mapped buffer, we set the
> -     * 'writeble' parameter to 'true'. Modifications to the buffer are n=
ot
> +     * 'writable' parameter to 'true'. Modifications to the buffer are n=
ot
>       * written back to the file.
>       */
>      mapped_file =3D g_mapped_file_new_from_fd(fd, true, NULL);
> --=20
> 2.26.2

dme.
--=20
I've always been mad, I know I've been mad, like the most of us are.

