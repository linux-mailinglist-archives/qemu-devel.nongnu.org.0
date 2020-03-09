Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131A317DEE3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 12:45:18 +0100 (CET)
Received: from localhost ([::1]:41408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBGqR-0000m0-TM
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 07:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1jBGpQ-000854-VM
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 07:44:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1jBGpQ-0004yn-1b
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 07:44:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32768
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1jBGpP-0004ya-TS
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 07:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583754251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=78I5LVGNS/WghemDDn/hYLUYD1AftfK/zET4ULXdDjQ=;
 b=CXL+7CfTKfQhdcu9RbMCDrOGjnOSbNvqRysfmHIGcY1i1wa4SqbP27R+qD2QMrxj38e4yV
 HpWPvhmi218R/qobEtpzSKZKbrSqaBkOujV5twDA+xmza+BQ+vwssMFsSPpazJao88WuE9
 +xfIwTAc7yNdRfY3bu4OBDYNLeTF4aM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-145ePac0Mx-b9s86tx_zLg-1; Mon, 09 Mar 2020 07:44:07 -0400
X-MC-Unique: 145ePac0Mx-b9s86tx_zLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D5AF107B116;
 Mon,  9 Mar 2020 11:44:06 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BE2960C05;
 Mon,  9 Mar 2020 11:44:00 +0000 (UTC)
Date: Mon, 9 Mar 2020 12:43:58 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v4 10/13] arm/arm64: ITS: INT functional
 tests
Message-ID: <20200309114358.aaf5dyglehby4pup@kamzik.brq.redhat.com>
References: <20200309102420.24498-1-eric.auger@redhat.com>
 <20200309102420.24498-11-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309102420.24498-11-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

On Mon, Mar 09, 2020 at 11:24:17AM +0100, Eric Auger wrote:
...
> diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
> index 0096de6..956d7b8 100644
> --- a/lib/arm/asm/gic-v3-its.h
> +++ b/lib/arm/asm/gic-v3-its.h
> @@ -5,9 +5,8 @@
>   *
>   * This work is licensed under the terms of the GNU LGPL, version 2.
>   */
> -
> -#ifndef _ASMARM_GICv3_ITS
> -#define _ASMARM_GICv3_ITS
> +#ifndef _ASMARM_GIC_V3_ITS_H_
> +#define _ASMARM_GIC_V3_ITS_H_

Another fix to squash into the patch where the lines are introduced.

>  
>  /* dummy its_data struct to allow gic_get_dt_bases() call */
>  struct its_data {
> @@ -19,5 +18,9 @@ static inline void test_its_introspection(void)
>  {
>  	report_abort("not supported on 32-bit");
>  }
> +static inline void test_its_trigger(void)
> +{
> +	report_abort("not supported on 32-bit");

As mentioned before, we don't want test_* and report_* functions in the
library code.

> +}
>  
>  #endif /* _ASMARM_GICv3_ITS */

Forgot to change _ASMARM_GICv3_ITS here.

> -- 
> 2.20.1
>

Thanks,
drew


