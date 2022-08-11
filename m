Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9CA58F80B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 09:02:35 +0200 (CEST)
Received: from localhost ([::1]:42792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM2DB-0007v3-TF
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 03:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oM28B-0004O5-Ga
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 02:57:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oM289-0004Jr-84
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 02:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660201040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A7rg+Fj9W8IyeFnKDkomNOKUaZOI3KyqwT/nq6JWnyA=;
 b=gcSkk4nVJvaHued39IpSWMdcUo5eZDvsv8SO7Xd0iqrNEzqqJO1dCWRf+I/Br9WltUg1PP
 MEmRxxFzkoxfDXXI3qmg//Dg7TRZaoLBAGEDLT/2p20u3mnC7YEPDjL+FnD8ynkgo9yvxm
 w5jMIGIb1Na1L8n4qP7tGVmLCjO58WE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-FT6M3zfbPRSlslbSNRRtjA-1; Thu, 11 Aug 2022 02:57:19 -0400
X-MC-Unique: FT6M3zfbPRSlslbSNRRtjA-1
Received: by mail-qk1-f199.google.com with SMTP id
 bl27-20020a05620a1a9b00b0069994eeb30cso14119019qkb.11
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 23:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=A7rg+Fj9W8IyeFnKDkomNOKUaZOI3KyqwT/nq6JWnyA=;
 b=xLa+4VC7rdhWPq8TNjt2u8FfDJM5Qa34w1DC9rba+k6IOjI6XLhX2GW4KhklW03QBU
 akT0Si/4RQqG9K4vtPIw0/HMUvQdfv/gUMKb4mM+ntU2uRvAqqAW6De/2SFjInhaTeys
 YC9O4ga0rjkdAdwYwGMUWi0gTfVZ229MwydWukYTjLqpjebZVdwzIcTu95ohm24tc/kk
 /2FsxvX2afQpudlKs6ruhj7mXo8Ta1Mem9dCq0OugxF4xae6h0on7p3Nt6dmfoxFfXwt
 Nyt2ZeqLskTkRVSdl83ZITTJX+qEo9HasjIf8HVvSNuR+hIU1OGWGOhe3kOqHb2EY1JK
 XiwA==
X-Gm-Message-State: ACgBeo1Ovk8GB/QtqH8XvhYB3NLIQXsjWNpXzKC5wL2E5d53bv1EdI5v
 nhNF9JZib3T+oOq4K6sFd7Telrn7Rgijd3QXimUu08HESqiPBS5gCiNPjQq+6VT7ihnEuW2S1He
 0NtE1RAZfl4i+r/FUbQLNTaFzeaYSEOQ=
X-Received: by 2002:a05:6214:238e:b0:470:8ee8:52e6 with SMTP id
 fw14-20020a056214238e00b004708ee852e6mr26859355qvb.45.1660201038677; 
 Wed, 10 Aug 2022 23:57:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4wSDyMF8hyG/CjWBrQaFRbCagG/jSlhugkBOz4UvMTONkptY7kwo4XlbPbdHYsYL7OxeVU4aj9r/UzDXvCoq0=
X-Received: by 2002:a05:6214:238e:b0:470:8ee8:52e6 with SMTP id
 fw14-20020a056214238e00b004708ee852e6mr26859347qvb.45.1660201038452; Wed, 10
 Aug 2022 23:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220809173926.1695280-1-eperezma@redhat.com>
In-Reply-To: <20220809173926.1695280-1-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 11 Aug 2022 08:56:42 +0200
Message-ID: <CAJaqyWes7ePnG5wRwWGCS6H4=mrrW4=D19xg74rX985Yd1-TyQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/12] NIC vhost-vdpa state restore via Shadow CVQ
To: qemu-level <qemu-devel@nongnu.org>
Cc: Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Tue, Aug 9, 2022 at 7:43 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> CVQ of net vhost-vdpa devices can be intercepted since the addition of x-=
svq.
> The virtio-net device model is updated. The migration was blocked because
> although the state can be megrated between VMM it was not possible to res=
tore
> on the destination NIC.
>
> This series add support for SVQ to inject external messages without the g=
uest's
> knowledge, so before the guest is resumed all the guest visible state is
> restored. It is done using standard CVQ messages, so the vhost-vdpa devic=
e does
> not need to learn how to restore it: As long as they have the feature, th=
ey
> know how to handle it.
>
> This series needs fix [1] to be applied to achieve full live
> migration.
>
> Thanks!
>
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-08/msg00325.htm=
l
>
> v8:
> - Rename NetClientInfo load to start, so is symmetrical with stop()
> - Delete copy of device's in buffer at vhost_vdpa_net_load
>
> v7:
> - Remove accidental double free.
>
> v6:
> - Move map and unmap of the buffers to the start and stop of the device. =
This
>   implies more callbacks on NetClientInfo, but simplifies the SVQ CVQ cod=
e.
> - Not assume that in buffer is sizeof(virtio_net_ctrl_ack) in
>   vhost_vdpa_net_cvq_add
> - Reduce the number of changes from previous versions
> - Delete unused memory barrier
>
> v5:
> - Rename s/start/load/
> - Use independent NetClientInfo to only add load callback on cvq.
> - Accept out sg instead of dev_buffers[] at vhost_vdpa_net_cvq_map_elem
> - Use only out size instead of iovec dev_buffers to know if the descripto=
r is
>   effectively available, allowing to delete artificial !NULL VirtQueueEle=
ment
>   on vhost_svq_add call.
>
> v4:
> - Actually use NetClientInfo callback.
>
> v3:
> - Route vhost-vdpa start code through NetClientInfo callback.
> - Delete extra vhost_net_stop_one() call.
>
> v2:
> - Fix SIGSEGV dereferencing SVQ when not in svq mode
>
> v1 from RFC:
> - Do not reorder DRIVER_OK & enable patches.
> - Delete leftovers
>
> Eugenio P=C3=A9rez (12):
>   vhost: stop transfer elem ownership in vhost_handle_guest_kick
>   vhost: use SVQ element ndescs instead of opaque data for desc
>     validation
>   vhost: Delete useless read memory barrier
>   vhost: Do not depend on !NULL VirtQueueElement on vhost_svq_flush
>   vhost_net: Add NetClientInfo prepare callback
>   vhost_net: Add NetClientInfo stop callback
>   vdpa: add net_vhost_vdpa_cvq_info NetClientInfo
>   vdpa: Move command buffers map to start of net device
>   vdpa: extract vhost_vdpa_net_cvq_add from
>     vhost_vdpa_net_handle_ctrl_avail
>   vhost_net: add NetClientState->load() callback
>   vdpa: Add virtio-net mac address via CVQ at start
>   vdpa: Delete CVQ migration blocker
>
>  include/hw/virtio/vhost-vdpa.h     |   1 -
>  include/net/net.h                  |   6 +
>  hw/net/vhost_net.c                 |  17 +++
>  hw/virtio/vhost-shadow-virtqueue.c |  27 ++--
>  hw/virtio/vhost-vdpa.c             |  14 --
>  net/vhost-vdpa.c                   | 225 ++++++++++++++++++-----------
>  6 files changed, 178 insertions(+), 112 deletions(-)
>
> --
> 2.31.1
>
>
>

Hi Jason,

Should I send a new version of this series with the changes you
proposed, or can they be done at pull time? (Mostly changes in patch
messages). Can you confirm to me that there is no other action I need
to perform?

Thanks!


