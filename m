Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A165F6FC51F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 13:37:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwLdh-0002DP-VA; Tue, 09 May 2023 07:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pwLdf-0002Cl-8e
 for qemu-devel@nongnu.org; Tue, 09 May 2023 07:36:15 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pwLdd-00017I-9x
 for qemu-devel@nongnu.org; Tue, 09 May 2023 07:36:15 -0400
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-b99f0a0052fso7617985276.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 04:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683632172; x=1686224172;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GMW84uHKpDg0uFDFMpaX4KTsOAKUPX1cJvjk2MMLmqY=;
 b=MHhjvNMRv+6mpL9lP7Hm9Q4Fn3Y172OQkdqwxDNcB8lTMCARqMJncRaBjFVt+CiUAp
 TBGF++3u5GaxL+smllkgLuY6lGegwhLUiGXg8rhtYoVsuGJzCnGf9bYFHp8+GKQb/9uk
 SGkVx9EWkOsNC0iFvuV1+Er2PWePAjJ6pewd164KUTZ2188xhEjoprxPXQAOHFN78W3U
 PXDzJHND5NMxZOeeUjhfuxfl8PxiXNpjIWxrptCn8SnSiVfRYBlwH2MQH01LstX9xFyW
 9JTGPpZQt2XMqlW7Hkng6SRqaReYh2Zy3p04YNTYEFeC616iG5l4kIWExZEcDOvwO+ON
 RniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683632172; x=1686224172;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMW84uHKpDg0uFDFMpaX4KTsOAKUPX1cJvjk2MMLmqY=;
 b=DaVjiouljZIv2nqCwzSHxvQH+oDtvy4msJOiVHJkauLfA8fHN6GoUjXpxJQW3o0Wa5
 u2twFl9zk6n77D9kruTMYI+Rt2ky/xIoeh+ptjL+0Jf80diRK+m/mRRnBT0arsAPpfT+
 ufCK6kEeXQJjsmEPS0Erz1fzo8GWRQHDhPUsShMkc6mE550Z9LwKC7R53UN2VdVfrSce
 C86CpVv9hoF5CdiRgfZlMRrFJXCdY6bLAAdNvT3p96NiXqn0cEKq0yPSmJ9VRbr8+/It
 1SiPNbpryPYy8URfL23qA5/Z0cDUNSHsRHHB5DfqE1O8bvElQ594DpRqZTADs94b8XIx
 yRoA==
X-Gm-Message-State: AC+VfDz0hPStblKUSOeFrkQZLhtd940MBeCbsk5NtKT7kB+dEqWTEZQQ
 PzfafSPquWYupEEvkg3PqdxMXwBe8U6U4oMWpMk=
X-Google-Smtp-Source: ACHHUZ652ZrinCTG+iDg7IaahP6uxbr3U1C1HbHIyGoh3e2XoDTfjBU2FXEAStCUw7HAttdvqmFIZ09Kv4RLOP9Wi30=
X-Received: by 2002:a25:c1c3:0:b0:b9a:8324:a492 with SMTP id
 r186-20020a25c1c3000000b00b9a8324a492mr11747474ybf.41.1683632171940; Tue, 09
 May 2023 04:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230509102652.705859-1-nsoffer@redhat.com>
In-Reply-To: <20230509102652.705859-1-nsoffer@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 9 May 2023 07:35:59 -0400
Message-ID: <CAJSP0QUD-T80PEuMS8wJ-OVtsWGVSLqcEsz6i8dvYr-AeSnxDA@mail.gmail.com>
Subject: Re: [PATCH] libvhost-user: Fix update of signalled_used
To: Nir Soffer <nsoffer@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 9 May 2023 at 06:28, Nir Soffer <nsoffer@redhat.com> wrote:
>
> When we check if a driver needs a signal, we compare:
>
> - used_event: written by the driver each time it consumes an item

In practice drivers tend to update it as you described, but devices
cannot make that assumption.

used_event is simply the index at which the driver wishes to receive
the next used buffer notification. It does not need to be updated each
time a used buffer is consumed.

> - new: current idx written to the used ring, updated by us
> - old: last idx we signaled about
>
> We call vring_need_event() which does:
>
>     return (__u16)(new_idx - event_idx - 1) < (__u16)(new_idx - old);
>
> Previously we updated signalled_used on every check, so old was always
> new - 1.

libvhost-user leaves it up to the application to decide when to call
vu_queue_notify(). It might be called once after pushing multiple used
buffers. We cannot assume it is always new - 1.

> Because used_event cannot bigger than new_idx, this check
> becomes (ignoring wrapping):
>
>     return new_idx == event_idx + 1;

This is not true. used_event is an arbitrary index value that can be
larger than new_idx. For example, if the driver wants to be notified
after 5 completions, it will set it to a future value that is greater
than new_idx.

> Since the driver consumes items at the same time the device produces
> items, it is very likely (and seen in logs) that the driver used_event
> is too far behind new_idx and we don't signal the driver.

This is expected and must be handled by the driver. Here is the Rust
virtio-driver code:

impl<'a, T: Clone> VirtqueueRing<'a, T> {
...
    fn pop(&mut self) -> Option<T> {
        if self.has_next() {
            let result = unsafe { (*self.ptr).ring[self.ring_idx()].clone() };
            self.next_idx += Wrapping(1);
            Some(result)
        } else {
            None
        }
    }
...
}

impl<'a, 'queue, R: Copy> Iterator for VirtqueueIter<'a, 'queue, R> {
    type Item = VirtqueueCompletion<R>;

    fn next(&mut self) -> Option<Self::Item> {
        if let Some(next) = self.virtqueue.used.pop() {
            let idx = (next.idx.to_native() %
(self.virtqueue.queue_size as u32)) as u16;
            self.virtqueue.free_desc(idx);
            if self.virtqueue.event_idx_enabled &&
self.virtqueue.used_notif_enabled {
                self.virtqueue.update_used_event();
            }

            let req = unsafe { *self.virtqueue.req.offset(idx as isize) };
            Some(VirtqueueCompletion { idx, req })
        } else {
            if self.virtqueue.event_idx_enabled &&
!self.virtqueue.used_notif_enabled {
                self.virtqueue.update_used_event();
            }
            None
        }
    }

When the caller uses VirtqueueIter to iterate over completed requests,
the race is automatically handled:

1. If the device sees the updated used_event value, then a Used Buffer
   Notification is sent. No notification is missed.

2. If the device sees the outdated used_event value, then no Used Buffer
   Notification is sent. Keep in mind that the device placed the Used
   Buffer into the Used Ring *before* checking used_event. The driver
   updates used_event before calling VirtqueueIter.next() again. Therefore,
   VirtqueueIter.next() is guaranteed to see the Used Buffer although no
   Used Buffer Notification was sent for it.

There is no scenario where VirtqueueIter does not see the new Used
Buffer and there is no Used Buffer Notification.

However, this relies on the driver always fully iterating - if it stops early
then notifications might be dropped.

> With libblkio virtio-blk-vhost-user driver, if the driver does not get a
> signal, the libblkio client can hang polling the completion fd. This
> is very easy to reproduce on some machines and impossible to reproduce
> on others.
>
> Fixed by updating signalled_used only when we signal the driver.
> Tested using blkio-bench and libblkio client application that used to
> hang randomly without this change.

QEMU works fine with the same code as libvhost-user though:

static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
{
    uint16_t old, new;
    bool v;
    /* We need to expose used array entries before checking used event. */
    smp_mb();
    /* Always notify when queue is empty (when feature acknowledge) */
    if (virtio_vdev_has_feature(vdev, VIRTIO_F_NOTIFY_ON_EMPTY) &&
        !vq->inuse && virtio_queue_empty(vq)) {
        return true;
    }

    if (!virtio_vdev_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX)) {
        return !(vring_avail_flags(vq) & VRING_AVAIL_F_NO_INTERRUPT);
    }

    v = vq->signalled_used_valid;
    vq->signalled_used_valid = true;
    old = vq->signalled_used;
    new = vq->signalled_used = vq->used_idx;
    return !v || vring_need_event(vring_get_used_event(vq), new, old);
}

I suspect there is a bug in the libblkio or virtio-driver code.
Unfortunately I've looked at the code a few times and couldn't spot
the issue :(.

>
> Buglink: https://gitlab.com/libblkio/libblkio/-/issues/68
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 8fb61e2df2..5f26d2d378 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -2382,12 +2382,11 @@ vu_queue_empty(VuDev *dev, VuVirtq *vq)
>  }
>
>  static bool
>  vring_notify(VuDev *dev, VuVirtq *vq)
>  {
> -    uint16_t old, new;
> -    bool v;
> +    uint16_t old, new, used;
>
>      /* We need to expose used array entries before checking used event. */
>      smp_mb();
>
>      /* Always notify when queue is empty (when feature acknowledge) */
> @@ -2398,15 +2397,27 @@ vring_notify(VuDev *dev, VuVirtq *vq)
>
>      if (!vu_has_feature(dev, VIRTIO_RING_F_EVENT_IDX)) {
>          return !(vring_avail_flags(vq) & VRING_AVAIL_F_NO_INTERRUPT);
>      }
>
> -    v = vq->signalled_used_valid;
> -    vq->signalled_used_valid = true;
> +    if (!vq->signalled_used_valid) {
> +        vq->signalled_used_valid = true;
> +        vq->signalled_used = vq->used_idx;
> +        return true;
> +    }
> +
> +    used = vring_get_used_event(vq);
> +    new = vq->used_idx;
>      old = vq->signalled_used;
> -    new = vq->signalled_used = vq->used_idx;
> -    return !v || vring_need_event(vring_get_used_event(vq), new, old);
> +
> +    if (vring_need_event(used, new, old)) {
> +        vq->signalled_used_valid = true;
> +        vq->signalled_used = vq->used_idx;
> +        return true;
> +    }
> +
> +    return false;
>  }
>
>  static void _vu_queue_notify(VuDev *dev, VuVirtq *vq, bool sync)
>  {
>      if (unlikely(dev->broken) ||
> --
> 2.40.1
>
>

