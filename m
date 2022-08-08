Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513DC58CA1B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 16:07:06 +0200 (CEST)
Received: from localhost ([::1]:44594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL3PN-0002Jt-2Y
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 10:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oL3I0-00073f-Rd; Mon, 08 Aug 2022 09:59:28 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:33396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oL3Hz-0004HW-9i; Mon, 08 Aug 2022 09:59:28 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id 7so13821715ybw.0;
 Mon, 08 Aug 2022 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=ogPeqYGm7GNHbk093NFY1BdhkWzY/UhsvfcJM1Uypdw=;
 b=kVRoS8T2LV3duwXv17yZL8GT9cHre0iqMATyjsZB3s3M4T7LP2nwDZNvlK/K88wWBv
 z6U66nv+N7RbmIAHQlTtvrIEN4xTvE68qi+k3m1LqWWhhiZH+5EV/YzD9EInAy8lgag7
 R/phamIooE/1VleNJO8+b34EoVPVmihodpphxvOmp56CQMSIuDY4MbhCnsUMOMi5kn42
 wMIfg674apJDLu8s/bXN6j+rg0w0k6Z3Wn/mIyytbh8OgXVPycq9UHAzk9C4pnJNeinh
 rUhCJc1S15JHP5vqHPNrbtgCssWF5IyT0Zm+AddP8Vf6j4q4LhZE83PsQgAn9Kh5rvtM
 VQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=ogPeqYGm7GNHbk093NFY1BdhkWzY/UhsvfcJM1Uypdw=;
 b=tKu0t0bcy6oUZfmjlaW+K8CNBnPZix3nOY5KF5U1tISHgg8yFWMUFVb7LVjiN2GYLq
 y9ThI5RmSqTDvZX1q8/9TLYRXLYGOkzY9u1ngNglvXNUAwyvSwgvHLuvWf9Dl3W3MG1F
 2+8ig2O3NiNtyvP4m85tOUgzimgVnEKDh4x89i+ETbLShovCRC7VpLU3efymVyaALps3
 khLlcq09n8od6Yh/G6wObFnzEDXm6imWf1tjRjBI2H47rixgU2CDJh2lXG2P3LQgo2fp
 ifeqoJb/c2HGoyj4ro6VbFyfDLUzx8wYu625bYP85hdKDyep7vFH5KnvQVOzimmbR0Kn
 Xv2g==
X-Gm-Message-State: ACgBeo0zdvwu/zrRnD7OeyZjCNvqQWmSViyjI7xoyGcJQTzOKZRoy2zv
 wpYFnmzBGTWH++/AKF7n17WbCokgkvtMZPtV2SY=
X-Google-Smtp-Source: AA6agR5iHpnbbqiu31u1oRi3Kq1ZF4j7WsmKoeSMPMw199hca8nstLv/YjRYvpUMdt4V+c6wsrqolq6X2kjm94iRgn0=
X-Received: by 2002:a05:6902:110b:b0:671:319a:f33d with SMTP id
 o11-20020a056902110b00b00671319af33dmr15961984ybu.102.1659967165803; Mon, 08
 Aug 2022 06:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220805075751.77499-1-faithilikerun@gmail.com>
 <20220805075751.77499-4-faithilikerun@gmail.com> <Yu5jnXJG3PBWcrYg@fedora>
In-Reply-To: <Yu5jnXJG3PBWcrYg@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 8 Aug 2022 21:59:15 +0800
Message-ID: <CAAAx-8KJa5X6uuJiswdV1ZwwR5YWNe3t3_G_nEZvMT-SLkzy7A@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] file-posix: introduce get_sysfs_str_val for device
 zoned model
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu block <qemu-block@nongnu.org>, 
 Hannes Reinecke <hare@suse.de>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Eric Blake <eblake@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb2c.google.com
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=888=E6=
=97=A5=E5=91=A8=E4=B8=80 21:52=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Aug 05, 2022 at 03:57:46PM +0800, Sam Li wrote:
> > Use sysfs attribute files to get the string value of device
> > zoned model. Then get_sysfs_zoned_model can convert it to
> > BlockZoneModel type in QEMU.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > ---
> >  block/file-posix.c               | 70 ++++++++++++++++++++++++++++++++
> >  include/block/block_int-common.h |  3 ++
> >  2 files changed, 73 insertions(+)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index a40eab64a2..4785203eea 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1264,6 +1264,68 @@ out:
> >  #endif
> >  }
> >
> > +/*
> > + * Convert the zoned attribute file in sysfs to internal value.
> > + */
> > +static int get_sysfs_str_val(int fd, struct stat *st,
> > +                              const char *attribute,
> > +                              char **val) {
>
> The fd argument is unused and can be dropped.
>
> > +#ifdef CONFIG_LINUX
> > +    char *buf =3D NULL;
> > +    g_autofree char *sysfspath =3D NULL;
> > +    int ret;
> > +    size_t len;
> > +
> > +    if (!S_ISBLK(st->st_mode)) {
> > +        return -ENOTSUP;
> > +    }
> > +
> > +    sysfspath =3D g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
> > +                                major(st->st_rdev), minor(st->st_rdev)=
,
> > +                                attribute);
> > +    ret =3D g_file_get_contents(sysfspath, &buf, &len, NULL);
> > +    if (ret =3D=3D -1) {
> > +        ret =3D -errno;
>
> g_file_get_contents() does not set errno. You can either pass in a
> GError and report the message string by converting it into a QEMU Error
> object (grep for g_file_get_contents() to see example), or you can
> return a fixed error code like -ENOENT.
>
> > +        return ret;
> > +    }
> > +
> > +    /* The file is ended with '\n' */
> > +    if (buf[len - 1] =3D=3D '\n') {
> > +        buf[len - 1] =3D '\0';
> > +    }
> > +
> > +    if (!strncpy(*val, buf, len)) {
> > +        ret =3D -errno;
> > +        return ret;
> > +    }
> > +    g_free(buf);
>
> buf is not necessary. val can be passed directly to g_file_get_contents()=
.
>
> > +    return 0;
> > +#else
> > +    return -ENOTSUP;
> > +#endif
> > +}
>
> Now get_sysfs_long_val() can be written using get_sysfs_str_val():
>
>   static long get_sysfs_long_val(struct stat *st, const char *attribute)
>   {
>       g_autofree char *str =3D NULL;
>       const char *end;
>       long val;
>       int ret;
>
>       ret =3D get_sysfs_str_val(st, attribute, &str);
>       if (ret < 0) {
>           return ret;
>       }
>
>       ret =3D qemu_strtol(str, &end, 10, &val);
>       if (ret =3D=3D 0 && end && *end =3D=3D '\0') {
>           ret =3D val;
>       }
>       return ret;
>   }
>
> The get_sysfs_long_val() patch can be moved after the
> get_sysfs_str_val() patch.

Cool! Will change it.

> > +
> > +static int get_sysfs_zoned_model(int fd, struct stat *st,
> > +                                 BlockZoneModel *zoned) {
> > +    g_autofree char *val =3D NULL;
> > +    val =3D g_malloc(32);
> > +    get_sysfs_str_val(fd, st, "zoned", &val);
>
> Once get_sysfs_str_val() passes val through to g_get_file_contents() the
> caller will no longer have to g_malloc() val themselves.

