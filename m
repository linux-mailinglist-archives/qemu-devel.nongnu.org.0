Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15482CEB59
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 10:52:04 +0100 (CET)
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl7kx-0005Ey-RL
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 04:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kl7jO-0004KW-Nd
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 04:50:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kl7jM-0007YJ-QN
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 04:50:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607075424;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ft/KvADNPiSTXMbQ4XO9Hd43L+YE8RFLJA/kVVbksb0=;
 b=PtTcTAcCZDc9LbDza/iynYGR+V2bcfaMoiOGSLD//M74ZYUPgqgTr+HM/2q36fm7QtVtAZ
 //KL5eqxhM5Crp+L8YvnDkACi4Y/kCT+BXz6OHQ5Bsb0+mdHnmD2KFx3cL5ZzoTnBsFc6M
 kXLFx91MvW68S/lxdpmwe76TW5VzNRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-xYF4ljvZNainVXmhOc2mBA-1; Fri, 04 Dec 2020 04:50:22 -0500
X-MC-Unique: xYF4ljvZNainVXmhOc2mBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11B5310054FF;
 Fri,  4 Dec 2020 09:50:20 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE5DA620D7;
 Fri,  4 Dec 2020 09:50:07 +0000 (UTC)
Date: Fri, 4 Dec 2020 09:50:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [for-6.0 v5 00/13] Generalize memory encryption models
Message-ID: <20201204095005.GB3056135@redhat.com>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201204054415.579042-1-david@gibson.dropbear.id.au>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: pair@us.ibm.com, cohuck@redhat.com, brijesh.singh@amd.com,
 frankja@linux.ibm.com, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, thuth@redhat.com,
 pbonzini@redhat.com, rth@twiddle.net, mdroth@linux.vnet.ibm.com,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 04, 2020 at 04:44:02PM +1100, David Gibson wrote:
> A number of hardware platforms are implementing mechanisms whereby the
> hypervisor does not have unfettered access to guest memory, in order
> to mitigate the security impact of a compromised hypervisor.
> 
> AMD's SEV implements this with in-cpu memory encryption, and Intel has
> its own memory encryption mechanism.  POWER has an upcoming mechanism
> to accomplish this in a different way, using a new memory protection
> level plus a small trusted ultravisor.  s390 also has a protected
> execution environment.
> 
> The current code (committed or draft) for these features has each
> platform's version configured entirely differently.  That doesn't seem
> ideal for users, or particularly for management layers.
> 
> AMD SEV introduces a notionally generic machine option
> "machine-encryption", but it doesn't actually cover any cases other
> than SEV.
> 
> This series is a proposal to at least partially unify configuration
> for these mechanisms, by renaming and generalizing AMD's
> "memory-encryption" property.  It is replaced by a
> "securable-guest-memory" property pointing to a platform specific
> object which configures and manages the specific details.

There's no docs updated or added in this series.

docs/amd-memory-encryption.txt needs an update at least, and
there ought to be a doc added describing how this series is
to be used for s390/ppc 


>  accel/kvm/kvm-all.c                   |  39 +------
>  accel/kvm/sev-stub.c                  |  10 +-
>  accel/stubs/kvm-stub.c                |  10 --
>  backends/meson.build                  |   1 +
>  backends/securable-guest-memory.c     |  30 +++++
>  hw/core/machine.c                     |  71 ++++++++++--
>  hw/i386/pc_sysfw.c                    |   6 +-
>  hw/ppc/meson.build                    |   1 +
>  hw/ppc/pef.c                          | 124 +++++++++++++++++++++
>  hw/ppc/spapr.c                        |  10 ++
>  hw/s390x/pv.c                         |  58 ++++++++++
>  include/exec/securable-guest-memory.h |  86 +++++++++++++++
>  include/hw/boards.h                   |   2 +-
>  include/hw/ppc/pef.h                  |  26 +++++
>  include/hw/s390x/pv.h                 |   1 +
>  include/qemu/typedefs.h               |   1 +
>  include/qom/object.h                  |   3 +-
>  include/sysemu/kvm.h                  |  17 ---
>  include/sysemu/sev.h                  |   5 +-
>  qom/object.c                          |   4 +-
>  softmmu/vl.c                          |  16 ++-
>  target/i386/kvm.c                     |  12 ++
>  target/i386/monitor.c                 |   1 -
>  target/i386/sev.c                     | 153 ++++++++++++--------------
>  target/ppc/kvm.c                      |  18 ---
>  target/ppc/kvm_ppc.h                  |   6 -
>  target/s390x/kvm.c                    |   3 +
>  27 files changed, 510 insertions(+), 204 deletions(-)
>  create mode 100644 backends/securable-guest-memory.c
>  create mode 100644 hw/ppc/pef.c
>  create mode 100644 include/exec/securable-guest-memory.h
>  create mode 100644 include/hw/ppc/pef.h

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


