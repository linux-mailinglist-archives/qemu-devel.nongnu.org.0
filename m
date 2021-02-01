Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB4B30A858
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 14:10:03 +0100 (CET)
Received: from localhost ([::1]:54714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Yxu-0003jY-8H
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 08:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l6Yvb-0002uE-QW
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:07:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l6YvV-0003AS-LE
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612184851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNzMxf+fTW4hamb1PZKuDHdfW3iofxV//N4sc7S+ygk=;
 b=Srwgw4miURHyDpSDglrxWDLQKtSU/mI1O6v8I21gAUJNy7rqKC390a/26dx0ZEBZEgY7LG
 znGtpzl6lWS6ksxQkxv4kQ+dRaF60LBR2xhTRCtpndIQtCF+zAixYVqbaSdjHLMKaFHbIb
 IV8d7SnlaBboZr0pKWcJKtcD9ZQ/0FE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-eEhlYMBKMsynVsVluWobyA-1; Mon, 01 Feb 2021 08:07:29 -0500
X-MC-Unique: eEhlYMBKMsynVsVluWobyA-1
Received: by mail-qk1-f197.google.com with SMTP id k126so13192977qkf.8
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 05:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yNzMxf+fTW4hamb1PZKuDHdfW3iofxV//N4sc7S+ygk=;
 b=QXM098B2hm+NRw2eBp2OXvNA8KKRULAsDDE4IodFJtIl7TKsdi8uVfquzktEWgiTP9
 S6THrABM9oqFrJsrtQxjD++u87JSVlg/JzQ/9IFF+aQXijojBeEpsz/wZ8ngFE1yfoih
 I864gshicqPeI9WMnloIhPsOsSwgUbpTGWdqjcZNGF4Qmf2NCceRM0BQXegqcLnzxY9I
 E45rx82RL2mG4XYSLb3iOisG3lttgq8yiWgua5Hyzb+DPx3JxCtlgUJVMn5o38rBXC9e
 BVM/T2QC/G3ISDkyaVYJHqcthYlIgMFa0M8aqbWr207jtirQkI4BYYt43G1kUBSYgpKw
 FdzA==
X-Gm-Message-State: AOAM530rBX62+24bQOvMA97ueokt+VPvHMSZlhaLlEm/s4EG5NzdQPin
 8HcrvWlBCpQcAtmuqgdkxeHLQ4kfYDyuBFtxUAqwd0rLajQJCEgNwdMySHD5IQQOOT8ajH1aVSu
 TrroPIppTCdea81ex8inoVDvz4Hkj4Xo=
X-Received: by 2002:a37:87c5:: with SMTP id
 j188mr15521682qkd.210.1612184849479; 
 Mon, 01 Feb 2021 05:07:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmu3EYsjGmnGvjTXEbE5oJ0FXyiqnU6NHtQsyfMb9pd2wuKSRU5h+mbmOFl3sRhA7kr9jHNyednRl+Q7b++U0=
X-Received: by 2002:a37:87c5:: with SMTP id
 j188mr15521663qkd.210.1612184849222; 
 Mon, 01 Feb 2021 05:07:29 -0800 (PST)
MIME-Version: 1.0
References: <20210129090728.831208-1-eperezma@redhat.com>
 <20210201115954.6v6ga7ledlumeby4@steredhat>
In-Reply-To: <20210201115954.6v6ga7ledlumeby4@steredhat>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Feb 2021 14:06:53 +0100
Message-ID: <CAJaqyWferxXcOXftXz8Oz0VunZ7oSh6zc1QdrM8VOnNbFqN1Pw@mail.gmail.com>
Subject: Re: [PATCH] vhost: Check for valid vdev in
 vhost_backend_handle_iotlb_msg
To: Stefano Garzarella <sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 1, 2021 at 1:00 PM Stefano Garzarella <sgarzare@redhat.com> wro=
te:
>
> On Fri, Jan 29, 2021 at 10:07:28AM +0100, Eugenio P=C3=A9rez wrote:
> >Not checking this can lead to invalid dev->vdev member access in
> >vhost_device_iotlb_miss if backend issue an iotlb message in a bad
> >timing, either maliciously or by a bug.
> >
> >Reproduced rebooting a guest with testpmd in txonly forward mode.
> > #0  0x0000559ffff94394 in vhost_device_iotlb_miss (
> >     dev=3Ddev@entry=3D0x55a0012f6680, iova=3D10245279744, write=3D1)
> >     at ../hw/virtio/vhost.c:1013
> > #1  0x0000559ffff9ac31 in vhost_backend_handle_iotlb_msg (
> >     imsg=3D0x7ffddcfd32c0, dev=3D0x55a0012f6680)
> >     at ../hw/virtio/vhost-backend.c:411
> > #2  vhost_backend_handle_iotlb_msg (dev=3Ddev@entry=3D0x55a0012f6680,
> >     imsg=3Dimsg@entry=3D0x7ffddcfd32c0)
> >     at ../hw/virtio/vhost-backend.c:404
> > #3  0x0000559fffeded7b in slave_read (opaque=3D0x55a0012f6680)
> >     at ../hw/virtio/vhost-user.c:1464
> > #4  0x000055a0000c541b in aio_dispatch_handler (
> >     ctx=3Dctx@entry=3D0x55a0010a2120, node=3D0x55a0012d9e00)
> >     at ../util/aio-posix.c:329
> >
> >Fixes: 6dcdd06e3b ("spec/vhost-user spec: Add IOMMU support")
>
> I'm not sure but IIUC vhost_backend_handle_iotlb_msg() was introduced by
> commit 020e571b8b, so maybe is better this 'Fixes' line:
>
> Fixes: 020e571b8b ("vhost: rework IOTLB messaging")
>

Hi Stefano.

Thanks for reviewing it :). Actually yes, you are right, I carried the
previous Fixes line by mistake.

Should I send a new patch?

Thanks!


> >Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >---
> > hw/virtio/vhost-backend.c | 5 +++++
> > 1 file changed, 5 insertions(+)
> >
> >diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> >index 222bbcc62d..31b33bde37 100644
> >--- a/hw/virtio/vhost-backend.c
> >+++ b/hw/virtio/vhost-backend.c
> >@@ -406,6 +406,11 @@ int vhost_backend_handle_iotlb_msg(struct vhost_dev=
 *dev,
> > {
> >     int ret =3D 0;
> >
> >+    if (unlikely(!dev->vdev)) {
> >+        error_report("Unexpected IOTLB message when virtio device is st=
opped");
> >+        return -EINVAL;
> >+    }
> >+
> >     switch (imsg->type) {
> >     case VHOST_IOTLB_MISS:
> >         ret =3D vhost_device_iotlb_miss(dev, imsg->iova,
> >--
> >2.27.0
> >
> >
>
> The patch LGTM:
>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>


