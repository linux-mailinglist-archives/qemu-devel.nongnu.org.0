Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061A65897AC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 08:12:16 +0200 (CEST)
Received: from localhost ([::1]:52056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJU5Y-0003NW-Vj
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 02:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJTrK-0006OQ-TW
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 01:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJTrI-0006Q9-0n
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 01:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659592642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CNTkuUyxC72KQni/k0sFVujytVwz1AkYKl+GW6xAEmo=;
 b=dSsoQr1PYygAxcIdRk+3AlgeUVylwT8wB/VOqOQa4sUeiHAEBKHQ8zPxdzGccs3KDuQByD
 wsECZ3X4l0mufa1ASWPjQdvfVKRgsB0J5sLgdpH0ZssVVFWznWq8OjjEaHTig7fl6fYTL9
 5S15eCDvEuf5nw2lVG01XpLH5Q0Ka6M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-K550KdoIOqCKRJSlJXyYNQ-1; Thu, 04 Aug 2022 01:57:21 -0400
X-MC-Unique: K550KdoIOqCKRJSlJXyYNQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bm34-20020a05620a19a200b006b5f1d95ceeso15019078qkb.5
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 22:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CNTkuUyxC72KQni/k0sFVujytVwz1AkYKl+GW6xAEmo=;
 b=aL5zyXnnvIrGp40uZHHmnpOTJU0/HfXypS8WjE6ZZVk+zYm+tfNPotkFaNB5CRXk2b
 kMMviLo0o6EjtUgoglKN0lJ+NLoliO3iAZvy4H7BH0SsQeM6jNlP90JSBJOnNI0UseoF
 88Xy37otJJsj6Tyhn4SRShkiC/dJn8AzpMTQzvq/iclm0hhWcCgBXb/jsiOwuz98sooG
 F8Xbj2G6hdFtxEZpzpAmbqshQ5bch9nuirQCxXJIJf5bXfR+3PfMkRNmy1eMzrbG9WTu
 TRPI1s8GrBjpBEjnJx1uNwToTUfhI4N+ZEFkIvmGUDH8hVoKUTWjhe2iW6VUWHNUGczF
 pnnw==
X-Gm-Message-State: ACgBeo0b6t+5SiF9aihvDk2HHAg3sgZRf6RZyhcwrUzXCRLG+KKVLVnA
 jLvO5M5LUsKMk0Q9rH8LPWgYr+fMQ7Go6t6M1NwC+kJvaReyMT6NHUXXI8Iq5ZCom8e7I2qZhh1
 eGoWnY23rW8ZfQ43e7yR7z3N44z4HjRA=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr204778qkl.559.1659592640748; 
 Wed, 03 Aug 2022 22:57:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR46qDSs6eEYGSDENrXWUO2nknG41D2BvSNW4TlUk685BOVbdvId5068vtHyjNuEOEsPnZuXQKCk4NW4ZwqppB8=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr204772qkl.559.1659592640539; Wed, 03
 Aug 2022 22:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220802175731.312115-1-eperezma@redhat.com>
 <20220802175731.312115-3-eperezma@redhat.com>
 <6ca24679-7d2b-a3ab-4c9e-a83745682808@redhat.com>
In-Reply-To: <6ca24679-7d2b-a3ab-4c9e-a83745682808@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 4 Aug 2022 07:56:44 +0200
Message-ID: <CAJaqyWfLhAZ3h7EFsPmeUo0f1JBfAG3ubmTa-xwTy0xz5NZr9g@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] vhost: use SVQ element ndescs instead of opaque
 data for desc validation
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Thu, Aug 4, 2022 at 5:01 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/8/3 01:57, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Since we're going to allow SVQ to add elements without the guest's
> > knowledge and without its own VirtQueueElement, it's easier to check if
> > an element is a valid head checking a different thing than the
> > VirtQueueElement.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
>
>
> Patch looks good to me. But I spot several other issues:
>
> 1) vhost_svq_add() use size_t for in_num and out_num, is this intended?

Would you prefer them to be unsigned? To me size_t fits better, but
VirtQueueElement uses unsigned anyway.

> 2) do we need to fail vhost_svq_add() if in_num + out_num =3D=3D 0?
>

We can recover from it, but it's a failure of qemu code.
- In the case of loading the state to the destination device, we
already know the layout (it's always 1 out, 1 in).
- In the case of forwarding buffers, there is no way to get a
VirtQueueElement with 0 out and 0 in descriptors, due to the virtqueue
way of working.

Would you prefer to return success in this case?

Thanks!


