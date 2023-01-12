Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449FB66718C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:04:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwIx-0007mm-UJ; Thu, 12 Jan 2023 07:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFwIZ-0007Ns-86
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFwIX-0003EU-6e
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673524988;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=A1S8oagK+OmCaCCRKTqwkjbTVJtpuqKSC2zdNhDLc8E=;
 b=NFkdxq95uKwFFDXTjlwt+0YCZLZN4TJFDb1bHQeYafuiwO6GTPfD9MLHoT+lslKFNk16vs
 fpKVL8tSkNEWi8vl8ZSxa5hf2uuJKtIcUaSgpT0v/Wl98wMuQx1nq7vgtGgGoS0m1D+fk+
 auf7mFA3ChnVvkVMUNQlgny2NIwsGI8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-wqd-U0ZhPp6H7UtVMoWi6g-1; Thu, 12 Jan 2023 07:03:07 -0500
X-MC-Unique: wqd-U0ZhPp6H7UtVMoWi6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F4881C00417;
 Thu, 12 Jan 2023 12:03:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82ECB40ED784;
 Thu, 12 Jan 2023 12:03:03 +0000 (UTC)
Date: Thu, 12 Jan 2023 12:03:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 pasic@linux.ibm.com, richard.henderson@linaro.org, david@redhat.com,
 thuth@redhat.com, cohuck@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, kvm@vger.kernel.org, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 seiden@linux.ibm.com, nrb@linux.ibm.com, scgl@linux.ibm.com,
 frankja@linux.ibm.com, clg@kaod.org
Subject: Re: [PATCH v14 08/11] qapi/s390/cpu topology:  change-topology
 monitor command
Message-ID: <Y7/29cONlVoKukIP@redhat.com>
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-9-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105145313.168489-9-pmorel@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 05, 2023 at 03:53:10PM +0100, Pierre Morel wrote:
> The modification of the CPU attributes are done through a monitor
> commands.
> 
> It allows to move the core inside the topology tree to optimise
> the cache usage in the case the host's hypervizor previously
> moved the CPU.
> 
> The same command allows to modifiy the CPU attributes modifiers
> like polarization entitlement and the dedicated attribute to notify
> the guest if the host admin modified scheduling or dedication of a vCPU.
> 
> With this knowledge the guest has the possibility to optimize the
> usage of the vCPUs.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  qapi/machine-target.json |  29 ++++++++
>  include/monitor/hmp.h    |   1 +
>  hw/s390x/cpu-topology.c  | 141 +++++++++++++++++++++++++++++++++++++++
>  hmp-commands.hx          |  16 +++++
>  4 files changed, 187 insertions(+)
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index 2e267fa458..75b0aa254d 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -342,3 +342,32 @@
>                     'TARGET_S390X',
>                     'TARGET_MIPS',
>                     'TARGET_LOONGARCH64' ] } }
> +
> +##
> +# @change-topology:
> +#
> +# @core: the vCPU ID to be moved
> +# @socket: the destination socket where to move the vCPU
> +# @book: the destination book where to move the vCPU
> +# @drawer: the destination drawer where to move the vCPU

This movement can be done while the guest OS is running ?
What happens to guest OS apps ? Every I know will read
topology once and assume it never changes at runtime.

What's the use case for wanting to re-arrange topology in
this manner ? It feels like its going to be a recipe for
hard to diagnose problems, as much code in libvirt and apps
above will assuming the vCPU IDs are assigned sequentially
starting from node=0,book=0,drawer=0,socket=0,core=0,
incrementing core, then incrementing socket, then
incrementing drawer, etc.

> +# @polarity: optional polarity, default is last polarity set by the guest
> +# @dedicated: optional, if the vCPU is dedicated to a real CPU
> +#
> +# Modifies the topology by moving the CPU inside the topology
> +# tree or by changing a modifier attribute of a CPU.
> +#
> +# Returns: Nothing on success, the reason on failure.
> +#
> +# Since: <next qemu stable release, eg. 1.0>
> +##
> +{ 'command': 'change-topology',

'set-cpu-topology'

> +  'data': {
> +      'core': 'int',
> +      'socket': 'int',
> +      'book': 'int',
> +      'drawer': 'int',
> +      '*polarity': 'int',
> +      '*dedicated': 'bool'
> +  },
> +  'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM' ] }
> +}


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


