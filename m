Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A33A480CBA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:19:16 +0100 (CET)
Received: from localhost ([::1]:47976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2I0B-0002KP-4w
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:19:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2HyY-0001Jn-Ey
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 14:17:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2HyW-0001hm-G0
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 14:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640719051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Js4t0jQJWnGTvWLylhheiLko/KNFgBwnGYBU+uEJwH0=;
 b=E8+jXiPSzBh/suVUsDIuvd4KWj4iJC1o/Ga1Mi9MYlMSG3h4MnkKhnZX9IKO+TjUh3Zj5/
 G6tzZ/OnRPnjUioHh8PzRt1mHX0hkK9Mqw0+PNCHx6FFV/C+M1yUvwAP7w+MEAogsYzyz8
 +xquvG4E8IdL/Y2nST9JeEOZwO8bLnU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-6zaYzL3FOhConIw_HMMlVQ-1; Tue, 28 Dec 2021 14:17:25 -0500
X-MC-Unique: 6zaYzL3FOhConIw_HMMlVQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 p1-20020adfba81000000b001a25b07ff53so4212660wrg.22
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 11:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Js4t0jQJWnGTvWLylhheiLko/KNFgBwnGYBU+uEJwH0=;
 b=6O09mwq0KPy2raKDMuiwo7zRGBUVjm5b+Ui7x5dNB/BP8CL9TacMvBaY6JRYAwalOA
 VZ5nGok+2lpKw0oUUTPTd+3xspduKieRLt4ErMoFnpJdqZDXlEmtkSKBLo2YqS4SJDgS
 FLt3bYXcTjE0F4nraQDcWlBKU+7+3IAEaqtulKc2Cjio7OWFy6URO2baFN4TMdLMY5LU
 0iLxAvF4p9WrUuNShDjSYomYODC58JHT3YpgGpM4FbBmL5i2CD+zIMUNJ7X+4hI2C35x
 qm8qa4UlThVj9I3N+59nJRnCSqRk7jKO4Hzn6X9bWthaxCsETEKInguQOnFZlwudwgMF
 0fjg==
X-Gm-Message-State: AOAM530nzgF2KUIgXVXo/Zc9Qt8oSm1GO+Z1odDdPLTYbluq1DgiZZIC
 r5WwwYrawL8/jHvSdEp3Dk1AXPsDfAmYIaDka1U2fYJkDILOm4qizpQJez2gngsytW3HZbvdjBy
 Yh66pJEmUK6KGyo0=
X-Received: by 2002:a05:600c:1c9f:: with SMTP id
 k31mr18514454wms.159.1640719044212; 
 Tue, 28 Dec 2021 11:17:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYlyc85sSsV8P6A+TmBnNkKY4gI+PaHFlJLrbvCZjz2a15+OPiDdHzx++qfTHIPIZAaFKTYA==
X-Received: by 2002:a05:600c:1c9f:: with SMTP id
 k31mr18514426wms.159.1640719043964; 
 Tue, 28 Dec 2021 11:17:23 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id v1sm21597088wru.45.2021.12.28.11.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 11:17:23 -0800 (PST)
Message-ID: <fa7f67b2-ca1d-bd95-1a33-534a50b2d4c8@redhat.com>
Date: Tue, 28 Dec 2021 20:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 02/14] hw/core/machine: Introduce CPU cluster topology
 support
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-3-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/28/21 10:22, Yanan Wang wrote:
> The new Cluster-Aware Scheduling support has landed in Linux 5.16,
> which has been proved to benefit the scheduling performance (e.g.
> load balance and wake_affine strategy) on both x86_64 and AArch64.
> 
> So now in Linux 5.16 we have four-level arch-neutral CPU topology
> definition like below and a new scheduler level for clusters.
> struct cpu_topology {
>     int thread_id;
>     int core_id;
>     int cluster_id;
>     int package_id;
>     int llc_id;
>     cpumask_t thread_sibling;
>     cpumask_t core_sibling;
>     cpumask_t cluster_sibling;
>     cpumask_t llc_sibling;
> }
> 
> A cluster generally means a group of CPU cores which share L2 cache
> or other mid-level resources, and it is the shared resources that
> is used to improve scheduler's behavior. From the point of view of
> the size range, it's between CPU die and CPU core. For example, on
> some ARM64 Kunpeng servers, we have 6 clusters in each NUMA node,
> and 4 CPU cores in each cluster. The 4 CPU cores share a separate
> L2 cache and a L3 cache tag, which brings cache affinity advantage.
> 
> In virtualization, on the Hosts which have pClusters, if we can

Maybe [*] -> reference to pClusters?

> design a vCPU topology with cluster level for guest kernel and
> have a dedicated vCPU pinning. A Cluster-Aware Guest kernel can
> also make use of the cache affinity of CPU clusters to gain
> similar scheduling performance.
> 
> This patch adds infrastructure for CPU cluster level topology
> configuration and parsing, so that the user can specify cluster
> parameter if their machines support it.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine-smp.c | 26 +++++++++++++++++++-------
>  hw/core/machine.c     |  3 +++
>  include/hw/boards.h   |  6 +++++-
>  qapi/machine.json     |  5 ++++-
>  qemu-options.hx       |  7 ++++---
>  softmmu/vl.c          |  3 +++
>  6 files changed, 38 insertions(+), 12 deletions(-)

> diff --git a/qapi/machine.json b/qapi/machine.json
> index edeab6084b..ff0ab4ca20 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1404,7 +1404,9 @@
>  #
>  # @dies: number of dies per socket in the CPU topology
>  #
> -# @cores: number of cores per die in the CPU topology
> +# @clusters: number of clusters per die in the CPU topology

Missing:

   #            (since 7.0)

> +#
> +# @cores: number of cores per cluster in the CPU topology
>  #
>  # @threads: number of threads per core in the CPU topology
>  #
> @@ -1416,6 +1418,7 @@
>       '*cpus': 'int',
>       '*sockets': 'int',
>       '*dies': 'int',
> +     '*clusters': 'int',
>       '*cores': 'int',
>       '*threads': 'int',
>       '*maxcpus': 'int' } }
If you want I can update the doc when applying.

Thanks,

Phil.


