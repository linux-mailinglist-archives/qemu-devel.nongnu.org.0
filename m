Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B11F57958B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:50:44 +0200 (CEST)
Received: from localhost ([::1]:54740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiwF-0004YP-Gl
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDiud-0003CK-BG
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:49:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDiub-0001ri-33
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658220540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k+3pdxysdnUEhRwICRurqlrZjz+YEd1klOd3O+9mdyk=;
 b=BLpIvrKYB74ms8F9I9OnVFgP0M5lQig01/d5c7BmQ6B5yIDmyin+vv5JRoNf5fRQJEidr/
 yxNoJxfG4LZVFcaWpapSxZHpVTapvuYa2iqXIa7D/Sf74KWbTyx+rAYXjYdaJ71K2eFU9m
 LkQPY9DGgmnPbzC3rw4XF0BujL91Hd8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-L2LWueAENBG5jJvpKt1LwQ-1; Tue, 19 Jul 2022 04:48:59 -0400
X-MC-Unique: L2LWueAENBG5jJvpKt1LwQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 w8-20020a197b08000000b00489e72a3025so5157955lfc.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k+3pdxysdnUEhRwICRurqlrZjz+YEd1klOd3O+9mdyk=;
 b=7yjdJzG4KNQdf0koIEyqD0+2/kGQr1wt3Hyi6+ntn47pXDP9eCTLBtOTKK0FLCZEjA
 VSu0vyUt/zFrIAw825iyusof+uumGWvLojfPneqhDnlRxsE8iNUxv+tn5s3j+bYtZecf
 3QdpIVFmm5FlYxaEDUftzIQa+d1UBVCnXCYNjs34XHJqQFJl/3BEgl++d+DeZK50EDXI
 KxFlCl63nNLxKVjEnqugS8Ox+lb8loqcUEBTLuOKAouLSk9Fa8igAotHTmWe9rx8VfaW
 y+5lJVo/rwWdxRNY+f6D2akJPxBVF4YNgF4brVFd5TDPAB7YGuwlEAgcKt7f319EnW8V
 n/1w==
X-Gm-Message-State: AJIora9vrnlFvscqfKHYO6p2C+Fr5voW/VMw7BuBvDmEvWI8pC0b0g/c
 Sk8zEIp6426ypvMKVYGdvG43PfolraXmmA9kul9Md2u6uMCRrEf0V5sUD6bYSxKM5bM4vFNilk5
 uK3qHLhI5PqlWdQVMe6vOj636/rn0i8Q=
X-Received: by 2002:a2e:557:0:b0:25d:466a:31b8 with SMTP id
 84-20020a2e0557000000b0025d466a31b8mr14617206ljf.243.1658220536947; 
 Tue, 19 Jul 2022 01:48:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUIBTnhfvhuXO25qp30PCnN9/3rrbHq6X9W5F61b0orFUNizqAZN4poZ50Vs3p3Jck4+fvNdK6CS57F+fpXco=
X-Received: by 2002:a2e:557:0:b0:25d:466a:31b8 with SMTP id
 84-20020a2e0557000000b0025d466a31b8mr14617184ljf.243.1658220536631; Tue, 19
 Jul 2022 01:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-13-eperezma@redhat.com>
 <CACGkMEuHR_R6Jxjvznv1T-d6SGngsYQyfhCNw8-HoTb3FLcX0w@mail.gmail.com>
 <CAJaqyWfwODXUr_z3Qzp7_MSbEamG0W8MxUtxn1kV-NE_qfBi-A@mail.gmail.com>
 <CACGkMEvfPDMK+7jg+r5hunxA+EXuN9V_d_KZfkCfufe-ONbXFQ@mail.gmail.com>
 <CAJaqyWdf-VQxP4rYasSzdq3yaYLPw1_G6J=Kqq5SXXWEDYpKCA@mail.gmail.com>
 <c5ee2d97-a86a-9f98-c45a-940b720f601a@redhat.com>
 <CAJaqyWdUAM3E2sqQojGgs7_ty19m9bSyXkQo_VyNouWK=CX8GA@mail.gmail.com>
In-Reply-To: <CAJaqyWdUAM3E2sqQojGgs7_ty19m9bSyXkQo_VyNouWK=CX8GA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 19 Jul 2022 16:48:45 +0800
Message-ID: <CACGkMEsCdar+A6=VXfgWMhRLHvsV7nC-3nramiisicO2-W5Cng@mail.gmail.com>
Subject: Re: [PATCH v2 12/19] vhost: add vhost_svq_poll
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jul 19, 2022 at 4:42 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Jul 19, 2022 at 9:38 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/7/16 01:05, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > > On Fri, Jul 15, 2022 at 10:48 AM Jason Wang <jasowang@redhat.com> wro=
te:
> > >> On Fri, Jul 15, 2022 at 1:39 PM Eugenio Perez Martin
> > >> <eperezma@redhat.com> wrote:
> > >>> On Fri, Jul 15, 2022 at 5:59 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > >>>> On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redh=
at.com> wrote:
> > >>>>> It allows the Shadow Control VirtQueue to wait for the device to =
use the
> > >>>>> available buffers.
> > >>>>>
> > >>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >>>>> ---
> > >>>>>   hw/virtio/vhost-shadow-virtqueue.h |  1 +
> > >>>>>   hw/virtio/vhost-shadow-virtqueue.c | 22 ++++++++++++++++++++++
> > >>>>>   2 files changed, 23 insertions(+)
> > >>>>>
> > >>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost=
-shadow-virtqueue.h
> > >>>>> index 1692541cbb..b5c6e3b3b4 100644
> > >>>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
> > >>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > >>>>> @@ -89,6 +89,7 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *=
svq, const SVQElement *elem,
> > >>>>>   int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec=
 *out_sg,
> > >>>>>                     size_t out_num, const struct iovec *in_sg, si=
ze_t in_num,
> > >>>>>                     SVQElement *elem);
> > >>>>> +size_t vhost_svq_poll(VhostShadowVirtqueue *svq);
> > >>>>>
> > >>>>>   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int s=
vq_kick_fd);
> > >>>>>   void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int c=
all_fd);
> > >>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost=
-shadow-virtqueue.c
> > >>>>> index 5244896358..31a267f721 100644
> > >>>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> > >>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > >>>>> @@ -486,6 +486,28 @@ static void vhost_svq_flush(VhostShadowVirtq=
ueue *svq,
> > >>>>>       } while (!vhost_svq_enable_notification(svq));
> > >>>>>   }
> > >>>>>
> > >>>>> +/**
> > >>>>> + * Poll the SVQ for one device used buffer.
> > >>>>> + *
> > >>>>> + * This function race with main event loop SVQ polling, so extra
> > >>>>> + * synchronization is needed.
> > >>>>> + *
> > >>>>> + * Return the length written by the device.
> > >>>>> + */
> > >>>>> +size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
> > >>>>> +{
> > >>>>> +    do {
> > >>>>> +        uint32_t len;
> > >>>>> +        SVQElement *elem =3D vhost_svq_get_buf(svq, &len);
> > >>>>> +        if (elem) {
> > >>>>> +            return len;
> > >>>>> +        }
> > >>>>> +
> > >>>>> +        /* Make sure we read new used_idx */
> > >>>>> +        smp_rmb();
> > >>>> There's already one smp_rmb(0 in vhost_svq_get_buf(). So this seem=
s useless?
> > >>>>
> > >>> That rmb is after checking for new entries with (vq->last_used_idx =
!=3D
> > >>> svq->shadow_used_idx) , to avoid reordering used_idx read with the
> > >>> actual used entry. So my understanding is
> > >>> that the compiler is free to skip that check within the while loop.
> > >> What do you mean by "that check" here?
> > >>
> > > The first check of (presumably cached) last_used_idx !=3D
> > > shadow_used_idx. Right before the SVQ's vring fetch of
> > > svq->vring.used->idx.
> > >
> > >>> Maybe the right solution is to add it in vhost_svq_more_used after =
the
> > >>> condition (vq->last_used_idx !=3D svq->shadow_used_idx) is false?
> > >> I'm not sure I get the goal of the smp_rmb() here. What barrier does=
 it pair?
> > >>
> > > It pairs with the actual device memory write.
> > >
> > > Note that I'm worried about compiler optimizations or reordering
> > > causing an infinite loop, not that the memory is updated properly.
> > >
> > > Let's say we just returned from vhost_svq_add, and avail_idx -
> > > used_idx > 0. The device still did not update SVQ vring used idx, and
> > > qemu is very fast so it completes a full call of vhost_svq_get_buf
> > > before the device is able to increment the used index. We can trace
> > > the full vhost_svq_get_buf without a memory barrier.
> > >
> > > If the compiler inlines enough and we delete the new smp_rmb barrier,
> > > this is what it sees:
> > >
> > > size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
> > > {
> > >      do {
> > >          more_used =3D false
> > >          // The next conditional returns false
> > >          if (svq->last_used_idx !=3D svq->shadow_used_idx) {
> > >              goto useful;
> > >          }
> > >
> > >          svq->shadow_used_idx =3D cpu_to_le16(svq->vring.used->idx);
> > >
> > >          // next conditional returns false too
> > >          if (!(svq->last_used_idx !=3D svq->shadow_used_idx))
> > >              continue;
> > >
> > > useful:
> > >          // actual code to handle new used buffer
> > >          break;
> > >          }
> > >      }
> > > }
> > >
> > > And qemu does not need to read again none of the variables since
> > > nothing modifies them within the loop before "useful" tag
> > > (svq->vring.used->idx, svq->last_used_idx, svq->shadow_used_idx). So
> > > it could freely rewrite as:
> > >
> > > size_t vhost_svq_poll(VhostShadowVirtqueue *svq) {
> > >      if (svq->last_used_idx =3D=3D svq->shadow_used_idx &&
> > >          svq->last_used_idx =3D=3D svq->vring.used->idx) {
> > >              for (;;);
> > >      }
> > > }
> > >
> > > That's why I think the right place for the mb is right after caller
> > > code see (potentially cached) last_used_idx =3D=3D shadow_used_idx, a=
nd it
> > > needs to read a value paired with the "device's mb" in the SVQ vring.
> >
> >
> > I think you need "volatile" instead of the memory barriers.
>
> The kernel's READ_ONCE implementation uses a volatile casting but also
> a memory read barrier after it.

This sounds strange, the volatile should not tie to any barriers. And
this is what I've seen in kernel's code:

/*
 * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
 * atomicity. Note that this may result in tears!
 */
#ifndef __READ_ONCE
define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
#endif

Thanks

> I guess it's because the compiler can
> reorder non-volatile accesses around volatile ones. In the proposed
> code, that barrier is provided by the vhost_svq_more_used caller
> (vhost_svq_get_buf). I think no other caller should need it.
>
> Thanks!
>
> > If I
> > understand correctly, you want the load from the memory instead of the
> > registers here.
> >
> > Thanks
> >
> >
> > >
> > > We didn't have that problem before, since we clear event_notifier
> > > right before the do{}while(), and event loop should hit a memory
> > > barrier in the next select / poll / read / whatever syscall to check
> > > that event notifier fd is set again.
> > >
> > >> Since we are in the busy loop, we will read the for new used_idx for
> > >> sure,
> > > I'm not so sure of that, but maybe I've missed something.
> > >
> > > I'm sending v3 with this comment pending, so we can iterate faster.
> > >
> > > Thanks!
> > >
> > >> and we can't forecast when the used_idx is committed to memory.
> > >>
> >
>


