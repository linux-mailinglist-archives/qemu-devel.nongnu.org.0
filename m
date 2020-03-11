Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC8A181C7E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:39:58 +0100 (CET)
Received: from localhost ([::1]:54352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3Sf-0008Aq-R2
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1jC3Rk-00068F-V1
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:39:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1jC3Rj-0003aV-NP
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:39:00 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44366
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1jC3Rj-0003Wk-FA
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W5t/PCQFrEfrTtXP6H3fAc6etVr5BGU7Jh+WijcxdM8=;
 b=HijIR8QCVAgNuCEFrDaymiJkwI7HZ3tejg9oZ9wR1xrcmz4e+vEL7qPSqIhtVDV9KB44a2
 FqMi7AEL1ESbmKP28u2FHhIyI4FqZrFK1uPN2ZiOTmBpQ4ZHPMV/qVy3YHByF+qfC/tOau
 z+fYGbhHcdybau1OPxgB7KP+vQ5xVEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-ukR6C7iqPe-lkwOjA2QKpw-1; Wed, 11 Mar 2020 11:38:54 -0400
X-MC-Unique: ukR6C7iqPe-lkwOjA2QKpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74A8A189F764;
 Wed, 11 Mar 2020 15:38:52 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-206-80.brq.redhat.com
 [10.40.206.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CF0F5C13D;
 Wed, 11 Mar 2020 15:38:45 +0000 (UTC)
Date: Wed, 11 Mar 2020 16:38:42 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v6 07/13] arm/arm64: ITS:
 its_enable_defaults
Message-ID: <20200311153842.knuyqfnzqopb35gj@kamzik.brq.redhat.com>
References: <20200311135117.9366-1-eric.auger@redhat.com>
 <20200311135117.9366-8-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311135117.9366-8-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, kvm@vger.kernel.org,
 maz@kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 andre.przywara@arm.com, yuzenghui@huawei.com, alexandru.elisei@arm.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 11, 2020 at 02:51:11PM +0100, Eric Auger wrote:
> +/* must be called after gicv3_enable_defaults */
> +void its_enable_defaults(void)
> +{
> +	int i;
> +
> +	/* Allocate LPI config and pending tables */
> +	gicv3_lpi_alloc_tables();
> +
> +	for (i = 0; i < nr_cpus; i++)
> +		gicv3_lpi_rdist_enable(i);

You still haven't explained what's wrong with for_each_present_cpu. Also,
I see you've added 'i < nr_cpus' loops in arm/gic.c too. I'd prefer we not
assume that all cpu's are present (even though, currently, they must be),
because we may want to integrate cpu hotplug tests with these tests at
some point.

> +
> +	writel(GITS_CTLR_ENABLE, its_data.base + GITS_CTLR);
> +}
> -- 
> 2.20.1
> 
> 


