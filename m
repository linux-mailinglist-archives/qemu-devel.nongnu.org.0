Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DE755BFD5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:42:53 +0200 (CEST)
Received: from localhost ([::1]:50076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67kC-0008GX-OI
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o67MQ-00039d-LK; Tue, 28 Jun 2022 05:18:18 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:46725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o67MN-0004N4-Fb; Tue, 28 Jun 2022 05:18:17 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id l11so21113448ybu.13;
 Tue, 28 Jun 2022 02:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ojhk6QpBzpPpiS0FQ4LNWeVNRNc1d1kr/CCJF24g1Co=;
 b=hSrIYoyGLdZMphdbZjIHRElCT/PoRu5fBLf04qNVI9fEFcXTf2DZUf8NJNlz+KoO/H
 Z38+OB4cHC9/3tbHBadc7x/UPfxkal3QJknCdMDAoSEMN5yjyJA5Mpa8ot2RBecTzJge
 uJPZ37+AAHu1PzAEIWG9CVF8QEfpr4POSmsVeYZjTdnStgwFoXOONphH1hffk1wWqIY8
 2SRuWMk1y+U6iiIz3P3uprEQhCnsjs768gTu1bN4xeYf0mg/IYwoegjfyvySk5+mFLDo
 EDQH8LYNE/v1UZtisKf4AxO+SzVxJJv+ju7EOWidPqTJ+LXlmMxFn6aZKOsryZt/L70W
 r+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ojhk6QpBzpPpiS0FQ4LNWeVNRNc1d1kr/CCJF24g1Co=;
 b=He16z/agO1coG4FEeSGIC5MDTf7EnLhYEv25l/4k+Sh3E+gLwr/sOYU6w2JlBgHGrP
 oho7yS749pAJ/ozb+i1fRf3/a/+XZAbDf1/zR9w41prBPwQGijsNfORHjTjmsC6bBNMH
 43rZZJPWlvATKu4FNNhQA+L1iMHOLmHsC4Xc+Dk/rybHDDBdNcwO+UahUjb5NTHJacjB
 wvKIHYg98kGO9hSacJIEw+B+lhHmrULeRLoOzRnX4TLx26T4HPHA9mF07C+AVFW0Evnk
 Rw+SGjYvuxHlpzmVFdbQhmuz74BoWvzHMPv8NRxzvgF8WiYv+D4acJmUajFcQdmpbSOH
 3n2Q==
X-Gm-Message-State: AJIora/Z3mLt8I6mMx8Heo9sLNlYj/rl9L8yvRSEpUqwQkRwz8CsRtj7
 NH2o6EXvf2RgOCeMk6T3zj16GRjkRtZgQINoEzs=
X-Google-Smtp-Source: AGRyM1u2DAaGbkHGIzNcjQ/mJrseqSRtjh5MY415jb1OmR7lqS3YMHJlbesVbz0IyRpBQx9xeekaglavD53Du7lRRIA=
X-Received: by 2002:a25:d957:0:b0:66c:9476:708f with SMTP id
 q84-20020a25d957000000b0066c9476708fmr15216307ybg.427.1656407893886; Tue, 28
 Jun 2022 02:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-4-faithilikerun@gmail.com>
 <Yrq3HUPe3QBjS2kq@stefanha-x1.localdomain>
In-Reply-To: <Yrq3HUPe3QBjS2kq@stefanha-x1.localdomain>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 28 Jun 2022 17:18:03 +0800
Message-ID: <CAAAx-8J95y6vFnwMNYT+WmYki-cgdB8SRNbAzy7VPQ5A6j+_wQ@mail.gmail.com>
Subject: Re: [RFC v3 3/5] file-posix: introduce get_sysfs_long_val for zoned
 device information.
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb2d.google.com
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=BA=8C 16:20=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jun 27, 2022 at 08:19:15AM +0800, Sam Li wrote:
> > Use sysfs attribute files to get the zoned device information in case
> > that ioctl() commands of zone management interface won't work. It can
> > return long type of value like chunk_sectors, zoned_append_max_bytes,
> > max_open_zones, max_active_zones.
> > ---
> >  block/file-posix.c | 37 +++++++++++++++++++++++++------------
> >  1 file changed, 25 insertions(+), 12 deletions(-)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 1b8b0d351f..73c2cdfbca 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1216,15 +1216,19 @@ static int hdev_get_max_hw_transfer(int fd, str=
uct stat *st)
> >  #endif
> >  }
> >
> > -static int hdev_get_max_segments(int fd, struct stat *st)
> > -{
> > +/*
> > + * Get zoned device information (chunk_sectors, zoned_append_max_bytes=
,
> > + * max_open_zones, max_active_zones) through sysfs attribute files.
>
> This function is also used to get max_segments, which is not related to
> zoned devices. How about:
>
>   Get a block queue sysfs attribute value.
>
> > + */
> > +static long get_sysfs_long_val(int fd, struct stat *st,
> > +                               const char *attribute) {
> >  #ifdef CONFIG_LINUX
> >      char buf[32];
> >      const char *end;
> >      char *sysfspath =3D NULL;
> >      int ret;
> >      int sysfd =3D -1;
> > -    long max_segments;
> > +    long val;
> >
> >      if (S_ISCHR(st->st_mode)) {
> >          if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) =3D=3D 0) {
> > @@ -1237,8 +1241,9 @@ static int hdev_get_max_segments(int fd, struct s=
tat *st)
> >          return -ENOTSUP;
> >      }
> >
> > -    sysfspath =3D g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segm=
ents",
> > -                                major(st->st_rdev), minor(st->st_rdev)=
);
> > +    sysfspath =3D g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
> > +                                major(st->st_rdev), minor(st->st_rdev)=
,
> > +                                attribute);
> >      sysfd =3D open(sysfspath, O_RDONLY);
> >      if (sysfd =3D=3D -1) {
> >          ret =3D -errno;
> > @@ -1256,9 +1261,9 @@ static int hdev_get_max_segments(int fd, struct s=
tat *st)
> >      }
> >      buf[ret] =3D 0;
> >      /* The file is ended with '\n', pass 'end' to accept that. */
> > -    ret =3D qemu_strtol(buf, &end, 10, &max_segments);
> > +    ret =3D qemu_strtol(buf, &end, 10, &val);
> >      if (ret =3D=3D 0 && end && *end =3D=3D '\n') {
> > -        ret =3D max_segments;
> > +        ret =3D val;
> >      }
> >
> >  out:
> > @@ -1272,6 +1277,15 @@ out:
> >  #endif
> >  }
> >
> > +static int hdev_get_max_segments(int fd, struct stat *st) {
> > +    int ret;
> > +    ret =3D get_sysfs_long_val(fd, st, "max_segments");
> > +    if (ret < 0) {
> > +        return -1;
>
> This hides the actual error number. The if statement can be dropped and
> the function can be simplified to:
>
>   static int hdev_get_max_segments(int fd, struct stat *st) {
>       return get_sysfs_long_val(fd, st, "max_segments");
>   }
>
> Whether you want to keep the tiny helper function or inline
> get_sysfs_long_val(fd, st, "max_segments") into the caller is up to you.
>
> > +    }
> > +    return ret;
> > +}
> > +
> >  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
> >  {
> >      BDRVRawState *s =3D bs->opaque;
> > @@ -1872,6 +1886,7 @@ static int handle_aiocb_zone_report(void *opaque)=
 {
> >
> >  static int handle_aiocb_zone_mgmt(void *opaque) {
> >      RawPosixAIOData *aiocb =3D opaque;
> > +    BlockDriverState *s =3D aiocb->bs;
> >      int fd =3D aiocb->aio_fildes;
> >      int64_t offset =3D aiocb->aio_offset;
> >      int64_t len =3D aiocb->aio_nbytes;
> > @@ -1884,11 +1899,9 @@ static int handle_aiocb_zone_mgmt(void *opaque) =
{
> >      int64_t zone_size_mask;
> >      int ret;
> >
> > -    ret =3D ioctl(fd, BLKGETZONESZ, &zone_size);
> > -    if (ret) {
> > -        return -1;
> > -    }
> > -
> > +    g_autofree struct stat *file =3D g_new(struct stat, 1);
> > +    stat(s->filename, file);
>
> There is no need to allocate struct stat using g_new(). It's a small
> struct that can be on the stack.
>
> Also, fstat(fd, &st) is preferred when the file descriptor is already
> open because it avoids race conditions due to file renaming/path
> traversal.
>
> Here is how this could be written:
>
>   struct stat st;
>   if (fstat(fd, &st) < 0) {
>       return -errno;
>   }

Thanks for the suggestions!

>
> > +    zone_size =3D get_sysfs_long_val(fd, file, "chunk_sectors");
> >      zone_size_mask =3D zone_size - 1;
> >      if (offset & zone_size_mask) {
> >          error_report("offset is not the start of a zone");
> > --
> > 2.35.3
> >

