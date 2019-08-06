Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B8583953
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 21:05:08 +0200 (CEST)
Received: from localhost ([::1]:35798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hv4lg-0004F6-1Z
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 15:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hv4hN-0006UU-AS
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 15:00:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hv4hM-00013h-6s
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 15:00:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59870)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hv4hM-00013E-1R
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 15:00:40 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0460730BD1D4;
 Tue,  6 Aug 2019 19:00:39 +0000 (UTC)
Received: from work-vm (ovpn-117-206.ams2.redhat.com [10.36.117.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B182145A7;
 Tue,  6 Aug 2019 19:00:35 +0000 (UTC)
Date: Tue, 6 Aug 2019 20:00:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Singh, Brijesh" <brijesh.singh@amd.com>
Message-ID: <20190806190033.GM3066@work-vm>
References: <20190806165429.19327-1-brijesh.singh@amd.com>
 <20190806165429.19327-2-brijesh.singh@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806165429.19327-2-brijesh.singh@amd.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 06 Aug 2019 19:00:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 01/14] doc: update AMD SEV API spec web
 link
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Singh, Brijesh (brijesh.singh@amd.com) wrote:
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  docs/amd-memory-encryption.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
> index 43bf3ee6a5..8822cadda1 100644
> --- a/docs/amd-memory-encryption.txt
> +++ b/docs/amd-memory-encryption.txt
> @@ -67,8 +67,8 @@ expects.
>  LAUNCH_FINISH command finalizes the guest launch and destroy's the cryptographic
>  context.
>  
> -See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
> -complete flow chart.
> +See Secure Encrypted Virtualization Key Management API spec section
> +'Launching a guest' usage flow  (Appendix A) for the complete flow chart.
>  
>  To launch a SEV guest
>  
> @@ -97,8 +97,8 @@ References
>  AMD Memory Encryption whitepaper:
>  http://amd-dev.wpengine.netdna-cdn.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf
>  
> -Secure Encrypted Virtualization Key Management:
> -[1] http://support.amd.com/TechDocs/55766_SEV-KM API_Specification.pdf
> +Secure Encrypted Virtualization Key Management API Spec:
> +[1] https://developer.amd.com/sev/ (Secure Encrypted Virtualization API)

Yep, that's better; note the document name seems to have lost the words
'key management' at some time; but:


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>  KVM Forum slides:
>  http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

