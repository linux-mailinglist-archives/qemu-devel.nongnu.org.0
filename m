Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5213D3D350A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 09:08:03 +0200 (CEST)
Received: from localhost ([::1]:55752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6pHu-0006q7-5C
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 03:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m6pGh-0005sN-6e
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:06:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m6pGd-0007pr-77
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627024001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vF+Ctgl+UTk027RymWUjLQCG9r0lLXEP2VZlk9E3wUA=;
 b=GONJEyp9vxz5ryvnIn5F4OyRxRyCw4OrNunuWPLOa1xx1pbjWVK3P1jYNYzaNQzJm59xeR
 GVoAwt9TOwenSmydi1mWYyLpGsv8GROS7EEXwG1KT0POBs0sH+qrD03ZVZnoZO00cDEEm8
 NV2f+ewqlxbbQ6roNvtsJe9YrrQbdb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-la8NieF2N82LquavFBqoQA-1; Fri, 23 Jul 2021 03:06:40 -0400
X-MC-Unique: la8NieF2N82LquavFBqoQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3E8510086C4;
 Fri, 23 Jul 2021 07:06:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D46B760862;
 Fri, 23 Jul 2021 07:06:37 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH for-6.1 v3 1/1] machine: Disallow specifying topology
 parameters as zero
In-Reply-To: <20210723020002.18456-2-wangyanan55@huawei.com>
Organization: Red Hat GmbH
References: <20210723020002.18456-1-wangyanan55@huawei.com>
 <20210723020002.18456-2-wangyanan55@huawei.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 23 Jul 2021 09:06:36 +0200
Message-ID: <8735s57blv.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Danie?= =?utf-8?Q?l_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23 2021, Yanan Wang <wangyanan55@huawei.com> wrote:

> In the SMP configuration, we should either specify a topology
> parameter with a reasonable value (equal to or greater than 1)
> or just leave it omitted and QEMU will calculate its value.
> Configurations which explicitly specify the topology parameters
> as zero like "sockets=0" are meaningless, so disallow them.
>
> However, the commit 1e63fe685804d
> (machine: pass QAPI struct to mc->smp_parse) has documented that
> '0' has the same semantics as omitting a parameter in the qapi
> comment for SMPConfiguration. So this patch fixes the doc and
> also adds the corresponding sanity check in the smp parsers.
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
> Tested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 15 +++++++++++++++
>  qapi/machine.json |  6 +++---
>  qemu-options.hx   | 12 +++++++-----
>  3 files changed, 25 insertions(+), 8 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 775add0795..d95e8b6903 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -829,6 +829,21 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>  
> +    /*
> +     * The topology parameters must be specified equal to or great than one

s/great/greater/

> +     * or just omitted, explicit configuration like "cpus=0" is not allowed.
> +     */
> +    if ((config->has_cpus && config->cpus == 0) ||
> +        (config->has_sockets && config->sockets == 0) ||
> +        (config->has_dies && config->dies == 0) ||
> +        (config->has_cores && config->cores == 0) ||
> +        (config->has_threads && config->threads == 0) ||
> +        (config->has_maxcpus && config->maxcpus == 0)) {
> +        error_setg(errp, "CPU topology parameters must be equal to "
> +                   "or greater than one if provided");
> +        goto out_free;
> +    }
> +
>      mc->smp_parse(ms, config, errp);
>      if (errp) {
>          goto out_free;
> diff --git a/qapi/machine.json b/qapi/machine.json
> index c3210ee1fb..9272cb3cf8 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1288,8 +1288,8 @@
>  ##
>  # @SMPConfiguration:
>  #
> -# Schema for CPU topology configuration.  "0" or a missing value lets
> -# QEMU figure out a suitable value based on the ones that are provided.
> +# Schema for CPU topology configuration. A missing value lets QEMU
> +# figure out a suitable value based on the ones that are provided.
>  #
>  # @cpus: number of virtual CPUs in the virtual machine
>  #
> @@ -1297,7 +1297,7 @@
>  #
>  # @dies: number of dies per socket in the CPU topology
>  #
> -# @cores: number of cores per thread in the CPU topology
> +# @cores: number of cores per die in the CPU topology
>  #
>  # @threads: number of threads per core in the CPU topology
>  #
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 99ed5ec5f1..b0168f8c48 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -223,11 +223,13 @@ SRST
>      of computing the CPU maximum count.
>  
>      Either the initial CPU count, or at least one of the topology parameters
> -    must be specified. Values for any omitted parameters will be computed
> -    from those which are given. Historically preference was given to the
> -    coarsest topology parameters when computing missing values (ie sockets
> -    preferred over cores, which were preferred over threads), however, this
> -    behaviour is considered liable to change.
> +    must be specified. The specified parameters must be equal to or great

s/great/greater/

> +    than one, explicit configuration like "cpus=0" is not allowed. Values
> +    for any omitted parameters will be computed from those which are given.
> +    Historically preference was given to the coarsest topology parameters
> +    when computing missing values (ie sockets preferred over cores, which
> +    were preferred over threads), however, this behaviour is considered
> +    liable to change.
>  ERST
>  
>  DEF("numa", HAS_ARG, QEMU_OPTION_numa,

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


