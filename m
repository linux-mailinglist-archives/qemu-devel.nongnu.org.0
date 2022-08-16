Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ACF595FF9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 18:16:10 +0200 (CEST)
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNzEf-0004L5-0y
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 12:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNzAl-0000H3-In; Tue, 16 Aug 2022 12:12:07 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:46996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNzAj-0006In-6x; Tue, 16 Aug 2022 12:12:06 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31f445bd486so163903737b3.13; 
 Tue, 16 Aug 2022 09:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=zPRQnJFvWtCG/bmjOUV9YwnCITH9A7OwlZq1xte67UA=;
 b=Lhg9GHkDmhrjhd3S0Eyb+oO8jgSKY0xtBu/gsDS3Zlms9aNyj0Mnt5p2IEeHdvZ6Nx
 SRjRx6FnTtnmY4HN4n7pXtL34oe+ZtQG1Bs3dFALkSaxV1xoQx8zEnUvGkeoijtpvjld
 LMZodzR6c+ev8OOEsbd7zyu8a/53KjtFi8vGXg2PCVMjQQil8KtKJBSFSg1CEtqavg7S
 WylinaZJ9+dfhVhPQ9aeCXCiKcveZK8tT+ferJYDO0XteTdk7225kf+TDBJWbKshhJ2U
 guLcFenZAbBqnvkKoFerTMI1fIo+TUGZmdMt+gUWiaDFdovLFDzQCSTwqyUZYCMJyOrv
 05Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=zPRQnJFvWtCG/bmjOUV9YwnCITH9A7OwlZq1xte67UA=;
 b=oo4VpNoz7b21DWC+OPLF5OptgnmxioYRVyv1Iv5R448TGweCvpYB6KeZY3DH3Lqr8g
 VxiGIjIjmVwP2B2/nWheiP1OTFAvT1+DwUtD7UBc264nFgzfRUwzih/ZIcI7huxm0nXe
 lDsU9arT5ZrTib9jK7cT26m0A9K2Dw7rdrbV36XPXLtjl+MgTma9OpN/s5uiBwwe7as0
 /b7q4KbHnIj7K3dGdHv0xs8stS3HTYSwu8GHsz3gN+8q5HuaVX1ZNmBzbvTn00fRDK5E
 Y3790LFI4174aSc5ZaZmtTHKBLNObnfJEQOsmi4k/0+NMMFRiu4rlesvGQq3jjSS+8Jp
 ocKA==
X-Gm-Message-State: ACgBeo0FgCHlIHELbURoBMQhyuSmZZZ9/ba0yXb97V4uOXMirkuG90af
 XPfNKejJ5Q+sqrdG123j/37+HRxaZSdMHWZUOO2fMz4PcmawN5k6
X-Google-Smtp-Source: AA6agR4SRVqG0EbvF5MxOjlD24T06QL4FuaoYgUBmlkQu5PjNHqV0Xtmq6e4Y+DiDXxiGTTj02WtsmBA+kzwt6aGHxI=
X-Received: by 2002:a0d:dd96:0:b0:334:b86d:78cc with SMTP id
 g144-20020a0ddd96000000b00334b86d78ccmr47863ywe.267.1660666323350; Tue, 16
 Aug 2022 09:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-3-faithilikerun@gmail.com>
In-Reply-To: <20220816062522.85714-3-faithilikerun@gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Wed, 17 Aug 2022 00:11:41 +0800
Message-ID: <CAAAx-8KbEQ10oCYkpg6zugmunF578j6mOvufTM-YqtNuR0r45Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] file-posix: introduce get_sysfs_str_val for device
 zoned model
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Hannes Reinecke <hare@suse.de>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu block <qemu-block@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x112b.google.com
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
> Use sysfs attribute files to get the string value of device
> zoned model. Then get_sysfs_zoned_model can convert it to
> BlockZoneModel type in QEMU.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
>  block/file-posix.c               | 93 ++++++++++++++++++--------------
>  include/block/block_int-common.h |  3 ++
>  2 files changed, 55 insertions(+), 41 deletions(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 48cd096624..c07ac4c697 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1210,66 +1210,71 @@ static int hdev_get_max_hw_transfer(int fd, struc=
t stat *st)
>  #endif
>  }
>
> -static int hdev_get_max_segments(int fd, struct stat *st)
> -{
> +/*
> + * Convert the zoned attribute file in sysfs to internal value.
> + */
> +static int get_sysfs_str_val(struct stat *st, const char *attribute,
> +                             char **val) {
>  #ifdef CONFIG_LINUX
> -    char buf[32];
> -    const char *end;
> -    char *sysfspath =3D NULL;
> +    g_autofree char *sysfspath =3D NULL;
>      int ret;
> -    int sysfd =3D -1;
> -    long max_segments;
> -
> -    if (S_ISCHR(st->st_mode)) {
> -        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) =3D=3D 0) {
> -            return ret;
> -        }
> -        return -ENOTSUP;
> -    }
> +    size_t len;
>
>      if (!S_ISBLK(st->st_mode)) {
>          return -ENOTSUP;
>      }
>
> -    sysfspath =3D g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segmen=
ts",
> -                                major(st->st_rdev), minor(st->st_rdev));
> -    sysfd =3D open(sysfspath, O_RDONLY);
> -    if (sysfd =3D=3D -1) {
> -        ret =3D -errno;
> -        goto out;
> +    sysfspath =3D g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
> +                                major(st->st_rdev), minor(st->st_rdev),
> +                                attribute);
> +    ret =3D g_file_get_contents(sysfspath, val, &len, NULL);
> +    if (ret =3D=3D -1) {
> +        return -ENOENT;
>      }

+/* The file is ended with '\n' */
+char *p;
+p =3D *val;
+if (*(p + len - 1) =3D=3D '\n') {
+    *(p + len - 1) =3D '\0';
+}

I'm sorry to miss this part to make the str end with '\0'.

> -    do {
> -        ret =3D read(sysfd, buf, sizeof(buf) - 1);
> -    } while (ret =3D=3D -1 && errno =3D=3D EINTR);
> +    return ret;
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
> +static int get_sysfs_zoned_model(struct stat *st, BlockZoneModel *zoned)=
 {
> +    g_autofree char *val =3D NULL;
> +    int ret;
> +
> +    ret =3D get_sysfs_str_val(st, "zoned", &val);
>      if (ret < 0) {
> -        ret =3D -errno;
> -        goto out;
> -    } else if (ret =3D=3D 0) {
> -        ret =3D -EIO;
> -        goto out;
> +        return ret;
>      }
> -    buf[ret] =3D 0;
> -    /* The file is ended with '\n', pass 'end' to accept that. */
> -    ret =3D qemu_strtol(buf, &end, 10, &max_segments);
> -    if (ret =3D=3D 0 && end && *end =3D=3D '\n') {
> -        ret =3D max_segments;
> +
> +    if (strcmp(val, "host-managed") =3D=3D 0) {
> +        *zoned =3D BLK_Z_HM;
> +    } else if (strcmp(val, "host-aware") =3D=3D 0) {
> +        *zoned =3D BLK_Z_HA;
> +    } else if (strcmp(val, "none") =3D=3D 0) {
> +        *zoned =3D BLK_Z_NONE;
> +    } else {
> +        return -ENOTSUP;
>      }
> +    return 0;
> +}
>
> -out:
> -    if (sysfd !=3D -1) {
> -        close(sysfd);
> +static int hdev_get_max_segments(int fd, struct stat *st) {
> +    int ret;
> +    if (S_ISCHR(st->st_mode)) {
> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) =3D=3D 0) {
> +            return ret;
> +        }
> +        return -ENOTSUP;
>      }
> -    g_free(sysfspath);
> -    return ret;
> -#else
> -    return -ENOTSUP;
> -#endif
> +    return get_sysfs_long_val(st, "max_segments");
>  }
>
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s =3D bs->opaque;
>      struct stat st;
> +    int ret;
> +    BlockZoneModel zoned;
>
>      s->needs_alignment =3D raw_needs_alignment(bs);
>      raw_probe_alignment(bs, s->fd, errp);
> @@ -1307,6 +1312,12 @@ static void raw_refresh_limits(BlockDriverState *b=
s, Error **errp)
>              bs->bl.max_hw_iov =3D ret;
>          }
>      }
> +
> +    ret =3D get_sysfs_zoned_model(s->fd, &st, &zoned);
> +    if (ret < 0) {
> +        zoned =3D BLK_Z_NONE;
> +    }
> +    bs->bl.zoned =3D zoned;
>  }
>
>  static int check_for_dasd(int fd)
> diff --git a/include/block/block_int-common.h b/include/block/block_int-c=
ommon.h
> index 8947abab76..7f7863cc9e 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -825,6 +825,9 @@ typedef struct BlockLimits {
>
>      /* maximum number of iovec elements */
>      int max_iov;
> +
> +    /* device zone model */
> +    BlockZoneModel zoned;
>  } BlockLimits;
>
>  typedef struct BdrvOpBlocker BdrvOpBlocker;
> --
> 2.37.1
>

