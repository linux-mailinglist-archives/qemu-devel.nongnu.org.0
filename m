Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B167755B8A6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:35:05 +0200 (CEST)
Received: from localhost ([::1]:41512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kD2-0007zF-P9
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5kAg-0006BB-JV; Mon, 27 Jun 2022 04:32:38 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:36619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5kAZ-0001G6-DE; Mon, 27 Jun 2022 04:32:38 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3176d94c236so78206587b3.3; 
 Mon, 27 Jun 2022 01:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5PqxLyUrijgr5VSFIqQUBMkQmUZevUcgdSF+KUfKceA=;
 b=ijEA3TJz5Z6c4eZX5w/A/1NCkhD6aTbztnJ8FwxMp7VrOsVUWmnZmbMiHklQUCzgXe
 seJfpN8R8bBbLpEJDA5KoIN7nLbP/d1g5tYPOc4Ze80am9+0rWVy3MI1Aweh9qEYTGIV
 mWeNC9/InRLXTxVHfNpVaNCht7UHSibFnkQ6mWNZj3XHqFfxfG5P3Paay9SMbobHN1+C
 OI0da+W7PwXkygQuzJpklz6H69lAoTRlnnVxXL7YWgL7zS8w5gZb2cSRYedw5oyoD/HZ
 Sr2wR9sLtTAyCj2N0CVH+lgFFdj32WkNCT2Kwnz+MBzkqP0abxdyx6eASRoEZyjcociy
 ly2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5PqxLyUrijgr5VSFIqQUBMkQmUZevUcgdSF+KUfKceA=;
 b=G7n9R5ZcHhyVdiMeshHgOFIw1RiWwmW74r5Lqf9/CAMcHrFVaFu1RGy3XyNO6iKcY9
 Ih4sYqojS4FjGc8l3korduodwVCV9OR6AJo6YQ368fqF3fRTcgLjGXnagWVTOpqqvsVr
 gSVclbnUUJA96308GzcMGKrVyTM5kvNLvYCc2oTEsBjhG97StubOkaNK89nvHniJhCtt
 ZMncgu1Rl1+/ItvDuxr7S0kD6oYXtYhqephxRwTjYSCV42H492IpzmJ9LqbHBtIH1Qbr
 lWJjZggLNAQMRrhxRBpLHBan6+fm4wkU58dYIXZ6ayAzOnnm5Bxf6NVomD3UYZR+J5HJ
 cfyw==
X-Gm-Message-State: AJIora/4Iop1K7bjjrkBZOCCM/XkXRgYcxuwsreq1IQ6w8M0XhRjpcu7
 yvA3LuysYxS+DXJRpXfOmcjLJeyROWQw6o+dqrg=
X-Google-Smtp-Source: AGRyM1u9OR0vnuQy+mMEhGqBK8aaYK06TvCSWaiDOFWZp2FA0dcZj98VGcx1O2PkoJXXxmUJqryEHiEdmvIq9FYX/0o=
X-Received: by 2002:a81:503:0:b0:317:c5d5:16fe with SMTP id
 3-20020a810503000000b00317c5d516femr13043888ywf.231.1656318749668; Mon, 27
 Jun 2022 01:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-4-faithilikerun@gmail.com>
 <09739a27-358f-8150-fcb3-2d2b8be0caaf@suse.de>
In-Reply-To: <09739a27-358f-8150-fcb3-2d2b8be0caaf@suse.de>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 27 Jun 2022 16:32:30 +0800
Message-ID: <CAAAx-8+0iSs7YXNaMsdFgkmByPP6RHxxBk91_sSkrj51bsy4WA@mail.gmail.com>
Subject: Re: [RFC v3 3/5] file-posix: introduce get_sysfs_long_val for zoned
 device information.
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
=E5=91=A8=E4=B8=80 15:31=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/27/22 02:19, Sam Li wrote:
> > Use sysfs attribute files to get the zoned device information in case
> > that ioctl() commands of zone management interface won't work. It can
> > return long type of value like chunk_sectors, zoned_append_max_bytes,
> > max_open_zones, max_active_zones.
> > ---
> >   block/file-posix.c | 37 +++++++++++++++++++++++++------------
> >   1 file changed, 25 insertions(+), 12 deletions(-)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 1b8b0d351f..73c2cdfbca 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1216,15 +1216,19 @@ static int hdev_get_max_hw_transfer(int fd, str=
uct stat *st)
> >   #endif
> >   }
> >
> > -static int hdev_get_max_segments(int fd, struct stat *st)
> > -{
> > +/*
> > + * Get zoned device information (chunk_sectors, zoned_append_max_bytes=
,
> > + * max_open_zones, max_active_zones) through sysfs attribute files.
> > + */
> > +static long get_sysfs_long_val(int fd, struct stat *st,
> > +                               const char *attribute) {
> >   #ifdef CONFIG_LINUX
> >       char buf[32];
> >       const char *end;
> >       char *sysfspath =3D NULL;
> >       int ret;
> >       int sysfd =3D -1;
> > -    long max_segments;
> > +    long val;
> >
> >       if (S_ISCHR(st->st_mode)) {
> >           if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) =3D=3D 0) {
> > @@ -1237,8 +1241,9 @@ static int hdev_get_max_segments(int fd, struct s=
tat *st)
> >           return -ENOTSUP;
> >       }
> >
> > -    sysfspath =3D g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segm=
ents",
> > -                                major(st->st_rdev), minor(st->st_rdev)=
);
> > +    sysfspath =3D g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
> > +                                major(st->st_rdev), minor(st->st_rdev)=
,
> > +                                attribute);
> >       sysfd =3D open(sysfspath, O_RDONLY);
> >       if (sysfd =3D=3D -1) {
> >           ret =3D -errno;
> > @@ -1256,9 +1261,9 @@ static int hdev_get_max_segments(int fd, struct s=
tat *st)
> >       }
> >       buf[ret] =3D 0;
> >       /* The file is ended with '\n', pass 'end' to accept that. */
> > -    ret =3D qemu_strtol(buf, &end, 10, &max_segments);
> > +    ret =3D qemu_strtol(buf, &end, 10, &val);
> >       if (ret =3D=3D 0 && end && *end =3D=3D '\n') {
> > -        ret =3D max_segments;
> > +        ret =3D val;
> >       }
> >
> >   out:
> > @@ -1272,6 +1277,15 @@ out:
> >   #endif
> >   }
> >
> > +static int hdev_get_max_segments(int fd, struct stat *st) {
> > +    int ret;
> > +    ret =3D get_sysfs_long_val(fd, st, "max_segments");
> > +    if (ret < 0) {
> > +        return -1;
> > +    }
> > +    return ret;
> > +}
> > +
> >   static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
> >   {
> >       BDRVRawState *s =3D bs->opaque;
> > @@ -1872,6 +1886,7 @@ static int handle_aiocb_zone_report(void *opaque)=
 {
> >
> >   static int handle_aiocb_zone_mgmt(void *opaque) {
> >       RawPosixAIOData *aiocb =3D opaque;
> > +    BlockDriverState *s =3D aiocb->bs;
> >       int fd =3D aiocb->aio_fildes;
> >       int64_t offset =3D aiocb->aio_offset;
> >       int64_t len =3D aiocb->aio_nbytes;
> > @@ -1884,11 +1899,9 @@ static int handle_aiocb_zone_mgmt(void *opaque) =
{
> >       int64_t zone_size_mask;
> >       int ret;
> >
> > -    ret =3D ioctl(fd, BLKGETZONESZ, &zone_size);
> > -    if (ret) {
> > -        return -1;
> > -    }
> > -
> > +    g_autofree struct stat *file =3D g_new(struct stat, 1);
> > +    stat(s->filename, file);
> > +    zone_size =3D get_sysfs_long_val(fd, file, "chunk_sectors");
> >       zone_size_mask =3D zone_size - 1;
> >       if (offset & zone_size_mask) {
> >           error_report("offset is not the start of a zone");
>
> Round of applause.
>
Thanks! It was based on Damien's suggestion.

> Reviewed-by: Hannes Reinecke <hare@suse.de>
>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                        Kernel Storage Architect
> hare@suse.de                                      +49 911 74053 688
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: Felix Imend=C3=B6rffer

