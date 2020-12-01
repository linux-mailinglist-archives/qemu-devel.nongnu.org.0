Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D2E2CA0EA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:08:31 +0100 (CET)
Received: from localhost ([::1]:34936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3WI-0003SY-Jc
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kk3Rl-0007qY-9C
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:03:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kk3Rg-0005Lu-6M
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606820621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lcOj7fkQipCIlpc5MBpXx4VRVwWSoBEvFgRn9IvZnQs=;
 b=VwzwycQQ0KsH3hsY6IguF00x4G8gXWsNLGWsGABkJ/9wBQVmFXupaM2HHKHW4VsGsg2SEm
 mCSY89BmeblJniBodZpSCbZMz3vaeLfNaZWeBVtbdRv1eBg7zNgfWvVux4QWvwY7pXUgZm
 KEpYs9yl1asyQcHaLCtDjo38R6EG5bE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-PTDgUR51OGqzjinoyqlbcQ-1; Tue, 01 Dec 2020 06:03:39 -0500
X-MC-Unique: PTDgUR51OGqzjinoyqlbcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A248B108E1A0;
 Tue,  1 Dec 2020 11:03:37 +0000 (UTC)
Received: from work-vm (ovpn-115-1.ams2.redhat.com [10.36.115.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B9B75D973;
 Tue,  1 Dec 2020 11:03:04 +0000 (UTC)
Date: Tue, 1 Dec 2020 11:03:02 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Subject: Re: [PATCH 01/11] memattrs: add debug attribute
Message-ID: <20201201110302.GC4338@work-vm>
References: <cover.1605316268.git.ashish.kalra@amd.com>
 <2ba88b512ec667eff66b2ece2177330a28e657c0.1605316268.git.ashish.kalra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ba88b512ec667eff66b2ece2177330a28e657c0.1605316268.git.ashish.kalra@amd.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas.Lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, mtosatti@redhat.com,
 ssg.sos.patches@amd.com, qemu-devel@nongnu.org, armbru@redhat.com,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Ashish Kalra (Ashish.Kalra@amd.com) wrote:
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> Extend the MemTxAttrs to include a 'debug' flag. The flag can be used as
> general indicator that operation was triggered by the debugger.
> 
> A subsequent patch will set the debug=1 when issuing a memory access
> from the gdbstub or HMP commands. This is a prerequisite to support
> debugging an encrypted guest. When a request with debug=1 is seen, the
> encryption APIs will be used to access the guest memory.

Is this also the flag that would be used for memory dumping?

> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  include/exec/memattrs.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 95f2d20d55..c8b56389d6 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -49,6 +49,8 @@ typedef struct MemTxAttrs {
>      unsigned int target_tlb_bit0 : 1;
>      unsigned int target_tlb_bit1 : 1;
>      unsigned int target_tlb_bit2 : 1;
> +    /* Memory access request from the debugger */
> +    unsigned int debug:1;

It might be good to clarify that this is for QEMU debug features, not
guest side debug features (e.g. CPU debug facilities/registers)

Dave

>  } MemTxAttrs;
>  
>  /* Bus masters which don't specify any attributes will get this,
> -- 
> 2.17.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


