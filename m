Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B08C449EBE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 23:46:24 +0100 (CET)
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkDPD-0007Nd-DW
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 17:46:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mkDMy-0006KX-85
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 17:44:05 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=44729
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mkDMv-0005I9-PH
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 17:44:02 -0500
Received: by mail-io1-xd2b.google.com with SMTP id f9so20326620ioo.11;
 Mon, 08 Nov 2021 14:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WBXCNBgU8CcKAxSwhr3mUT60pBImmYZqHDisNP33Cxk=;
 b=iWfSXedkytDNHsHfswe5/jSuvkvHpB7owTS2aTiBCu/8F/fKg9sBSS3iLL3PFYhqQE
 rjuy7bgrxr0A27CxBHamgS6SlspE1g3+ANGlOKzCPfA3XsCRF+L6zknTao+zsZo2fIf3
 NoEGh4elDY8G+HOeqjAsYqOxCibwYo4V1t7t5u8HWnUx+WCAwRqjHNkOlfnzTzNMqC0h
 x1hv2laqFH/yu2hK23PDQmYwUp2xzuQNH/5bgjIpLFpmLGHBBn8V4OQ4ys5R98qATxFD
 jSC28C/Qq+TMG66fjQMmPT2d+4FVPS0PUK0ixSjtQNf9PvagJ8CrlVt6eFozMM88Rudk
 84kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WBXCNBgU8CcKAxSwhr3mUT60pBImmYZqHDisNP33Cxk=;
 b=Pld7qWNNFm8LTn882YRHcunVcfzBfsA25LcFZFNRRotkCm2LZXBI/D4wvYv2eX60oi
 mlNrXhnYUTRn6Q7YniwtZoF8fq+Ys+V5OJoiDzQLxVPvTmxIk+3vTAkq247Ki2MLw7vK
 WW8FC3N5dfFnn8AAdKZAG9rihaaJwgUgdEj/jZnFA67EjhVu8L3onz/LqA/j6F5gPOd2
 lZj3eJ7Kgk3PeS/TdUeAIECZ/1/Kf74yl+S31k/1Cl59BLW6//ig1LCHN/KRigyvud3m
 fG4fRH1hsmM6vlfXwsiPsh1/jmHoaQva77lzCWNaOKxCsAQb6RkdtIdUZnPhI33BVmNV
 5n6A==
X-Gm-Message-State: AOAM531Y0aKl+1ghJ55lXxurPIvubcUZ3G8JWbJYXDAwMQshriFGGU9C
 hpDOq2gSkLxWE32t4O8KVi/IXywdQfO8XLlIeWE=
X-Google-Smtp-Source: ABdhPJwea2HaTzqIbDqNWuJrPjBJ5dC3lgY6E8tCO7fDX+N8z1nBb65N5a1Mda6ZyIxzF/MGeQe7N0zGCH1O52RyUn4=
X-Received: by 2002:a05:6638:d16:: with SMTP id
 q22mr1996737jaj.35.1636411438394; 
 Mon, 08 Nov 2021 14:43:58 -0800 (PST)
MIME-Version: 1.0
References: <20211108200756.1302697-1-sw@weilnetz.de>
In-Reply-To: <20211108200756.1302697-1-sw@weilnetz.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Nov 2021 08:43:32 +1000
Message-ID: <CAKmqyKPSHycrLo5=Eh5NeZVVE8aMkQXCVGxmQrKYEs50k6HLqQ@mail.gmail.com>
Subject: Re: [PATCH] device_tree: Fix compiler error
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 9, 2021 at 6:08 AM Stefan Weil <sw@weilnetz.de> wrote:
>
> A build with gcc (Debian 10.2.1-6) 10.2.1 20210110 fails:
>
> ../../../softmmu/device_tree.c: In function =E2=80=98qemu_fdt_add_path=E2=
=80=99:
> ../../../softmmu/device_tree.c:560:18: error: =E2=80=98retval=E2=80=99 ma=
y be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>   560 |     int namelen, retval;
>       |                  ^~~~~~
>
> This is not a real error, but the compiler can be satisfied with a small =
change.

Why don't we just initalise retval?

Alistair

>
> Fixes: b863f0b75852 ("device_tree: Add qemu_fdt_add_path")
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  softmmu/device_tree.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 3965c834ca..9e96f5ecd5 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -564,7 +564,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>          return -1;
>      }
>
> -    while (p) {
> +    do {
>          name =3D p + 1;
>          p =3D strchr(name, '/');
>          namelen =3D p !=3D NULL ? p - name : strlen(name);
> @@ -584,7 +584,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>          }
>
>          parent =3D retval;
> -    }
> +    } while (p);
>
>      return retval;
>  }
> --
> 2.30.2
>
>

