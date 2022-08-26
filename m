Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A0E5A22F0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 10:26:42 +0200 (CEST)
Received: from localhost ([::1]:34172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRUfo-0007GP-Lq
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 04:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oRUcV-0003g9-9l
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:23:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oRUcR-0000Ro-Q7
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:23:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661502190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hrBH3X0LyM1Y9zGt9v3zYWs8C0PaYE41yB9Y6cAHQ8s=;
 b=IvVx/ynz6ff01EH1ZyHUL5k+LAYXjlQtbFnF82RfaxRtzVJLb0zI/Xwn+Zf1/qrEpGBlsl
 EjkTHeeceRi/RZl9Mi4DM3jBLnrFtv5DrdHI9RJcwpoWbg1ObeNoCTO2BP/L1ER79AFeUK
 Zl43NusnJfMBEA4CfbV3jkgyqsSbc84=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-98-23mjQ_2KMBej8rUal4P0fA-1; Fri, 26 Aug 2022 04:23:08 -0400
X-MC-Unique: 23mjQ_2KMBej8rUal4P0fA-1
Received: by mail-qt1-f197.google.com with SMTP id
 fy12-20020a05622a5a0c00b00344569022f7so824710qtb.17
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 01:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=hrBH3X0LyM1Y9zGt9v3zYWs8C0PaYE41yB9Y6cAHQ8s=;
 b=Vw7gZGYbNMVxa7S3lk8H2jvqBj6xswpo2vDDAvLuN19SoBKVT7XHEsX3A2CUxh2xcA
 F8lOy6psFHgBhrqXjkj4FzhzscWJndbutgNMkNQ4rZRe9+W4J4H5ZY0AgvmRx5ZKACjk
 T4KdizfLo2kWYZ6kKPA6kukEJx/bqqp9N7I4COgxufSZq59xkyuPYaS+a/ECJ0xl7I4z
 MNcAuVfqTVMvErHTg/x8rzSyNK6Gb6/jd/beHngpH8By/0Y7nL0UB+zHNcxo0JIC8KrK
 eN9+LZ1tNjBMCNl+xtHaD7Bmi3xfRV49P17XCr4+qxVhOFOxmZdZlc8K7QZUAMkGEaha
 Bisw==
X-Gm-Message-State: ACgBeo0b2ZIYjVtdVM8SHoNtb7zH2AO5ZWp3+cVXBmECMqopZwISPfyC
 1Hma9OxMM6FqE4TyETGiJVRxUlA7422Etc4EmUHqsr7mhVc0/9gbvNAt6C9C/LmKs1iqI8AZOBc
 P9P+aIywGEQmvn/BX1j487azaaCt+4d8=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr5713888qkl.559.1661502188478; 
 Fri, 26 Aug 2022 01:23:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5tiQ8b2y4iVvrERmEkj1wJvXvnd4A+sQFGBEcyZ5igxxtKROEM9LPcvN5vvqirsYoH5Y4hlHYHKfN73AC+GTA=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr5713878qkl.559.1661502188244; Fri, 26
 Aug 2022 01:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-5-eperezma@redhat.com>
 <7debe883-819a-f083-aa72-8b9e05ca5be8@redhat.com>
 <8aafb501-a852-bc45-8989-b48644c5e1f5@oracle.com>
 <CAJaqyWfemKiDHSU5ujHhJrNjMgeD2i-7uYA0y3fUSC0fuE7bYA@mail.gmail.com>
 <ad87db8e-d71c-4771-98c7-29effcc8d8c7@oracle.com>
In-Reply-To: <ad87db8e-d71c-4771-98c7-29effcc8d8c7@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 26 Aug 2022 10:22:32 +0200
Message-ID: <CAJaqyWffp491FihNtL7zEweS3e6z3FzLMM3nwyX5J2Jnh5JO=w@mail.gmail.com>
Subject: Re: [PATCH 4/5] virtio-net: Update virtio-net curr_queue_pairs in
 vdpa backends
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Aug 26, 2022 at 6:29 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 8/24/2022 11:19 PM, Eugenio Perez Martin wrote:
> > On Thu, Aug 25, 2022 at 2:38 AM Si-Wei Liu <si-wei.liu@oracle.com> wrot=
e:
> >>
> >>
> >> On 8/23/2022 9:27 PM, Jason Wang wrote:
> >>> =E5=9C=A8 2022/8/20 01:13, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> >>>> It was returned as error before. Instead of it, simply update the
> >>>> corresponding field so qemu can send it in the migration data.
> >>>>
> >>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>> ---
> >>>
> >>> Looks correct.
> >>>
> >>> Adding Si Wei for double check.
> >> Hmmm, I understand why this change is needed for live migration, but
> >> this would easily cause userspace out of sync with the kernel for othe=
r
> >> use cases, such as link down or userspace fallback due to vdpa ioctl
> >> error. Yes, these are edge cases.
> > The link down case is not possible at this moment because that cvq
> > command does not call virtio_net_handle_ctrl_iov.
> Right. Though shadow cvq would need to rely on extra ASID support from
> kernel. For the case without shadow cvq we still need to look for an
> alternative mechanism.
>
> > A similar treatment
> > than mq would be needed when supported, and the call to
> > virtio_net_set_status will be avoided.
> So, maybe the seemingly "right" fix for the moment is to prohibit manual
> set_link at all (for vDPA only)?

We can apply a similar solution and just save the link status, without
stopping any vqp backend. The code can be more elegant than checking
if the backend is vhost-vdpa of course, but what is the problem with
doing it that way?

> In longer term we'd need to come up
> with appropriate support for applying mq config regardless of asid or
> shadow cvq support.
>

What do you mean by applying "mq config"? To the virtio-net device
model in qemu? Is there any use case to apply it to the model outside
of live migration?

On the other hand, the current approach is not using ASID at all, it
will be added on top. Do you mean that it is needed for data
passthrough & CVQ shadow, isn't it?

> >
> > I'll double check device initialization ioctl failure with
> > n->curr_queue_pairs > 1 in the destination, but I think we should be
> > safe.
> >
> >> Not completely against it, but I
> >> wonder if there's a way we can limit the change scope to live migratio=
n
> >> case only?
> >>
> > The reason to update the device model is to send the curr_queue_pairs
> > to the destination in a backend agnostic way. To send it otherwise
> > would limit the live migration possibilities, but sure we can explore
> > another way.
> A hacky workaround that came off the top of my head was to allow sending
> curr_queue_pairs for the !vm_running case for vdpa. It doesn't look it
> would affect other backend I think. But I agree with Jason, this doesn't
> look decent so I give up on this idea. Hence for this patch,
>

I still don't get the problem. Also, the guest would need to reset the
device anyway, so that information will be lost, isn't it?

Thanks!

> Acked-by: Si-Wei Liu <si-wei.liu@oracle.com>
>
> >
> > Thanks!
> >
>


