Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5335341AC8B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 12:01:12 +0200 (CEST)
Received: from localhost ([::1]:45342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV9vC-0000Av-SJ
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 06:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mV9tC-0007W8-8v
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:59:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mV9t5-000121-JK
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632823137;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lC8tMbHGBad40yXcPh55m2sDRPJRZtnf4g7lkWlWssM=;
 b=hyrwYLZHPEY+upEtqA3PooxIZMeA+MbL3OtWbkeov56qbGIjwbd3Xq7OyApgPtsngB/S70
 +MdFr2xUUTS7frf5m8rxQ1m9QXP37jqJ9L1HVJwXCHcrtkUKmsztqSW2izr5Au8y1N4SMI
 MZU9zIYqzDGhPfZMb/5+B2DIYdSrpTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-DQqEn7jzNrqENS5go_vpGQ-1; Tue, 28 Sep 2021 05:58:56 -0400
X-MC-Unique: DQqEn7jzNrqENS5go_vpGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A51CA362F8;
 Tue, 28 Sep 2021 09:58:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F9BD1972D;
 Tue, 28 Sep 2021 09:58:41 +0000 (UTC)
Date: Tue, 28 Sep 2021 10:58:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 01/14] machine: Deprecate "parameter=0" SMP
 configurations
Message-ID: <YVLnTsJE2a9wlckS@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-2-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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

On Tue, Sep 28, 2021 at 11:57:42AM +0800, Yanan Wang wrote:
> In the SMP configuration, we should either provide a topology
> parameter with a reasonable value (greater than zero) or just
> omit it and QEMU will compute the missing value.
> 
> The users shouldn't provide a configuration with any parameter
> of it specified as zero (e.g. -smp 8,sockets=0) which could
> possibly cause unexpected results in the -smp parsing. So we
> deprecate this kind of configurations since 6.2 by adding the
> explicit sanity check.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/about/deprecated.rst | 15 +++++++++++++++
>  hw/core/machine.c         | 14 ++++++++++++++
>  qapi/machine.json         |  2 +-
>  qemu-options.hx           | 12 +++++++-----
>  4 files changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 3c2be84d80..97415dbecd 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -160,6 +160,21 @@ Use ``-display sdl`` instead.
>  
>  Use ``-display curses`` instead.
>  
> +``-smp`` ("parameter=0" SMP configurations) (since 6.2)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Specified CPU topology parameters must be greater than zero.
> +
> +In the SMP configuration, users should either provide a CPU topology
> +parameter with a reasonable value (greater than zero) or just omit it
> +and QEMU will compute the missing value.
> +
> +However, historically it was implicitly allowed for users to provide
> +a parameter with zero value, which is meaningless and could also possibly
> +cause unexpected results in the -smp parsing. So support for this kind of
> +configurations (e.g. -smp 8,sockets=0) is deprecated since 6.2 and will
> +be removed in the near future, users have to ensure that all the topology
> +members described with -smp are greater than zero.
>  
>  Plugin argument passing through ``arg=<string>`` (since 6.1)
>  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 067f42b528..711e83db54 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -835,6 +835,20 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>  
> +    /*
> +     * Specified CPU topology parameters must be greater than zero,
> +     * explicit configuration like "cpus=0" is not allowed.
> +     */
> +    if ((config->has_cpus && config->cpus == 0) ||
> +        (config->has_sockets && config->sockets == 0) ||
> +        (config->has_dies && config->dies == 0) ||
> +        (config->has_cores && config->cores == 0) ||
> +        (config->has_threads && config->threads == 0) ||
> +        (config->has_maxcpus && config->maxcpus == 0)) {
> +        warn_report("Invalid CPU topology deprecated: "
> +                    "CPU topology parameters must be greater than zero");
> +    }
> +
>      mc->smp_parse(ms, config, errp);
>      if (*errp) {
>          goto out_free;
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 32d47f4e35..227e75d8af 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1331,7 +1331,7 @@
>  #
>  # @dies: number of dies per socket in the CPU topology
>  #
> -# @cores: number of cores per thread in the CPU topology
> +# @cores: number of cores per die in the CPU topology
>  #
>  # @threads: number of threads per core in the CPU topology
>  #

This change is unrelated to the rest of this commit.

It just looks like a simple bug fix and should just be
spun out into its own patch.

> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8f603cc7e6..91d859aa29 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -227,11 +227,13 @@ SRST
>      of computing the CPU maximum count.
>  
>      Either the initial CPU count, or at least one of the topology parameters
> -    must be specified. Values for any omitted parameters will be computed
> -    from those which are given. Historically preference was given to the
> -    coarsest topology parameters when computing missing values (ie sockets
> -    preferred over cores, which were preferred over threads), however, this
> -    behaviour is considered liable to change.
> +    must be specified. The specified parameters must be greater than zero,
> +    explicit configuration like "cpus=0" is not allowed. Values for any
> +    omitted parameters will be computed from those which are given.
> +    Historically preference was given to the coarsest topology parameters
> +    when computing missing values (ie sockets preferred over cores, which
> +    were preferred over threads), however, this behaviour is considered
> +    liable to change.
>  ERST
>  
>  DEF("numa", HAS_ARG, QEMU_OPTION_numa,

If you split the docs fix out into its own patch then you can add

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

to both this patch and the new patch.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


