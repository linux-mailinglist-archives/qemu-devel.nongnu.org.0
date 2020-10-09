Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DEA288C0B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 17:02:20 +0200 (CEST)
Received: from localhost ([::1]:34356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQtuV-0005v4-6I
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 11:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kQtrp-000599-Fi; Fri, 09 Oct 2020 10:59:33 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kQtrn-0001mT-NT; Fri, 09 Oct 2020 10:59:33 -0400
Received: by mail-oi1-x244.google.com with SMTP id x62so10451217oix.11;
 Fri, 09 Oct 2020 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+jG2DP2iJh0+zAnhwbYD3F7QwCkBTCr/X6nB+Vw5Lek=;
 b=cDsdSRNIn+5U31Su3SgP5Ks1Fxoy2cYUYttAkVNrDg+bzNBHRWAn7Gps5G6fJaWWvz
 kWtJLtGpro2yjXfsxG2gE9vYYJiVN3AzEeTSo7uCbuntq7pTVVU+um0uqDUYHFVhpcYU
 YMgQoib93G458taP6S1gaCzic1/6gqEihxITel/2Mr7EOTG19AspW4vw8/FwOb0Oac5a
 VxgLYK8+gWGj34og+3ztzhrgBPN2TtAhCVMAsfz/utSc2xzV47EQWF4SAXgoulipxQpv
 P6EUVcXe715ubh9OtjVV4/+yseWPYj8zKHL2C4WQwJeszK3zkOhH8JotKcXf0WPrqU99
 mRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+jG2DP2iJh0+zAnhwbYD3F7QwCkBTCr/X6nB+Vw5Lek=;
 b=LhQt5n44Wuy+P/JQqklWQr6Qe1hZKMRHySFDOhLmeyibsY44IvpH6koiNZ/uitC7IM
 kxHRJzwiJqE4oEtnclcaLOCCJYPxllqTncYKVgJfoeXroE7FP/AdBFNxIk+CClbZScW7
 ecrsbjpMkCFVm2hzqkEUKSpuwiwYxw7v57vETwiYZIbHNI7W3D1L9tlcpK9LjaLvDrc8
 /+peV/7/xnQCl48HDTSyaeGkXiUKsb6XDCbrs3voM4MQYJAa8VqRAe1a9yuERy10PPby
 nQjWUeyisuWAea+pj1T5oZwIeVGdYLfIwqQzoSWP9lWbM59DsdkE4+tjlneMo5snsW/C
 OtbA==
X-Gm-Message-State: AOAM532y07SFh7IGJVmaY8yPPq4K5lqz4Ibc6m+CN7h/PkDxQIyp/Tf/
 LlLShicSpGR3xdLLPDTbvCXKJlAt+borbXpnKLE=
X-Google-Smtp-Source: ABdhPJzyZP7rQIx2M6ZztelWeYebLmPugVDJ/+1ZYeiEUHpxw037WrTUm8u1NdH3yGOaH438CrSZDRNrO31qRdxwpEQ=
X-Received: by 2002:a54:4d88:: with SMTP id y8mr2743122oix.97.1602255569913;
 Fri, 09 Oct 2020 07:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201009113843.60995-1-lvivier@redhat.com>
In-Reply-To: <20201009113843.60995-1-lvivier@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Fri, 9 Oct 2020 22:58:53 +0800
Message-ID: <CAKXe6SLbXTZMyT6XcSkUEhqZ2+V_SUCBu0U6nwmFYmSh_hrXMg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/char/serial: remove duplicate .class_init in
 serial_mm_info
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=liq3ea@gmail.com; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> =E4=BA=8E2020=E5=B9=B410=E6=9C=889=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=887:40=E5=86=99=E9=81=93=EF=BC=9A
>
> .class_init is already set to serial_mm_class_init.
>
> Remove the duplicate entry.
>
> Fixes: 17fd1a6490b1 ("serial-mm: add "regshift" property")
> Cc: marcandre.lureau@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  hw/char/serial.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 4386adabd466..97f71879ff2a 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -1120,7 +1120,6 @@ static const TypeInfo serial_mm_info =3D {
>      .class_init =3D serial_mm_class_init,
>      .instance_init =3D serial_mm_instance_init,
>      .instance_size =3D sizeof(SerialMM),
> -    .class_init =3D serial_mm_class_init,
>  };
>
>  static void serial_register_types(void)
> --
> 2.26.2
>
>

