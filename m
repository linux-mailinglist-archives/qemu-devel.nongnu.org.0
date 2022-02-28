Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0317E4C6E2B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:28:47 +0100 (CET)
Received: from localhost ([::1]:47112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOg4z-0004RD-9p
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:28:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOg1I-00026z-7R
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:25:00 -0500
Received: from [2607:f8b0:4864:20::b32] (port=46624
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOg1D-00009Q-0Z
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:24:55 -0500
Received: by mail-yb1-xb32.google.com with SMTP id b35so20411713ybi.13
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 05:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R8XIE8Os3TQmISDyZZT5a5+CHVrjU8cQD3NJfOSvfhc=;
 b=POa57ftO/daSfG2Fw1jFmEf15jeJhT/wWd4vJJF9z8ivbN78tmrn5y3lrM12YGdM5p
 yFWwjzp13aIVIep10Yw/JjmZD7CfGjhR/iMXBE70/A4KR4/4jPlH+hmEo2DkMr+k0tLB
 AWMaWya0wsQR+MOHBRLUTgW1FDn/U+JtkyYX/W4iCW66/8Hm1fQ/yXgUJCitwy23XjEn
 Vv4PFLSk6i7O7DUobX5QPlWLzKxhdVdaSEyxaUUMO3KyOSP2qcFYEYJwqP1IzrrGim7a
 WYl5uraIN+XwiI13hLETOLF+UA8MDWuITO0o29P1gx40VJM/I6v48hEpClXLY5g9Q41+
 g+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R8XIE8Os3TQmISDyZZT5a5+CHVrjU8cQD3NJfOSvfhc=;
 b=yhUP0b7yYhNwPQBWSTsdUX4zZkJFMn8C6vnSCyyV5axUFtl7l488O9/hxnQ1IP21Hp
 57PYsVY1l8cysgkA+7iolhj8qGFyqtqdnxczx/1sxHycAgWOJgAIND8rvxJ1Yzohh7JI
 zQP/gEEcZOGk4BaZh/TEcXephmuE00KqCw9RbAohWcOEpFzAaGVgF36iolFK3l8paevc
 K64V9zp91kItOkXI0Mqp/P27QNZ8h/7n+ToC5OZy1EBJ5ZDoj8rvr+5V/+j/N47MHp5j
 aY1Fx6JlLKhGQRGJzcVxO1U41iOP17SzHSVLclVLHybdAPKDOGSrRfHu69Lscrt9xTkR
 AmOA==
X-Gm-Message-State: AOAM531EpiOcfCCU/IdyI3zvBCJtCgUBb2X4axWgl5fKaCwWbMGk0Gi6
 lD3V9wAD11tQaJkYo32C6/zeJr21z9c7d9xB4nFAXg==
X-Google-Smtp-Source: ABdhPJx6I7Yn578DIPTye/1eP5SzMhR2zwgqyWqrknABVta7veo8t9U5yyjF1tkENvdWHuBNABkkiloOQeArbxxCMBM=
X-Received: by 2002:a25:dc87:0:b0:624:4104:a331 with SMTP id
 y129-20020a25dc87000000b006244104a331mr18889524ybe.67.1646054689643; Mon, 28
 Feb 2022 05:24:49 -0800 (PST)
MIME-Version: 1.0
References: <20220228120720.722632-1-marcandre.lureau@redhat.com>
 <20220228120720.722632-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220228120720.722632-2-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 13:24:38 +0000
Message-ID: <CAFEAcA_a+0Nz5b3uU052FquVLOLRTvejPD13NSxvHTu_yZTBiQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] meson: fix CONFIG_ATOMIC128 check
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 12:19, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> testfile.c: In function 'main':
> testfile.c:5:11: error: incorrect number of arguments to function '__atom=
ic_load'
>     5 |       y =3D __atomic_load(&x, 0);
>       |           ^~~~~~~~~~~~~
> testfile.c:6:7: error: argument 2 of '__atomic_store' must be a pointer t=
ype
>     6 |       __atomic_store(&x, y, 0);
>       |       ^~~~~~~~~~~~~~
> testfile.c:7:7: error: argument 3 of '__atomic_compare_exchange' must be =
a pointer type
>     7 |       __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> And it must be linked with -latomic.

As Philippe says, this isn't right. What the configure test
is checking for is "do we have 128-bit atomics which are
handled inline and specifically not via libatomic". The
reason we can't use libatomic is documented in the comment
starting "GCC is a house divided" in include/qemu/atomic128.h.

thanks
-- PMM

