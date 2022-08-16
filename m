Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1F2595FFA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 18:16:21 +0200 (CEST)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNzEp-0004jR-Vc
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 12:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNzCh-0001kx-4E; Tue, 16 Aug 2022 12:14:07 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:35340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNzCf-0006VW-KU; Tue, 16 Aug 2022 12:14:06 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-33365a01f29so66474727b3.2; 
 Tue, 16 Aug 2022 09:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=Eb9OWY+iAAKXuJtjdfk+iEMx5OnBNugOfVlUm0qhECk=;
 b=Obws2QbTAGXB8MJ7zmMBOdZ4NTUTQRXgbCggo54mMZuKFEnQ/PBldoL3ZPiG1kniZa
 4DBZcLyiPf+ZFptd+qlY+gI8D79yTed21vYy0YZO0q805z7tzYw5+ChpZhmT7E7D6iG3
 nWbnpW7gA4TwefS0avAzgtwlEhJ6hTpUvB6NFCTCDnyhjn0SvYQcGeI+Hb1s2FkHiZQX
 Rwurjm5h4NLiYsuTpNHaeb0yI+eybMYpxUzuHiTZhEPeOIonO2AGCL/ZYN6P31Mq1s0w
 7ai65YbmT5kjcPgmAMpgNTre/pMQa5Qc7/Nt/cbJro4A+4cH87cCizWmeDmLBhOxhTbJ
 6djQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=Eb9OWY+iAAKXuJtjdfk+iEMx5OnBNugOfVlUm0qhECk=;
 b=zrBUhRdhrVwwgKK9kr65iGEvtrbuugJEjgWuqPPsEV7qGt1qBkyDHzNhuOXssFn7bW
 SK0L8LdCS3Qebd8zqAUfMrFzLu+jkGxFCKPRwesEzrsk2NtZ+aEsUOINyhJ2MJtmDeYK
 MYn5ucCYJ9Q+bD7qQill8v1a7uy2tX3XYaKZyPBSXmkZgp5XIqGLAZbN1c/sg60I2m9T
 GfpnI5jygi5uIzX14UCWPfqcT7GYdsH8EYlTNnRt8ieub7WGqq84AwLGEttHDjlNKYIP
 kaPm0qL5EVS6dX9TO7RoE2UbICRZjfA46K29aJ+TQV2vSSEMXExRLPV0N159xsdcrGdu
 qZbA==
X-Gm-Message-State: ACgBeo1HU3L8c2F/0J9DdXcbORGVInAv92QwcqM9yA2luqpXOlmjSfZ6
 MuX9UoLFtPndANoZN3QuEtY9dGlm2wx5W++QJELSO7V04oSPFeL2
X-Google-Smtp-Source: AA6agR4YhXCrhLLpW4u5+SBEwIqPSxRrl+AU/zXc4Ky6KDekGYrr0OQBdmprF3hm6ldOGo2VDAZKxHyGIYhJr0O0D4Y=
X-Received: by 2002:a05:6902:2cb:b0:684:aebe:49ab with SMTP id
 w11-20020a05690202cb00b00684aebe49abmr12842300ybh.242.1660666443414; Tue, 16
 Aug 2022 09:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-4-faithilikerun@gmail.com>
In-Reply-To: <20220816062522.85714-4-faithilikerun@gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Wed, 17 Aug 2022 00:13:52 +0800
Message-ID: <CAAAx-8+fLxM5-7XLQdLO3wSXON-uK5jK9En2n1JH2K1j+LjaJg@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] file-posix: introduce get_sysfs_long_val for the
 long sysfs attribute
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Hannes Reinecke <hare@suse.de>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu block <qemu-block@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sam Li <faithilikerun@gmail.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=8816=E6=97=
=A5=E5=91=A8=E4=BA=8C 14:25=E5=86=99=E9=81=93=EF=BC=9A
>
> Use sysfs attribute files to get the long value of zoned device
> information.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/file-posix.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index c07ac4c697..727389488c 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1258,6 +1258,33 @@ static int get_sysfs_zoned_model(struct stat *st, =
BlockZoneModel *zoned) {
>      return 0;
>  }
>
> +/*
> + * Get zoned device information (chunk_sectors, zoned_append_max_bytes,
> + * max_open_zones, max_active_zones) through sysfs attribute files.
> + */
> +static long get_sysfs_long_val(struct stat *st, const char *attribute) {
> +#ifdef CONFIG_LINUX
> +    g_autofree char *str =3D NULL;
> +    const char *end;
> +    long val;
> +    int ret;
> +
> +    ret =3D get_sysfs_str_val(st, attribute, &str);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    /* The file is ended with '\n', pass 'end' to accept that. */
> +    ret =3D qemu_strtol(str, &end, 10, &val);
> +    if (ret =3D=3D 0 && end && *end =3D=3D '\n') {

Should be  "if (ret =3D=3D 0 && end && *end =3D=3D '\0') {". Changes accord=
ingly.

> +        ret =3D val;
> +    }
> +    return ret;
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
>  static int hdev_get_max_segments(int fd, struct stat *st) {
>      int ret;
>      if (S_ISCHR(st->st_mode)) {
> --
> 2.37.1
>

