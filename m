Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D728F487FE8
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 01:24:03 +0100 (CET)
Received: from localhost ([::1]:57492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5zWc-0001xp-DN
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 19:24:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5zVI-00014U-EU; Fri, 07 Jan 2022 19:22:40 -0500
Received: from [2607:f8b0:4864:20::d32] (port=35832
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5zVG-00058U-Q6; Fri, 07 Jan 2022 19:22:40 -0500
Received: by mail-io1-xd32.google.com with SMTP id y70so9213152iof.2;
 Fri, 07 Jan 2022 16:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k3NPVvDkIV3sTprnGw9GCol6BU2QPGGFPtc1vpAmcmc=;
 b=aSkpKQauh4nt8iwYZ03OevjVtDW8gZSV4JaYfisToyNFb1bWHSA0NBPT1gDq6Fs4Nt
 pYa4jmZf1JPaqOI8y/Po6lcPksdcAEjI0mJwAVT0Tm3jL8i/8mNGhlYIk4JMsSRQ/sje
 1DZJpfDRCgJcYkgGCwZThOD6BQE9arpfJ7b66S0k666HTbZo2ISCpRLsstKTkJwD8hDC
 uTVfAELMyE6sXGw+/Np79743mzzLxtLaNzHnOKLFFfAF06Mmq6bK9v1HfHB90QBJxz0f
 eDjJjBmWXYlv7TCGW2GCqd9Ft98QhjEViKfzqdHi7G9ljWr54xyfu4znVkPjB1MzZGSq
 rQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k3NPVvDkIV3sTprnGw9GCol6BU2QPGGFPtc1vpAmcmc=;
 b=3N6dMhUAutgn+kbWFTXAuVbCKiIb5XoQzXoS/0eVSB6f60UEtUt4tAJ5rOB94/el6/
 wK1gN+ppKO1dNFiA25y05VsCtr8q92v9pgDtPLTf6FrPNHJevZkpY+hBaERKUoEXw8rK
 w6Xd6YoQe/GikOM1M+6m4csdrIl5ELRXfEn6JQq9Dfso1p/kgdJcLk5NMeTQCkSC1/6L
 NP+RTnscvWUMIiObSCTZuEfdBYL7U4LJF4FiiUWD9d2lfGHjnAJccxSUU/TEMmCilbsg
 b/5BPFr/9hjka3C2E5TxvYIVlU4/60imxO3h8QPTUz386NimBuiLfqAsT/WJ75NRKptj
 WeRA==
X-Gm-Message-State: AOAM533KUYET5h+e34dqWRz9yjRlA4zhSJk3XGs2XXwmHXuU8dTlKTkX
 ZcT53C+9zQf98wb7A/kmn/ENl3aNVXXcsKqJLvo=
X-Google-Smtp-Source: ABdhPJxnaMfhcTDoIOcE/vSv99tO/k+/vY4WTLvRV1+ABI2nFsY+zTVFf1tuCvZWQp6ibPEW7O8qbD0WBvW2PBROZxI=
X-Received: by 2002:a5d:8a0a:: with SMTP id w10mr31243513iod.90.1641601346554; 
 Fri, 07 Jan 2022 16:22:26 -0800 (PST)
MIME-Version: 1.0
References: <20220107133844.145039-1-thuth@redhat.com>
In-Reply-To: <20220107133844.145039-1-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 8 Jan 2022 10:22:00 +1000
Message-ID: <CAKmqyKO2sxGT49MS27LBUq+K7K5yxUp+jOpgV8sMYs7tXNfQ0g@mail.gmail.com>
Subject: Re: [PATCH] softmmu/device_tree: Silence compiler warning with
 --enable-sanitizers
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 7, 2022 at 11:41 PM Thomas Huth <thuth@redhat.com> wrote:
>
> If I configure my build with --enable-sanitizers, my GCC (v8.5.0)
> complains:
>
> .../softmmu/device_tree.c: In function =E2=80=98qemu_fdt_add_path=E2=80=
=99:
> .../softmmu/device_tree.c:560:18: error: =E2=80=98retval=E2=80=99 may be =
used uninitialized
>  in this function [-Werror=3Dmaybe-uninitialized]
>      int namelen, retval;
>                   ^~~~~~
>
> It's a false warning since the while loop is always executed at least
> once (p has to be non-NULL, otherwise the derefence in the if-statement
> earlier will crash). Thus let's switch to a do-while loop here instead
> to make the compiler happy in all cases.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> 2.27.0
>
>

