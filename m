Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCD732E778
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:56:28 +0100 (CET)
Received: from localhost ([::1]:37408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI94F-0005cP-MS
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lI931-0004b2-96
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:55:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lI92y-0002sT-6d
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614945307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njzlrDbrDTt3PT7n5vh/BZWBaXp6NQZY7jeu59DCR6g=;
 b=iz+3UHSu9QdsHlSD0U5ilwZzDmH+1usZbXCuv7imlmW63HlhtDaGpGZN3fdcRZyqRcykKf
 3ropomodSFzZIC4BH/hq7mcelh1cK2RtBKQMBCqsnuPdWyz5kFMWS6SHe5ZWiDbwAlf6sB
 UTFJbk71a3IUha5TS7WBGSA5GncG5c8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-UNrnUwC1M2iiXr2SvZc0PA-1; Fri, 05 Mar 2021 06:55:03 -0500
X-MC-Unique: UNrnUwC1M2iiXr2SvZc0PA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 527386973A;
 Fri,  5 Mar 2021 11:55:02 +0000 (UTC)
Received: from gondolin (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9443C5D71D;
 Fri,  5 Mar 2021 11:54:44 +0000 (UTC)
Date: Fri, 5 Mar 2021 12:54:42 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210305125442.6c582681.cohuck@redhat.com>
In-Reply-To: <20210302173544.3704179-1-pasic@linux.ibm.com>
References: <20210302173544.3704179-1-pasic@linux.ibm.com>
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
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  2 Mar 2021 18:35:44 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> Since the virtio-gpu-ccw device depends on the hw-display-virtio-gpu
> module, which provides the type virtio-gpu-device, packaging the
> hw-display-virtio-gpu module as a separate package that may or may not
> be installed along with the qemu package leads to problems. Namely if
> the hw-display-virtio-gpu is absent, qemu continues to advertise
> virtio-gpu-ccw, but it aborts not only when one attempts using
> virtio-gpu-ccw, but also when libvirtd's capability probing tries
> to instantiate the type to introspect it.
> 
> Let us thus introduce a module named hw-s390x-virtio-gpu-ccw that
> is going to provide the virtio-gpu-ccw device. The hw-s390x prefix
> was chosen because it is not a portable device. Because registering
> virtio-gpu-ccw would make non-s390x emulator fail due to a missing
> parent type, if built as a module, before registering it, we check
> if the ancestor types are already registered.
> 
> With virtio-gpu-ccw built as a module, the correct way to package a
> modularized qemu is to require that hw-display-virtio-gpu must be
> installed whenever the module hw-s390x-virtio-gpu-ccw.
> 
> The definition S390_ADAPTER_SUPPRESSIBLE was moved to "cpu.h", per
> suggestion of Thomas Huth. From interface design perspective, IMHO, not
> a good thing as it belongs to the public interface of
> css_register_io_adapters(). We did this because CONFIG_KVM requeires
> NEED_CPU_H and Thomas, and other commenters did not like the
> consequences of that.
> 
> Moving the interrupt related declarations to s390_flic.h was suggested
> by Cornelia Huck.
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> ---
> 
> As explained in [1] the previous idea of type_register_mayfail() does
> not work. The next best thing is to check if all types we need are
> already registered before registering virtio-gpu-ccw from the module. It
> is reasonable to assume that when the module is loaded, the ancestors
> are already registered (which is not the case if the device is a
> built in one).
> 
> The alternatives to this approch I could identify are:
> * A poor mans version of this which checks for the parent
> * Emulator specific modules:
>   * An emulator specific directory within the modules directory which
>     is ignored by the other emulators.
>   * A way to tell the shared util library the name of this directory,
>     and the code to check it if set.
>   * Build hw-s390x-virtio-gpu-ccw so it lands in this special directory
>     in the build tree, and install it there as well.
>   I've spend some time with looking into this, but I came to the
>   conclusion that the two latter points look hairy.
> 
> [1] https://lore.kernel.org/qemu-devel/20210222125548.346166-1-pasic@linux.ibm.com/T/#maf0608df5479f87b23606f01f732740d2617b458
> ---
>  hw/s390x/meson.build         |  7 ++++-
>  hw/s390x/virtio-ccw-gpu.c    |  5 ++++
>  include/hw/s390x/css.h       |  7 -----
>  include/hw/s390x/s390_flic.h |  3 +++
>  include/qom/object.h         | 10 ++++++++
>  qom/object.c                 | 50 ++++++++++++++++++++++++++++++++++++
>  target/s390x/cpu.h           |  9 ++++---
>  util/module.c                |  1 +
>  8 files changed, 81 insertions(+), 11 deletions(-)

The s390x part looks fine, but I'm not that well versed in the object
and module stuff...


