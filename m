Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B70B55B8BB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:49:12 +0200 (CEST)
Received: from localhost ([::1]:34390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kQh-00056I-Hx
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5kMR-0002nD-GS; Mon, 27 Jun 2022 04:44:47 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:34541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5kMP-0003m3-Nd; Mon, 27 Jun 2022 04:44:47 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-318889e6a2cso78143077b3.1; 
 Mon, 27 Jun 2022 01:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=177A+Qi7kPqcGPYcNYe7Ftc51A7BjQ1In1SuR4+/GzQ=;
 b=l3f1kXrBB/ifiDd2BShjOP6bEfMySpxgRk4U/78z58AprmnWxVKEtGWymG8Pf7I7CR
 sskLBNV3tELUhSTivh+IxiDrNuzHbkrgbCM8Bz1Aw4xj2dx0rz1+N4mgsOgvtlVeR1Ej
 1QuO5u6ZS2MeG/cQjSwzIVJJAUwWHT81ZkSnlv0gGCq4LL43DVC8hasUSFTw9WTJyQQ0
 6zv4VCvdD5zzg0qI9dVOx82hSCeMseAUJ3jYRrB7MpW6Waaz7DO8qRZKkXhtKtY73Mm9
 W44EaB2+LgHN/gy6whvJw4k25n6dgGs9rHBUCiQHIygIoxCefoE2XrqsS09jcbOZsDUW
 aAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=177A+Qi7kPqcGPYcNYe7Ftc51A7BjQ1In1SuR4+/GzQ=;
 b=ml8Kw5NOP2Py0ozga9WGkrS/nD0kTzdG0WJ7JCC7/Zmmepeis4Atdal6PAdWkS/5v5
 eKGB+a6bWoBs6i3hvVvj+kSci2t5SV0h3gvtsNj3rJWLf05FWJZXRkYlvIkZoX+gHZDh
 onf0ZTlUn5op5eL5eI7PLyCT/cp+54zSvPJ/kIugh5RheOoB4AzNm/Tj+g/pGgDlC93S
 WvJvGWqvle9MLWwH4Z/vbBRMCH6QW5RvZy/Z0KTcGdoFyUT1c1dTPfIFnzu5BJhMLXHg
 76KGRkflu0G0n3wrUkemuIBM1y8DdCH2E8dKsxntRvrN4dWWTGE23DaMTk1pH2/AaSw8
 TcqQ==
X-Gm-Message-State: AJIora/tsjXArgmwftHSQnZMYrAfuezjg23M8cFJB0qTEwpuiNtBJXLe
 9n0PG8+AMi0gaWhRNTAlNexErfjkj6Qi+tiDx/Q=
X-Google-Smtp-Source: AGRyM1suYOCtWXKa+1eoroKU9npb+gqCH1FaT+rdoUEjbm1shfstlHjhcG4RLgxdNl1MVhdcVt5GJBZTZJOHFzcv0/w=
X-Received: by 2002:a0d:fa07:0:b0:31b:a0f1:c094 with SMTP id
 k7-20020a0dfa07000000b0031ba0f1c094mr6810507ywf.95.1656319484169; Mon, 27 Jun
 2022 01:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-5-faithilikerun@gmail.com>
 <b9fab319-aaef-9f4e-090e-b10fa010eb5d@suse.de>
In-Reply-To: <b9fab319-aaef-9f4e-090e-b10fa010eb5d@suse.de>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 27 Jun 2022 16:44:44 +0800
Message-ID: <CAAAx-8KO_beNZ2i=3smsfGs67f28TT7puYFGbMbgxmr5OO3-WA@mail.gmail.com>
Subject: Re: [RFC v3 4/5] file-posix: introduce get_sysfs_str_val for device
 zoned model.
To: Hannes Reinecke <hare@suse.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1133.google.com
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

Hannes Reinecke <hare@suse.de> =E4=BA=8E2022=E5=B9=B46=E6=9C=8827=E6=97=A5=
=E5=91=A8=E4=B8=80 15:41=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/27/22 02:19, Sam Li wrote:
> > ---
> >   block/file-posix.c           | 60 +++++++++++++++++++++++++++++++++++=
+
> >   include/block/block-common.h |  4 +--
> >   2 files changed, 62 insertions(+), 2 deletions(-)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 73c2cdfbca..74c0245e0f 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1277,6 +1277,66 @@ out:
> >   #endif
> >   }
> >
> > +/*
> > + * Convert the zoned attribute file in sysfs to internal value.
> > + */
> > +static zone_model get_sysfs_str_val(int fd, struct stat *st) {
> > +#ifdef CONFIG_LINUX
> > +    char buf[32];
> > +    char *sysfspath =3D NULL;
> > +    int ret;
> > +    int sysfd =3D -1;
> > +
> > +    if (S_ISCHR(st->st_mode)) {
> > +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) =3D=3D 0) {
> > +            return ret;
> > +        }
> > +        return -ENOTSUP;
> > +    }
> > +
> > +    if (!S_ISBLK(st->st_mode)) {
> > +        return -ENOTSUP;
> > +    }
> > +
> > +    sysfspath =3D g_strdup_printf("/sys/dev/block/%u:%u/queue/zoned",
> > +                                major(st->st_rdev), minor(st->st_rdev)=
);
> > +    sysfd =3D open(sysfspath, O_RDONLY);
> > +    if (sysfd =3D=3D -1) {
> > +        ret =3D -errno;
> > +        goto out;
> > +    }
> > +    do {
> > +        ret =3D read(sysfd, buf, sizeof(buf) - 1);
> > +    } while (ret =3D=3D -1 && errno =3D=3D EINTR);
>
> This is wrong.
> read() might return a value smaller than the 'len' argument (sizeof(buf)
> -1 in your case). But in that case it's a short read, and one need to
> call 'read()' again to fetch the remaining bytes.
>
> So the correct code would be something like:
>
> offset =3D 0;
> do {
>      ret =3D read(sysfd, buf + offset, sizeof(buf) - 1 + offset);
>      if (ret > 0)
>          offset +=3D ret;
> } while (ret > 0);
>
> Not that you'd actually need it; reads from sysfs are basically never
> interrupted, so you should be able to read from an attribute in one go.
> IE alternatively you can drop the 'while' loop and just call read().
>
Yes, I didn't think it through.

> > +    if (ret < 0) {
> > +        ret =3D -errno;
> > +        goto out;
> > +    } else if (ret =3D=3D 0) {
> > +        ret =3D -EIO;
> > +        goto out;
> > +    }
> > +    buf[ret] =3D 0;
> > +
> > +    /* The file is ended with '\n' */
>
> I'd rather check if the string ends with an '\n', and overwrite
> it with a '\0'. That way you'd be insulated against any changes
> to sysfs.
>
Right! I was thinking about it but got hasty to hardcode everything.

> > +    if (strcmp(buf, "host-managed\n") =3D=3D 0) {
> > +        return BLK_Z_HM;
> > +    } else if (strcmp(buf, "host-aware\n") =3D=3D 0) {
> > +        return BLK_Z_HA;
> > +    } else {
> > +        return -ENOTSUP;
> > +    }
> > +
> > +out:
> > +    if (sysfd !=3D -1) {
> > +        close(sysfd);
> > +    }
> > +    g_free(sysfspath);
> > +    return ret;
> > +#else
> > +    return -ENOTSUP;
> > +#endif
> > +}
> > +
> >   static int hdev_get_max_segments(int fd, struct stat *st) {
> >       int ret;
> >       ret =3D get_sysfs_long_val(fd, st, "max_segments");
>
> And as you already set a precedent in your previous patch, I'd recommend
> split this in two patches, one introducing a generic function
> 'get_sysfs_str_val()' which returns a string and another function
> (eg hdev_get_zone_model()) which calls this function to fetch the device
> zoned model.
>
Maybe we can just return a str in get_sysfs_str_val and ignore
returning a zone_model for now? I was using zone_model for testing
purpose. Right now, this function is not used by others in
file-posix.c that causes compilation error in QEMU.

Thanks for reviewing!
Sam
> > diff --git a/include/block/block-common.h b/include/block/block-common.=
h
> > index 78cddeeda5..35e00afe8e 100644
> > --- a/include/block/block-common.h
> > +++ b/include/block/block-common.h
> > @@ -56,8 +56,8 @@ typedef enum zone_op {
> >   } zone_op;
> >
> >   typedef enum zone_model {
> > -    BLK_Z_HM,
> > -    BLK_Z_HA,
> > +    BLK_Z_HM =3D 0x1,
> > +    BLK_Z_HA =3D 0x2,
> >   } zone_model;
> >
> >   typedef enum BlkZoneCondition {
>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                        Kernel Storage Architect
> hare@suse.de                                      +49 911 74053 688
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: Felix Imend=C3=B6rffer

