Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A74242A563
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 15:20:16 +0200 (CEST)
Received: from localhost ([::1]:51698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maHhW-0007Zg-2K
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 09:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maHY2-0003Vc-4W
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maHXz-0004ke-Gs
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634044220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6KMfTRk5RczZ0PnbZWRpl29bQ0RqbCziFmmN6NJ82o=;
 b=EILyXqJS63DyRSbUY8g/DnzJLDE8gSfPH+zsyyYQ4UZGb0X2FtxB4dNlBMxrHSrG/FxLZ/
 KJh3YmpCgVOnT5NpklrcCtJRQli9Jbwpnw8v4sVYYoBeuy/lztPSvcX2pdydVBhs8Pw5GZ
 UM5eOJVC56Fdesy82uENURbjh2UcvKE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-3Lnsa0ekO-u9hQqE8n8wGA-1; Tue, 12 Oct 2021 09:10:19 -0400
X-MC-Unique: 3Lnsa0ekO-u9hQqE8n8wGA-1
Received: by mail-qv1-f69.google.com with SMTP id
 o90-20020a0c85e3000000b0038310a20003so16878739qva.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 06:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o6KMfTRk5RczZ0PnbZWRpl29bQ0RqbCziFmmN6NJ82o=;
 b=PiP7HdrAct372YQ8EQ2VOScjpKMZ9r3qz41rgnk26sVO7Snxh6VLYueoggsceotQ+r
 0+c+jINwrGTlLPmGn+7HAL8RRkrkDVhDkV8SUR+yeXnsWL/msg5BcThFp1no52BOstuu
 FtZXx6KgSTLYKbS0WzApJTWadGspuIr9WMVPgd0jaXfp/XAsxkxXNmsdkhuNv2wTOw6S
 8+iwdiXPzjlpK5r91dsTb8tHav45odxLs6fb1wBd32hPnEfIWfIhNV0d9tYTVM4hXYoa
 PfAW9aFK6AnCWon1mQibZzKkj2UuD08ChJoEIgEzDsoNCope/hgEb81Gf/JkjVIzfmxx
 dbrQ==
X-Gm-Message-State: AOAM533bogHUZcQX51OAMuS8b4RHCDC0UnP/8A1p6mzdOEcU5tbYTbf/
 p6B6PO0pLr28n84CZmuSCaRbUkEKrwzoAfQ6AHeMgJstuAliip+CwwIACdS0WydM/tecQmXz6oX
 t5EmzOomOaKZofVgj+6YhUbr+PiOLos4=
X-Received: by 2002:aed:3022:: with SMTP id 31mr22561696qte.322.1634044218925; 
 Tue, 12 Oct 2021 06:10:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNxmzHkshQj2x8o+3V+WUaVI2Z7lwZHyXTDABQJ2zgQeU0KhXcyBYd0W5H71MB8rtZ3HXbmnojhgx5A9898i0=
X-Received: by 2002:aed:3022:: with SMTP id 31mr22561649qte.322.1634044218588; 
 Tue, 12 Oct 2021 06:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-9-eperezma@redhat.com>
 <8735p6hlae.fsf@dusky.pond.sub.org>
In-Reply-To: <8735p6hlae.fsf@dusky.pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 12 Oct 2021 15:09:42 +0200
Message-ID: <CAJaqyWf+tO8irEGBNXB4yN0Af86YKCpfb5efd6zQ1GVfTiC2cw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 08/20] vhost: Route guest->host notification
 through shadow virtqueue
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 7:20 AM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>
> > Shadow virtqueue notifications forwarding is disabled when vhost_dev
> > stops, so code flow follows usual cleanup.
> >
> > Also, host notifiers must be disabled at SVQ start, and they will not
> > start if SVQ has been enabled when device is stopped. This is trivial
> > to address, but it is left out for simplicity at this moment.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  qapi/net.json                      |   2 +-
> >  hw/virtio/vhost-shadow-virtqueue.h |   8 ++
> >  include/hw/virtio/vhost-vdpa.h     |   4 +
> >  hw/virtio/vhost-shadow-virtqueue.c | 138 ++++++++++++++++++++++++++++-
> >  hw/virtio/vhost-vdpa.c             | 116 +++++++++++++++++++++++-
> >  5 files changed, 264 insertions(+), 4 deletions(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index a2c30fd455..fe546b0e7c 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -88,7 +88,7 @@
> >  #
> >  # @enable: true to use the alternate shadow VQ notifications
> >  #
> > -# Returns: Always error, since SVQ is not implemented at the moment.
> > +# Returns: Error if failure, or 'no error' for success.
>
> Delete the whole line, please.
>

I will do it.

Thanks!


> >  #
> >  # Since: 6.2
> >  #
> [...]
>


