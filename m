Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D513FCCB3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:59:11 +0200 (CEST)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL82I-0005B8-MO
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mL816-0004RB-Ma
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:57:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mL815-0001er-3F
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630432666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ib730FJ5rAr7Rv4R4zQvODQEKboU9vm4u2Wlce1GRHY=;
 b=OiR6Ng6GppqVZlzrNHIPQL8uBC80N8+GeCBW3D9WZrdWM628jr9+VnAGYy1cXKAToItj8k
 lqQ/fkD/He3bqLMTNVqcI3oGRtxH95JoK0FMdu+Ebi0c7xfiycvg6YH5fvLf1X2qZpE3qw
 h5fILwTHFIF9ffLYDMRmiA7SFp/lL0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-7_iT72JLOXaZz0PHkeOgOQ-1; Tue, 31 Aug 2021 13:57:42 -0400
X-MC-Unique: 7_iT72JLOXaZz0PHkeOgOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 102D68CC783;
 Tue, 31 Aug 2021 17:57:42 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5B002B0B3;
 Tue, 31 Aug 2021 17:57:41 +0000 (UTC)
Date: Tue, 31 Aug 2021 18:57:40 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] target/i386: add missing bits to CR4_RESERVED_MASK
Message-ID: <20210831175740.GZ26415@redhat.com>
References: <20210831175033.175584-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210831175033.175584-1-berrange@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Lara Lazier <laramglazier@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 06:50:33PM +0100, Daniel P. Berrangé wrote:
> Booting Fedora kernels with -cpu max hangs very early in boot. Disabling
> the la57 CPUID bit fixes the problem. git bisect traced the regression to
> 
>   commit 213ff024a2f92020290296cb9dc29c2af3d4a221 (HEAD, refs/bisect/bad)
>   Author: Lara Lazier <laramglazier@gmail.com>
>   Date:   Wed Jul 21 17:26:50 2021 +0200
> 
>     target/i386: Added consistency checks for CR4
> 
>     All MBZ bits in CR4 must be zero. (APM2 15.5)
>     Added reserved bitmask and added checks in both
>     helper_vmrun and helper_write_crN.
> 
>     Signed-off-by: Lara Lazier <laramglazier@gmail.com>
>     Message-Id: <20210721152651.14683-2-laramglazier@gmail.com>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> In this commit CR4_RESERVED_MASK is missing CR4_LA57_MASK and
> two others. Adding this lets Fedora kernels boot once again.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/i386/cpu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> I don't know the implications of CR4_VMXE_MASK and CR4_SMXE_MASK
> being missing in CR4_RESERVED_MASK. It didn't cause any ill effects
> either way, but I added them on the assumption that CR4_RESERVED_MASK
> was supposed to contain all define bits.
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 6c50d3ab4f..ce85f1a29d 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -257,6 +257,7 @@ typedef enum X86Seg {
>                  | CR4_DE_MASK | CR4_PSE_MASK | CR4_PAE_MASK \
>                  | CR4_MCE_MASK | CR4_PGE_MASK | CR4_PCE_MASK \
>                  | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK |CR4_UMIP_MASK \
> +                | CR4_LA57_MASK | CR4_VMXE_MASK | CR4_SMXE_MASK \
>                  | CR4_FSGSBASE_MASK | CR4_PCIDE_MASK | CR4_OSXSAVE_MASK \
>                  | CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_PKE_MASK | CR4_PKS_MASK))

First thing to say is I tested this locally and it fixes the
problem seen in https://bugzilla.redhat.com/show_bug.cgi?id=1999700.
I will also add this patch to Fedora soon.  So:

Tested-by: Richard W.M. Jones <rjones@redhat.com>

But my question is, does this mean that every time a new CPU feature
appears we must remember to update this code?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


