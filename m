Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2977302849
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:58:26 +0100 (CET)
Received: from localhost ([::1]:53816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l45C6-0001j2-2D
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l45A6-0000Fd-E7
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:56:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l45A3-0004jr-C6
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611593777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9PuGU3boryDYXtn22F1+JKHBZsOioMF7eZu1KMV6b4=;
 b=aMnxczWgO4OUCdRjVDvj52kUYbBEc0PMyqW/4tvXQEPRsxn12dALTsh3P6u3I+mR0HNSqs
 c5XXybEObpSeeRl+8z45zu8TizSPjFZ4RBLpKkuSdwD7EoHCdVx1r9F4zMYxQvpiX/cvv5
 DOEAmwqm469ReQnlkyYV7vmF43U9tlI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-e4FEYCyEPTG5brTiMabW4A-1; Mon, 25 Jan 2021 11:56:12 -0500
X-MC-Unique: e4FEYCyEPTG5brTiMabW4A-1
Received: by mail-qk1-f200.google.com with SMTP id u9so10403444qkk.5
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 08:56:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H9PuGU3boryDYXtn22F1+JKHBZsOioMF7eZu1KMV6b4=;
 b=MY6j5vrAc8CTOB7OyXJP7oqZA24sdh8iu9vC7hAOw+Dt+JL/Br7EPEE1szCkB2ZwOo
 IchwyG8Aw1P0sLjzAxF1iXALKjaeV6oLHInwlRICVMyilm1Pz2QwO0SmW7ITwoIR6ZqT
 Ok62ZcUrtSl1UkqUUEMzi5HPYtCrB2R9TXSxPS9YHPRgAZtKgTIVgZVlkiYAyC3Ed6dR
 mQVQKSWo09yjG7vdeLxc7KaswEoH6/8W4DCqbExkQJ/6R3xGsRQLm8pMSpwqLDiIh6v9
 CkkNTdSQcMJmIG9tvOSFPe8WMwTb8/JmTlGyU1p5OAFSGBv7MdfvrGRr76Bahc+q2nib
 KNLg==
X-Gm-Message-State: AOAM531459ReUU8NqJXxiyA2vnhuz789NM4JrJDpYpOYtVuhDGvmW1RV
 Kg7afxv0z7E9H/zHG+HwS5Q2PLZr6vzyew3qeSr346oZh9pxFWnZ16IpSJnsM8rN39134oQsyzi
 JPCUNJqdLJ7jMQbWZi0jxWuJafZNBA8c=
X-Received: by 2002:ad4:580f:: with SMTP id dd15mr1613519qvb.40.1611593771635; 
 Mon, 25 Jan 2021 08:56:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx46H32gy9nxZBAGiSEP0ia+qyID5oLuk0guSi01nUl7bjDIS3NXIBtgQ+M0xVw5NXfl9eHYDHoYCsU+1BkhiE=
X-Received: by 2002:ad4:580f:: with SMTP id dd15mr1613491qvb.40.1611593771401; 
 Mon, 25 Jan 2021 08:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20210122200851.345259-1-eperezma@redhat.com>
 <65ea6f69-538f-7f2e-b2d9-bb0a110f004b@redhat.com>
In-Reply-To: <65ea6f69-538f-7f2e-b2d9-bb0a110f004b@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 25 Jan 2021 17:55:35 +0100
Message-ID: <CAJaqyWdYQH8O-WvLm4raWtWbhwz6BiC3ucGyi584BWALyy+UUA@mail.gmail.com>
Subject: Re: [PATCH] virtio: Add corresponding memory_listener_unregister to
 unrealize
To: Jason Wang <jasowang@redhat.com>
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
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 4:15 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/23 =E4=B8=8A=E5=8D=884:08, Eugenio P=C3=A9rez wrote:
> > Cannot destroy address spaces of IOMMU-aware virtio devices without it,
> > since they can contain memory listeners.
>
>
> It's better to explain why the one in finalize doesn't work here.
>

Hi Jason! Good point. The other call is at virtio_device_instance_finalize.

Function virtio_device_instance_finalize is called after
address_space_destroy if we follow steps of buglink.

Address_space_destroy is called by
pci_qdev_unrealize/do_pci_unregister_device, after call to
virtio_device_unrealize. After that call,
virtio_device_instance_finalize is called through object_deinit,
freeing the bus.

Also, memory_listener_unregister can be called again because it checks
for listener->address_space !=3D NULL at start, and sets it to NULL at
end.

In regular shutdown, nothing of this is called, so maybe we could
safely delete the call to memory_listener_unregister at
virtio_device_instance_finalize?

If not, should I send again the patch with a new commit message?

Thanks!

> Thanks
>
>
> >
> > Fixes: c611c76417f ("virtio: add MemoryListener to cache ring translati=
ons")
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1912846
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/virtio.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index b308026596..67efd2c301 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -3680,6 +3680,7 @@ static void virtio_device_unrealize(DeviceState *=
dev)
> >       VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >       VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_GET_CLASS(dev);
> >
> > +    memory_listener_unregister(&vdev->listener);
> >       virtio_bus_device_unplugged(vdev);
> >
> >       if (vdc->unrealize !=3D NULL) {
>


