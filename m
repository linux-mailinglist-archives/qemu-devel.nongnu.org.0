Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560911E1AF9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 08:08:01 +0200 (CEST)
Received: from localhost ([::1]:37352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdSkq-0000KH-Dh
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 02:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jdSjx-0008Kj-QH
 for qemu-devel@nongnu.org; Tue, 26 May 2020 02:07:05 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:34872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jdSjw-0008Fm-OV
 for qemu-devel@nongnu.org; Tue, 26 May 2020 02:07:05 -0400
Received: by mail-lj1-x241.google.com with SMTP id c11so20857118ljn.2
 for <qemu-devel@nongnu.org>; Mon, 25 May 2020 23:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=35Xnf3mYgb8iUuIZyMa65nBVP2CMzYcj3sqg7EukcJc=;
 b=oogdlmpvuWmkfegxoL+MqWhscJGZ4zq8Bn0vt/C9Xv+sc6h2vmYhcktsNdhPBa4+4q
 tM9V99ljZqWP5VW+JeG7GvmOweGR6qjKbJQhpCgYssrVYV+8tPDbo02viKXzYNiZkfG+
 t1ilRDK31Z056vJOOoyyudJSlJdRQcqzF96HeVBJJVGdSLcOtF0suaIzF57nN0vZPmCp
 viHecylolzA4Vv5uEOcrJL8M9IPBNG779eXMq5+ehXdj4yT5cKWaB0Jsy+oDRTXDFU6A
 BLKer5Wf/1DZq5FQAM5kN0wbUWs6r/kYiE4l48g2iC/wI35aP9saiPWmecjwHoaLWw2i
 AqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=35Xnf3mYgb8iUuIZyMa65nBVP2CMzYcj3sqg7EukcJc=;
 b=d++emQlhtxnvVcTKFUY2KGhoChA21K5jOz7q0bhyELC/e7eCkjoHoiWQs9VWNM80BC
 a2KsR4in4SH7E/ABK4ibjNTQgiTtM5nJeBmLpkeJzG1rX9fMP0Yo29c/hjAVQnD8WWPx
 3+1Czz50+nAlTxvUii6Iepmgr64KspGB8EXHNAc1pPVRaMHE0b0uH7MVuPaVp8zTWXOc
 hw9ZO+vutm/B5gRWno/tM54OkaDijH1RxwfQHy+HHqoMDEZ2vw8Qi2WK6JMlEaYXzcgP
 v2IftLrk+RrSy0ht+HVYVArEPADRRJ5sf+s9h0UZxgxFTqXv7Iwwy7vRn8oWwjMI/hnN
 lh6Q==
X-Gm-Message-State: AOAM533+K0LhztZhwOkdt9ZEE2HjKr3zGsO+CfBdvus+7FQxInpVqwdv
 tXuyFumlIxyfuH4tSUraRT2IJKS9AoIZj4511aE=
X-Google-Smtp-Source: ABdhPJyJPO4AYtSNz3Ge5dCO+SXW/Ud3Bs1RIlm0elP4dMMGLV02J02S3Msix/rtUncM33GNHhcj6WRhIbl9Qk2wJFg=
X-Received: by 2002:a2e:2204:: with SMTP id i4mr952898lji.110.1590473222157;
 Mon, 25 May 2020 23:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200515084209.9419-1-f4bug@amsat.org>
 <bc327559-f5f2-db1d-ad6e-6df6d0198a24@amsat.org>
In-Reply-To: <bc327559-f5f2-db1d-ad6e-6df6d0198a24@amsat.org>
From: chen huacai <zltjiangshi@gmail.com>
Date: Tue, 26 May 2020 14:06:50 +0800
Message-ID: <CABDp7Vo2LRBBzBRnHiyY69CyEEbmszeoV_qdNNK+KMU78OWD7Q@mail.gmail.com>
Subject: Re: [PATCH] hw/mips/mips_fulong2e: Remove unused 'audio/audio.h'
 include
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::241;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lj1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-level <qemu-devel@nongnu.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Tue, May 26, 2020 at 2:04 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> ping?
>
> On 5/15/20 10:42 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > The Fuloong machine never had to use "audio/audio.h", remove it.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  hw/mips/mips_fulong2e.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
> > index ef02d54b33..05b9efa516 100644
> > --- a/hw/mips/mips_fulong2e.c
> > +++ b/hw/mips/mips_fulong2e.c
> > @@ -33,7 +33,6 @@
> >  #include "hw/mips/mips.h"
> >  #include "hw/mips/cpudevs.h"
> >  #include "hw/pci/pci.h"
> > -#include "audio/audio.h"
> >  #include "qemu/log.h"
> >  #include "hw/loader.h"
> >  #include "hw/ide/pci.h"
> >
>
>


--=20
Huacai Chen

