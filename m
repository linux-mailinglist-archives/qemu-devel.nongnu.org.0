Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8252EFB36
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:27:32 +0100 (CET)
Received: from localhost ([::1]:37144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0EG-00061W-2F
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ky0BX-0004ly-Dc
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:24:43 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ky0BV-0008Dw-Rk
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:24:43 -0500
Received: by mail-ej1-x62f.google.com with SMTP id qw4so16456446ejb.12
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QOjiVqz4xSXzNrjxO98q0Oj1+3/h+lmQwTMq1kn8Poc=;
 b=oO/qKSgkL5jyUImonxwgi7ExpXbIiYoAEwsEwVVdXNIMknP9uyN1oSgAlUGcxPI+1I
 k647kFF82SnFRkO5yqhW5PUuqEhcbT4Puqnl1kAAXYdwne1476mMnWwy1gQ+6OFWeUgF
 nA+/C3NSyR2U6nZdul//8L/TbhRZ4jwLeEygp3G8R5aYwacXsbwx9TYMNhThOarPWEsH
 8ky/owWdVQB4qfiib/SacqXdoG8b8iFYdXvGVzJhSv08F2zsdaEBvN04IEM6AlbsQ06N
 M9PXb6xzNdNIGJikWrsuVObUnnqC7pgN00ts3F/jvBznX1Hy3r6Svy2RQeRTA7gWwZbl
 fPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QOjiVqz4xSXzNrjxO98q0Oj1+3/h+lmQwTMq1kn8Poc=;
 b=XiDz9nMXjwV27kgGa4XwRMkCKspBge0nPlHYBLbR5/UhXIFxbfPSuxM+34NS6HoMKH
 IjHNk35GX7fhlCXOuSDCnjJkzisAiT5ALPP2hlD/Y1wA6TW4HPFnCuFV3TDVPccySrVp
 3upv9sNt/ko9OWanBueSImtgRJwfhRfAOMTBROaVsSobjwTkYufcLkx76PfLN3pSL6ZP
 pjphekj5wxDg/RN/TxWpl5qsUznrB9myYyQEH+j+pX7kn51VX40JkRB/v0MUQd4CsRSg
 R9cX6xkltFBKGmzBNkEDrBsJeOV69HGSBZ2JzgzWGGZNygFHWtzwsgpaT5/4X8hvtMCA
 idyQ==
X-Gm-Message-State: AOAM531JxO3mWQymbBy8M9piZzDxprErjruP8MCW9UaCGaJIJvaB2YXp
 sd7HI5z31ZQy2/3l2cgEmk1eJHGPQ2tXUIqIMF6GcA==
X-Google-Smtp-Source: ABdhPJyZ2wdT9Tq44isPfSgJxXUChYw/SNpjmx2LBdvy0xocTZjA602Hs+FgpfXs+3MLfxcVu/dob1iOAzGiDbfX+2A=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr4038657ejr.482.1610144680626; 
 Fri, 08 Jan 2021 14:24:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610143658.git.balaton@eik.bme.hu>
 <a4dc55b56eed3ce899b7bf9835b980a114c52598.1610143658.git.balaton@eik.bme.hu>
In-Reply-To: <a4dc55b56eed3ce899b7bf9835b980a114c52598.1610143658.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 22:24:29 +0000
Message-ID: <CAFEAcA8_LxPKC79eOdt_fsFhjRV1KB-tq51oR6-=YzDfM9MMgw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] sam460ex: Use type cast macro instead of simple
 cast
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 22:17, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> Use the PCI_BUS type cast macro to convert result of qdev_get_child_bus().
> Also remove the check for NULL afterwards which should not be needed
> because sysbus_create_simple() uses error_abort and we create the PCI
> host object here that's expected to have a PCI bus so this shouldn't
> fail. Even if it would fail that would be due to a programmer error so
> an error message is not necessary.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

