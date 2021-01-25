Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546DD302592
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 14:39:59 +0100 (CET)
Received: from localhost ([::1]:49864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4261-0002EZ-S6
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 08:39:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l425A-0001QG-Iw
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:39:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l4252-0004vY-2g
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611581935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWghUd/XXTgGvy95dYILQ4x+o4koWHVATmcb3oMTRGA=;
 b=AW0LY0DWqclgNNn1RW4ULjce2UEwQO8UxqLWwedyC7TuB1x/uvnF/IJRfHsBB/MjRlJF0Q
 Ae4pEreu7IR1vlzb9yLqjO9smK8012vKPQMFU/q3K1HMRLCjsMMvR5YpbCj4fNoF1NpdVH
 8NboWv934JXdPevkVhLAUi3JVD/a5Cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-LnFePLpSPHymoEog2wqa0g-1; Mon, 25 Jan 2021 08:38:51 -0500
X-MC-Unique: LnFePLpSPHymoEog2wqa0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1484EEC1A5;
 Mon, 25 Jan 2021 13:38:50 +0000 (UTC)
Received: from gondolin (ovpn-113-161.ams2.redhat.com [10.36.113.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CCC218A60;
 Mon, 25 Jan 2021 13:38:43 +0000 (UTC)
Date: Mon, 25 Jan 2021 14:38:40 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v2] s390x/cpu_model: disallow unpack for --only-migratable
Message-ID: <20210125143840.64a64fdc.cohuck@redhat.com>
In-Reply-To: <20210125132238.179972-1-borntraeger@de.ibm.com>
References: <20210125132238.179972-1-borntraeger@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Thomas Huth <thuth@redhat.com>,
 "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Jan 2021 14:22:38 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> secure execution (aka protected virtualization) guests cannot be
> migrated at the moment. Disallow the unpack facility if the user
> specifies --only-migratable.

Maybe make the explanation a bit more verbose?

"Secure execution (aka protected virtualization) guests cannot be
migrated at the moment. If the unpack facility is provided in the cpu
model, a guest may choose to transition to secure mode, making the
guest unmigratable at that point in time. If the machine was explicitly
started with --only-migratable, we would get a failure only when the
guest actually tries to transition; instead, explicitly disallow the
unpack facility if --only-migratable was specified to avoid late
surprises."

> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
> v1->v2:
> - add missing return
> - protect check with CONFIG_USER_ONLY for building non softmmu binaries
> 
>  target/s390x/cpu_models.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 35179f9dc7ba..e844a4007210 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -26,6 +26,7 @@
>  #include "qapi/qmp/qdict.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "sysemu/arch_init.h"
> +#include "sysemu/sysemu.h"
>  #include "hw/pci/pci.h"
>  #endif
>  #include "qapi/qapi-commands-machine-target.h"
> @@ -878,6 +879,14 @@ static void check_compatibility(const S390CPUModel *max_model,
>          return;
>      }
>  
> +#ifndef CONFIG_USER_ONLY
> +    if (only_migratable && test_bit(S390_FEAT_UNPACK, model->features)) {
> +        error_setg(errp, "The unpack facility is not compatible with "
> +                   "the --only-migratable option");

Might be a bit surprising if the host model had been specified... is
there a way to add a hint how to get rid of the unpack bit?

> +	return;
> +    }
> +#endif
> +
>      /* detect the missing features to properly report them */
>      bitmap_andnot(missing, model->features, max_model->features, S390_FEAT_MAX);
>      if (bitmap_empty(missing, S390_FEAT_MAX)) {


