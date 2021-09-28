Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4852941ACF3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 12:29:22 +0200 (CEST)
Received: from localhost ([::1]:54046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAMT-0001FR-Ac
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 06:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAJf-0006pC-W2
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:26:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAJa-0006zt-8V
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632824781;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjZbmWI/l21ich4SsAoZGcgw200Idsce8jmegmlRTMs=;
 b=Ae2wH3OgHwcPyTxs9WfSEmavUK9xGCE/zxGQaq9lpL9zk05yyP+rKhJ2swzNfkyrtZvh0A
 LJQdksTt2Gg0ZAMa8hPp1ipGNcGd6ca2PL8GJd5nORcSLPBYP7c/rpQWkqLImNxhj2HGAJ
 zCw9IOvMjpVT1l0G+a0aP+nGCeu8dPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-wwPQMgNGOmSRUyfo8YzUoA-1; Tue, 28 Sep 2021 06:26:19 -0400
X-MC-Unique: wwPQMgNGOmSRUyfo8YzUoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C0CA835DE1;
 Tue, 28 Sep 2021 10:26:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D45563AC0;
 Tue, 28 Sep 2021 10:25:55 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:25:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 12/14] machine: Remove smp_parse callback from
 MachineClass
Message-ID: <YVLtsRB7aGcYvDl6@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-13-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-13-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On Tue, Sep 28, 2021 at 11:57:53AM +0800, Yanan Wang wrote:
> Now we have a generic smp parser for all arches, and there will
> not be any other arch specific ones, so let's remove the callback
> from MachineClass and call the parser directly.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/core/machine.c   | 3 +--
>  include/hw/boards.h | 5 -----
>  2 files changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


