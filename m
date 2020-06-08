Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFA21F1FB7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 21:27:08 +0200 (CEST)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiNQJ-00087R-Ld
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 15:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atar4qemu@gmail.com>)
 id 1jiNPU-0007iA-V8
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 15:26:16 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:39983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atar4qemu@gmail.com>)
 id 1jiNPU-0001Co-1B
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 15:26:16 -0400
Received: by mail-io1-xd44.google.com with SMTP id q8so20027968iow.7
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 12:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ee1EOgJCAI+paZydzhe4pw1JOja9HMDxzvXpI6K4RWo=;
 b=OILglSgn1qPgyfKHfuszjBp9MNYiljoKzdUcUC/e2po2BnmwsTDNR7nkJufVIkvVbU
 16IqJU4gkk0q7FXtPtiJv6Mxjl0yoxXZyRxLndpzYqiJFS8PooVh4q3poBaQgKXk2cES
 hcky8Exs4i1R+1NfQHvHdShovUobbMTJ3x+nUBvLWRnwAlPdk99WgpNw7/YNpXaTyMrD
 gHAlH3x+kkR8yfWd1nd0eg9eC6P2mECr6l5bhHZxsPQhaeKyBmj20lEBjflvOMxt1/LO
 TUG3PiNiGQZNAffX+PNO5kh0BPfr75HFknIKFCBKY5CFS6Wp909eClJmBCavvC77nBNr
 tA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ee1EOgJCAI+paZydzhe4pw1JOja9HMDxzvXpI6K4RWo=;
 b=eitwnTxuP7FN6+ed8gc1PUeZ1/zSVkNxAFhvJKhUBM5p4v+2/9txRsZRu7AMVPAC8Q
 vjAa0wfAWTR5/y8sToJPk4yvQDBmqjaBTo4OJa+v72yw2ROtLO7POuwZVKMirtCY/4ib
 Y/XQWO6c4CaYdYm23vV8ZZ1qBU2xKfjObjTiullsNKpwDIvgym15G+ykKayQIHu03P7m
 kzxhDL5dJVUJ5rrAvirNcb/zLMcw0q/VxGCCUg0Qo2YBavsvIlofNN0H8xJL+Q2oI9vK
 VMEwzJU0UhwDt2NOeVT2kmBVMY5nyRM8k+czPZ0dzxcRGanJ7ogWJ+8+jkOA9Wyah+ev
 CvLQ==
X-Gm-Message-State: AOAM53095WnI9j5miwtMj0ut0t0kxmPVG8HaRlWy70M4EY1JXZRp2K7g
 AzLeOrPXBstVvukAS0SA3lWMy6GZngzGsUmuA3E=
X-Google-Smtp-Source: ABdhPJwy7Gpj/2AR84MrSfHCUZUs1Qg6RqnjuVc/r5PaXZ+KT5qjxRTarcZZNolR7ziF+SmLrTYssnKgX/lQXb9AiuQ=
X-Received: by 2002:a02:3402:: with SMTP id x2mr22148330jae.11.1591644374799; 
 Mon, 08 Jun 2020 12:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200608172144.20461-1-f4bug@amsat.org>
 <20200608172144.20461-4-f4bug@amsat.org>
In-Reply-To: <20200608172144.20461-4-f4bug@amsat.org>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Mon, 8 Jun 2020 21:26:03 +0200
Message-ID: <CACXAS8CTCc+c+KHc2rMtTeH2UdWtFQGFfEHDjbw=ckPOjk49UQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/sparc64/niagara: Map the UART device
 unconditionally
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=atar4qemu@gmail.com; helo=mail-io1-xd44.google.com
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Fabien Chouteau <chouteau@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 8, 2020 at 7:21 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> The UART is present on the machine regardless there is a
> character device connected to it. Map it unconditionally.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>

> ---
>  hw/sparc64/niagara.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
> index 201fb05d50..a87d55f6bb 100644
> --- a/hw/sparc64/niagara.c
> +++ b/hw/sparc64/niagara.c
> @@ -151,10 +151,8 @@ static void niagara_init(MachineState *machine)
>              exit(1);
>          }
>      }
> -    if (serial_hd(0)) {
> -        serial_mm_init(sysmem, NIAGARA_UART_BASE, 0, NULL, 115200,
> -                       serial_hd(0), DEVICE_BIG_ENDIAN);
> -    }
> +    serial_mm_init(sysmem, NIAGARA_UART_BASE, 0, NULL,
> +                   115200, serial_hd(0), DEVICE_BIG_ENDIAN);
>      create_unimplemented_device("sun4v-iob", NIAGARA_IOBBASE, NIAGARA_IO=
BSIZE);
>      sun4v_rtc_init(NIAGARA_RTC_BASE);
>  }
> --
> 2.21.3
>


--=20
Regards,
Artyom Tarasenko

SPARC and PPC PReP under qemu blog: http://tyom.blogspot.com/search/label/q=
emu

