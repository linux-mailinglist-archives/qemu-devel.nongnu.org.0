Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034E8596214
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 20:12:19 +0200 (CEST)
Received: from localhost ([::1]:55524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO133-0003ND-KU
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 14:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oO0l9-0002TS-TH; Tue, 16 Aug 2022 13:53:47 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:45959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oO0l8-00053d-AN; Tue, 16 Aug 2022 13:53:47 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3246910dac3so171010617b3.12; 
 Tue, 16 Aug 2022 10:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=jrCvh7aVFrpyuFMH345nlqAH7clsuEPHKThDrR/Y6gI=;
 b=YE9KodScTBtUOoxBY8peFZZYCHhx1ngTUAvckAbi/2x3BnZFIOakRRUO1GJKa5T1B1
 aP05rp0ZfzXZcz0OcWDiiJlj5wpSA6Hrvy/NyeEpjzppX6PljzID3zylGy8sNJlpTgxV
 LMW03q7KaoowxkHCuBsRe+XIgXQ2bQhyxxU7jZBNyvLO6DlJX4eyvj/vBOUAtL5Udb93
 h9gBQNiH4LCpL8RbfG1RO6zHQEatLBR1ix79SflUeq8EerXqlnfVgkngH7R1fKzkHait
 4DpilNu2DDzYbj2yTd0cUYghGJO3LjDdYZU/pmszBKFtSiVHdZfHkRZAPsB1AT8nqmlV
 E1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=jrCvh7aVFrpyuFMH345nlqAH7clsuEPHKThDrR/Y6gI=;
 b=UtHPIsGxv6pMiS6rZaZnksWvLkGxg9rAvnkejlre7Tuz0+g05kp3yskA/KpMX4PXF6
 L1xzLI6XAytHQwmR+pH2R1vsWMTgrMpmCNTllzar5L1xuBeWSWDHd9B80H1jlgdPb5h/
 /0PaPEamAY+b5Xk3ov77bTelEiI5CEGNBk6gLaF1hphm8seyICWEiFoZ4hwYxllSmuRL
 Dgxbrzg9VbRUtIv/QqdpbB6yZ7bTMv+uAjGho8EP5qQw2QnCvuxJ5MmWcNEF8XoCXX8U
 8gOwN3T9fD5XWJCZEQnxGAUobLQfwMNm9Uq4BnkhdW2610GLPHDOHwstinHsLEwGT7qW
 VAzA==
X-Gm-Message-State: ACgBeo05J5YeMEpvmg23fUjrLQsLdfTT631JmZWQG1dF+KJ+R4xgkcvC
 eh7cPVr7HwZVXsjLZG7pTQNgUuCZZW+DYMr4tMg=
X-Google-Smtp-Source: AA6agR5NIssqsBjpVTE1VXMVOzvDCm0ZJjh25DPqaOh/DffIrri7tA6Okg1o0Z8MiPAZ80UERlgmOqs6AfCZpEYhfTI=
X-Received: by 2002:a05:6902:2cb:b0:684:aebe:49ab with SMTP id
 w11-20020a05690202cb00b00684aebe49abmr13150750ybh.242.1660672424843; Tue, 16
 Aug 2022 10:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-4-faithilikerun@gmail.com>
 <69f2b5bd-2312-a581-7ce1-065159eeaf5d@opensource.wdc.com>
In-Reply-To: <69f2b5bd-2312-a581-7ce1-065159eeaf5d@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Wed, 17 Aug 2022 01:53:53 +0800
Message-ID: <CAAAx-8+j=HrzhzHDzdE+LWKay6fRkvqugk+1CTb-zAc8ZxpFrg@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] file-posix: introduce get_sysfs_long_val for the
 long sysfs attribute
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Fam Zheng <fam@euphon.net>, 
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1132.google.com
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

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B48=
=E6=9C=8817=E6=97=A5=E5=91=A8=E4=B8=89 01:35=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2022/08/15 23:25, Sam Li wrote:
> > Use sysfs attribute files to get the long value of zoned device
> > information.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  block/file-posix.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index c07ac4c697..727389488c 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1258,6 +1258,33 @@ static int get_sysfs_zoned_model(struct stat *st=
, BlockZoneModel *zoned) {
> >      return 0;
> >  }
> >
> > +/*
> > + * Get zoned device information (chunk_sectors, zoned_append_max_bytes=
,
> > + * max_open_zones, max_active_zones) through sysfs attribute files.
> > + */
>
> The comment here needs to be more generic since this helper is used in pa=
tch 2
> in hdev_get_max_segments(). So simply something like:
>
> /*
>  * Get a sysfs attribute value as a long integer.
>  */
>
> And since this helper is used in patch 2, this patch needs to go before p=
atch 2
> (reverse patch 2 and 3 order).

Can I merge patch2 and patch 3 into one patch? Because in patch 2
hdev_get_max_segments -> get_sysfs_long_val(-> get_sysfs_str_val)
while in patch 3 get_sysfs_long_val-> get_sysfs_str_val,
hdev_get_max_segments is required for qemu setting up I guess so the
dependency is intertwined here. If we use separate patches, then the
last patch will modify the first patch's code, which I think is messy.

>
> > +static long get_sysfs_long_val(struct stat *st, const char *attribute)=
 {
> > +#ifdef CONFIG_LINUX
> > +    g_autofree char *str =3D NULL;
> > +    const char *end;
> > +    long val;
> > +    int ret;
> > +
> > +    ret =3D get_sysfs_str_val(st, attribute, &str);
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +
> > +    /* The file is ended with '\n', pass 'end' to accept that. */
> > +    ret =3D qemu_strtol(str, &end, 10, &val);
> > +    if (ret =3D=3D 0 && end && *end =3D=3D '\n') {
> > +        ret =3D val;
> > +    }
> > +    return ret;
> > +#else
> > +    return -ENOTSUP;
> > +#endif
> > +}
> > +
> >  static int hdev_get_max_segments(int fd, struct stat *st) {
> >      int ret;
> >      if (S_ISCHR(st->st_mode)) {
>
>
> --
> Damien Le Moal
> Western Digital Research

