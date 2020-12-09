Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1172D487A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:01:49 +0100 (CET)
Received: from localhost ([::1]:60182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3me-0003Cr-IA
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn3iu-0001RA-8P
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn3is-0004g9-Jv
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:57:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607536674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/TyFuiiN7T8ztg3J+dkXREgPHoexWcv0xcyj6tH0TjY=;
 b=iEeAxQxUZUWWmjUDgxPI7QAFNgHbyqwA1P0M1iWJHHVWitWMLBaV+u3YdTGOUFJrvYlu35
 jvB1J4eYrW124d8DllYnGBH89Woi/E99njj+GG/5/p9vpPj9egLWo1UZ0ThPObrereogZS
 4U+E6JB/PXIeUlKnZVuuzG14B58cItQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-VRSBibu6NG-jfTJK_hI7_g-1; Wed, 09 Dec 2020 12:57:50 -0500
X-MC-Unique: VRSBibu6NG-jfTJK_hI7_g-1
Received: by mail-qt1-f197.google.com with SMTP id v9so1794367qtw.12
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/TyFuiiN7T8ztg3J+dkXREgPHoexWcv0xcyj6tH0TjY=;
 b=N9RnyIHcPNR/oZD7SR3Jmacoxu28+CBlfSuiDGIwZ9RSKVbLwPlDuxY72d9XE2tLNj
 d6A2iWN8zpE7GC4aKjz86xYOgTrAoo4oa759ymEzFkRp3NP7us9zk+gfoWwG2nBl4NI5
 TX4Z/aQTpdK9hW60cjgiAu6z5akzGJ3h7oigtmL+Kcc2XbqU72a40VF2ZKEQYe7gG0yg
 imRB4RLXlxYLVKdLC/7gZTmfnpmbXaedI/VCpi1zsdmGOnYEAU0sTAkSFogtALR7OTmA
 27kzvLN3ZDbudu35hhr/bsL668oyFSBdRCZ8NzsAPJiaWRkQvwETkARBSaK/5tyGpprn
 2u8A==
X-Gm-Message-State: AOAM5335zz222ZhRnjkPQwWmwUtAuuang1c2uNhHrqcArYS4uqFUGQ1r
 524MphCSm1LVYsoZGoScAvSCs5tFGeJItfvNqgxkdriTEOIwcnuo+ZjA2cCketowof92sb9E2af
 xhQDbrhIN9KegNixFXqE7CBdbTa3l9MM=
X-Received: by 2002:a37:b987:: with SMTP id j129mr1641823qkf.131.1607536669867; 
 Wed, 09 Dec 2020 09:57:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPk1684Ru5rlDYOwl7BoAgTKuEcvaEAnSF0249oHQ/8MPs97gHSBbXi1zddK6zsparPuktdrs4tC120cCgL0c=
X-Received: by 2002:a37:b987:: with SMTP id j129mr1641779qkf.131.1607536669584; 
 Wed, 09 Dec 2020 09:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-9-eperezma@redhat.com>
 <20201208072051.GO203660@stefanha-x1.localdomain>
In-Reply-To: <20201208072051.GO203660@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 9 Dec 2020 18:57:12 +0100
Message-ID: <CAJaqyWeYV8jmXOFcvoB9LzY471KzWGT=iX+emB=O+GzWqDUjOw@mail.gmail.com>
Subject: Re: [RFC PATCH 08/27] vhost: Add a flag for software assisted Live
 Migration
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Dec 8, 2020 at 8:21 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, Nov 20, 2020 at 07:50:46PM +0100, Eugenio P=C3=A9rez wrote:
> > @@ -1571,6 +1577,13 @@ void vhost_dev_disable_notifiers(struct vhost_de=
v *hdev, VirtIODevice *vdev)
> >      BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> >      int i, r;
> >
> > +    if (hdev->sw_lm_enabled) {
> > +        /* We've been called after migration is completed, so no need =
to
> > +           disable it again
> > +        */
> > +        return;
> > +    }
> > +
> >      for (i =3D 0; i < hdev->nvqs; ++i) {
> >          r =3D virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_=
index + i,
> >                                           false);
>
> What is the purpose of this?

It is again a quick hack to get shadow_vq POC working. Again, it
deserves a better comment :).

If I recall correctly, vhost-net calls vhost_dev_disable_notifiers
again on destruction, and it calls to memory_region_del_eventfd, then
virtio_pci_ioeventfd_assign, which is not safe to call again because
of the i !=3D mr->ioeventfd_nb assertion.

The right fix for this should be either in virtio-pci (more generic,
but not sure if calling it again is the expected semantic of it),
individual vhost devices (less generic) or where it is at this moment,
but with the right comment.

Thanks!


