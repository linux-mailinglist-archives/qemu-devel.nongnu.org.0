Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724181B78A9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 16:57:53 +0200 (CEST)
Received: from localhost ([::1]:40652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRzm4-0005OM-3M
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 10:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jRzl7-0004nL-48
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 10:56:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jRzl6-00080R-6J
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 10:56:52 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:45788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1jRzl5-0007ti-OF
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 10:56:51 -0400
Received: by mail-io1-xd41.google.com with SMTP id i19so10604336ioh.12
 for <qemu-devel@nongnu.org>; Fri, 24 Apr 2020 07:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9/SoZXon44YJS4MOXQkeYLY8ScYnUIqZ0iKw+qG59z4=;
 b=S5A2qRPe1sgyLFSIshGBhhC3w5XxgZ4gmqWyNKjppmLwcmWDmodHKfXeSSKU2FgZIM
 R5wk8GMLzUS9wr9IlaHHs6PLQVhFtFdUpRUxz8jtaOtbip+UtdUl6+59Vr2Nj+zP/jHm
 IXd/MDoeFhv+87PT9D++bC0IguFbBKQ14K+Wcdbr33BtjApPl1rnEdmRZtvKBRJQF2yK
 X0y1U8ys6H+je9erbXaOdPX0kC3lE3M5A/9bhi+q0r/JUOYVEwRBC+Hyp1vxBhsy5O4Y
 czO8+ASHjO12/OZ/B7KEJOxHTY/f71Welj5jX0uyAnvNsWVvYn4RRG9DQ69QudGhMC6T
 0ndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9/SoZXon44YJS4MOXQkeYLY8ScYnUIqZ0iKw+qG59z4=;
 b=Hyo8E1Da3JDKnNSjpTgF4zwtq5jLQUCzPTcZntAH56UumRwv092jzSu68g7R2Rjyqq
 9smrB1fP+ka6zR0K/yyWmQmllaE7agAfpAdSUw5E0uoeTkW9yGc1S2QGS4D/QfOpu6Y4
 5w03ldrzylZwpGy+16fzijGRPRnj5/eZW62MVyu70vLVgHRsBy3Zh20bi3zSZlhhOz1o
 aRgRYE7esBwWWEGR1NyHgGnOcRQCGcuoIhz9EmN1DEaZqrvAatDm7wTQbD002xy2DtYI
 BWrcSjuA/SO9NlP+Czx6EFPALggqR3bU1bN8PCoWRnXizI6I6V7Qsh4Y19n+riJNS74g
 rm5g==
X-Gm-Message-State: AGi0PuYNny3BNiu7n/Xh0dUwOqgOfDAsXbo6eKijL/pSPy5Yl1VzWtCt
 vzSiuYB/NivRJzkCncfpASDK3Nd1IpVi3vcCDJg=
X-Google-Smtp-Source: APiQypLj0tF8RXhbr5/FnGmRO3hVrDmaEeowhNrJol6JADTNa+BF7Bh+gIjXlfKgChefxJpZeurPv08xhsU1hIbUuBQ=
X-Received: by 2002:a6b:cd4a:: with SMTP id d71mr1706154iog.5.1587740210109;
 Fri, 24 Apr 2020 07:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200422181649.12258.37077.stgit@localhost.localdomain>
 <20200422182113.12258.56556.stgit@localhost.localdomain>
 <69bf1579-78db-2a2c-6ac0-169daaa50153@redhat.com>
In-Reply-To: <69bf1579-78db-2a2c-6ac0-169daaa50153@redhat.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Fri, 24 Apr 2020 07:56:38 -0700
Message-ID: <CAKgT0UeZLJfZtLyDo8DcQF2KmwoNxPYnkSrx6C-j=LxU9t0ovw@mail.gmail.com>
Subject: Re: [PATCH v21 QEMU 3/5] virtio-balloon: Replace free page hinting
 references to 'report' with 'hint'
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alexander.duyck@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d41
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 24, 2020 at 4:23 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 22.04.20 20:21, Alexander Duyck wrote:
> > From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> >
> > In an upcoming patch a feature named Free Page Reporting is about to be
> > added. In order to avoid any confusion we should drop the use of the word
> > 'report' when referring to Free Page Hinting. So what this patch does is go
> > through and replace all instances of 'report' with 'hint" when we are
> > referring to free page hinting.
> >
> > Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > ---
> >  hw/virtio/virtio-balloon.c         |   74 ++++++++++++++++++------------------
> >  include/hw/virtio/virtio-balloon.h |   20 +++++-----
> >  2 files changed, 47 insertions(+), 47 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > index a4729f7fc930..a1d6fb52c876 100644
> > --- a/hw/virtio/virtio-balloon.c
> > +++ b/hw/virtio/virtio-balloon.c
> > @@ -466,21 +466,21 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
> >              ret = false;
> >              goto out;
> >          }
> > -        if (id == dev->free_page_report_cmd_id) {
> > -            dev->free_page_report_status = FREE_PAGE_REPORT_S_START;
> > +        if (id == dev->free_page_hint_cmd_id) {
> > +            dev->free_page_hint_status = FREE_PAGE_HINT_S_START;
> >          } else {
> >              /*
> >               * Stop the optimization only when it has started. This
> >               * avoids a stale stop sign for the previous command.
> >               */
> > -            if (dev->free_page_report_status == FREE_PAGE_REPORT_S_START) {
> > -                dev->free_page_report_status = FREE_PAGE_REPORT_S_STOP;
> > +            if (dev->free_page_hint_status == FREE_PAGE_HINT_S_START) {
> > +                dev->free_page_hint_status = FREE_PAGE_HINT_S_STOP;
> >              }
> >          }
> >      }
> >
> >      if (elem->in_num) {
> > -        if (dev->free_page_report_status == FREE_PAGE_REPORT_S_START) {
> > +        if (dev->free_page_hint_status == FREE_PAGE_HINT_S_START) {
> >              qemu_guest_free_page_hint(elem->in_sg[0].iov_base,
> >                                        elem->in_sg[0].iov_len);
> >          }
> > @@ -506,11 +506,11 @@ static void virtio_ballloon_get_free_page_hints(void *opaque)
> >          qemu_mutex_unlock(&dev->free_page_lock);
> >          virtio_notify(vdev, vq);
> >        /*
> > -       * Start to poll the vq once the reporting started. Otherwise, continue
> > +       * Start to poll the vq once the hinting started. Otherwise, continue
> >         * only when there are entries on the vq, which need to be given back.
> >         */
> >      } while (continue_to_get_hints ||
> > -             dev->free_page_report_status == FREE_PAGE_REPORT_S_START);
> > +             dev->free_page_hint_status == FREE_PAGE_HINT_S_START);
> >      virtio_queue_set_notification(vq, 1);
> >  }
> >
> > @@ -531,14 +531,14 @@ static void virtio_balloon_free_page_start(VirtIOBalloon *s)
> >          return;
> >      }
> >
> > -    if (s->free_page_report_cmd_id == UINT_MAX) {
> > -        s->free_page_report_cmd_id =
> > -                       VIRTIO_BALLOON_FREE_PAGE_REPORT_CMD_ID_MIN;
> > +    if (s->free_page_hint_cmd_id == UINT_MAX) {
> > +        s->free_page_hint_cmd_id =
> > +                       VIRTIO_BALLOON_FREE_PAGE_HINT_CMD_ID_MIN;
> >      } else {
> > -        s->free_page_report_cmd_id++;
> > +        s->free_page_hint_cmd_id++;
> >      }
> >
> > -    s->free_page_report_status = FREE_PAGE_REPORT_S_REQUESTED;
> > +    s->free_page_hint_status = FREE_PAGE_HINT_S_REQUESTED;
> >      virtio_notify_config(vdev);
> >  }
> >
> > @@ -546,18 +546,18 @@ static void virtio_balloon_free_page_stop(VirtIOBalloon *s)
> >  {
> >      VirtIODevice *vdev = VIRTIO_DEVICE(s);
> >
> > -    if (s->free_page_report_status != FREE_PAGE_REPORT_S_STOP) {
> > +    if (s->free_page_hint_status != FREE_PAGE_HINT_S_STOP) {
> >          /*
> >           * The lock also guarantees us that the
> >           * virtio_ballloon_get_free_page_hints exits after the
> > -         * free_page_report_status is set to S_STOP.
> > +         * free_page_hint_status is set to S_STOP.
> >           */
> >          qemu_mutex_lock(&s->free_page_lock);
> >          /*
> >           * The guest hasn't done the reporting, so host sends a notification
> >           * to the guest to actively stop the reporting.
> >           */
> > -        s->free_page_report_status = FREE_PAGE_REPORT_S_STOP;
> > +        s->free_page_hint_status = FREE_PAGE_HINT_S_STOP;
> >          qemu_mutex_unlock(&s->free_page_lock);
> >          virtio_notify_config(vdev);
> >      }
> > @@ -567,15 +567,15 @@ static void virtio_balloon_free_page_done(VirtIOBalloon *s)
> >  {
> >      VirtIODevice *vdev = VIRTIO_DEVICE(s);
> >
> > -    s->free_page_report_status = FREE_PAGE_REPORT_S_DONE;
> > +    s->free_page_hint_status = FREE_PAGE_HINT_S_DONE;
> >      virtio_notify_config(vdev);
> >  }
> >
> >  static int
> > -virtio_balloon_free_page_report_notify(NotifierWithReturn *n, void *data)
> > +virtio_balloon_free_page_hint_notify(NotifierWithReturn *n, void *data)
> >  {
> >      VirtIOBalloon *dev = container_of(n, VirtIOBalloon,
> > -                                      free_page_report_notify);
> > +                                      free_page_hint_notify);
> >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> >      PrecopyNotifyData *pnd = data;
> >
> > @@ -624,7 +624,7 @@ static size_t virtio_balloon_config_size(VirtIOBalloon *s)
> >      if (virtio_has_feature(features, VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
> >          return offsetof(struct virtio_balloon_config, poison_val);
> >      }
> > -    return offsetof(struct virtio_balloon_config, free_page_report_cmd_id);
> > +    return offsetof(struct virtio_balloon_config, free_page_hint_cmd_id);
> >  }
> >
> >  static void virtio_balloon_get_config(VirtIODevice *vdev, uint8_t *config_data)
> > @@ -635,14 +635,14 @@ static void virtio_balloon_get_config(VirtIODevice *vdev, uint8_t *config_data)
> >      config.num_pages = cpu_to_le32(dev->num_pages);
> >      config.actual = cpu_to_le32(dev->actual);
> >
> > -    if (dev->free_page_report_status == FREE_PAGE_REPORT_S_REQUESTED) {
> > -        config.free_page_report_cmd_id =
> > -                       cpu_to_le32(dev->free_page_report_cmd_id);
> > -    } else if (dev->free_page_report_status == FREE_PAGE_REPORT_S_STOP) {
> > -        config.free_page_report_cmd_id =
> > +    if (dev->free_page_hint_status == FREE_PAGE_HINT_S_REQUESTED) {
> > +        config.free_page_hint_cmd_id =
> > +                       cpu_to_le32(dev->free_page_hint_cmd_id);
> > +    } else if (dev->free_page_hint_status == FREE_PAGE_HINT_S_STOP) {
> > +        config.free_page_hint_cmd_id =
> >                         cpu_to_le32(VIRTIO_BALLOON_CMD_ID_STOP);
> > -    } else if (dev->free_page_report_status == FREE_PAGE_REPORT_S_DONE) {
> > -        config.free_page_report_cmd_id =
> > +    } else if (dev->free_page_hint_status == FREE_PAGE_HINT_S_DONE) {
> > +        config.free_page_hint_cmd_id =
> >                         cpu_to_le32(VIRTIO_BALLOON_CMD_ID_DONE);
> >      }
> >
> > @@ -743,14 +743,14 @@ static int virtio_balloon_post_load_device(void *opaque, int version_id)
> >      return 0;
> >  }
> >
> > -static const VMStateDescription vmstate_virtio_balloon_free_page_report = {
> > +static const VMStateDescription vmstate_virtio_balloon_free_page_hint = {
> >      .name = "virtio-balloon-device/free-page-report",
> >      .version_id = 1,
> >      .minimum_version_id = 1,
> >      .needed = virtio_balloon_free_page_support,
> >      .fields = (VMStateField[]) {
> > -        VMSTATE_UINT32(free_page_report_cmd_id, VirtIOBalloon),
> > -        VMSTATE_UINT32(free_page_report_status, VirtIOBalloon),
> > +        VMSTATE_UINT32(free_page_hint_cmd_id, VirtIOBalloon),
> > +        VMSTATE_UINT32(free_page_hint_status, VirtIOBalloon),
> >          VMSTATE_END_OF_LIST()
> >      }
> >  };
> > @@ -766,7 +766,7 @@ static const VMStateDescription vmstate_virtio_balloon_device = {
> >          VMSTATE_END_OF_LIST()
> >      },
> >      .subsections = (const VMStateDescription * []) {
> > -        &vmstate_virtio_balloon_free_page_report,
> > +        &vmstate_virtio_balloon_free_page_hint,
> >          NULL
> >      }
> >  };
> > @@ -797,12 +797,12 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
> >                             VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
> >          s->free_page_vq = virtio_add_queue(vdev, VIRTQUEUE_MAX_SIZE,
> >                                             virtio_balloon_handle_free_page_vq);
> > -        s->free_page_report_status = FREE_PAGE_REPORT_S_STOP;
> > -        s->free_page_report_cmd_id =
> > -                           VIRTIO_BALLOON_FREE_PAGE_REPORT_CMD_ID_MIN;
> > -        s->free_page_report_notify.notify =
> > -                                       virtio_balloon_free_page_report_notify;
> > -        precopy_add_notifier(&s->free_page_report_notify);
> > +        s->free_page_hint_status = FREE_PAGE_HINT_S_STOP;
> > +        s->free_page_hint_cmd_id =
> > +                           VIRTIO_BALLOON_FREE_PAGE_HINT_CMD_ID_MIN;
> > +        s->free_page_hint_notify.notify =
> > +                                       virtio_balloon_free_page_hint_notify;
> > +        precopy_add_notifier(&s->free_page_hint_notify);
> >          if (s->iothread) {
> >              object_ref(OBJECT(s->iothread));
> >              s->free_page_bh = aio_bh_new(iothread_get_aio_context(s->iothread),
> > @@ -827,7 +827,7 @@ static void virtio_balloon_device_unrealize(DeviceState *dev, Error **errp)
> >      if (virtio_balloon_free_page_support(s)) {
> >          qemu_bh_delete(s->free_page_bh);
> >          virtio_balloon_free_page_stop(s);
> > -        precopy_remove_notifier(&s->free_page_report_notify);
> > +        precopy_remove_notifier(&s->free_page_hint_notify);
> >      }
> >      balloon_stats_destroy_timer(s);
> >      qemu_remove_balloon_handler(s);
> > diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
> > index d1c968d2376e..108cff97e71a 100644
> > --- a/include/hw/virtio/virtio-balloon.h
> > +++ b/include/hw/virtio/virtio-balloon.h
> > @@ -23,7 +23,7 @@
> >  #define VIRTIO_BALLOON(obj) \
> >          OBJECT_CHECK(VirtIOBalloon, (obj), TYPE_VIRTIO_BALLOON)
> >
> > -#define VIRTIO_BALLOON_FREE_PAGE_REPORT_CMD_ID_MIN 0x80000000
> > +#define VIRTIO_BALLOON_FREE_PAGE_HINT_CMD_ID_MIN 0x80000000
> >
> >  typedef struct virtio_balloon_stat VirtIOBalloonStat;
> >
> > @@ -33,20 +33,20 @@ typedef struct virtio_balloon_stat_modern {
> >         uint64_t val;
> >  } VirtIOBalloonStatModern;
> >
> > -enum virtio_balloon_free_page_report_status {
> > -    FREE_PAGE_REPORT_S_STOP = 0,
> > -    FREE_PAGE_REPORT_S_REQUESTED = 1,
> > -    FREE_PAGE_REPORT_S_START = 2,
> > -    FREE_PAGE_REPORT_S_DONE = 3,
> > +enum virtio_balloon_free_page_hint_status {
> > +    FREE_PAGE_HINT_S_STOP = 0,
> > +    FREE_PAGE_HINT_S_REQUESTED = 1,
> > +    FREE_PAGE_HINT_S_START = 2,
> > +    FREE_PAGE_HINT_S_DONE = 3,
> >  };
> >
> >  typedef struct VirtIOBalloon {
> >      VirtIODevice parent_obj;
> >      VirtQueue *ivq, *dvq, *svq, *free_page_vq;
> > -    uint32_t free_page_report_status;
> > +    uint32_t free_page_hint_status;
> >      uint32_t num_pages;
> >      uint32_t actual;
> > -    uint32_t free_page_report_cmd_id;
> > +    uint32_t free_page_hint_cmd_id;
> >      uint64_t stats[VIRTIO_BALLOON_S_NR];
> >      VirtQueueElement *stats_vq_elem;
> >      size_t stats_vq_offset;
> > @@ -55,7 +55,7 @@ typedef struct VirtIOBalloon {
> >      QEMUBH *free_page_bh;
> >      /*
> >       * Lock to synchronize threads to access the free page reporting related
> > -     * fields (e.g. free_page_report_status).
> > +     * fields (e.g. free_page_hint_status).
> >       */
> >      QemuMutex free_page_lock;
> >      QemuCond  free_page_cond;
> > @@ -64,7 +64,7 @@ typedef struct VirtIOBalloon {
> >       * stopped.
> >       */
> >      bool block_iothread;
> > -    NotifierWithReturn free_page_report_notify;
> > +    NotifierWithReturn free_page_hint_notify;
> >      int64_t stats_last_update;
> >      int64_t stats_poll_interval;
> >      uint32_t host_features;
> >
>
> Maybe split out the change to "free_page_report_cmd_id" in the uapi
> (meaning: move that to a separate patch). So you can move forward with
> most of this series (moving patch #1 and the free_page_report_cmd_id
> change to the very last of this series) without depending on that change
> to go upstream.

Okay. I can split it if that is needed. Any specific reason for
splitting it I should cite in the patch? From what I can tell Michael
has already accepted the renamed and pushed it to Linus.

Thanks.

- Alex

