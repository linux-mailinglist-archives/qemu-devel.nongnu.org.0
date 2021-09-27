Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C679D41921C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:19:35 +0200 (CEST)
Received: from localhost ([::1]:44406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnjS-0004K8-Pq
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUndJ-0005mi-FX
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:13:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUndF-0003ls-Re
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632737589;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=y1JfZYIVpUtu1zDOWIyaIPIYXVuAB5HyGmykC6xrIaw=;
 b=QM2XMvLbaVdSa54QAqBIhdT1xTT+WwUlEWXukLVtzAI/OJMT9zK7GRgHzWQQNl7MmLY9Pg
 w3n27r7akGi9QJvgh6jIwGQq364EX+Tpz89RVr7g3aryceRT7aR8JWEuf8sMo6LCYhkgI2
 kaYOgCahpZi4TWdmG0yfx6czbtSEemo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-lnFFkhOJNuCz-I6m8AaxBw-1; Mon, 27 Sep 2021 06:12:53 -0400
X-MC-Unique: lnFFkhOJNuCz-I6m8AaxBw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C6B1362F8;
 Mon, 27 Sep 2021 10:12:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D8345C261;
 Mon, 27 Sep 2021 10:12:37 +0000 (UTC)
Date: Mon, 27 Sep 2021 11:12:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v10 11/14] machine: Make smp_parse generic enough for all
 arches
Message-ID: <YVGZE7boLhoD1w2r@redhat.com>
References: <20210926084541.17352-1-wangyanan55@huawei.com>
 <20210926084541.17352-12-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210926084541.17352-12-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 26, 2021 at 04:45:38PM +0800, Yanan Wang wrote:
> Currently the only difference between smp_parse and pc_smp_parse
> is the support of dies parameter and the related error reporting.
> With some arch compat variables like "bool dies_supported", we can
> make smp_parse generic enough for all arches and the PC specific
> one can be removed.
> 
> Making smp_parse() generic enough can reduce code duplication and
> ease the code maintenance, and also allows extending the topology
> with more arch specific members (e.g., clusters) in the future.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/core/machine.c   | 110 ++++++++++++++++++++++++++++++++++++--------
>  hw/i386/pc.c        |  84 +--------------------------------
>  include/hw/boards.h |   9 ++++
>  3 files changed, 100 insertions(+), 103 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a21fcd7700..4b5c943f8e 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -15,6 +15,7 @@
>  #include "qapi/qmp/qerror.h"
>  #include "sysemu/replay.h"
>  #include "qemu/units.h"
> +#include "qemu/cutils.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "qapi/error.h"
> @@ -746,20 +747,87 @@ void machine_set_cpu_numa_node(MachineState *machine,
>      }
>  }
>  
> +static char *cpu_topology_hierarchy(MachineState *ms)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> +    SMPCompatProps *smp_props = &mc->smp_props;
> +    char topo_msg[256] = "";
> +
> +    /*
> +     * Topology members should be ordered from the largest to the smallest.
> +     * Concept of sockets/cores/threads is supported by default and will be
> +     * reported in the hierarchy. Unsupported members will not be reported.
> +     */
> +    g_autofree char *sockets_msg = g_strdup_printf(
> +            " * sockets (%u)", ms->smp.sockets);
> +    pstrcat(topo_msg, sizeof(topo_msg), sockets_msg);
> +
> +    if (smp_props->dies_supported) {
> +        g_autofree char *dies_msg = g_strdup_printf(
> +                " * dies (%u)", ms->smp.dies);
> +        pstrcat(topo_msg, sizeof(topo_msg), dies_msg);
> +    }
> +
> +    g_autofree char *cores_msg = g_strdup_printf(
> +            " * cores (%u)", ms->smp.cores);
> +    pstrcat(topo_msg, sizeof(topo_msg), cores_msg);
> +
> +    g_autofree char *threads_msg = g_strdup_printf(
> +            " * threads (%u)", ms->smp.threads);
> +    pstrcat(topo_msg, sizeof(topo_msg), threads_msg);
> +
> +    return g_strdup_printf("%s", topo_msg + 3);
> +}

Mixing g_strdup_printf + pstrcat + fixed buffer is quite
unpleasant. This method is begging to use 'GString' APIs
for formatting.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


