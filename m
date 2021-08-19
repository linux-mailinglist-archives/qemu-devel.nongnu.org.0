Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BF03F182D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 13:28:14 +0200 (CEST)
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGgDV-0002a0-7M
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 07:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mGgBo-0000tZ-5Z
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:26:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mGgBk-00009l-WA
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629372381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=27MTJK/9v1dWgBqVggxJRRzy7bRk7/PVj1YgfTNF8iM=;
 b=BUv81tOGpAK28xyhXVVddaeFSv6ueZb5gxlARl4ZeFBoBfqP01LTivM2LCrTHQ+LkN428Z
 0pwdTaQldrQaGzfiA09XjyRHBiKVfE2mdB9ZTGrTy9YO2hwHpakKW1zmI/IwcQKD3VWGMm
 GJRHt4V0CljyiQ0uflJQi078nWsoJY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-V3iXttiNNJ-JC31mo4e5QA-1; Thu, 19 Aug 2021 07:26:18 -0400
X-MC-Unique: V3iXttiNNJ-JC31mo4e5QA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38C3A8799E0;
 Thu, 19 Aug 2021 11:26:16 +0000 (UTC)
Received: from localhost (unknown [10.39.192.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7021F60916;
 Thu, 19 Aug 2021 11:26:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 01/16] docs/about/removed-features: Remove duplicated
 doc about -smp
In-Reply-To: <20210819031027.41104-2-wangyanan55@huawei.com>
Organization: Red Hat GmbH
References: <20210819031027.41104-1-wangyanan55@huawei.com>
 <20210819031027.41104-2-wangyanan55@huawei.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Thu, 19 Aug 2021 13:26:08 +0200
Message-ID: <87czq9smjz.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19 2021, Yanan Wang <wangyanan55@huawei.com> wrote:

> There are two places describing the same thing about deprecation
> of invalid topologies of -smp CLI, so remove the duplicated one.
>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  docs/about/removed-features.rst | 21 ++++-----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)
>
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index cbfa1a8e31..f5d6e2ea9c 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -194,7 +194,7 @@ by the ``tls-authz`` and ``sasl-authz`` options.
>  The ``pretty=on|off`` switch has no effect for HMP monitors and
>  its use is rejected.
>  
> -``-drive file=json:{...{'driver':'file'}}`` (removed 6.0)
> +``-drive file=json:{...{'driver':'file'}}`` (removed in 6.0)

I would not change this in this patch; while the cleanup looks fine,
there are some more instances and also e.g. things like x.y.z being used
sometimes, and it's probably better to clean that up via a separated patch.

>  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>  
>  The 'file' driver for drives is no longer appropriate for character or host
> @@ -593,7 +593,7 @@ error when ``-u`` is not used.
>  Command line options
>  --------------------
>  
> -``-smp`` (invalid topologies) (removed 5.2)
> +``-smp`` (invalid topologies) (removed in 5.2)
>  '''''''''''''''''''''''''''''''''''''''''''
>  
>  CPU topology properties should describe whole machine topology including
> @@ -606,7 +606,7 @@ Support for invalid topologies is removed, the user must ensure
>  topologies described with -smp include all possible cpus, i.e.
>  *sockets* * *cores* * *threads* = *maxcpus*.
>  
> -``-numa`` node (without memory specified) (removed 5.2)
> +``-numa`` node (without memory specified) (removed in 5.2)
>  '''''''''''''''''''''''''''''''''''''''''''''''''''''''
>  
>  Splitting RAM by default between NUMA nodes had the same issues as ``mem``
> @@ -647,20 +647,7 @@ as ignored. Currently, users are responsible for making sure the backing storage
>  specified with ``-mem-path`` can actually provide the guest RAM configured with
>  ``-m`` and QEMU fails to start up if RAM allocation is unsuccessful.
>  
> -``-smp`` (invalid topologies) (removed 5.2)
> -'''''''''''''''''''''''''''''''''''''''''''
> -
> -CPU topology properties should describe whole machine topology including
> -possible CPUs.
> -
> -However, historically it was possible to start QEMU with an incorrect topology
> -where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
> -which could lead to an incorrect topology enumeration by the guest.
> -Support for invalid topologies is removed, the user must ensure
> -topologies described with -smp include all possible cpus, i.e.
> -*sockets* * *cores* * *threads* = *maxcpus*.

Actually removing the duplicated section looks fine.

> -
> -``-machine enforce-config-section=on|off`` (removed 5.2)
> +``-machine enforce-config-section=on|off`` (removed in 5.2)
>  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>  
>  The ``enforce-config-section`` property was replaced by the


