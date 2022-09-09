Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A0A5B2C57
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 05:04:13 +0200 (CEST)
Received: from localhost ([::1]:45600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWUJP-0007dM-Ns
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 23:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oWUGm-00062Y-ET
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 23:01:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oWUGj-0000UY-6V
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 23:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662692483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2OwRJ6P1NxVSyZWAQYNjLXZU+U0uDlQR1rEZ1SC1Cgg=;
 b=g5d0pbkZJ6dkkKYnbRpYwUWCHOBuR0Dh88B9aKPsZggTwWNAAzrs4tNCN29jEaJn0xu1a0
 Hpa+5DltXc+ZZ0YPp1MaWQKmWD7bqTLtsZOonpwppbLd3xRQdlQ4DBT20hPMeP6xKrowdQ
 VHGMqReDqzrHqo8XDgBAMVF7CWxhL5c=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-417-eLJn2hhrM5WTQmO1Fip1LA-1; Thu, 08 Sep 2022 23:01:22 -0400
X-MC-Unique: eLJn2hhrM5WTQmO1Fip1LA-1
Received: by mail-vs1-f70.google.com with SMTP id
 s7-20020a056102108700b003983fde5676so34261vsr.17
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 20:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2OwRJ6P1NxVSyZWAQYNjLXZU+U0uDlQR1rEZ1SC1Cgg=;
 b=lV//Vk+OhmpT9lAJW2IvfsZKjuKioRBB37d/8piSwjBcu9dZ6RkW1gzMYvQZgWXy97
 vsYzt8QHC7eTfyRTeOWqP0HH6nqUU3f/8mkjDeDcPh/NZR8RnakY8Z1/oNDlYXYF9orv
 oW5vzQwkJjpJwtACZl4hQD7csG2m6DEEIThfUi9imLR3pJtxLOxgTcV2MsG3t+Uj3PNN
 X9YRREjPSg0xzmTuDc0MZ2JLnP1Wh1Lq8ssSzos5+7yLi8P+7tF0d9/I73EYxtvOIixn
 GnCnJXll+9i5wOKozLSfrZrTAK4gdZuTpll5lMhjFGm8lx/SnJm+5A6hl9FwesUAqZHy
 4/lg==
X-Gm-Message-State: ACgBeo1awKHffqaDIv9yZpRrYwC4owj+Q/Vf5YClOeNr2QsyiSBy89Tc
 3EWLgFYOs8oigwzUwil6pTUlqSJNeYC6hSiMAjnESsHXlr6h/SI3YN2PMlESHdFAL8DAT2+p+Gf
 mXacbqBWbVh7jJq06u8RC7p58M8rVgUA=
X-Received: by 2002:a67:e218:0:b0:398:4d8c:8037 with SMTP id
 g24-20020a67e218000000b003984d8c8037mr1318760vsa.4.1662692482034; 
 Thu, 08 Sep 2022 20:01:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5GvEIJ+ElGT7kjwedO8hDe/39EYpli0NFvmIdklxoTx8wfHf2XRi3oPBtcjMsLgiE4/Nk+uL0G1dBMwxy5Ngo=
X-Received: by 2002:a67:e218:0:b0:398:4d8c:8037 with SMTP id
 g24-20020a67e218000000b003984d8c8037mr1318744vsa.4.1662692481826; Thu, 08 Sep
 2022 20:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220906150719.1134955-1-eperezma@redhat.com>
In-Reply-To: <20220906150719.1134955-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 9 Sep 2022 11:01:10 +0800
Message-ID: <CACGkMEtwG=WUHStVKkTfeLST0BDEh=qenNH=xCTPuZ=vXOaF3A@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Vhost-vdpa Shadow Virtqueue multiqueue support.
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Parav Pandit <parav@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Laurent Vivier <lvivier@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cornelia Huck <cohuck@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, Sep 6, 2022 at 11:07 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> This series enables shadowed CVQ to intercept multiqueue commands through
> shadowed CVQ, update the virtio NIC device model so qemu send it in a
> migration, and the restore of that MQ state in the destination.
>
> v3:
> * Accept ctrl class and cmd in vhost_vdpa_net_load_cmd, so it's in charge=
 of
>   building the whole buffer
> * Rename cvq_cmd_in_buffer to status.
>
> v2:
> * Add vhost_vdpa_net_load_cmd helper to avoid out buffers castings.
> * Make cvq_cmd_in_buffer virtio_net_ctrl_ack type.
>
> Eugenio P=C3=A9rez (6):
>   vdpa: Make VhostVDPAState cvq_cmd_in_buffer control ack type
>   vdpa: extract vhost_vdpa_net_load_mac from vhost_vdpa_net_load
>   vdpa: Add vhost_vdpa_net_load_mq
>   vdpa: validate MQ CVQ commands
>   virtio-net: Update virtio-net curr_queue_pairs in vdpa backends
>   vdpa: Allow MQ feature in SVQ
>
>  hw/net/virtio-net.c |  17 +++----
>  net/vhost-vdpa.c    | 119 ++++++++++++++++++++++++++++++++------------
>  2 files changed, 93 insertions(+), 43 deletions(-)

Applied.

Thanks

>
> --
> 2.31.1
>
>


