Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3EF1D7F9D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 19:05:41 +0200 (CEST)
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jajCu-0003KL-JG
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 13:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jaj15-0005Bw-7f; Mon, 18 May 2020 12:53:27 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:46450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jaj14-0001FN-B5; Mon, 18 May 2020 12:53:26 -0400
Received: by mail-io1-xd42.google.com with SMTP id j8so11293837iog.13;
 Mon, 18 May 2020 09:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i1QfDnXLF3pdgsHDH6l70vgoP0qLzQyf5+UWG7s+x5w=;
 b=Uf2uGQaIhD+W6YvwxSt0CWRoiieWL0EqVuZ+Fj1Esuib6hV1c9NBZrSJMLaaNmG2nW
 //GPWZOj993fGPZp0ivvAPDFMevIVULOCU+TxuHo6651XKqF/QPgk2Vmrqaya6w7AIUq
 DcN1R9k/oMCN4uFIJuU9fxETj/2KcJtJLLCAKQOm75LcXtqYX8TgjD+QK6WcYLU4GVa8
 You0IQkVun9fs+KoZLwlgDadL5rF/O1TlKnRu4isSFWCRiXqP/W9szt43ahLHFZR7QWV
 Pbt1JTvIZCx8xxvstCiHArrJocCU0X/k4gy+10o+ATreFXcw1VTxxuXGbVvdMsShrTl5
 2dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i1QfDnXLF3pdgsHDH6l70vgoP0qLzQyf5+UWG7s+x5w=;
 b=XLI3j1FMAKTe6VuB9wIWPDBMOM99MmaohLNbV88dMN/rQTSGgyJ2ukjsoS/SoMaese
 EQcbyOabUXo3buxwvARWQJNkk0lvZamKMj7nkSMOyo91TodupOfj6/28/J7J/dOcumte
 pJZ8npsWttovtVG1DVUqr1TkbHw1+YT7d7NLTWSPkmwOz6Z0FD4nOUpSk881cDO3lx7Q
 wIfbG78lFjQoJ05J24AxBmqWoo/3YYTssBpDXH3WJxpulekNudynL8SHAz7B36BSLQS8
 pcZnKsV/I8pp1+oEkmXtQhyym21+QUuu4Ae0jkepmuVOPQnfrMpa9+Nw0dnor7wFxOxa
 lRGA==
X-Gm-Message-State: AOAM532YDzxDjsOL0CNeHZKKaMIGzLd8h1uAT2rpsVIgnQ7SnUPLCC27
 aWG+LbxcFFQ49kZAB+AjsYvcu1aj45+PEkxXwZ0=
X-Google-Smtp-Source: ABdhPJy4wYDtwsKIyu3uVb/W5VW7YaOBtoSn8VF/zHoiu9G3TBygxjuok/Cl4WLK7a41uGZOWpo0bVNKUe8BmnO0H2Y=
X-Received: by 2002:a6b:dc11:: with SMTP id s17mr15582879ioc.42.1589820804960; 
 Mon, 18 May 2020 09:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200518140309.5220-1-f4bug@amsat.org>
 <20200518140309.5220-5-f4bug@amsat.org>
In-Reply-To: <20200518140309.5220-5-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 May 2020 09:44:33 -0700
Message-ID: <CAKmqyKONqrqs+4AyyA86zL35Jw3bKU44BCy7ZhmHb7XTj+Z0zA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/timer/exynos4210_mct: Replace hw_error() by
 qemu_log_mask()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 18, 2020 at 7:05 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> hw_error() calls exit(). This a bit overkill when we can log
> the accesses as unimplemented or guest error.
>
> When fuzzing the devices, we don't want the whole process to
> exit. Replace some hw_error() calls by qemu_log_mask().
>
> Per the datasheet "Exynos 4412 RISC Microprocessor Rev 1.00"
> Chapter 25 "Multi Core Timer (MCT)" figure 1 and table 4,
> the default value on the APB bus is 0.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2: Fixes -Wsometimes-uninitialized:
>
> hw/timer/exynos4210_mct.c:1158:5: error: variable 'value' is used uniniti=
alized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>     default:
>     ^~~~~~~
> hw/timer/exynos4210_mct.c:1163:12: note: uninitialized use occurs here
>     return value;
>            ^~~~~
> hw/timer/exynos4210_mct.c:1063:19: note: initialize the variable 'value' =
to silence this warning
>     uint32_t value;
>                   ^
>                    =3D 0
> ---
>  hw/timer/exynos4210_mct.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index 570cf7075b..29a4b10676 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -54,7 +54,6 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> -#include "hw/hw.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>  #include "qemu/timer.h"
> @@ -62,7 +61,6 @@
>  #include "hw/ptimer.h"
>
>  #include "hw/arm/exynos4210.h"
> -#include "hw/hw.h"
>  #include "hw/irq.h"
>
>  //#define DEBUG_MCT
> @@ -1062,7 +1060,7 @@ static uint64_t exynos4210_mct_read(void *opaque, h=
waddr offset,
>      int index;
>      int shift;
>      uint64_t count;
> -    uint32_t value;
> +    uint32_t value =3D 0;
>      int lt_i;
>
>      switch (offset) {
> @@ -1158,8 +1156,8 @@ static uint64_t exynos4210_mct_read(void *opaque, h=
waddr offset,
>          break;
>
>      default:
> -        hw_error("exynos4210.mct: bad read offset "
> -                TARGET_FMT_plx "\n", offset);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX =
"\n",
> +                      __func__, offset);
>          break;
>      }
>      return value;
> @@ -1484,8 +1482,8 @@ static void exynos4210_mct_write(void *opaque, hwad=
dr offset,
>          break;
>
>      default:
> -        hw_error("exynos4210.mct: bad write offset "
> -                TARGET_FMT_plx "\n", offset);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX =
"\n",
> +                      __func__, offset);
>          break;
>      }
>  }
> --
> 2.21.3
>
>

