Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA66A3A26DB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:24:02 +0200 (CEST)
Received: from localhost ([::1]:41028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrFyr-0003cH-Kt
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lrFrq-0006ll-2x
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:16:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lrFrh-0007bi-NF
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623312997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLKCnILlLqHCGjEs8z/yWUyWVBtu1u0HYtrB8R4hbvk=;
 b=PlRXTytTqQyv8GNzxR9nqjkbvQFEBUx2VhoXfLfaYNRIeVzYCwFfJeKGLgeY233SL36SYw
 z2qV0aIn/GnjW7NoIOgP6B2FmVOufWazh1fV6DfchpKICLqpRKSmSjW9FdFi+H1843W08b
 7DOVvt8Dx0Ixv4fWOWLWHT+9wtSZ+L4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-eshFYsBdM4idD7Zdx-Pofg-1; Thu, 10 Jun 2021 04:16:36 -0400
X-MC-Unique: eshFYsBdM4idD7Zdx-Pofg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21A3B192296E;
 Thu, 10 Jun 2021 08:16:35 +0000 (UTC)
Received: from work-vm (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2496319CA8;
 Thu, 10 Jun 2021 08:16:32 +0000 (UTC)
Date: Thu, 10 Jun 2021 09:16:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 04/11] target/i386/cpu: Add missing 'qapi/error.h' header
Message-ID: <YMHKXiEK+3evW+2C@work-vm>
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210610064556.1421620-5-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Commit 00b81053244 ("target-i386: Remove assert_no_error usage")
> forgot to add the "qapi/error.h", add it now.

for the error_abort I guess

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  target/i386/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index a9fe1662d39..694031e4aec 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -27,6 +27,7 @@
>  #include "sysemu/hvf.h"
>  #include "kvm/kvm_i386.h"
>  #include "sev_i386.h"
> +#include "qapi/error.h"
>  #include "qapi/qapi-visit-machine.h"
>  #include "qapi/qmp/qerror.h"
>  #include "qapi/qapi-commands-machine-target.h"
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


