Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190D2459004
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:14:22 +0100 (CET)
Received: from localhost ([::1]:59392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpA5M-0006zP-MH
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:14:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mpA48-0005Om-Rr
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:13:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mpA45-0008PA-5P
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637590379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vd02JsOmoQqykn35Ql408cjfDULXbY3etoCqux97PAc=;
 b=MuNW20/O78S5QDWL4/ftGewJWAQ9Hu49RKJgOPiu49dc8gO+FxhJ5teakYZw4dor8thXxU
 6Y7x+Q7kPwA+HtyHGOGSCM+pmYySmQf5pagHlUeMKyruvqsQ/w29OCrfDBN+v86mOqQmX6
 UcUNF/nwhHYUTl/O0s802zsYWJ7An7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-K5qTg-w9N-ixndhnO8xEmQ-1; Mon, 22 Nov 2021 09:12:54 -0500
X-MC-Unique: K5qTg-w9N-ixndhnO8xEmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54C2A1DDF4;
 Mon, 22 Nov 2021 14:12:53 +0000 (UTC)
Received: from redhat.com (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE5F1981F;
 Mon, 22 Nov 2021 14:12:52 +0000 (UTC)
Date: Mon, 22 Nov 2021 08:12:50 -0600
From: Eric Blake <eblake@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2] qapi/machine.json: Fix incorrect description for
 die-id
Message-ID: <20211122141250.n6wwuh7tmvt2iult@redhat.com>
References: <20211122032651.16064-1-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20211122032651.16064-1-wangyanan55@huawei.com>
User-Agent: NeoMutt/20211029-26-f6989f
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 22, 2021 at 11:26:51AM +0800, Yanan Wang wrote:
> In terms of scope, die-id should mean "the die number within
> socket the CPU belongs to" instead of "the die number within
> node/board the CPU belongs to". Fix it to avoid confusing
> the Doc reader.
> 
> Fixes: 176d2cda0d ("i386/cpu: Consolidate die-id validity in smp context")
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  qapi/machine.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 067e3f5378..f1839acf20 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -867,7 +867,7 @@
>  #
>  # @node-id: NUMA node ID the CPU belongs to
>  # @socket-id: socket number within node/board the CPU belongs to
> -# @die-id: die number within node/board the CPU belongs to (Since 4.1)
> +# @die-id: die number within socket the CPU belongs to (since 4.1)
>  # @core-id: core number within die the CPU belongs to
>  # @thread-id: thread number within core the CPU belongs to
>  #
> -- 
> 2.19.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


