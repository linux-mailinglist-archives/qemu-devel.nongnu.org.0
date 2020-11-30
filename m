Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9E22C7F5F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 08:56:54 +0100 (CET)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kje3J-0005iJ-4K
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 02:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kje1W-0005Bm-4r
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 02:55:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kje1T-000365-EJ
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 02:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606722896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfYEN4na3C3FMqwMo6LNjQ8k4ZCO0qa7qNB5nkxkM6o=;
 b=XEl7iqI3DAeA8AKUnM4dGpQ+oBDQzvSUExnupTNieRh/8JSJhihdjqSnEZkmOzYsPdOiPf
 tN2IG2w04FGFNJ8eGeMDYbfZFWQfbpqZDVOBsWkSA9fUuth0uyWI7kCAShDXqE4k4K7xZa
 5MFex9szYZ6VUJLKUOLgkLgaKrjvlAw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-uO27YCBVP_OjUdJv2xdGPw-1; Mon, 30 Nov 2020 02:54:54 -0500
X-MC-Unique: uO27YCBVP_OjUdJv2xdGPw-1
Received: by mail-qk1-f199.google.com with SMTP id w189so8974984qkd.6
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 23:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cfYEN4na3C3FMqwMo6LNjQ8k4ZCO0qa7qNB5nkxkM6o=;
 b=MxSEtbvqhBn5YVrvrkw5GdX0bNqXSEnyFcWbBRF0yg0/Mg8ngZJHup7ZHiN0kSS3b/
 XqyPxSq9z7B4oTcVtBu0xdg9DfXhSK3wIdShpz/3OwNkbzIJ3xEK2cGQrObKGgwTZmoK
 HQJZ5fbellVyC01sjAXvf/T0LczPpOcIzDxBPZwaKHEAEcb1JtVei+Tg7UjNKvV/+CxH
 UiTkcok5Ouq0N0HzdnElBslbyGZh7urzSISzvN+fLirk93Bo+qW82m8qgtdbyTGh/yau
 KhJZJ8yr1PQ1ku0Ar6FIeNzE5jvzAKpGuzL6eGcsWqoSjkEesv+vZMK2DlZ+Lf4ZCNEN
 2FKA==
X-Gm-Message-State: AOAM531GOClL5JnmSG/uv/Cq7OlMfi+xAu5p4MKj83kf85sKL7xxB5MP
 nfxBvT9n50G+2+7nCEd+Q+vNmHvHkHSeMa6Pn0NB7Txz64Q54/0DmAuYeIJsaycSs8LJprNi0PH
 uxWWtI4wSMFi0cEm+s+Eyo5qguk0N46I=
X-Received: by 2002:a05:620a:132d:: with SMTP id
 p13mr21768042qkj.233.1606722894181; 
 Sun, 29 Nov 2020 23:54:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuzkTzTp2p3vGrFooseaaNhC8uI+tyCQrxfu6y0WFvPSKipLD0ddM5+y6Pgg0Pf6Qwpznddv7mfYMwakFsfAA=
X-Received: by 2002:a05:620a:132d:: with SMTP id
 p13mr21768001qkj.233.1606722893979; 
 Sun, 29 Nov 2020 23:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-24-eperezma@redhat.com>
 <20201127152901.cbfu7rmewbxventr@steredhat>
In-Reply-To: <20201127152901.cbfu7rmewbxventr@steredhat>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 30 Nov 2020 08:54:18 +0100
Message-ID: <CAJaqyWe+u+ZPSeMr7ZLHYGbqRhH=YZxE8zrMamTQFxrSLgb3sA@mail.gmail.com>
Subject: Re: [RFC PATCH 23/27] vhost: unmap qemu's shadow virtqueues on sw
 live migration
To: Stefano Garzarella <sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Howard Cai <howard.cai@gmail.com>,
 Parav Pandit <parav@mellanox.com>, vm <vmireyno@marvell.com>,
 Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 4:29 PM Stefano Garzarella <sgarzare@redhat.com> wr=
ote:
>
> On Fri, Nov 20, 2020 at 07:51:01PM +0100, Eugenio P=C3=83=C2=A9rez wrote:
> >Since vhost does not need to access it, it has no sense to keep it
> >mapped.
> >
> >Signed-off-by: Eugenio P=C3=83=C2=A9rez <eperezma@redhat.com>
> >---
> > hw/virtio/vhost.c | 1 +
> > 1 file changed, 1 insertion(+)
> >
> >diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >index f640d4edf0..eebfac4455 100644
> >--- a/hw/virtio/vhost.c
> >+++ b/hw/virtio/vhost.c
> >@@ -1124,6 +1124,7 @@ static int vhost_sw_live_migration_start(struct vh=
ost_dev *dev)
> >
> >         dev->sw_lm_shadow_vq[idx] =3D vhost_sw_lm_shadow_vq(dev, idx);
> >         event_notifier_set_handler(&vq->masked_notifier, vhost_handle_c=
all);
> >+        vhost_virtqueue_memory_unmap(dev, &dev->vqs[idx], true);
>
> IIUC vhost_virtqueue_memory_unmap() is already called at the end of
> vhost_virtqueue_stop(), so we can skip this call, right?
>

You are totally right Stefano, thanks for the catch!

> >
> >         vhost_vring_write_addr(dev->sw_lm_shadow_vq[idx], &addr);
> >         r =3D dev->vhost_ops->vhost_set_vring_addr(dev, &addr);
> >-- 2.18.4
> >
>


