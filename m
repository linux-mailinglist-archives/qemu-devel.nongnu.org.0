Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D40B3D370E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:51:33 +0200 (CEST)
Received: from localhost ([::1]:50430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qty-0006rg-Us
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6qsy-00066A-J1
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6qsu-0001T2-Gu
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627030220;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LydjRcQkwKxDXpkiwx7P7o26eHyHbd6vqGPrX8nVJac=;
 b=hOLa3/X53jgW6MWDSCtfgZRM03/8kTi0YqDsfy6Tu9/U/Fs9aUsLjg+M4Ft+6cK72iHEaM
 qB7k3JaS+7kZGXXIZPW4dnTM1SBxLItPdtBLx7NMd4jWE26VW4/qbu8fPiiIkGRIkhtbI3
 TuCpLHzh38uv/Mz4DF1QREQcS8bQJ8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-hLIGlAApMiSLEnShaI7svw-1; Fri, 23 Jul 2021 04:50:18 -0400
X-MC-Unique: hLIGlAApMiSLEnShaI7svw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88CCC92502;
 Fri, 23 Jul 2021 08:50:17 +0000 (UTC)
Received: from redhat.com (ovpn-114-245.ams2.redhat.com [10.36.114.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 286AD26DEC;
 Fri, 23 Jul 2021 08:50:03 +0000 (UTC)
Date: Fri, 23 Jul 2021 09:50:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 2/2] acpi: x86: pcihp: add support hotplug on
 multifunction bridges
Message-ID: <YPqCuAM94TMiYvGV@redhat.com>
References: <20210722105945.2080428-1-imammedo@redhat.com>
 <20210722105945.2080428-3-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210722105945.2080428-3-imammedo@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, peter.maydell@linaro.org,
 jusual@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 06:59:45AM -0400, Igor Mammedov wrote:
> Commit 17858a1695 (hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35)
> switched PCI hotplug from native to ACPI one by default.
> 
> That however breaks ihotplug on following CLI that used to work:

s/ihotplug/hotplug/

>    -nodefaults -machine q35 \
>    -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
>    -device pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2
> 
> where PCI device is hotplugged to pcie-root-port-1 with error on guest side:
> 
>   ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND (20201113/psargs-330)
>   ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
>   ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
>   ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01] (20201113/evgpe-515)
> 
> cause is that QEMU's ACPI hotplug never supported functions other then 0
> and due to bug it was generating notification entries for not described
> functions.
> 
> Technically there is no reason not to describe cold-plugged bridges
> (root ports) on functions other then 0, as they similaraly to bridge

s/similaraly/similarly/

> on function 0 are unpluggable.
> 
> Fix consists of describing cold-plugged bridges[root ports] on functions
> other than 0.
> 
> Fixes: 17858a169508609ca9063c544833e5a1adeb7b52
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reported-by: Laurent Vivier <lvivier@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


