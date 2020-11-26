Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5FA2C5DB6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 23:12:18 +0100 (CET)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiPUv-0006eu-Br
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 17:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiPTh-0005tt-64
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:11:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiPTd-0004Zm-BO
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606428656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zjArGFcs2fBpuKvFj60RdR/IGn5T0XZSTIWxFGmiY/I=;
 b=W1A3x6IOOFDwU0SUn8P6HdYuXV8fa1Uotbs0WauBKHofLZoAMGThLCra+6wKrP/6vcb6WC
 N8xU1h2qTcU9SuTHphmfnUioOcUzGS1fay03deFPNPBQo0KvIYy5Ve8Vv9Y3aCCoDdpwuz
 9Sl+0Veix5fg3D9sNWENimZZ1Jyeeao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-_1X3yvC8NUiimNNmQld7rw-1; Thu, 26 Nov 2020 17:10:53 -0500
X-MC-Unique: _1X3yvC8NUiimNNmQld7rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90BCB1005D4D;
 Thu, 26 Nov 2020 22:10:51 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DD305D6AC;
 Thu, 26 Nov 2020 22:10:51 +0000 (UTC)
Date: Thu, 26 Nov 2020 17:10:49 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH 0/8] hvf: Implement Apple Silicon Support
Message-ID: <20201126221049.GS2271382@habkost.net>
References: <20201126215017.41156-1-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20201126215017.41156-1-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 10:50:09PM +0100, Alexander Graf wrote:
> Now that Apple Silicon is widely available, people are obviously excited
> to try and run virtualized workloads on them, such as Linux and Windows.
> 
> This patch set implements a rudimentary, first version to get the ball
> going on that. With this applied, I can successfully run both Linux and
> Windows as guests, albeit with a few caveats:
> 
>   * no WFI emulation, a vCPU always uses 100%
>   * vtimer handling is a bit hacky
>   * we handle most sysregs flying blindly, just returning 0
>   * XHCI breaks in OVMF, works in Linux+Windows
> 
> Despite those drawbacks, it's still an exciting place to start playing
> with the power of Apple Silicon.
> 
> Enjoy!
> 
> Alex
> 
> Alexander Graf (8):
>   hvf: Add hypervisor entitlement to output binaries
>   hvf: Move common code out
>   arm: Set PSCI to 0.2 for HVF
>   arm: Synchronize CPU on PSCI on
>   hvf: Add Apple Silicon support
>   hvf: Use OS provided vcpu kick function
>   arm: Add Hypervisor.framework build target
>   hw/arm/virt: Disable highmem when on hypervisor.framework
> 
>  MAINTAINERS                  |  14 +-
>  accel/hvf/entitlements.plist |   8 +
>  accel/hvf/hvf-all.c          |  56 ++++
>  accel/hvf/hvf-cpus.c         | 484 +++++++++++++++++++++++++++++++++++
>  accel/hvf/meson.build        |   7 +
>  accel/meson.build            |   1 +

This seems to conflict with the accel cleanup work being done by
Claudio[1].  Maybe Claudio could cherry-pick some of the code
movement patches from this series, or this series could be
rebased on top of his.

[1] https://lore.kernel.org/qemu-devel/20201124162210.8796-1-cfontana@suse.de

>  hw/arm/virt.c                |   9 +
>  include/hw/core/cpu.h        |   3 +-
>  include/sysemu/hvf_int.h     |  69 +++++
>  meson.build                  |  39 ++-
>  scripts/entitlement.sh       |  11 +
>  target/arm/arm-powerctl.c    |   3 +
>  target/arm/cpu.c             |   4 +
>  target/arm/hvf/hvf.c         | 345 +++++++++++++++++++++++++
>  target/arm/hvf/meson.build   |   3 +
>  target/arm/meson.build       |   2 +
>  target/i386/hvf/hvf-cpus.c   | 131 ----------
>  target/i386/hvf/hvf-cpus.h   |  25 --
>  target/i386/hvf/hvf-i386.h   |  48 +---
>  target/i386/hvf/hvf.c        | 360 +-------------------------
>  target/i386/hvf/meson.build  |   1 -
>  target/i386/hvf/x86hvf.c     |  11 +-
>  target/i386/hvf/x86hvf.h     |   2 -
>  23 files changed, 1061 insertions(+), 575 deletions(-)
>  create mode 100644 accel/hvf/entitlements.plist
>  create mode 100644 accel/hvf/hvf-all.c
>  create mode 100644 accel/hvf/hvf-cpus.c
>  create mode 100644 accel/hvf/meson.build
>  create mode 100644 include/sysemu/hvf_int.h
>  create mode 100755 scripts/entitlement.sh
>  create mode 100644 target/arm/hvf/hvf.c
>  create mode 100644 target/arm/hvf/meson.build
>  delete mode 100644 target/i386/hvf/hvf-cpus.c
>  delete mode 100644 target/i386/hvf/hvf-cpus.h
> 
> -- 
> 2.24.3 (Apple Git-128)
> 

-- 
Eduardo


