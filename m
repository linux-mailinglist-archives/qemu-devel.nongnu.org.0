Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519293B322E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 17:03:20 +0200 (CEST)
Received: from localhost ([::1]:46742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQsx-0001NW-3K
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 11:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwQrx-0000iH-Ft
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 11:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwQrv-0002zJ-Oi
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 11:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624546935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z9W/rOufi/IaYBDMpFJr0RR7IZvuTD5/SifYiQvRQg4=;
 b=ZZJHPVQQ0wH605Cdg8gKDqbEukOyl+f8SNhsEKooCtyyptOD1rEeer5Z0ycPcMxeW9GR55
 oHDy1Tc9b5iWaBwp64fDQkNTQJogUPDOQIn+bbaiIeKYIOGDhpr8n5i3q6gpSvruMxK3Z9
 OGaTspO59RTt3rbdHYfz9X43YqxWwV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-IkctkmLsMMCdxYDF-7FJvA-1; Thu, 24 Jun 2021 11:01:49 -0400
X-MC-Unique: IkctkmLsMMCdxYDF-7FJvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C00CF195D564;
 Thu, 24 Jun 2021 15:01:46 +0000 (UTC)
Received: from work-vm (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AFD95D6AB;
 Thu, 24 Jun 2021 15:01:27 +0000 (UTC)
Date: Thu, 24 Jun 2021 16:01:25 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 00/34] modules: add meta-data database
Message-ID: <YNSeRVV+vejFd9Vw@work-vm>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Gerd Hoffmann (kraxel@redhat.com) wrote:
> This patch series adds support for module meta-data.  Today this is
> either hard-coded in qemu (see qemu_load_module_for_opts) or handled
> with manually maintained lists in util/module (see module_deps[] and
> qom_modules[]).  This series replaced that scheme with annotation
> macros, so the meta-data can go into the module source code and -- for
> example -- the module_obj() annotations can go next to the TypeInfo
> struct for the object class.

So this is slightly off-topic for the series; but kind of relevant,
but...
Is there a way to inhibit module loading after a given point?

I ask, because there's a fairly well known security escalation that
takes advantage of NSS loading of PAM modules; typically you have
your nice sandboxed application, you write out your nasty .so into the
sandbox and then somehow get your application to trigger the PAM module
load.
Now, what stops the same attack here?

Dave

> Patches 1-3 put the infrastructure in place:  Add the annotation macros,
> add a script to collect the meta-data, add a script to compile the
> meta-data into C source code which we can then add to qemu.
> 
> Patch 4 - check module dependencies (Jose, new in v4).
> 
> Patches 5-13 add annotations macros to the modules we have.
> 
> Patches 14-16 put the modinfo database into use and remove the
> module_deps[] and qom_modules[] lists.
> 
> Patch 16 adds two tracepoints for easier trouble-shooting.
> 
> Patches 18-20 add support for target-specific modules.
> 
> Patches 21-24 add documentation for all of the above (new in v4, was
> separate series).
> 
> Patches 25-29 start building accelerators modular.  So far it is
> only qtest (all archs) and a small fraction of tcg (x86 only).
> 
> Patches 30-34 add support for registering hmp commands so they can
> be implemented as module (new in v4, was separate series).
> 
> take care,
>   Gerd
> 
> Gerd Hoffmann (33):
>   modules: add modinfo macros
>   modules: collect module meta-data
>   modules: generate modinfo.c
>   modules: add qxl module annotations
>   modules: add virtio-gpu module annotations
>   modules: add chardev module annotations
>   modules: add audio module annotations
>   modules: add usb-redir module annotations
>   modules: add ccid module annotations
>   modules: add ui module annotations
>   modules: add s390x module annotations
>   modules: add block module annotations
>   modules: use modinfo for dependencies
>   modules: use modinfo for qom load
>   modules: use modinfo for qemu opts load
>   modules: add tracepoints
>   modules: check arch and block load on mismatch
>   modules: check arch on qom lookup
>   modules: target-specific module build infrastructure
>   modules: add documentation for module sourcesets
>   modules: add module_obj() note to QOM docs
>   modules: module.h kerneldoc annotations
>   modules: hook up modules.h to docs build
>   accel: autoload modules
>   accel: add qtest module annotations
>   accel: build qtest modular
>   accel: add tcg module annotations
>   accel: build tcg modular
>   monitor: allow register hmp commands
>   usb: drop usb_host_dev_is_scsi_storage hook
>   monitor/usb: register 'info usbhost' dynamically
>   usb: build usb-host as module
>   monitor/tcg: move tcg hmp commands to accel/tcg, register them
>     dynamically
> 
> Jose R. Ziviani (1):
>   modules: check if all dependencies can be satisfied
> 
>  scripts/modinfo-collect.py      |  67 +++++++++++
>  scripts/modinfo-generate.py     |  97 ++++++++++++++++
>  include/hw/usb.h                |   7 +-
>  include/monitor/monitor.h       |   3 +
>  include/qemu/module.h           |  74 ++++++++++++
>  accel/accel-common.c            |   2 +-
>  accel/accel-softmmu.c           |   2 +-
>  accel/qtest/qtest.c             |   2 +
>  accel/tcg/hmp.c                 |  29 +++++
>  accel/tcg/tcg-accel-ops.c       |   1 +
>  accel/tcg/tcg-all.c             |   1 +
>  audio/spiceaudio.c              |   2 +
>  block/iscsi-opts.c              |   1 +
>  chardev/baum.c                  |   1 +
>  chardev/spice.c                 |   4 +
>  hw/display/qxl.c                |   4 +
>  hw/display/vhost-user-gpu-pci.c |   1 +
>  hw/display/vhost-user-gpu.c     |   1 +
>  hw/display/vhost-user-vga.c     |   1 +
>  hw/display/virtio-gpu-base.c    |   1 +
>  hw/display/virtio-gpu-gl.c      |   3 +
>  hw/display/virtio-gpu-pci-gl.c  |   3 +
>  hw/display/virtio-gpu-pci.c     |   2 +
>  hw/display/virtio-gpu.c         |   1 +
>  hw/display/virtio-vga-gl.c      |   3 +
>  hw/display/virtio-vga.c         |   2 +
>  hw/ppc/spapr.c                  |   2 +-
>  hw/s390x/virtio-ccw-gpu.c       |   3 +
>  hw/usb/ccid-card-emulated.c     |   1 +
>  hw/usb/ccid-card-passthru.c     |   1 +
>  hw/usb/dev-storage-bot.c        |   1 +
>  hw/usb/dev-storage-classic.c    |   1 +
>  hw/usb/dev-uas.c                |   1 +
>  hw/usb/host-libusb.c            |  38 ++----
>  hw/usb/host-stub.c              |  45 -------
>  hw/usb/redirect.c               |   1 +
>  monitor/hmp.c                   |   7 ++
>  monitor/misc.c                  |  34 +++---
>  softmmu/vl.c                    |  24 ++--
>  stubs/module-opts.c             |   4 -
>  ui/egl-headless.c               |   4 +
>  ui/gtk.c                        |   4 +
>  ui/sdl2.c                       |   4 +
>  ui/spice-app.c                  |   3 +
>  ui/spice-core.c                 |   5 +
>  util/module.c                   | 200 ++++++++++++++++++--------------
>  accel/qtest/meson.build         |   8 +-
>  accel/tcg/meson.build           |   6 +-
>  docs/devel/build-system.rst     |  17 +++
>  docs/devel/index.rst            |   1 +
>  docs/devel/modules.rst          |   5 +
>  docs/devel/qom.rst              |   8 ++
>  hmp-commands-info.hx            |   3 -
>  hw/usb/meson.build              |  10 +-
>  meson.build                     |  82 +++++++++++++
>  util/trace-events               |   4 +
>  56 files changed, 624 insertions(+), 218 deletions(-)
>  create mode 100755 scripts/modinfo-collect.py
>  create mode 100755 scripts/modinfo-generate.py
>  create mode 100644 accel/tcg/hmp.c
>  delete mode 100644 hw/usb/host-stub.c
>  create mode 100644 docs/devel/modules.rst
> 
> -- 
> 2.31.1
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


