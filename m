Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3AB6671B7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:11:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwPk-0003TT-Ii; Thu, 12 Jan 2023 07:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFwPi-0003Sw-0S
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:10:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFwPg-0005LZ-41
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673525431;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=m7ctaQSqwJCI8HWipVGgCP7kRuDp6u50d7Qpz/siyqg=;
 b=boYypGOIer8qnRi+GRIu8AkzfJuZBhyI9ghZkP/36s9AxEwJwldCiTcSNso17lGpenySgG
 9FNNx1/x2HPeTVOaZhE1EGDgzKwyNrcbvDq3R4YkyrwaI1c7Kkb6F+2gzQB0Ys4/7+86b+
 sK/UT5IvW86ohYT6ic92lYuSE8x/+9E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-6czC9ptYO4qvkpmqbRPPwg-1; Thu, 12 Jan 2023 07:10:28 -0500
X-MC-Unique: 6czC9ptYO4qvkpmqbRPPwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D3C4802C1C;
 Thu, 12 Jan 2023 12:10:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC12E140EBF5;
 Thu, 12 Jan 2023 12:10:24 +0000 (UTC)
Date: Thu, 12 Jan 2023 12:10:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 pasic@linux.ibm.com, richard.henderson@linaro.org, david@redhat.com,
 thuth@redhat.com, cohuck@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, kvm@vger.kernel.org, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 seiden@linux.ibm.com, nrb@linux.ibm.com, scgl@linux.ibm.com,
 frankja@linux.ibm.com, clg@kaod.org
Subject: Re: [PATCH v14 09/11] qapi/s390/cpu topology: monitor query topology
 information
Message-ID: <Y7/4rm9JYihUpLS1@redhat.com>
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-10-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105145313.168489-10-pmorel@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jan 05, 2023 at 03:53:11PM +0100, Pierre Morel wrote:
> Reporting the current topology informations to the admin through
> the QEMU monitor.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  qapi/machine-target.json | 66 ++++++++++++++++++++++++++++++++++
>  include/monitor/hmp.h    |  1 +
>  hw/s390x/cpu-topology.c  | 76 ++++++++++++++++++++++++++++++++++++++++
>  hmp-commands-info.hx     | 16 +++++++++
>  4 files changed, 159 insertions(+)
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index 75b0aa254d..927618a78f 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -371,3 +371,69 @@
>    },
>    'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM' ] }
>  }
> +
> +##
> +# @S390CpuTopology:
> +#
> +# CPU Topology information
> +#
> +# @drawer: the destination drawer where to move the vCPU
> +#
> +# @book: the destination book where to move the vCPU
> +#
> +# @socket: the destination socket where to move the vCPU
> +#
> +# @polarity: optional polarity, default is last polarity set by the guest
> +#
> +# @dedicated: optional, if the vCPU is dedicated to a real CPU
> +#
> +# @origin: offset of the first bit of the core mask
> +#
> +# @mask: mask of the cores sharing the same topology
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'S390CpuTopology',
> +  'data': {
> +      'drawer': 'int',
> +      'book': 'int',
> +      'socket': 'int',
> +      'polarity': 'int',
> +      'dedicated': 'bool',
> +      'origin': 'int',
> +      'mask': 'str'
> +  },
> +  'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM' ] }
> +}
> +
> +##
> +# @query-topology:
> +#
> +# Return information about CPU Topology
> +#
> +# Returns a @CpuTopology instance describing the CPU Toplogy
> +# being currently used by QEMU.
> +#
> +# Since: 8.0
> +#
> +# Example:
> +#
> +# -> { "execute": "cpu-topology" }
> +# <- {"return": [
> +#     {
> +#         "drawer": 0,
> +#         "book": 0,
> +#         "socket": 0,
> +#         "polarity": 0,
> +#         "dedicated": true,
> +#         "origin": 0,
> +#         "mask": 0xc000000000000000,
> +#     },
> +#    ]
> +#   }
> +#
> +##
> +{ 'command': 'query-topology',
> +  'returns': ['S390CpuTopology'],
> +  'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM' ] }
> +}

IIUC, you're using @mask as a way to compress the array returned
from query-topology, so that it doesn't have any repeated elements
with the same data. I guess I can understand that desire when the
core count can get very large, this can have a large saving.

The downside of using @mask, is that now you require the caller
to parse the string to turn it into a bitmask and expand the
data. Generally this is considered a bit of an anti-pattern in
QAPI design - we don't want callers to have to further parse
the data to extract information, we want to directly consumable
from the parsed JSON doc.

We already have 'query-cpus-fast' wich returns one entry for
each CPU. In fact why do we need to add query-topology at all.
Can't we just add book-id / drawer-id / polarity / dedicated
to the query-cpus-fast result ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


