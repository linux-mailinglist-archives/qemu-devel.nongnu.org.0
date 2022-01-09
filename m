Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE5A488B7C
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 19:04:03 +0100 (CET)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6cXy-0008IZ-HM
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 13:04:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6cVY-00072d-Dt
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 13:01:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6cVV-0004qK-BD
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 13:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641751281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPVOYgcOe9bAS0/fkl8DgVEMWGUYJmHzuKfjssa+GjA=;
 b=PMHfuZv4gfowmNiA0bPZFX34tSRjN90zB1pgnPAEZOCwkNshffndxWNA9cyLOldA2lK6ad
 4ChgnRGbVTMJk+uxn3Ux2cw+LPakp82LPG+BHnLRdKTP2Tq+llXvmnqyWcWG8KWcvmt3UX
 Oq2FmLe2paAk8PaL41I44Htl2oCP02I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-5omBkH6_MlS3aHgL8loFqg-1; Sun, 09 Jan 2022 13:01:20 -0500
X-MC-Unique: 5omBkH6_MlS3aHgL8loFqg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r65-20020a1c4444000000b003478a458f01so3998065wma.4
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 10:01:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pPVOYgcOe9bAS0/fkl8DgVEMWGUYJmHzuKfjssa+GjA=;
 b=QE+/QYVhh8sJLfzMSDeSWjTe9yKuVHqYY6MvSZ2iCSH7eAnwcIYIEg2eijojqu9YfE
 TIfqb6WPsJmr3zMli2fNIq+czvO9yxlqO4MIXyvbfRuOL5UcAUX4NomKhGJ5oxp3bnQl
 TjOFFCCOfC2cR3uSEH0r/5Q8Eh6Vnr2SlDxCpAIqAdjWPHBIMwLVCLrtIzHWEpMSXsow
 +lKukAhTuvqK7w6gfCwxuPFNcO9p9ahxojz5iZwYkpKmPNW1Svlc7DI6vKiYJyCTLgz3
 g8zAnzQDL8q/AMuAO4EEE8c58SW236aCxpiJd0/gqfSYgXx+g47ff1rfW8dq8xQnfocP
 5ZEw==
X-Gm-Message-State: AOAM532rzOtLT++eAfEdSf28cCFozzkaEw+RNquDXAFW7WNtI9ED7cBj
 zJhZppGp0v5uMrroUSE8XUWCloR9kmOwo0jN3l7c2Ku0MsKf/M/3GliYS/nM5BY1LIkC9ux4KaT
 olGkAAdLJpardz0k=
X-Received: by 2002:a5d:6c6b:: with SMTP id r11mr59615665wrz.548.1641751279072; 
 Sun, 09 Jan 2022 10:01:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/N3C+wu6Hoq7PgHBxDdim5tl7npSdVyJD6U4BjpSmdvBxg3dlj0qoq8u5njv/5oXdL9Wk1Q==
X-Received: by 2002:a5d:6c6b:: with SMTP id r11mr59615654wrz.548.1641751278876; 
 Sun, 09 Jan 2022 10:01:18 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:c07a:cd29:1c16:894b:6b07])
 by smtp.gmail.com with ESMTPSA id q8sm2946357wrz.66.2022.01.09.10.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 10:01:18 -0800 (PST)
Date: Sun, 9 Jan 2022 13:01:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Volker =?iso-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PULL v3 12/55] virtio-pci: add support for configure interrupt
Message-ID: <20220109125933-mutt-send-email-mst@kernel.org>
References: <20220108003423.15830-1-mst@redhat.com>
 <20220108003423.15830-13-mst@redhat.com>
 <2ebfb2e7-bd51-d5ee-7e17-7cec59a0f0d5@t-online.de>
 <20220109110613-mutt-send-email-mst@kernel.org>
 <75f376c9-e1bb-297e-50f1-0934b8cae022@t-online.de>
MIME-Version: 1.0
In-Reply-To: <75f376c9-e1bb-297e-50f1-0934b8cae022@t-online.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 09, 2022 at 06:52:28PM +0100, Volker Rümelin wrote:
> Am 09.01.22 um 17:11 schrieb Michael S. Tsirkin:
> > On Sun, Jan 09, 2022 at 07:17:30AM +0100, Volker Rümelin wrote:
> > > Hi,
> > > 
> > > > From: Cindy Lu <lulu@redhat.com>
> > > > 
> > > > Add support for configure interrupt, The process is used kvm_irqfd_assign
> > > > to set the gsi to kernel. When the configure notifier was signal by
> > > > host, qemu will inject a msix interrupt to guest
> > > > 
> > > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > > > Message-Id: <20211104164827.21911-11-lulu@redhat.com>
> > > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >    hw/virtio/virtio-pci.h |  4 +-
> > > >    hw/virtio/virtio-pci.c | 92 ++++++++++++++++++++++++++++++++++++------
> > > >    2 files changed, 83 insertions(+), 13 deletions(-)
> > > > 
> > > Since this commit I see the following warnings.
> > > 
> > > With -drive
> > > if=virtio,id=disk1,file=/srv/cdimg/Linux/images/opensuse.qcow2,discard=unmap
> > > 
> > > qemu-system-x86_64: virtio-blk failed to set guest notifier (-16), ensure
> > > -accel kvm is set.
> > > qemu-system-x86_64: virtio_bus_start_ioeventfd: failed. Fallback to
> > > userspace (slower).
> > > 
> > > With libvirt
> > >      <controller type='pci' index='1' model='pcie-root-port'>
> > >        <address type='pci' domain='0x0000' bus='0x00' slot='0x1c'
> > > function='0'
> > >         multifunction='on'/>
> > >      </controller>
> > >      <controller type='pci' index='2' model='pcie-root-port'>
> > >        <address type='pci' domain='0x0000' bus='0x00' slot='0x1c'
> > > function='1'/>
> > >      </controller>
> > >      <controller type='scsi' index='0' model='virtio-scsi'>
> > >        <driver queues='4'/>
> > >        <address type='pci' domain='0x0000' bus='0x01' slot='0x00'
> > > function='0'/>
> > >      </controller>
> > >      <disk type='block' device='disk'>
> > >        <driver name='qemu' type='raw' cache='none' discard='unmap'
> > > io='io_uring'/>
> > >        <source dev='/dev/vgtmp/lnxpowerm1'/>
> > >        <target dev='sda' bus='scsi'/>
> > >        <address type='drive' controller='0' bus='0' unit='0'/>
> > >        <boot order='1'/>
> > >      </disk>
> > > 
> > > 2022-01-08T17:45:26.911491Z qemu-system-x86_64: virtio-scsi: Failed to set
> > > guest notifiers (-16), ensure -accel kvm is set.
> > > 2022-01-08T17:45:26.911505Z qemu-system-x86_64: virtio_bus_start_ioeventfd:
> > > failed. Fallback to userspace (slower).
> > > 
> > > The messages appear around the time the Linux guest initializes the drivers.
> > > 
> > > With best regards,
> > > Volker
> > I guess it's a host that has an oldish kernel?
> 
> It's an openSUSE 5.3.18 frankenstein kernel.
> 
> > Does the following help?
> > 
> 
> No.
> 
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index 98fb5493ae..b77cd69f97 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -1130,15 +1130,15 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
> >               proxy->vector_irqfd =
> >                   g_malloc0(sizeof(*proxy->vector_irqfd) *
> >                             msix_nr_vectors_allocated(&proxy->pci_dev));
> > +            r = kvm_virtio_pci_vector_config_use(proxy);
> > +            if (r < 0) {
> > +                goto config_error;
> > +            }
> >               r = kvm_virtio_pci_vector_use(proxy, nvqs);
> >               if (r < 0) {
> >                   goto config_assign_error;
> >               }
> >           }
> > -        r = kvm_virtio_pci_vector_config_use(proxy);
> > -        if (r < 0) {
> > -            goto config_error;
> > -        }
> >           r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
> >                                         virtio_pci_vector_mask,
> >                                         virtio_pci_vector_poll);
> 
> With and without this patch msix_set_vector_notifiers() returns -16.


EBUSY

strace? did a syscall return this?

> > @@ -1155,7 +1155,9 @@ notifiers_error:
> >           kvm_virtio_pci_vector_release(proxy, nvqs);
> >       }
> >   config_error:
> > -    kvm_virtio_pci_vector_config_release(proxy);
> > +    if (with_irqfd) {
> > +        kvm_virtio_pci_vector_config_release(proxy);
> > +    }
> >   config_assign_error:
> >       virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, !assign,
> >                                     with_irqfd);


