Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069316F0BDA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 20:25:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps6Hm-0003dw-7A; Thu, 27 Apr 2023 14:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps6Hk-0003do-Nk
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 14:24:04 -0400
Received: from mout.web.de ([212.227.15.4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps6Hj-0004V7-2q
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 14:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682619833; i=lukasstraub2@web.de;
 bh=GzBDVHTZdAdMDRudgF5y2KwwhYXwcs7Har6X3MbU+vk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=n7KFdA3WcQOlzemMfVe4+miuZmQzi4SsOeZHKvKJuk6Maf/WVkG5zLYIM7qGUJgrC
 7cxO1sBaUKe1yw3iAhpiOglGOLga7W6FtCO9YtlXgKS5X47Zr5OnOcAMGZsu7KlTsl
 jD9k1EiaSa5mkmVofqUxNyU8+u3cNyudzkpv7x4ADbZORpOX/xfmM9VrGEXfzgN1mB
 DcwuZQbhSMCqv00IV5vBr9mlUcHLFCi8SDjC1ozXPOYWvoP9SjKOqrFyOeI/fz1BS9
 k/jKCNfWqWCkEhAXoHmGC9oXex+1S+V3MBHPbD5cnWAcVvJE4qc3BRHbCvWMK5CfjR
 LDlMp5uEDbfIw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.107]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MFs1z-1q3rRW1Qr9-00HLhx; Thu, 27
 Apr 2023 20:23:53 +0200
Date: Thu, 27 Apr 2023 20:23:43 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>
Subject: Re: [PATCH 01/19] multifd: We already account for this packet on
 the multifd thread
Message-ID: <20230427182343.5887a5b4@gecko.fritz.box>
In-Reply-To: <20230427163449.27473-2-quintela@redhat.com>
References: <20230427163449.27473-1-quintela@redhat.com>
 <20230427163449.27473-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xf2ZW8DNzcVu4CzBeM7TewV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:lrVYeHoTkiFKSccpCmwgjKA/NlQMSCcQGZHhRFKvLHHi6mc8KWq
 QF9MilL7uBL1zKC5cFivdm+Zg2nPkAbqVLZAYLDQLHMP6Veg2xF12Q0nlBeQiegUU7XaH71
 As7hXIl89dKBSYCuutF5Adx3SGk3YufCN2YWpmX6LocpjVlosX1uTSTPsRpwv9jJHU3hh/u
 nyFJoPepuZo6M05xpHwpA==
UI-OutboundReport: notjunk:1;M01:P0:gVmXRnjz4KM=;Vd8wi2Ebn2rYAzMLJO4VvqOpSOP
 PnExnSYCj0tGEnG4d+yznFnChoMiNbcD6HzTFgaIOLnyRNbZHjqCM2VAW2Ok6thZDpJhEJWxa
 RzjnqqkiloSW+wTd+maYaVwfhCAJ5rUgTHXr2yqw3jQqscuGKCToyr09+irGYmtelL5gvvxkQ
 pQV/581Uh/KEz6BKM/mlpEt/T6lFhATDT2+Mjw4MypU4F2HtamOtU+7dCO1qeW0y7LQu96yGx
 VYzIgFvV801rXdI8FJNiheC7xNcm9CwFNcU03Dnb1R9qos2SGH5RHkOn1d4IY17Ncn7/SW6/e
 Jx7jdHp09QDpWqtNNWb0DnJZVNJaOzejUUN+CsiJEWXgKtQ9KiVsAhZMuhrnZPMNRzILS49fN
 RUzjCk3K/yTYn++qHSlt0dljx8Xy2wCoV8IJW9OQ74CN6397iNKSPcSOw8FMFjZnBnXvriz6j
 Qn2lQJMZGPB9VixwWbAh4Tyr7ZU5BNPn6eGsprdH+Rn8oJyxyvUiXc3qR5hL/YtQ/vXYgsTaT
 1qHjlEBeKUN83AhIefDo577HUhBSNDWiWq5HS/I6H5DzzD7b0T3hmk9/4wCdMBzc30JX2tHDf
 MuGN+ZTLVUU5FHVijEsK/NYa724AHr76yRm6S4f8XJgdXe+5stkoL4mlC7Ya2sLXKxqDZQZMB
 3gkoVHdS0QVi8qYAnH28BPLKPgTbaeNsZfuppWSesOIADzC/v4I/YIpdEEeKCXbDlb5lX3o5b
 nlZ7iiqFVM9XPYvrtOxgy3DzK6nQD8x1Splf2Txnp6j3K3YcIs9rDaGjncT3sG9/Zy/pcJYMx
 eVoBXMrcEHjaik6Zd8UfkeoYGNqDmw1fzBuFVYtRlGBQmzurTL5Hgnful/HtjX7yNYzcSaXzw
 3ORpSAoKnkVgN5/l5a9pg30oQP1XDyUEcuxALosFpKscYmD3TSHwW28WKRoUQsUT6ls3HauUt
 iB0Q6Q==
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/xf2ZW8DNzcVu4CzBeM7TewV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Apr 2023 18:34:31 +0200
Juan Quintela <quintela@redhat.com> wrote:

> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Lukas Straub <lukasstraub2@web.de>

> ---
>  migration/multifd.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 6a59c03dd2..6053012ad9 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -626,10 +626,7 @@ int multifd_send_sync_main(QEMUFile *f)
>          p->packet_num =3D multifd_send_state->packet_num++;
>          p->flags |=3D MULTIFD_FLAG_SYNC;
>          p->pending_job++;
> -        qemu_file_acct_rate_limit(f, p->packet_len);
>          qemu_mutex_unlock(&p->mutex);
> -        stat64_add(&ram_counters.transferred, p->packet_len);
> -        stat64_add(&ram_counters.multifd_bytes, p->packet_len);
>          qemu_sem_post(&p->sem);
>      }
>      for (i =3D 0; i < migrate_multifd_channels(); i++) {



--=20


--Sig_/xf2ZW8DNzcVu4CzBeM7TewV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRKva8ACgkQNasLKJxd
sliOmw/7B1jrWjuJAquQkbN8apYsyw431I/nTl7miXHZvWSir2vSQW1izsI1qdTZ
ZEQQoIf6GeTQxxFd2V2+V4sV64xlI5gnhYkdGh9sC8GABbJ2L4Oa6VJW70+U/NC8
SKHBL9asubBv8eiITHoAAMKKFUA6QEvKqq1JQaYbkrVyy0YCOpyTwTbDuxlL73KL
ruNRTmFGpsk1d+1Ge1lhtaqPegPOywt7r+NFwcJm7PjX5HcZ/XvdHACwGfDubMku
JXlUH78nIRUvp2wH8ETQ5ieOEhdvioFaO2nwoe8OqheN1zs0Dg0MVIcbJuvZAlW/
xr734w0dbmaxeMdIz2Ifq1tQJAWLQEv9SErvEBEDwTWPNo9WP/DSWA6ZcsV5NOhq
s7dxH7CpspZUJnv+v59ELSYxeiiHVkxNMSq/JMJaZIMDkxT9Y1r9htO2BgkBIhrO
dlfwZz+ZChN3vbndrEA4p8MJWPf7Q59BEh6PQklOR5yKr0cFJQlZ4rH3zsIdWOQx
Z0e9VXXzwykYr+oBxAWoeE1yRtuSfLBSq6rN4+0qwJ0g/fU7x2jM1Sglfd+FL+T5
CWfQPf/DctdjVZSFzaDM0XeR9Q4KiBzOZgL5z8huDuGoWRNaD0qSC/AojhGGk3nN
1Wa4SwwQDlg+fRxTNeGGXyluJRcoG8VeLhC88fFUKNKxuF6Zxfg=
=rbHZ
-----END PGP SIGNATURE-----

--Sig_/xf2ZW8DNzcVu4CzBeM7TewV--

