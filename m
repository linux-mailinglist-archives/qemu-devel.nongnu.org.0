Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386B1398664
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:23:22 +0200 (CEST)
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loO1x-0002cD-AD
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loO0q-0001te-Bk
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:22:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loO0o-0004Gp-Tn
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622629330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ZGNzuVcjgDFr0Hr7+GzWVBYcbkfG41QweMqN9yU8Yo=;
 b=h0iUn9edtEnYkStfArSHe+0edvwgLGqAY0yN6inon9AawSfMajznTKg4hoogZWUJMZsVET
 uWfyoimnC5vk/F+/0vh77KXlfR9ZTcuYxGFrodYjTEl0swwRozj3WXdlpN7WuMf9Tr4g1o
 kSqImX9U+fywajeYbds0/098i97vomM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-gWK3iAE8PMiSmL9t3E-90Q-1; Wed, 02 Jun 2021 06:22:06 -0400
X-MC-Unique: gWK3iAE8PMiSmL9t3E-90Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCC1580293B;
 Wed,  2 Jun 2021 10:22:05 +0000 (UTC)
Received: from localhost (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 600245947F;
 Wed,  2 Jun 2021 10:22:05 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v4 09/14] target/s390x: make helper.c sysemu-only
In-Reply-To: <20210524025256.22252-9-acho@suse.com>
Organization: Red Hat GmbH
References: <20210524025256.22252-1-acho@suse.com>
 <20210524025256.22252-9-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 02 Jun 2021 12:22:03 +0200
Message-ID: <87y2bspnw4.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: thuth@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, cfontana@suse.de,
 pbonzini@redhat.com, acho@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> Now that we have moved cpu-dump functionality out of helper.c,
> we can make the module sysemu-only.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>  target/s390x/helper.c    | 4 ----
>  target/s390x/meson.build | 2 +-
>  2 files changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/target/s390x/helper.c b/target/s390x/helper.c
> index 41ccc83d11..f246bec353 100644
> --- a/target/s390x/helper.c
> +++ b/target/s390x/helper.c

Maybe mention at the beginning of this file that this is sysemu only?

> @@ -27,11 +27,8 @@
>  #include "hw/s390x/pv.h"
>  #include "sysemu/hw_accel.h"
>  #include "sysemu/runstate.h"
> -#ifndef CONFIG_USER_ONLY
>  #include "sysemu/tcg.h"
> -#endif
>  
> -#ifndef CONFIG_USER_ONLY
>  void s390x_tod_timer(void *opaque)
>  {
>      cpu_inject_clock_comparator((S390CPU *) opaque);
> @@ -322,4 +319,3 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, hwaddr len)
>      cpu_physical_memory_unmap(sa, len, 1, len);
>      return 0;
>  }
> -#endif /* CONFIG_USER_ONLY */

Acked-by: Cornelia Huck <cohuck@redhat.com>


