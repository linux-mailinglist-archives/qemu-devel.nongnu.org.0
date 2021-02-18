Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799A431EA18
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 13:58:43 +0100 (CET)
Received: from localhost ([::1]:43498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCitG-0002y0-03
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 07:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lCirY-00025e-Ua
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 07:56:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lCirT-0007jM-Qk
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 07:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613653008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1VbTbq7RE7QflOTgfWAj5S/o8+kZqaQBuc8WmXPl0s=;
 b=OVvFgg+CXpz9G+SBRh6aqeqlucpIMVsi3T/EBBwMOPycoFqrNmAUHYeRGMDA2HL/ao3ucJ
 3XhpE+ykGmXXIUsYJytkXWrkO4Q3w03zCgY49iKFyEQQxUfu+21p62sPDBfq9mKaBfEkoK
 ZCussxBgaowaaAoDY1j5TpNaToAjq9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-lLnMvLxzMnGAT-cksitYfA-1; Thu, 18 Feb 2021 07:56:46 -0500
X-MC-Unique: lLnMvLxzMnGAT-cksitYfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EB266D4E6;
 Thu, 18 Feb 2021 12:56:44 +0000 (UTC)
Received: from gondolin (ovpn-113-63.ams2.redhat.com [10.36.113.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DB085D6A1;
 Thu, 18 Feb 2021 12:56:21 +0000 (UTC)
Date: Thu, 18 Feb 2021 13:56:18 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210218135618.06532573.cohuck@redhat.com>
In-Reply-To: <20210218113438.3fe80078.pasic@linux.ibm.com>
References: <20210218022227.979741-1-pasic@linux.ibm.com>
 <6c0f5acf-9ebb-ba04-1389-c6690796a6ad@redhat.com>
 <20210218113438.3fe80078.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 11:34:38 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Thu, 18 Feb 2021 10:23:16 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
> > > Since the virtio-gpu-ccw device depends on the hw-display-virtio-gpu
> > > module, which provides the type virtio-gpu-device, packaging the
> > > hw-display-virtio-gpu module as a separate package that may or may not
> > > be installed along with the qemu package leads to problems. Namely if
> > > the hw-display-virtio-gpu is absent, qemu continues to advertise
> > > virtio-gpu-ccw, but it aborts not only when one attempts using
> > > virtio-gpu-ccw, but also when libvirtd's capability probing tries
> > > to instantiate the type to introspect it.
> > > 
> > > Let us thus introduce a module named hw-s390x-virtio-gpu-ccw that
> > > is going to provide the virtio-gpu-ccw device. The hw-s390x prefix
> > > was chosen because it is not a portable device.
> > > 
> > > With virtio-gpu-ccw built as a module, the correct way to package a
> > > modularized qemu is to require that hw-display-virtio-gpu must be
> > > installed whenever the module hw-s390x-virtio-gpu-ccw.
> > > 
> > > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > > ---
> > >   hw/s390x/meson.build | 17 ++++++++++++++++-
> > >   util/module.c        |  1 +
> > >   2 files changed, 17 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> > > index 2a7818d94b..153b1309fb 100644
> > > --- a/hw/s390x/meson.build
> > > +++ b/hw/s390x/meson.build
> > > @@ -34,7 +34,6 @@ virtio_ss.add(files('virtio-ccw.c'))
> > >   virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-ccw-balloon.c'))
> > >   virtio_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-ccw-blk.c'))
> > >   virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-ccw-crypto.c'))
> > > -virtio_ss.add(when: 'CONFIG_VIRTIO_GPU', if_true: files('virtio-ccw-gpu.c'))
> > >   virtio_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-ccw-input.c'))
> > >   virtio_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-ccw-net.c'))
> > >   virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-ccw-rng.c'))
> > > @@ -46,3 +45,19 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-ccw.c'
> > >   s390x_ss.add_all(when: 'CONFIG_VIRTIO_CCW', if_true: virtio_ss)
> > >   
> > >   hw_arch += {'s390x': s390x_ss}
> > > +
> > > +if target.startswith('s390x')
> > > +  hw_s390x_modules = {}
> > > +
> > > +  hw_s390x_modules_c_args = ['-DNEED_CPU_H',
> > > +	      '-DCONFIG_TARGET="@0@-config-target.h"'.format(target)]
> > > +  hw_s390x_modules_inc = [include_directories('../../target' / config_target['TARGET_BASE_ARCH'])]
> > > +  hw_s390x_modules_dependencies = declare_dependency(
> > > +	       include_directories: hw_s390x_modules_inc, compile_args: hw_s390x_modules_c_args)    
> > 
> > Basically the patch looks fine to me, but I wonder why all that above lines 
> > (related to hw_s390x_modules_dependencies) are requred at all? The other 
> > display modules in hw/display/meson.build also do not need to re-define 
> > c_args for example?  
> 
> The explanation is simple. Unlike most devices, the ccw devices aren't
> portable. In particular both css.c and css.h includes "cpu.h", and
> virtio-ccw-gpu.c includes "qemu/osdep.h". Furthermore osdep.h contains:
> #ifdef NEED_CPU_H
> #include CONFIG_TARGET
> #else
> #include "exec/poison.h"
> #endif
> so if we don't have NEED_CPU_H, among others CONFIG_KVM is poisoned, and
> CONFIG_KVM is used in "css.h". Frankly, I can't tell under what circumstances
> does css need "cpu.h". 

s390_crw_mchk() and s390_io_interrupt() are in cpu.h. Nowadays, they
use the flic to inject interrupts; but their earlier implementations
had a dummy cpu state.

I'm wondering whether s390_flic.h is a better place for functions
injecting floating interrupts, now that we don't have the non-flic
support anymore.

> I managed to build the s390x-softmmu target
> without it, but decided to put it back. Regarding "osdep.h", I just
> assumed includes are done the way they are done for a good reason. Maybe
> the includes can be changed in a way that the things you ask about become
> unnecessary, but with the code as is they are necessary. Try to drop them
> and check out what happens.
> 
> Regards,
> Halil
> 


