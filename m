Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23493FA06D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 22:16:50 +0200 (CEST)
Received: from localhost ([::1]:57320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJiHR-0003yo-62
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 16:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJiGT-0003IF-04
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 16:15:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJiGQ-0004w8-7i
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 16:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630095344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lkJuGHRWTjEjE+gy4jXEjtAVv+BPYQ8MVLBM+H9fyFw=;
 b=CNTY6ekoNLSzqi4qY0lkZ04D9KK5GbArzrVDnzyYWEI2cX5MKTI/ENWlYR5ULMUnmSn21B
 hsiXCvWxRDiHb15n0+aVnhDaPqITCKskRVrjh0kzH+pfSCyU5bbgnRR3tMdej+f8xHYKMR
 8Phr1xEIweTE7trxmAOyZvB+Kff7eyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-R2Y2ZTknNquZYaLBqhi_BQ-1; Fri, 27 Aug 2021 16:15:38 -0400
X-MC-Unique: R2Y2ZTknNquZYaLBqhi_BQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C5FB87D541;
 Fri, 27 Aug 2021 20:15:37 +0000 (UTC)
Received: from redhat.com (ovpn-112-96.phx2.redhat.com [10.3.112.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1501F100EB3D;
 Fri, 27 Aug 2021 20:15:34 +0000 (UTC)
Date: Fri, 27 Aug 2021 15:15:32 -0500
From: Eric Blake <eblake@redhat.com>
To: Guoyi Tu <tugy@chinatelecom.cn>
Subject: Re: [PATCH] qapi: Set boolean value correctly in examples
Message-ID: <20210827201532.bott5brcqnvnicfo@redhat.com>
References: <a21a2b61-2653-a2c9-4478-715e5fb19120@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <a21a2b61-2653-a2c9-4478-715e5fb19120@chinatelecom.cn>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 27, 2021 at 05:06:27PM +0800, Guoyi Tu wrote:
> 
> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
> ---
>  qapi/trace.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/qapi/trace.json b/qapi/trace.json
> index 47c68f04da..eedfded512 100644
> --- a/qapi/trace.json
> +++ b/qapi/trace.json
> @@ -99,7 +99,7 @@
>  # Example:
>  #
>  # -> { "execute": "trace-event-set-state",
> -#      "arguments": { "name": "qemu_memalign", "enable": "true" } }
> +#      "arguments": { "name": "qemu_memalign", "enable": true } }
>  # <- { "return": {} }
>  #
>  ##
> -- 
> 2.25.1
> 
> -- 
> Best Regards,
> Guoyi Tu
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


