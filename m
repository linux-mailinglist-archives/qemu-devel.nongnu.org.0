Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48D2009CF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 15:19:56 +0200 (CEST)
Received: from localhost ([::1]:35380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmGvz-0003B1-Gp
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 09:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1jmGth-0001eH-OI
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 09:17:34 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42313
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1jmGtf-00036f-GU
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 09:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592572648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XhWUY4sTxVlQy/wcNSR8ElLcSNYAXkS9ysaEjKLquFQ=;
 b=GINfllrEKSZxevXdNjqodD47demWVzVxJ7Kj+zt7yxWftRl0d2zfUbOIf6T2NHh746tmr0
 byS94laJ+hLJZv3GNModixJ4Y8NdlN5AFNEb+eeoJWboc31eLXCYdf+0qdHPQIk9+ikfgV
 frq3eZKkbuZWkQ5R82K2S48Ert9euM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-TQfj53AlMwWuO4yXm1Krpg-1; Fri, 19 Jun 2020 09:17:27 -0400
X-MC-Unique: TQfj53AlMwWuO4yXm1Krpg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49211835B40;
 Fri, 19 Jun 2020 13:17:24 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17F9510013C4;
 Fri, 19 Jun 2020 13:17:24 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
 id BD7243E048A; Fri, 19 Jun 2020 15:17:22 +0200 (CEST)
Date: Fri, 19 Jun 2020 15:17:22 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] cpu-models-x86: Fix CPU model name - s/IBR/IBRS/
Message-ID: <20200619131722.GN20144@paraplu>
References: <20200619125413.2210-1-kchamart@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200619125413.2210-1-kchamart@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 01:50:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 19, 2020 at 02:54:13PM +0200, Kashyap Chamarthy wrote:
> It is specified as a literal CPU model, so worth fixing it.
> 
> Although the reader might eventually learn the correct name, assuming
> they where to look -- `qemu-system-x86 -cpu help`.

s/they where/they know where/

> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/system/cpu-models-x86.rst.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
> index 9a2327828e..9b025c04cc 100644
> --- a/docs/system/cpu-models-x86.rst.inc
> +++ b/docs/system/cpu-models-x86.rst.inc
> @@ -66,7 +66,7 @@ across all desired hosts.
>  ``Haswell``, ``Haswell-IBRS``, ``Haswell-noTSX``, ``Haswell-noTSX-IBRS``
>      Intel Core Processor (Haswell, 2013)
>  
> -``IvyBridge``, ``IvyBridge-IBR``
> +``IvyBridge``, ``IvyBridge-IBRS``
>      Intel Xeon E3-12xx v2 (Ivy Bridge, 2012)
>  
>  ``SandyBridge``, ``SandyBridge-IBRS``
> -- 
> 2.21.1
> 

-- 
/kashyap


