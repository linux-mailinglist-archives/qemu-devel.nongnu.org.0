Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA33033266F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:19:25 +0100 (CET)
Received: from localhost ([::1]:44588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcGi-00023G-IZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJbjw-0005C7-4T
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:45:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJbjs-0000Za-D5
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615293926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9iEvu4DS25inKP36gsRvCljH4wYCnN11Bn9bsq6N9VM=;
 b=Bid/oNaFzkgWXvNlQPg2XZI9oxMz2pEtOEYrOy+bXcnUjKo4gnYZ2v02oUh1wqCkKu+5KX
 hoV55UCQeqTAZGcahz74elU0DpEDNIj3DQO38Ez+p3YLV/GXVoasNimneObcF2CEX0rA72
 dOgEno0X76E4ImbQHQ7DaFnh+pZQUj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-T4Ywg3PqO_278fdYvPcAgg-1; Tue, 09 Mar 2021 07:45:24 -0500
X-MC-Unique: T4Ywg3PqO_278fdYvPcAgg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 487C7107465C;
 Tue,  9 Mar 2021 12:45:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-41.ams2.redhat.com
 [10.36.113.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C3F15C260;
 Tue,  9 Mar 2021 12:45:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2B7C518000A2; Tue,  9 Mar 2021 13:45:12 +0100 (CET)
Date: Tue, 9 Mar 2021 13:45:12 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v3 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210309124512.6goag5jblcje3umk@sirius.home.kraxel.org>
References: <20210302173544.3704179-1-pasic@linux.ibm.com>
 <20210305214603.GF3139005@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210305214603.GF3139005@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 05, 2021 at 04:46:03PM -0500, Eduardo Habkost wrote:
> On Tue, Mar 02, 2021 at 06:35:44PM +0100, Halil Pasic wrote:
> > Since the virtio-gpu-ccw device depends on the hw-display-virtio-gpu
> > module, which provides the type virtio-gpu-device, packaging the
> > hw-display-virtio-gpu module as a separate package that may or may not
> > be installed along with the qemu package leads to problems. Namely if
> > the hw-display-virtio-gpu is absent, qemu continues to advertise
> > virtio-gpu-ccw, but it aborts not only when one attempts using
> > virtio-gpu-ccw, but also when libvirtd's capability probing tries
> > to instantiate the type to introspect it.
> > 
> > Let us thus introduce a module named hw-s390x-virtio-gpu-ccw that
> > is going to provide the virtio-gpu-ccw device. The hw-s390x prefix
> > was chosen because it is not a portable device. Because registering
> > virtio-gpu-ccw would make non-s390x emulator fail due to a missing
> > parent type, if built as a module, before registering it, we check
> > if the ancestor types are already registered.
> 
> I don't understand what makes it necessary to make the
> type_register() call conditional.  Calling type_register() before
> the parent types are registered is perfectly valid.

Well, yes, in a non-modular world this will work perfectly fine.  We
only compile objects actually supported into the system emulator.

With modular builds we have the situation that we have shared modules
which may or may not work in specific system emulators, for example
hw-display-virtio-gpu-pci.so or the ccw module added by this patch,
because the given system emulator doesn't provide the needed support.
We have some which don't support pci (avr for example).  Likewise ccw
is supported by s390x only.

When loading the ccw module into a non-s390x the object initialization
fails due to the missing parent object and we run into an assert.

Loading a pci module into a non-pci system emulator would have an
simliar effect, except that those modules don't load in the first
place due to missing symbol references for pci_* functions.

So we are looking for some way to deal with the situation, i.e.
avoid failing type initialization (we could also catch type
initialitation failues, but there are *lots* if places in qemu ...).
So not registering a type where we know it will fail is the idea here,
taking advantage of the fact that in case of modules the types are
actually loaded and initialized in order, so if the parent type isn't
present at registration time it wouldn't show up later.

Hmm, while thinking about it, a completely different idea:  Maybe add
explicit symbol references instead?  i.e. add "have_$feature = 1"
variables (either unconditionally, or only for the cases where we don't
have symbol references anyway), then reference them in modules needing
the feature like this:

	if (have_bus_ccw) {
		type_register(&type_virtio_gpu_ccw);
	}

take care,
  Gerd


