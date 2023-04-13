Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D756E0C0B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 13:06:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmukj-0004YJ-4s; Thu, 13 Apr 2023 07:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pmukV-0004J0-LF
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:04:26 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pmukL-0000ZP-4B
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:04:18 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-54c0c86a436so394068507b3.6
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 04:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681383847; x=1683975847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+TI1SaqpsPZBKnp9w5BIR7Eb0nbfqYbacjsJhQ/90No=;
 b=csOx65KiCWMaupLMAoYCCpgYrdsZRaM/uzQeEpdKuiga8cHMDHbOP85aaOeP1jYrDL
 UABB8FgfYEDdd6bThmITP3kiEDSVhqbiIou9YfdLzcmpi46f90615Zez8Gpuwposb0dH
 hzmccS8Q966c82xZow4YF7w0r55yXzkjZNIvC8DcI7Y6SkikvwPF9NWzQW+2PuY1nr25
 ISva8/A4TocwfmzH0au/PAktXiM5lKIhWISdYyFPtFQznWLRJttUSxMWf/YeluTE6FYN
 w4DdPn3h1dJrEkxaCossaC8Flt83l76Ui0knonP0FiS+Tj1kx6RNPbpi/+fsiia5zvRb
 sx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681383847; x=1683975847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+TI1SaqpsPZBKnp9w5BIR7Eb0nbfqYbacjsJhQ/90No=;
 b=cwbD5am1c1d2dP/0ZAzcwOjmwfI/hr8Ix4g9EEkKxteexV6dWY0N4mtfXpVMtUZEV/
 Dk0gOyxaz/659S+o1UhNx2cOvOvQrM9J/z48X6DahCEoAayCSw8MJQCZ85mbjb0wywj1
 O0qk+T5ycitBuwu78OVg3Kj9Fox/og1oDZpEfg3IyZpUYjIQOKia0+m6KltEUamChv5I
 QFKMd6bRFzy5ogFlnRLb9UhWmcEVH/3BrvXNhOVCy002URwFqrcMoboZAZTJ+5M3q5e3
 1kA5Lyy2AxAwlHT0eahDmuReHLEznV3VHr/RDIMrUBTTgdlWfGcnggfucnzci1AhIRiV
 iKGA==
X-Gm-Message-State: AAQBX9eoPDjiZjhWYBYahc+4hamZdRlSv0SMrEbwwDeYxgIHs/lZoHFr
 HOvWYLo1pwhIGmVjowXM9+UsVL/Bag6hNPyibow=
X-Google-Smtp-Source: AKy350YGDW6ifASgcTCpt9VFLCJXVUPmP/UTQMhYtdwQ46UdbyUIEfkzE6yoAU51zHEejIv9XWg/kE0N4Ut1jSdZsTI=
X-Received: by 2002:a81:ad4a:0:b0:54f:17b6:f30a with SMTP id
 l10-20020a81ad4a000000b0054f17b6f30amr1127462ywk.4.1681383846724; Thu, 13 Apr
 2023 04:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-2-hreitz@redhat.com>
 <20230412205138.GA2813183@fedora>
 <0ca69a92-49ab-223e-b737-9d8655883f38@redhat.com>
In-Reply-To: <0ca69a92-49ab-223e-b737-9d8655883f38@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 13 Apr 2023 07:03:55 -0400
Message-ID: <CAJSP0QWOu5vW_fWc+UKfemrfhgGvJjNJmifVGCyRaP895AXocg@mail.gmail.com>
Subject: Re: [PATCH 1/4] vhost: Re-enable vrings after setting features
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>, 
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Roman Kagan <rvkagan@yandex-team.ru>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1130.google.com
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

On Thu, 13 Apr 2023 at 04:20, Hanna Czenczek <hreitz@redhat.com> wrote:
>
> On 12.04.23 22:51, Stefan Hajnoczi wrote:
> > On Tue, Apr 11, 2023 at 05:05:12PM +0200, Hanna Czenczek wrote:
> >> If the back-end supports the VHOST_USER_F_PROTOCOL_FEATURES feature,
> >> setting the vhost features will set this feature, too.  Doing so
> >> disables all vrings, which may not be intended.
> >>
> >> For example, enabling or disabling logging during migration requires
> >> setting those features (to set or unset VHOST_F_LOG_ALL), which will
> >> automatically disable all vrings.  In either case, the VM is running
> >> (disabling logging is done after a failed or cancelled migration, and
> >> only once the VM is running again, see comment in
> >> memory_global_dirty_log_stop()), so the vrings should really be enable=
d.
> >> As a result, the back-end seems to hang.
> >>
> >> To fix this, we must remember whether the vrings are supposed to be
> >> enabled, and, if so, re-enable them after a SET_FEATURES call that set
> >> VHOST_USER_F_PROTOCOL_FEATURES.
> >>
> >> It seems less than ideal that there is a short period in which the VM =
is
> >> running but the vrings will be stopped (between SET_FEATURES and
> >> SET_VRING_ENABLE).  To fix this, we would need to change the protocol,
> >> e.g. by introducing a new flag or vhost-user protocol feature to disab=
le
> >> disabling vrings whenever VHOST_USER_F_PROTOCOL_FEATURES is set, or ad=
d
> >> new functions for setting/clearing singular feature bits (so that
> >> F_LOG_ALL can be set/cleared without touching F_PROTOCOL_FEATURES).
> >>
> >> Even with such a potential addition to the protocol, we still need thi=
s
> >> fix here, because we cannot expect that back-ends will implement this
> >> addition.
> >>
> >> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> >> ---
> >>   include/hw/virtio/vhost.h | 10 ++++++++++
> >>   hw/virtio/vhost.c         | 13 +++++++++++++
> >>   2 files changed, 23 insertions(+)
> >>
> >> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> >> index a52f273347..2fe02ed5d4 100644
> >> --- a/include/hw/virtio/vhost.h
> >> +++ b/include/hw/virtio/vhost.h
> >> @@ -90,6 +90,16 @@ struct vhost_dev {
> >>       int vq_index_end;
> >>       /* if non-zero, minimum required value for max_queues */
> >>       int num_queues;
> >> +
> >> +    /*
> >> +     * Whether the virtqueues are supposed to be enabled (via
> >> +     * SET_VRING_ENABLE).  Setting the features (e.g. for
> >> +     * enabling/disabling logging) will disable all virtqueues if
> >> +     * VHOST_USER_F_PROTOCOL_FEATURES is set, so then we need to
> >> +     * re-enable them if this field is set.
> >> +     */
> >> +    bool enable_vqs;
> >> +
> >>       /**
> >>        * vhost feature handling requires matching the feature set
> >>        * offered by a backend which may be a subset of the total
> >> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >> index a266396576..cbff589efa 100644
> >> --- a/hw/virtio/vhost.c
> >> +++ b/hw/virtio/vhost.c
> >> @@ -50,6 +50,8 @@ static unsigned int used_memslots;
> >>   static QLIST_HEAD(, vhost_dev) vhost_devices =3D
> >>       QLIST_HEAD_INITIALIZER(vhost_devices);
> >>
> >> +static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int ena=
ble);
> >> +
> >>   bool vhost_has_free_slot(void)
> >>   {
> >>       unsigned int slots_limit =3D ~0U;
> >> @@ -899,6 +901,15 @@ static int vhost_dev_set_features(struct vhost_de=
v *dev,
> >>           }
> >>       }
> >>
> >> +    if (dev->enable_vqs) {
> >> +        /*
> >> +         * Setting VHOST_USER_F_PROTOCOL_FEATURES would have disabled=
 all
> >> +         * virtqueues, even if that was not intended; re-enable them =
if
> >> +         * necessary.
> >> +         */
> >> +        vhost_dev_set_vring_enable(dev, true);
> >> +    }
> >> +
> >>   out:
> >>       return r;
> >>   }
> >> @@ -1896,6 +1907,8 @@ int vhost_dev_get_inflight(struct vhost_dev *dev=
, uint16_t queue_size,
> >>
> >>   static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int en=
able)
> >>   {
> >> +    hdev->enable_vqs =3D enable;
> >> +
> >>       if (!hdev->vhost_ops->vhost_set_vring_enable) {
> >>           return 0;
> >>       }
> > The vhost-user spec doesn't say that VHOST_F_LOG_ALL needs to be toggle=
d
> > at runtime and I don't think VHOST_USER_SET_PROTOCOL_FEATURES is
> > intended to be used like that. This issue shows why doing so is a bad
> > idea.
> >
> > VHOST_F_LOG_ALL does not need to be toggled to control logging. Logging
> > is controlled at runtime by the presence of the dirty log
> > (VHOST_USER_SET_LOG_BASE) and the per-vring logging flag
> > (VHOST_VRING_F_LOG).
>
> Technically, the spec doesn=E2=80=99t say that SET_LOG_BASE is required. =
 It says:
>
> =E2=80=9CTo start/stop logging of data/used ring writes, the front-end ma=
y send
> messages VHOST_USER_SET_FEATURES with VHOST_F_LOG_ALL and
> VHOST_USER_SET_VRING_ADDR with VHOST_VRING_F_LOG in ring=E2=80=99s flags =
set to
> 1/0, respectively.=E2=80=9D
>
> (So the spec also very much does imply that toggling F_LOG_ALL at
> runtime is a valid way to enable/disable logging.  If we were to no
> longer do that, we should clarify it there.)

I missed that VHOST_VRING_F_LOG only controls logging used ring writes
while writes to descriptors are always logged when VHOST_F_LOG_ALL is
set. I agree that the spec does require VHOST_F_LOG_ALL to be toggled
at runtime.

What I suggested won't work.

> I mean, naturally, logging without a shared memory area to log in to
> isn=E2=80=99t much fun, so we could clarify that SET_LOG_BASE is also a
> requirement, but it looks to me as if we can=E2=80=99t use SET_LOG_BASE t=
o
> disable logging, because it=E2=80=99s supposed to always pass a valid FD =
(at
> least libvhost-user expects this:
> https://gitlab.com/qemu-project/qemu/-/blob/master/subprojects/libvhost-u=
ser/libvhost-user.c#L1044).

As an aside: I don't understand how logging without an fd is supposed
to work in QEMU's code or in the vhost-user spec. QEMU does not
support that case even though it's written as if shmfd were optional.

> So after a cancelled migration, the dirty bitmap SHM will stay around
> indefinitely (which is already not great, but if we were to use the
> presence of that bitmap as an indicator as to whether we should log or
> not, it would be worse).

Yes, continuing to log forever is worse.

>
> So the VRING_F_LOG flag remains.
>
> > I suggest permanently enabling VHOST_F_LOG_ALL upon connection when the
> > the backend supports it. No spec changes are required.
> >
> > libvhost-user looks like it will work. I didn't look at DPDK/SPDK, but
> > checking that it works there is important too.
>
> I can=E2=80=99t find VRING_F_LOG in libvhost-user, so what protocol do yo=
u mean
> exactly that would work in libvhost-user?  Because SET_LOG_BASE won=E2=80=
=99t
> work, as you can=E2=80=99t use it to disable logging.

That's true. There is no way to disable logging.

> (For DPDK, I=E2=80=99m not sure.  It looks like it sometimes takes VRING_=
F_LOG
> into account, but I think only when it comes to logging accesses to the
> vring specifically, i.e. not DMA to other areas of guest memory?  I
> think only places that use vq->log_guest_addr implicitly check it,
> others don=E2=80=99t.  So for example,
> vhost_log_write_iova()/vhost_log_cache_write_iova() don=E2=80=99t seem to=
 check
> VRING_F_LOG, which seem to be the functions generally used for writes to
> memory outside of the vrings.  So here, even if VRING_F_LOG is disabled
> for all vrings, as long as a log SHM is set, all writes to memory
> outside of the immediate vrings seem to cause logging (as long as
> F_LOG_ALL is set).)
>
> Hanna
>
> > I have CCed people who may be interested in this issue. This is the
> > first time I've looked at vhost-user logging, so this idea may not work=
.
> >
> > Stefan
>
>

