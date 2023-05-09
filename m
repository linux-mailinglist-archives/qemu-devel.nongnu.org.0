Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1386FBFB9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 08:56:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwHGV-0002PE-EZ; Tue, 09 May 2023 02:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pwHGS-0002Ok-NT; Tue, 09 May 2023 02:56:00 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pwHGQ-0004Y2-TD; Tue, 09 May 2023 02:56:00 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ac770a99e2so59682771fa.3; 
 Mon, 08 May 2023 23:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683615355; x=1686207355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZQJzyzIEI9kCxaIDMJ1MufyobAHtq7BtRGQUTOEj+w=;
 b=rFVW376W+tJIpi74vJXDZUjeULDxRtxHE6HL5XHEl3osagnx19uD/Yu7ikXgR11clf
 WXOa7FOln6lT7Tbekck4+PaZVA0ifeM8k69YDdaRu0LvmOyi10xgwrlvI6X/OM9E9RFD
 PXJin8gIcAI6dqyQTv0OqCmKBD/RMdN1xZH7gYLpdUWGcvWYji1EJefBg9m9Sb8RztQG
 FiSfc/n6WWwspdDuvL+czJbuinQq253zgPr8CPnYrT8WaxQSt0RZZxXO1007LdicirbU
 eXqaC6RZkiVuk52A7OHTAmiBtdMuljLLIqldWyUX6rDOOSBLb9aDuML72HtyYnCg9Brw
 39pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683615355; x=1686207355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZQJzyzIEI9kCxaIDMJ1MufyobAHtq7BtRGQUTOEj+w=;
 b=UZwhGGk180I6C8+gZ4+dnJAuiabEhYri06Z8CYm6xkjgajzjVO9TFcm8LJwd6HKKTc
 d62cYhmKslv7oiLnOqyqrin4LHkPFX4e7H8p/V3X1aEJ0Z9FtEipcIiPzcfoSofjhn44
 h+tc4haooEAaWsyBD8/D9ofMB4s0iMKwraFGkBhtOFx6Ai1560+cx1pTWHrKnWebplpP
 l+n5fefdgxBhWGgBwZ4aoFLHABlMaVoZOwXgNyYgLNSWcKYV6poeL5lm6cD2JOMaQ4h4
 7yBuD6zM04XY2+uPCnBM44Q1vv+ay4vUewX8sBfd5awRSLsY/AttsdSdFMGZNtlNobfC
 9USQ==
X-Gm-Message-State: AC+VfDx8fKsWx1t5W0UCMSPsrFDJGStjMj1NJgvJV4Ml3tuukH+Jvlwv
 IjOKznnG/9C2F/+oxVGjNm+9LJ8OhYdPsHQXE0M=
X-Google-Smtp-Source: ACHHUZ4F7sIJyx9nQbX9+XaP3PSVR3fz5QPh2vOy/bicrdFjyqEqgDmLFPIjyaeMypbSbKGCZHRrrM93FlNFA3YY/SM=
X-Received: by 2002:a2e:93d5:0:b0:2ab:5bee:affc with SMTP id
 p21-20020a2e93d5000000b002ab5beeaffcmr441607ljh.21.1683615354483; Mon, 08 May
 2023 23:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230506150111.2496-1-yin31149@gmail.com>
 <CAJaqyWfwFx_zhYpJ_o4E7M84255GbNtKGDM9fnqkyBJMTA=k2w@mail.gmail.com>
In-Reply-To: <CAJaqyWfwFx_zhYpJ_o4E7M84255GbNtKGDM9fnqkyBJMTA=k2w@mail.gmail.com>
From: Hawkins Jiawei <yin31149@gmail.com>
Date: Tue, 9 May 2023 14:55:42 +0800
Message-ID: <CAKrof1OYXC4NPJVBHDLbGMT1x5FeXO=k8m-p9bs3Liqr+57USg@mail.gmail.com>
Subject: Re: [PATCH RESEND] vhost: fix possible wrap in SVQ descriptor ring
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 18801353760@163.com,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=yin31149@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Hi Eugenio,
Thanks for reviewing.

On 2023/5/9 1:26, Eugenio Perez Martin wrote:
> On Sat, May 6, 2023 at 5:01=E2=80=AFPM Hawkins Jiawei <yin31149@gmail.com=
> wrote:
>>
>> QEMU invokes vhost_svq_add() when adding a guest's element into SVQ.
>> In vhost_svq_add(), it uses vhost_svq_available_slots() to check
>> whether QEMU can add the element into the SVQ. If there is
>> enough space, then QEMU combines some out descriptors and
>> some in descriptors into one descriptor chain, and add it into
>> svq->vring.desc by vhost_svq_vring_write_descs().
>>
>> Yet the problem is that, `svq->shadow_avail_idx - svq->shadow_used_idx`
>> in vhost_svq_available_slots() return the number of occupied elements,
>> or the number of descriptor chains, instead of the number of occupied
>> descriptors, which may cause wrapping in SVQ descriptor ring.
>>
>> Here is an example. In vhost_handle_guest_kick(), QEMU forwards
>> as many available buffers to device by virtqueue_pop() and
>> vhost_svq_add_element(). virtqueue_pop() return a guest's element,
>> and use vhost_svq_add_elemnt(), a wrapper to vhost_svq_add(), to
>> add this element into SVQ. If QEMU invokes virtqueue_pop() and
>> vhost_svq_add_element() `svq->vring.num` times, vhost_svq_available_slot=
s()
>> thinks QEMU just ran out of slots and everything should work fine.
>> But in fact, virtqueue_pop() return `svq-vring.num` elements or
>> descriptor chains, more than `svq->vring.num` descriptors, due to
>> guest memory fragmentation, and this cause wrapping in SVQ descriptor ri=
ng.
>>
>
> The bug is valid even before marking the descriptors used. If the
> guest memory is fragmented, SVQ must add chains so it can try to add
> more descriptors than possible.

I will add this in the commit message in v2 patch.

>
>> Therefore, this patch adds `num_free` field in VhostShadowVirtqueue
>> structure, updates this field in vhost_svq_add() and
>> vhost_svq_get_buf(), to record the number of free descriptors.
>> Then we can avoid wrap in SVQ descriptor ring by refactoring
>> vhost_svq_available_slots().
>>
>> Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
>> Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
>> ---
>>   hw/virtio/vhost-shadow-virtqueue.c | 9 ++++++++-
>>   hw/virtio/vhost-shadow-virtqueue.h | 3 +++
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow=
-virtqueue.c
>> index 8361e70d1b..e1c6952b10 100644
>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>> @@ -68,7 +68,7 @@ bool vhost_svq_valid_features(uint64_t features, Error=
 **errp)
>>    */
>>   static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue *=
svq)
>>   {
>> -    return svq->vring.num - (svq->shadow_avail_idx - svq->shadow_used_i=
dx);
>> +    return svq->num_free;
>>   }
>>
>>   /**
>> @@ -263,6 +263,9 @@ int vhost_svq_add(VhostShadowVirtqueue *svq, const s=
truct iovec *out_sg,
>>           return -EINVAL;
>>       }
>>
>> +    /* Update the size of SVQ vring free descriptors */
>> +    svq->num_free -=3D ndescs;
>> +
>>       svq->desc_state[qemu_head].elem =3D elem;
>>       svq->desc_state[qemu_head].ndescs =3D ndescs;
>>       vhost_svq_kick(svq);
>> @@ -450,6 +453,9 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShad=
owVirtqueue *svq,
>>       svq->desc_next[last_used_chain] =3D svq->free_head;
>>       svq->free_head =3D used_elem.id;
>>
>> +    /* Update the size of SVQ vring free descriptors */
>
> No need for this comment.
>
> Apart from that,
>
> Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>

Thanks for your suggestion. I will remove the
comment in v2 patch, with this tag on.


>> +    svq->num_free +=3D num;
>> +
>>       *len =3D used_elem.len;
>>       return g_steal_pointer(&svq->desc_state[used_elem.id].elem);
>>   }
>> @@ -659,6 +665,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, Virt=
IODevice *vdev,
>>       svq->iova_tree =3D iova_tree;
>>
>>       svq->vring.num =3D virtio_queue_get_num(vdev, virtio_get_queue_ind=
ex(vq));
>> +    svq->num_free =3D svq->vring.num;
>>       driver_size =3D vhost_svq_driver_area_size(svq);
>>       device_size =3D vhost_svq_device_area_size(svq);
>>       svq->vring.desc =3D qemu_memalign(qemu_real_host_page_size(), driv=
er_size);
>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow=
-virtqueue.h
>> index 926a4897b1..6efe051a70 100644
>> --- a/hw/virtio/vhost-shadow-virtqueue.h
>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
>> @@ -107,6 +107,9 @@ typedef struct VhostShadowVirtqueue {
>>
>>       /* Next head to consume from the device */
>>       uint16_t last_used_idx;
>> +
>> +    /* Size of SVQ vring free descriptors */
>> +    uint16_t num_free;
>>   } VhostShadowVirtqueue;
>>
>>   bool vhost_svq_valid_features(uint64_t features, Error **errp);
>> --
>> 2.25.1
>>
>

