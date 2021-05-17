Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF149382295
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 03:44:33 +0200 (CEST)
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liSJ7-0006Yb-2u
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 21:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSHw-0004t8-B1; Sun, 16 May 2021 21:43:20 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:46817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSHu-0000hK-QB; Sun, 16 May 2021 21:43:20 -0400
Received: by mail-yb1-xb30.google.com with SMTP id y2so6395739ybq.13;
 Sun, 16 May 2021 18:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g3xw0qSyOxOPiAGbQQC+ISBldTL9MV88oQhTnn3ElAE=;
 b=VDnOQZJM3bCyrVNkFjbHJ+vfYP7nSvgIaGT13jmO/zydG4mDYJ+fZ+He1wCLVjoniL
 BwDeLz2yccKslMPevMwkOKEg4WP2+tZCcFCtCn/2V6nHcY2OC3od+uOTgRC13MpdRURg
 xTgWY7DVDM8vhtRUnmDcvdDaxRTQYS1rHmpq3dVotuR7K9N3F0IYYUn9c9ISEC+BJgzT
 /r4GWIbq/MUssPPx683o0ZRYqZ3hfV6hSX5x5bzdHLbbLq4kEP6N+80Ja2F1ZssuHaaQ
 Nwqy7aH5IbSZMvNYzOFa/s0kj6d775DqmLG48pcarazC3/MgeyDTPTgpac53iH65XV+J
 uRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g3xw0qSyOxOPiAGbQQC+ISBldTL9MV88oQhTnn3ElAE=;
 b=Ls75FV4v9cxVkcCJwRApnMtQgLfFnvPQK4crvwC+k2zxWl05Y50Nv2HvJlFPANec8G
 BCsXaXzIFtaiyJ6jjFDPgLxg6hKCQt6wZmzvxaKkDEdHiFzQy+idIuz0iHoatDnYVTCk
 g612zSjvrZu6dc9wWa8qrv3gVFra7bM0lDW7MYhGpbqpfGxKAG3owOHYXXuT+sqlF/rA
 Y6jfnZ7Df63y5UGQovgg1a1bzDgL/XSeehRBd/KJIGCiRPXbfiCu8GD7hU6ayem2RvUt
 BtQRsWuQU1nmiakuxvGA4V3NOcOvWnYv3vvF75RgAE+uDOkU7I9NTkRgrrnKUKQTxdrK
 zKfA==
X-Gm-Message-State: AOAM5322HVyePFZ27hwRFc1NjYqtYXF5W0It8pMNW20pjXl/BKeqGUFk
 OMWhZF5Pb3sw1t5KMeAbRzisy47AShKcQ3m3VIY=
X-Google-Smtp-Source: ABdhPJz6opUAMYXo1yJkCeI1g1LAK+xrJdHFkI5FCna3MLwZF2IYAcckp/NT1NwtO7ur/YjUvADNKJ3OehVhJPTb4e8=
X-Received: by 2002:a05:6902:1543:: with SMTP id
 r3mr46361856ybu.332.1621215796958; 
 Sun, 16 May 2021 18:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210516205034.694788-1-f4bug@amsat.org>
In-Reply-To: <20210516205034.694788-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 09:43:05 +0800
Message-ID: <CAEUhbmWV2HBxk_5_YwdFXM_JauC0svy5QmMwvfpo_Eokxj6hcw@mail.gmail.com>
Subject: Re: [PATCH] misc: Correct relative include path
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 17, 2021 at 4:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Headers should be included from the 'include/' directory,
> not from the root directory.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i386/acpi-common.h     | 6 +++---
>  include/monitor/monitor.h | 2 +-
>  hw/gpio/aspeed_gpio.c     | 2 +-
>  hw/intc/ppc-uic.c         | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

