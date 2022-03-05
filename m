Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180714CE68B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 20:19:48 +0100 (CET)
Received: from localhost ([::1]:44002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQZwQ-0002E6-L2
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 14:19:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nQZus-00008G-2Y
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 14:18:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nQZuo-0002YC-G1
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 14:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646507885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvJINJXDZWAva/NNdH22waMGKZbOeUPJdZQvwb0flVM=;
 b=a2UXsIc1BVUbblniBH7RpE+j4hUOFcQbEB5VML/rzgr7dpnevIxVQtImlL3wiY4ZBVIPyj
 B2sxGZPwkkCYE7L87z2yPv2sSoLXVpVp2TA5tU5tz2gB9nc/0CnxN0p9JsqQKWr19g2tnw
 1+QwdpPMz3ikmrbDXR///INuTtRoqFw=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-U3XzrYC4MMG41e2_ahZ-DQ-1; Sat, 05 Mar 2022 14:18:04 -0500
X-MC-Unique: U3XzrYC4MMG41e2_ahZ-DQ-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2dc44b6dc9dso66684257b3.23
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 11:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rvJINJXDZWAva/NNdH22waMGKZbOeUPJdZQvwb0flVM=;
 b=YSXd0y69W1NgLQLgd1gWWDj5FO2VmLOAtFazT5SWhoRxqlANUzRpPhhsEgNjnZRm0Z
 odQUEBvSIHs3iuCLWnqByJ+3AN9NqVRa1wxdUZ3ljJUrSezZRBTVp+z3pDR8Rsv3r42S
 ceh37UJIxdvbY3EfdOB4ChU2OUfJIG9tx1rl++eDy0veo5sF8nOT+E5Dayx/CgYR8G37
 xr2VOoiWEabCISp2/4Rv4Gytia0hHtsJLLPHVkUURwRMgfiG48Hb5G4F7mZC/Dz4aFjJ
 8gAQjNsbREmkY3R8nps1vylSryGp20BSI6qZFr4QUXOqEc9q9CYyy52KJPEIRgEvCyLI
 kELA==
X-Gm-Message-State: AOAM530fG/rQu4lS4abVV+Wx4V8JAUPEaGBw5e0DPqpECHxmslv1n2IM
 eQDpSjCROBS5SETwaY03C5F+za7tLXWwGgvQ7Ht+x6qPNKUzWbZC8khgw6ySSrrCt6thgLhs46g
 CtKPJxhlWNsDgeA79Zn3rTbRTzbolH60=
X-Received: by 2002:a25:6612:0:b0:628:ab58:578b with SMTP id
 a18-20020a256612000000b00628ab58578bmr3174114ybc.343.1646507882835; 
 Sat, 05 Mar 2022 11:18:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxj6DBF8+LQ15uJoxnKVJjxDauSNzTbrcyYjwkVtvEbBMWv0YmxLn1QSDF49UpVmXC41Be2iOPsLa4AmyBmef4=
X-Received: by 2002:a25:6612:0:b0:628:ab58:578b with SMTP id
 a18-20020a256612000000b00628ab58578bmr3174096ybc.343.1646507882462; Sat, 05
 Mar 2022 11:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20220304211618.3715999-1-marcandre.lureau@redhat.com>
 <20220304211618.3715999-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220304211618.3715999-5-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sat, 5 Mar 2022 23:17:51 +0400
Message-ID: <CAMxuvaz_uCxtL+0e-=AFZsuomNAz6H7Y+6RbdkSzfbxcMSLGrg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] Replace qemu_gettimeofday() with g_get_real_time()
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Marek Vasut <marex@denx.de>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 5, 2022 at 1:18 AM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> GLib g_get_real_time() is an alternative to gettimeofday() which allows
> to simplify our code.
>
> For semihosting, a few bits are lost on POSIX host, but this shouldn't
> be a big concern.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  blockdev.c                 |  8 ++++----
>  hw/rtc/m41t80.c            |  6 +++---
>  hw/virtio/virtio-balloon.c |  9 +--------
>  qapi/qmp-event.c           | 12 +++++-------
>  qemu-img.c                 |  8 ++++----
>  target/m68k/m68k-semi.c    | 22 ++++++++++------------
>  target/nios2/nios2-semi.c  | 23 ++++++++++-------------
>  7 files changed, 37 insertions(+), 51 deletions(-)
>
> diff --git a/blockdev.c b/blockdev.c
> index 42e098b458b1..4b07dbfbdefc 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -1235,7 +1235,7 @@ static void internal_snapshot_prepare(BlkActionStat=
e *common,
>      BlockDriverState *bs;
>      QEMUSnapshotInfo old_sn, *sn;
>      bool ret;
> -    qemu_timeval tv;
> +    int64_t rt;
>      BlockdevSnapshotInternal *internal;
>      InternalSnapshotState *state;
>      AioContext *aio_context;
> @@ -1305,9 +1305,9 @@ static void internal_snapshot_prepare(BlkActionStat=
e *common,
>      /* 3. take the snapshot */
>      sn =3D &state->sn;
>      pstrcpy(sn->name, sizeof(sn->name), name);
> -    qemu_gettimeofday(&tv);
> -    sn->date_sec =3D tv.tv_sec;
> -    sn->date_nsec =3D tv.tv_usec * 1000;
> +    rt =3D g_get_real_time();
> +    sn->date_sec =3D rt / G_USEC_PER_SEC;
> +    sn->date_nsec =3D (rt % G_USEC_PER_SEC) * 1000;
>      sn->vm_clock_nsec =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      if (replay_mode !=3D REPLAY_MODE_NONE) {
>          sn->icount =3D replay_get_current_icount();
> diff --git a/hw/rtc/m41t80.c b/hw/rtc/m41t80.c
> index a00971a67e1c..e045c864bb44 100644
> --- a/hw/rtc/m41t80.c
> +++ b/hw/rtc/m41t80.c
> @@ -47,7 +47,7 @@ static uint8_t m41t80_recv(I2CSlave *i2c)
>  {
>      M41t80State *s =3D M41T80(i2c);
>      struct tm now;
> -    qemu_timeval tv;
> +    int64_t rt;
>
>      if (s->addr < 0) {
>          s->addr =3D 0;
> @@ -57,8 +57,8 @@ static uint8_t m41t80_recv(I2CSlave *i2c)
>      }
>      switch (s->addr++) {
>      case 0:
> -        qemu_gettimeofday(&tv);
> -        return to_bcd(tv.tv_usec / 10000);
> +        rt =3D g_get_real_time();
> +        return to_bcd((rt % G_USEC_PER_SEC) / 10000);
>      case 1:
>          return to_bcd(now.tm_sec);
>      case 2:
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index e6c1b0aa46fe..b1bada84cecc 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -452,7 +452,6 @@ static void virtio_balloon_receive_stats(VirtIODevice=
 *vdev, VirtQueue *vq)
>      VirtQueueElement *elem;
>      VirtIOBalloonStat stat;
>      size_t offset =3D 0;
> -    qemu_timeval tv;
>
>      elem =3D virtqueue_pop(vq, sizeof(VirtQueueElement));
>      if (!elem) {
> @@ -484,13 +483,7 @@ static void virtio_balloon_receive_stats(VirtIODevic=
e *vdev, VirtQueue *vq)
>              s->stats[tag] =3D val;
>      }
>      s->stats_vq_offset =3D offset;
> -
> -    if (qemu_gettimeofday(&tv) < 0) {
> -        warn_report("%s: failed to get time of day", __func__);
> -        goto out;
> -    }
> -
> -    s->stats_last_update =3D tv.tv_sec;
> +    s->stats_last_update =3D g_get_real_time() / G_USEC_PER_SEC;
>
>  out:
>      if (balloon_stats_enabled(s)) {
> diff --git a/qapi/qmp-event.c b/qapi/qmp-event.c
> index 19d3cd003833..025716b3ec37 100644
> --- a/qapi/qmp-event.c
> +++ b/qapi/qmp-event.c
> @@ -20,15 +20,13 @@
>
>  static void timestamp_put(QDict *qdict)
>  {
> -    int err;
>      QDict *ts;
> -    qemu_timeval tv;
> +    int64_t rt =3D g_get_real_time();
>
> -    err =3D qemu_gettimeofday(&tv);
> -    /* Put -1 to indicate failure of getting host time */
> -    ts =3D qdict_from_jsonf_nofail("{ 'seconds': %lld, 'microseconds': %=
lld }",
> -                                 err < 0 ? -1LL : (long long)tv.tv_sec,
> -                                 err < 0 ? -1LL : (long long)tv.tv_usec)=
;
> +    ts =3D qdict_from_jsonf_nofail("{ 'seconds': %" G_GINT64_FORMAT
> +                                 ", 'microseconds': %" G_GINT64_FORMAT "=
}",
> +                                 rt / G_USEC_PER_SEC,
> +                                 rt % G_USEC_PER_SEC);

NACK this, fixed in v3

>      qdict_put(qdict, "timestamp", ts);
>  }
>
> diff --git a/qemu-img.c b/qemu-img.c
> index 6fe2466032f9..e26773909684 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -3304,11 +3304,11 @@ static int img_snapshot(int argc, char **argv)
>      char *filename, *snapshot_name =3D NULL;
>      int c, ret =3D 0, bdrv_oflags;
>      int action =3D 0;
> -    qemu_timeval tv;
>      bool quiet =3D false;
>      Error *err =3D NULL;
>      bool image_opts =3D false;
>      bool force_share =3D false;
> +    int64_t rt;
>
>      bdrv_oflags =3D BDRV_O_RDWR;
>      /* Parse commandline parameters */
> @@ -3405,9 +3405,9 @@ static int img_snapshot(int argc, char **argv)
>          memset(&sn, 0, sizeof(sn));
>          pstrcpy(sn.name, sizeof(sn.name), snapshot_name);
>
> -        qemu_gettimeofday(&tv);
> -        sn.date_sec =3D tv.tv_sec;
> -        sn.date_nsec =3D tv.tv_usec * 1000;
> +        rt =3D g_get_real_time();
> +        sn.date_sec =3D rt / G_USEC_PER_SEC;
> +        sn.date_nsec =3D (rt % G_USEC_PER_SEC) * 1000;
>
>          ret =3D bdrv_snapshot_create(bs, &sn);
>          if (ret) {
> diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
> index c5c164e096c8..37343d47e247 100644
> --- a/target/m68k/m68k-semi.c
> +++ b/target/m68k/m68k-semi.c
> @@ -378,19 +378,17 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
>                             arg0, arg1);
>              return;
>          } else {
> -            qemu_timeval tv;
>              struct gdb_timeval *p;
> -            result =3D qemu_gettimeofday(&tv);
> -            if (result =3D=3D 0) {
> -                if (!(p =3D lock_user(VERIFY_WRITE,
> -                                    arg0, sizeof(struct gdb_timeval), 0)=
)) {
> -                    /* FIXME - check error code? */
> -                    result =3D -1;
> -                } else {
> -                    p->tv_sec =3D cpu_to_be32(tv.tv_sec);
> -                    p->tv_usec =3D cpu_to_be64(tv.tv_usec);
> -                    unlock_user(p, arg0, sizeof(struct gdb_timeval));
> -                }
> +            int64_t rt =3D g_get_real_time();
> +            p =3D lock_user(VERIFY_WRITE, arg0, sizeof(struct gdb_timeva=
l), 0);
> +            if (!p) {
> +                /* FIXME - check error code? */
> +                result =3D -1;
> +            } else {
> +                result =3D 0;
> +                p->tv_sec =3D cpu_to_be32(rt / G_USEC_PER_SEC);
> +                p->tv_usec =3D cpu_to_be64(rt % G_USEC_PER_SEC);
> +                unlock_user(p, arg0, sizeof(struct gdb_timeval));
>              }
>          }
>          break;
> diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
> index 5a7ad0c7108d..3decf6924c8f 100644
> --- a/target/nios2/nios2-semi.c
> +++ b/target/nios2/nios2-semi.c
> @@ -400,20 +400,17 @@ void do_nios2_semihosting(CPUNios2State *env)
>                             arg0, 0);
>              return;
>          } else {
> -            qemu_timeval tv;
>              struct gdb_timeval *p;
> -            result =3D qemu_gettimeofday(&tv);
> -            if (result =3D=3D 0) {
> -                p =3D lock_user(VERIFY_WRITE, arg0, sizeof(struct gdb_ti=
meval),
> -                              0);
> -                if (!p) {
> -                    result =3D -1;
> -                    errno =3D EFAULT;
> -                } else {
> -                    p->tv_sec =3D cpu_to_be32(tv.tv_sec);
> -                    p->tv_usec =3D cpu_to_be64(tv.tv_usec);
> -                    unlock_user(p, arg0, sizeof(struct gdb_timeval));
> -                }
> +            int64_t rt =3D g_get_real_time();
> +            p =3D lock_user(VERIFY_WRITE, arg0, sizeof(struct gdb_timeva=
l), 0);
> +            if (!p) {
> +                result =3D -1;
> +                errno =3D EFAULT;
> +            } else {
> +                result =3D 0;
> +                p->tv_sec =3D cpu_to_be32(rt / G_USEC_PER_SEC);
> +                p->tv_usec =3D cpu_to_be64(rt % G_USEC_PER_SEC);
> +                unlock_user(p, arg0, sizeof(struct gdb_timeval));
>              }
>          }
>          break;
> --
> 2.35.1.273.ge6ebfd0e8cbb
>


