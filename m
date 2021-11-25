Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8568945D53E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 08:15:13 +0100 (CET)
Received: from localhost ([::1]:53150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq8yO-0002En-Mi
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 02:15:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mq8w2-0000oP-7T
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:12:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mq8vr-0002cQ-Kh
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637824354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JFn26hPET/C0ib11Q6ibZHAprSACLmOUyLokmLKAPBc=;
 b=Bla6fOfVOT9W4H91UzOua2q9/vOWh7HDb05GArLeOQhnEkHc5dqNah00x0KWwefrAp5Aos
 kOvBcq3nqcn21cKI2bUb9CAUBtWmd5a3IFJw79XIYVfWz7MB77FrVGhLS1Mv6AE8a1j1Qj
 P2wna4fkl0Qhc6ugcKrm1Lwo/QrDRdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-3BwvtepTNGerYDRom7gq6A-1; Thu, 25 Nov 2021 02:12:31 -0500
X-MC-Unique: 3BwvtepTNGerYDRom7gq6A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A8751023F4D;
 Thu, 25 Nov 2021 07:12:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83F2E1800B;
 Thu, 25 Nov 2021 07:12:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2C01E11380A7; Thu, 25 Nov 2021 08:12:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 2/2] hw/i386: Rename default_bus_bypass_iommu
References: <20210811085842.2511545-1-jean-philippe@linaro.org>
 <20210811085842.2511545-2-jean-philippe@linaro.org>
Date: Thu, 25 Nov 2021 08:12:25 +0100
In-Reply-To: <20210811085842.2511545-2-jean-philippe@linaro.org>
 (Jean-Philippe Brucker's message of "Wed, 11 Aug 2021 10:58:44 +0200")
Message-ID: <87tug0pv3a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael & Marcel, this patch fixes a bug that became a regression when
the fix missed 6.1.  It's been stuck on the list since August.  Please
have a look, and if it's good, get it merged.  I just asked the arm/virt
maintainer to do the same for PATCH 1.

Jean-Philippe Brucker <jean-philippe@linaro.org> writes:

> Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
> parameter definitions cannot use underscores, because keyval_dashify()
> transforms them to dashes and the parser doesn't find the parameter.
>
> This affects option default_bus_bypass_iommu which was introduced in the
> same release:
>
> $ qemu-system-x86_64 -M q35,default_bus_bypass_iommu=on
> qemu-system-x86_64: Property 'pc-q35-6.1-machine.default-bus-bypass-iommu' not found
>
> Rename the parameter to "default-bus-bypass-iommu". Passing
> "default_bus_bypass_iommu" is still valid since the underscore are
> transformed automatically.
>
> Fixes: c9e96b04fc19 ("hw/i386: Add a default_bus_bypass_iommu pc machine option")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/i386/pc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index fb24f000e7..ce4756ad59 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1779,7 +1779,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_add_bool(oc, "hpet",
>          pc_machine_get_hpet, pc_machine_set_hpet);
>  
> -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
> +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
>          pc_machine_get_default_bus_bypass_iommu,
>          pc_machine_set_default_bus_bypass_iommu);


