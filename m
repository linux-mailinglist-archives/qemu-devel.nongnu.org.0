Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429925775DE
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jul 2022 13:04:31 +0200 (CEST)
Received: from localhost ([::1]:39540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oD24c-0007VT-9Y
	for lists+qemu-devel@lfdr.de; Sun, 17 Jul 2022 07:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oD22E-000555-F3
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 07:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oD22C-0003wl-DW
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 07:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658055719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g18qSWSuCOQqNcwuo1+QfgXjKwibSRuoyLF24MP8ujU=;
 b=EIaY9Qkdm+/IGtDuXrp7sbqCMahS+QHJ5Iv3PhNH79VhuWb69lnJm3DG7gx1SZkfJORNRj
 MP6p33qJ0PQN2XVNo9EePwcnXTQWtcXa5WszSD+CYDTXry8/0nu8DYXA4DEeRUBh+GAJFl
 lkPWapnUBz0PMTIoMLd+Rn8PD7j43Hk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-22-g__SaP_SZtp2QC_tq4Q-1; Sun, 17 Jul 2022 07:01:52 -0400
X-MC-Unique: 22-g__SaP_SZtp2QC_tq4Q-1
Received: by mail-qt1-f198.google.com with SMTP id
 c22-20020ac81116000000b0031d25923ea8so6610540qtj.17
 for <qemu-devel@nongnu.org>; Sun, 17 Jul 2022 04:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g18qSWSuCOQqNcwuo1+QfgXjKwibSRuoyLF24MP8ujU=;
 b=6aKe/2HUH9l5y61kdAV0AgU+w2fdCMNtHTTwnQgu6pDHCXzYhFnZByO8Xp1MjF8xVc
 A/1D5GZYRHoyCOX1clOIk5aiZ+yPm6oGi0XKB3wd6mjVReLSstTLmzfBl+4TuBE0kHrT
 1fftom3AvaaiIo5BigtE0YHh+wtguVEXUHRtQh0ALGJoe7qJNwdiVWiUGwz80urm+eQK
 LRLx+26wFY6WjTc2Zpi0wtqQOlu799sa3h3huOY/DuThoqOj8BDu1WDsflLYKlHA3mUU
 +wxwPIZPP/q2bkGOQSGqczuuIDSNX9Gg7yeg3UkvwHS502uo5s/ooS+/xWy4ippU9Qo0
 3jQw==
X-Gm-Message-State: AJIora9PlG2b/fqbY+X8ad0zeTcuhIDu3NfocTkKVv8JMnajErqW/vA2
 GvoAdq8MrqtWyMR1CpZbEPpprM1a+6Q2X0FQhrVdC72unlLXNLHd7W7TEnZXdMcbY4lgTnsvWbr
 fjRKFM0XWHotq7vLKR0yuUwxJ0shgC54=
X-Received: by 2002:a05:620a:2a13:b0:6b5:c197:d565 with SMTP id
 o19-20020a05620a2a1300b006b5c197d565mr10647625qkp.255.1658055712107; 
 Sun, 17 Jul 2022 04:01:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3qm+Z6qLenpRXoU5N5q5BWabwLgQJ+AMdsvvW8J89T115Ja0oIV5nLvGzOoDYZVack0Uy76iqYGn5zi/jm90=
X-Received: by 2002:a05:620a:2a13:b0:6b5:c197:d565 with SMTP id
 o19-20020a05620a2a1300b006b5c197d565mr10647603qkp.255.1658055711909; Sun, 17
 Jul 2022 04:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-8-eperezma@redhat.com>
In-Reply-To: <20220716113407.2730331-8-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Sun, 17 Jul 2022 13:01:15 +0200
Message-ID: <CAJaqyWesT4t=OSAKKnn5UQwJs0pZTYdhYeUhMDqtsWNBWjos7Q@mail.gmail.com>
Subject: Re: [RFC PATCH 07/12] vhost: Add VhostVDPAStartOp operation
To: qemu-level <qemu-devel@nongnu.org>
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Gautam Dawar <gdawar@xilinx.com>
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

On Sat, Jul 16, 2022 at 1:44 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> It allows to run commands at start of the device, before it have enabled
> any queue.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.h | 3 +++
>  include/hw/virtio/vhost-vdpa.h     | 5 +++++
>  hw/virtio/vhost-vdpa.c             | 8 ++++++++
>  3 files changed, 16 insertions(+)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-=
virtqueue.h
> index 03eb7ff670..210fe393cd 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -26,6 +26,8 @@ typedef struct SVQDescState {
>  } SVQDescState;
>
>  typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> +typedef int (*ShadowVirtQueueStart)(VhostShadowVirtqueue *svq,
> +                                    void *opaque);
>
>  /**
>   * Callback to handle an avail buffer.
> @@ -43,6 +45,7 @@ typedef int (*VirtQueueAvailCallback)(VhostShadowVirtqu=
eue *svq,
>                                        void *vq_callback_opaque);
>
>  typedef struct VhostShadowVirtqueueOps {
> +    ShadowVirtQueueStart start;
>      VirtQueueAvailCallback avail_handler;
>  } VhostShadowVirtqueueOps;
>

Changes above are leftovers, I'll remove them for the next version.


