Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6704D2E7112
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 14:53:03 +0100 (CET)
Received: from localhost ([::1]:47286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuFQs-0001SV-G4
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 08:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuFP2-0000ya-4A
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:51:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kuFOz-0002e8-WD
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 08:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609249864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2kqHDducz/HBx/juyzvFPoufz+8KaUcypugGCRxOpdI=;
 b=JjbNeOak/Lgs8lkWhaSHZNjOoZYSVBvpNeDoNeip2OII5t902Pwl/wKFu7Tybzw9Hl9fVC
 IWK57L2pCwUuZigxMTqgI6ubBcXI0J6FEXimIH3miFDNleNp9VgLNH9LbfRv8xPPtLfhsR
 piLNMtkS72kBkx29+eLg9yyNSVXUmJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-dwnYHi__N9GqX1tt1ckLow-1; Tue, 29 Dec 2020 08:51:01 -0500
X-MC-Unique: dwnYHi__N9GqX1tt1ckLow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73FAE801AA3;
 Tue, 29 Dec 2020 13:50:59 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 857E1277BE;
 Tue, 29 Dec 2020 13:50:53 +0000 (UTC)
Date: Tue, 29 Dec 2020 14:50:52 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH v3 6/8] Kconfig: Enable PXB for ARM_VIRT by default
Message-ID: <20201229145052.38834f73@redhat.com>
In-Reply-To: <20201223090836.9075-7-cenjiahui@huawei.com>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
 <20201223090836.9075-7-cenjiahui@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: xieyingtai@huawei.com, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Dec 2020 17:08:34 +0800
Jiahui Cen <cenjiahui@huawei.com> wrote:
subj
s/by default//
s/enable/compile/

> PXB is now supported on ARM, so let's enable it by default.
s/it by default/for arm_virt machine/
s/enable/compile/

> 
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> ---
>  hw/pci-bridge/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-bridge/Kconfig b/hw/pci-bridge/Kconfig
> index a51ec716f5..f8df4315ba 100644
> --- a/hw/pci-bridge/Kconfig
> +++ b/hw/pci-bridge/Kconfig
> @@ -5,7 +5,7 @@ config PCIE_PORT
>  
>  config PXB
>      bool
> -    default y if Q35
> +    default y if Q35 || ARM_VIRT
>  
>  config XIO3130
>      bool


