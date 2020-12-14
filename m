Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F122D9D48
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:11:21 +0100 (CET)
Received: from localhost ([::1]:41194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1korNY-0007vS-7K
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1korDc-0005Xd-Gf
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:01:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1korDU-0004Ko-4S
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607965254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0B0YEDnoS8M0GXlt72UhVhZU/03A7MZBaySCY6cDkCI=;
 b=X1l+cwDe3Aa+F7mz59ZqhBYqdNn3lpNJu1sKHPSIHXQTgOWnX/k3h2u4GzO3k7T31EFwAZ
 RTTGwuWuVPG3WT0nWabjXama/dDbYug2Jpl+rGGevGeEOuB/breCSJpgg28yo89sOmMKKt
 demO75G83rNozIuaRvs0fM4eNJ7CicM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-7ofVFPZmMuK2pj4vvakPIw-1; Mon, 14 Dec 2020 12:00:53 -0500
X-MC-Unique: 7ofVFPZmMuK2pj4vvakPIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFA82612AD;
 Mon, 14 Dec 2020 17:00:50 +0000 (UTC)
Received: from gondolin (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1524470497;
 Mon, 14 Dec 2020 17:00:38 +0000 (UTC)
Date: Mon, 14 Dec 2020 18:00:36 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [for-6.0 v5 08/13] securable guest memory: Introduce sgm
 "ready" flag
Message-ID: <20201214180036.3837693e.cohuck@redhat.com>
In-Reply-To: <20201204054415.579042-9-david@gibson.dropbear.id.au>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-9-david@gibson.dropbear.id.au>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, berrange@redhat.com,
 thuth@redhat.com, pbonzini@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  4 Dec 2020 16:44:10 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> The platform specific details of mechanisms for implementing securable
> guest memory may require setup at various points during initialization.
> Thus, it's not really feasible to have a single sgm initialization hook,
> but instead each mechanism needs its own initialization calls in arch or
> machine specific code.
> 
> However, to make it harder to have a bug where a mechanism isn't properly
> initialized under some circumstances, we want to have a common place,
> relatively late in boot, where we verify that sgm has been initialized if
> it was requested.
> 
> This patch introduces a ready flag to the SecurableGuestMemory base type
> to accomplish this, which we verify just before the machine specific
> initialization function.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/core/machine.c                     | 8 ++++++++
>  include/exec/securable-guest-memory.h | 2 ++
>  target/i386/sev.c                     | 2 ++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 816ea3ae3e..a67a27d03c 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1155,6 +1155,14 @@ void machine_run_board_init(MachineState *machine)
>      }
>  
>      if (machine->sgm) {
> +        /*
> +         * Where securable guest memory is initialized depends on the
> +         * specific mechanism in use.  But, we need to make sure it's
> +         * ready by now.  If it isn't, that's a bug in the
> +         * implementation of that sgm mechanism.
> +         */
> +        assert(machine->sgm->ready);

Under which circumstances might we arrive here with 'ready' not set?

- programming error, setup is happening too late -> assert() seems
  appropriate
- we tried to set it up, but some error happened -> should we rely on
  the setup code to error out first? (i.e. we won't end up here, unless
  there's a programming error, in which case the assert() looks fine)
  Is there a possible use case for "we could not set it up, but we
  support an unsecured guest (as long as it is clear what happens)"?
  Likely only for guests that transition themselves, but one could
  argue that QEMU should simply be invoked a second time without the
  sgm stuff being specified in the error case.

> +
>          /*
>           * With securable guest memory, the host can't see the real
>           * contents of RAM, so there's no point in it trying to merge


