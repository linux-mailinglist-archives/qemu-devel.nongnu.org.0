Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BABD2D421C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 13:24:31 +0100 (CET)
Received: from localhost ([::1]:38820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmyWE-0004wf-6x
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 07:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kmySk-0003WW-Dy
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:20:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kmySi-0002mW-Dl
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:20:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607516450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02tquZiATMN/D94oqS1HgMSz6T4cchxv1MZSl+fk/68=;
 b=Ptv6WlCombD7SXxPNnrHWi1O0Z49VMlTL1hC7Lpy124LaRhscuv7DBZTl2mFQtOUXHoKoE
 /YH+i2qOM/svCqsRxHFDpakwKYud+sIcajoKktS8J6bbC8ENRUH6s1nvoj5ZBeuYuUo20k
 Hcztr/LK3gMPf011sCVbVIevrkA1EHM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-EeJjww5sND6RymDyPxWgLA-1; Wed, 09 Dec 2020 07:20:47 -0500
X-MC-Unique: EeJjww5sND6RymDyPxWgLA-1
Received: by mail-qk1-f198.google.com with SMTP id u17so879737qku.17
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 04:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=02tquZiATMN/D94oqS1HgMSz6T4cchxv1MZSl+fk/68=;
 b=fxfQ6fQK+BWSV06FoP7HpXCOWMuccD3ILVHu8pLpo9caAQ9tBwfKJ5Qin5SUvsMEKi
 /U71BrCY3wvApwE6YdgPq0kOOplArvUwsEmES5TAnSr33fJN9hP2oAtXqukOKeKJaJl1
 rmVUAjlrShte54eXlySU6643YbP6uj37xUn0w6XuRA3dbOHZqK4K/XHt9KDuIL6HyPW4
 2ardN7fw7qO/+ZU2q9N8ZryqodLI8+11/lfDSBsi/ZnrB+H6DaeAPCTfdCe7FtP9niku
 3L9dVXUGkVfpwo2Ix7ytTgjN39n2ODmBDYwPDLrvZg9XPhzkaR+tRx4BseOPGupxjfq5
 bC8g==
X-Gm-Message-State: AOAM532epqajwMGIhJL+KprBwnN+esq2BGPu0gB9mWKXmddnpHLM/sNJ
 0NmIONK/w3wrs4lOmcHEa2Ij7w8RlvGt5+CJvW/8v9on+2C1Fc8oINmz4UreW8/eDumPfb0UV7Z
 zndP1R6PZ7Ok6n8l+83k1CYdiKb0FClk=
X-Received: by 2002:a37:8485:: with SMTP id g127mr2590264qkd.233.1607516447503; 
 Wed, 09 Dec 2020 04:20:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxt/nrA+PEG+B8jRnIAdin9fm1aHeI7kL5mjtjcSfyl2llDTS9p8AJqVYo87tA8/xuhq3mMWO7Vd0gMqaadb3Y=
X-Received: by 2002:a37:8485:: with SMTP id g127mr2590212qkd.233.1607516447222; 
 Wed, 09 Dec 2020 04:20:47 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-3-eperezma@redhat.com>
 <20201207161938.GJ203660@stefanha-x1.localdomain>
In-Reply-To: <20201207161938.GJ203660@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 9 Dec 2020 13:20:10 +0100
Message-ID: <CAJaqyWcZ_LEu1OibCoG+couDPoOjDPQNLkoEppEat=jDP6zvxQ@mail.gmail.com>
Subject: Re: [RFC PATCH 02/27] vhost: Add device callback in
 vhost_migration_log
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 7, 2020 at 5:19 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, Nov 20, 2020 at 07:50:40PM +0100, Eugenio P=C3=A9rez wrote:
> > This allows code to reuse the logic to not to re-enable or re-disable
> > migration mechanisms. Code works the same way as before.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 2bd8cdf893..2adb2718c1 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -862,7 +862,9 @@ err_features:
> >      return r;
> >  }
> >
> > -static int vhost_migration_log(MemoryListener *listener, bool enable)
> > +static int vhost_migration_log(MemoryListener *listener,
> > +                               bool enable,
> > +                               int (*device_cb)(struct vhost_dev *, bo=
ol))
>
> Please document the argument. What is the callback function supposed to
> do ("device_cb" is not descriptive so I'm not sure)?

Sure, I will expand documentation if we stick with this approach to
enable/disable the shadow virtqueue (I hope we agree on a better one
anyway).

Just for completion, it was meant for vhost_dev_set_log, so vhost_dev*
is the device to enable/disable migration, and the second bool is for
enable/disable it.

Thanks!


