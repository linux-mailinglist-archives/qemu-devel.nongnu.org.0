Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E033B19C44C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 16:33:40 +0200 (CEST)
Received: from localhost ([::1]:41060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK0uZ-0007tf-W6
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 10:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59982)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jK0rk-0005az-1P
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 10:30:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jK0ri-0006E3-RE
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 10:30:43 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33868
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jK0ri-0006Df-Mq
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 10:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585837842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XBuFrkcERybOn1uu2JGzEcKGgkd/WDsU3+Z13eum04=;
 b=HMC2eIXRFyRa+QopgXONfERpPPvzwfEABxJ09ingDwsdJyYLNoGC5L8bFroMJZhkLmPUun
 mzPjlYtQlBD6317hn/8tfxzvt8GT7iJqI0HJvxxIIz4qlKAo5EM8BOAmPYhQlondkhBcP8
 b8oLhizae9lUrHlsgzCpZ3g1DKCL/ek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-rInIln1OO_uwq4gZtKKX0w-1; Thu, 02 Apr 2020 10:30:40 -0400
X-MC-Unique: rInIln1OO_uwq4gZtKKX0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37C39101FC67;
 Thu,  2 Apr 2020 14:30:39 +0000 (UTC)
Received: from [10.3.113.246] (ovpn-113-246.phx2.redhat.com [10.3.113.246])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83D4F60BF1;
 Thu,  2 Apr 2020 14:30:35 +0000 (UTC)
Subject: Re: [RFC 3/5] qmp: add QMP command virtio-queue-status
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20200402100302.833267-1-lvivier@redhat.com>
 <20200402100302.833267-4-lvivier@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c45b157a-f0dd-e094-b26b-c5612f1f0cc1@redhat.com>
Date: Thu, 2 Apr 2020 09:30:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402100302.833267-4-lvivier@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Thomas Huth <thuth@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/20 5:03 AM, Laurent Vivier wrote:
> This new command shows internal status of a VirtQueue.
> (vrings and indexes).
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   hw/virtio/virtio-stub.c |  6 +++
>   hw/virtio/virtio.c      | 35 +++++++++++++++
>   qapi/virtio.json        | 98 +++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 139 insertions(+)
> 

> +++ b/qapi/virtio.json
> @@ -117,3 +117,101 @@
>     'data': { 'path': 'str' },
>     'returns': 'VirtioStatus'
>   }
> +
> +##
> +# @VirtQueueStatus:
> +#
> +# Status of a VirtQueue
> +#
> +# @queue_index: VirtQueue queue_index

More naming conventions.  queue-index.  I'll quit pointing them out, but 
the whole series should be scrubbed.


> +# Example:
> +#
> +# -> { "execute": "virtio-queue-status",
> +#      "arguments": {
> +#          "path": "/machine/peripheral-anon/device[3]/virtio-backend",
> +#          "queue": 0
> +#      }
> +#   }
> +# <- { "return": {
> +#      "signalled_used": 373,

Of course, if you fix the naming conventions, you'll also need to 
regenerate the examples.

Hmm, it's a bit annoying that our current QMP output is 
non-deterministic.  It doesn't affect correctness, but it would be nice 
if our output was in the same order as our declaration.  Not the fault 
of your patch, nor something you need to worry about.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


