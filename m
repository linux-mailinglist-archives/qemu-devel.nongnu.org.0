Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3456730F4B3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:14:40 +0100 (CET)
Received: from localhost ([::1]:36548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fP5-0002QC-8U
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l7fFE-000842-7c
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:04:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l7fFC-0001OE-Fr
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612447465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bot6oNq3akYET9Qz1geOxoVnvn33F8XsA2z7Wz1GLms=;
 b=EBWJN5L4hUrmsXNiK9tzYJptlGFGnQvP32AlKNXhMdA2K3rgkfo/9V/OqRoL0ueOR8sAjo
 YdiXv23NHJRE/46AoP37UJZ/ay2qirix9e6ZNmD2YfoCj2qOeVpKTSHgB0jodD11L+d2vS
 U1c6t5+gcv8mkmN6BufGYRy/yA2Hmy8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-t0uQuDGiMpuT4D6zwnUXfg-1; Thu, 04 Feb 2021 09:04:24 -0500
X-MC-Unique: t0uQuDGiMpuT4D6zwnUXfg-1
Received: by mail-qv1-f72.google.com with SMTP id e17so2244995qvo.9
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 06:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bot6oNq3akYET9Qz1geOxoVnvn33F8XsA2z7Wz1GLms=;
 b=FY0WCWLM9vUzfdWH0gvKR/tv4NahDYYKfIWUtQjtebcJrBEpocZxHZSk45xDCBG0yu
 6w+GOeqBQWQ+Rgaf8rLr1+ckOcFLuMr3IqShHaHd2Z4PfdM2rzUu3ATHEamEQeYIE+9n
 GRZIj3QEIC9cen+ubRqf2kn1eb6WlzPx4OOSCjU5mB3WQL6f9NeA1+E1bVEwVGP/VHeg
 jnDKqDRaPVQEiV9ZkqUGGvXfx+XtvYxnahQD9X8e3MDWiAsLmlo0Wrl8z6gvBpQ1glG6
 YfXDec6xAtYBNI7KDBiVK7QXUI2PvIk1G3n6EIuvhZ5x1Ed9unz9sAA/GgkHa4YR8C87
 fc3g==
X-Gm-Message-State: AOAM530ASIAtVFxnJd6i62jmn4hakdTjxQqRuaCNrTvbp/j6bSRKmxk2
 R2CbHvC1XmALgZnPF88W9eQaWsy5VTGfVbwku5QPYV1aKd9k9LhnakbK1FefaRwhpoFL8GSnXjY
 62WHlSX2ndFXEthR6kB6IeyanPGkpEgs=
X-Received: by 2002:a37:88b:: with SMTP id 133mr7379531qki.425.1612447463860; 
 Thu, 04 Feb 2021 06:04:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxP69UQNpCi9bWnB2SmzoehMDCbE5KUzaFs24k5MKQSCLG0cgVNqSvWZQs+oe7DonQWVXAx7kOw1S1WDDSBamc=
X-Received: by 2002:a37:88b:: with SMTP id 133mr7379494qki.425.1612447463654; 
 Thu, 04 Feb 2021 06:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-9-eperezma@redhat.com>
 <4ab76cf6-401b-97de-6154-2e025cb1ebc6@redhat.com>
 <CAJaqyWc5_nmniTDsjCCpJpERvMq5RsB0xebeNuP8=oVnHQkovg@mail.gmail.com>
 <87v9b8hvul.fsf@dusky.pond.sub.org>
In-Reply-To: <87v9b8hvul.fsf@dusky.pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 4 Feb 2021 15:03:46 +0100
Message-ID: <CAJaqyWedzsfmUg63mfmgGL6FCdePiWBjz+ZZkgrD=1B=8YkipA@mail.gmail.com>
Subject: Re: [RFC 08/10] vhost: Add x-vhost-enable-shadow-vq qmp
To: Markus Armbruster <armbru@redhat.com>
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Rob Miller <rob.miller@broadcom.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 4, 2021 at 1:16 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Eugenio Perez Martin <eperezma@redhat.com> writes:
>
> > On Tue, Feb 2, 2021 at 4:38 PM Eric Blake <eblake@redhat.com> wrote:
> >>
> >> On 1/29/21 2:54 PM, Eugenio P=C3=A9rez wrote:
> [...]
> >> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >> > index 040f68ff2e..42836e45f3 100644
> >> > --- a/hw/virtio/vhost.c
> >> > +++ b/hw/virtio/vhost.c
> >> > @@ -15,6 +15,7 @@
> >> >
> >> >  #include "qemu/osdep.h"
> >> >  #include "qapi/error.h"
> >> > +#include "qapi/qapi-commands-net.h"
> >> >  #include "hw/virtio/vhost.h"
> >> >  #include "qemu/atomic.h"
> >> >  #include "qemu/range.h"
> >> > @@ -1841,3 +1842,8 @@ int vhost_net_set_backend(struct vhost_dev *hd=
ev,
> >> >
> >> >      return -1;
> >> >  }
> >> > +
> >> > +void qmp_x_vhost_enable_shadow_vq(const char *name, bool enable, Er=
ror **errp)
> >> > +{
> >> > +    error_setg(errp, "Shadow virtqueue still not implemented.");
> >>
> >> error_setg() should not be passed a trailing '.'.
> >>
> >
> > Oh, sorry I missed the comment in the error_setg doc.
> >
> > I copy&pasted from the call to error_setg "Migration disabled: vhost
> > lacks VHOST_F_LOG_ALL feature.". I'm wondering if it's a good moment
> > to delete the dot there too, since other tools could depend on parsing
> > it.
>
> It's pretty much always a good moment for patches improving error
> messages :)
>

Great, changing it too :).

Thanks!


