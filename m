Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9926A58C1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 13:01:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyez-0000pD-I1; Tue, 28 Feb 2023 07:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pWyex-0000kz-LM; Tue, 28 Feb 2023 07:00:43 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pWyev-0002CM-95; Tue, 28 Feb 2023 07:00:43 -0500
Received: by mail-ed1-x530.google.com with SMTP id eg37so38672485edb.12;
 Tue, 28 Feb 2023 04:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjDtXPmmtBFVicGMUdbffmor+qzQsMSpCbsE93cHJe8=;
 b=VOrRR742rJE2RL7pQLw8blXV0VXQHdk4hlc8aG1ig6lhIZFb4JMDFmULjTLOHwzW5m
 7zJOC6V1kwhac8muG4pKIc9pYmCJLFe4A580uwsUudmknLRMLO1ab5YXAdLeAODNrrGl
 Ty1QgNxnRDXqjMbIC2Jmg0jN1x5zbWKHoB8vmZnOaKgq3EWCMA8+OIr1oomJZ8GnrXpL
 XWQ+ePuyD8bPknX8OVFjfew6nPoFP06LRBQUQg8j3aLF8l/w8NjHR0nQws32/ykofaNA
 Hcyd2/YbliBgXxSrAbZK+JVHPEyf9nJxWvgJlxz1Xl6u57MfG2ykCCCOvqNqSR/qNfwC
 pLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjDtXPmmtBFVicGMUdbffmor+qzQsMSpCbsE93cHJe8=;
 b=tGNsuHN0OeEW5VEzQiWRryR7npXbPGMmyByy3t7QLd0podoOrcUPLvvS5Qj+ZGqm42
 OHYh0VTRNI5ubOP0IUlYqesrZQkfR3QS1ofiZYC4umkNHZsnqfgtF37zt7rwHOXESe3q
 WTVcBhXnVXDgQ+0TX8hPoRutsc5ZmBDevxkCZ+J2SIBWA1rFHQCbX6NHnGGWe5oN45Ba
 /lSTdwE2HHTxsphvhwkdTBJx53EiQncwZgTQG8t8GVnINCWszA9hmQYrnFkv1bc9Vm7h
 vL64pUks+NqTBVggl3PTG4i/KaVoDf3BALbzu1jgj7Cl2tYvQxv4NVZ/0c7leTylz4xf
 D7bg==
X-Gm-Message-State: AO0yUKVjRL5OMLFs8Al+USK8ykbfczS+wP8Qsjpi57c/OgUaNg9loXQq
 4XA3GHVtQTvpM0TPuktKNyvlrjqlVoT8tTjtP28=
X-Google-Smtp-Source: AK7set+DTmEaJhHBn6CrRWL1ZZ4N1bXXcZj320ubiii0cQC4t6g8SYcDK07AVCo0K8ZvFooR4ygoFmB4praRtU3Cbzg=
X-Received: by 2002:a50:8e50:0:b0:4ac:20b:96b7 with SMTP id
 16-20020a508e50000000b004ac020b96b7mr1628434edx.8.1677585637988; Tue, 28 Feb
 2023 04:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20230129102850.84731-1-faithilikerun@gmail.com>
 <20230129102850.84731-4-faithilikerun@gmail.com> <Y/z0Xl0qxUpJAXUl@redhat.com>
 <Y/0BDib2ww1XdIov@fedora> <Y/3rYd/yhMhziyHq@redhat.com>
In-Reply-To: <Y/3rYd/yhMhziyHq@redhat.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 28 Feb 2023 20:00:11 +0800
Message-ID: <CAAAx-8J5Rj0yCtWGN7L3qQKK=+cV3K=jBbRP0Vqm=3DWURWe4Q@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, hare@suse.de, damien.lemoal@opensource.wdc.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=faithilikerun@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Kevin Wolf <kwolf@redhat.com> =E4=BA=8E2023=E5=B9=B42=E6=9C=8828=E6=97=A5=
=E5=91=A8=E4=BA=8C 19:54=E5=86=99=E9=81=93=EF=BC=9A
>
> Am 27.02.2023 um 20:14 hat Stefan Hajnoczi geschrieben:
> > On Mon, Feb 27, 2023 at 07:20:14PM +0100, Kevin Wolf wrote:
> > > Am 29.01.2023 um 11:28 hat Sam Li geschrieben:
> > > > Add zoned device option to host_device BlockDriver. It will be pres=
ented only
> > > > for zoned host block devices. By adding zone management operations =
to the
> > > > host_block_device BlockDriver, users can use the new block layer AP=
Is
> > > > including Report Zone and four zone management operations
> > > > (open, close, finish, reset, reset_all).
> > > >
> > > > Qemu-io uses the new APIs to perform zoned storage commands of the =
device:
> > > > zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
> > > > zone_finish(zf).
> > > >
> > > > For example, to test zone_report, use following command:
> > > > $ ./build/qemu-io --image-opts -n driver=3Dhost_device, filename=3D=
/dev/nullb0
> > > > -c "zrp offset nr_zones"
> > > >
> > > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > ---
> > > >  block/block-backend.c             | 147 ++++++++++++++
> > > >  block/file-posix.c                | 323 ++++++++++++++++++++++++++=
++++
> > > >  block/io.c                        |  41 ++++
> > > >  include/block/block-io.h          |   7 +
> > > >  include/block/block_int-common.h  |  21 ++
> > > >  include/block/raw-aio.h           |   6 +-
> > > >  include/sysemu/block-backend-io.h |  18 ++
> > > >  meson.build                       |   4 +
> > > >  qemu-io-cmds.c                    | 149 ++++++++++++++
> > > >  9 files changed, 715 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/block/block-backend.c b/block/block-backend.c
> > > > index ba7bf1d6bc..a4847b9131 100644
> > > > --- a/block/block-backend.c
> > > > +++ b/block/block-backend.c
> > > > @@ -1451,6 +1451,15 @@ typedef struct BlkRwCo {
> > > >      void *iobuf;
> > > >      int ret;
> > > >      BdrvRequestFlags flags;
> > > > +    union {
> > > > +        struct {
> > > > +            unsigned int *nr_zones;
> > > > +            BlockZoneDescriptor *zones;
> > > > +        } zone_report;
> > > > +        struct {
> > > > +            unsigned long op;
> > > > +        } zone_mgmt;
> > > > +    };
> > > >  } BlkRwCo;
> > >
> > > Should we use a different struct for blk_aio_zone_*() so that we don'=
t
> > > need to touch the one for the normal I/O path? My concern is that
> > > increasing the size of the struct (currently 32 bytes) might negative=
ly
> > > impact the performance even of non-zoned devices. Maybe it turns out
> > > that it wasn't really necessary in the end (have we done any
> > > benchmarks?), but I don't think it can hurt anyway.
> > >
> > > With this changed, you can add to the series:
> > > Acked-by: Kevin Wolf <kwolf@redhat.com>
> >
> > There are unused fields in BlkRwCo and BlkAioEmAIOCB, so changing the
> > size of the struct isn't necessary. ioctl/flush/pdiscard already use
> > BlkAioEmAIOCB/BlkRwCo for non-read/write operations, including using th=
e
> > iobuf field for different types, so it wouldn't be weird:
> >
> >   typedef struct BlkRwCo {
> >       BlockBackend *blk;
> >       int64_t offset;
> >       void *iobuf;
> >             ^^^^^ used for preadv/pwritev qiov, ioctl buf, and NULL for
> >                   other request types. zone_report could put the
> >                   BlockZoneDescriptor pointer here. zone_mgmt could put
> >                   op here.
> >       int ret;
> >       BdrvRequestFlags flags;
> >   } BlkRwCo;
> >
> >   typedef struct BlkAioEmAIOCB {
> >       BlockAIOCB common;
> >       BlkRwCo rwco;
> >       int64_t bytes;
> >               ^^^^^ zone_report could put the nr_zones pointer here
> >       bool has_returned;
> >   } BlkAioEmAIOCB;
> >
> > Does that sound okay?
>
> Might not be great for readability, but good enough for me.
>
> Kevin

I see. Will change it accordingly. Thanks!

Sam

