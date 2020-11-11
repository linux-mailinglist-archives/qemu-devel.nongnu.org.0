Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0822AF46E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:08:17 +0100 (CET)
Received: from localhost ([::1]:41660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrjM-00083B-JX
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kcrhp-0007T4-5A
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:06:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kcrhm-0007mX-Do
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605107197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFGgGHziEt4AmBZM7aYh7Cp620vy9zCDQSjSYRXHluo=;
 b=YEtwXAtGPmGm77kmhQWqIJqrzX1GT4pprU4nr8EDp3eJPClTFas8M324CvLRI1lFPkGmKq
 DLpPDYfKz+A+tzNNkySb8ea94kS6CNJG743uw1yjW1+fRa+oUC3MP2TMjA8zzMLwUwQ+Fp
 tZJR//+TV7JqSV9weA/lVwoHf80DFDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-ELv4Wna7PMq-HjZPi8yAnQ-1; Wed, 11 Nov 2020 10:05:26 -0500
X-MC-Unique: ELv4Wna7PMq-HjZPi8yAnQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E00951E5C82;
 Wed, 11 Nov 2020 15:05:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6C9227BAE;
 Wed, 11 Nov 2020 15:05:25 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6A9958100;
 Wed, 11 Nov 2020 15:05:25 +0000 (UTC)
Date: Wed, 11 Nov 2020 10:05:25 -0500 (EST)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1888391810.22919498.1605107125694.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201111143440.112763-1-drjones@redhat.com>
References: <20201111143440.112763-1-drjones@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
MIME-Version: 1.0
X-Originating-IP: [10.40.192.178, 10.4.195.27]
Thread-Topic: hw/arm/virt: ARM_VIRT must select ARM_GIC
Thread-Index: JuozD2lwYiGtkrz8S11rhaXPScxz3A==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

----- Original Message -----
> From: "Andrew Jones" <drjones@redhat.com>
> To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
> Cc: "peter maydell" <peter.maydell@linaro.org>, philmd@redhat.com, "Miroslav Rezanina" <mrezanin@redhat.com>
> Sent: Wednesday, November 11, 2020 3:34:40 PM
> Subject: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
> 
> The removal of the selection of A15MPCORE from ARM_VIRT also
> removed what A15MPCORE selects, ARM_GIC. We still need ARM_GIC.
> 
> Fixes: bec3c97e0cf9 ("hw/arm/virt: Remove dependency on Cortex-A15 MPCore
> peripherals")
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 7d022eeefdbc..e69a9009cf0a 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -6,6 +6,7 @@ config ARM_VIRT
>      imply VFIO_PLATFORM
>      imply VFIO_XGMAC
>      imply TPM_TIS_SYSBUS
> +    select ARM_GIC
>      select ACPI
>      select ARM_SMMUV3
>      select GPIO_KEY
> --
> 2.26.2
> 
> 

Problems with missing dependencies solved by this patch.

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>

-- 
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer


