Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C980345E7A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:49:16 +0100 (CET)
Received: from localhost ([::1]:40184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgTD-00056u-46
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lOgQp-00044d-G1
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:46:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lOgQn-0008Lx-1o
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616503604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u2TGTVFBx00xmmOzqPs4Vt38KZWQ+L4etIJ/hfiMACw=;
 b=ebRYY3jW/1g64nA88VAU3TjdI6dUeZ4N//8/jR4DGc/gevKMaBo1yUCJ1qdzG8cAgEgyPc
 Id+iPHQOna0665VxmEZIBR0Nhq0vmqxtMDGNfbd0zvC97VaXJkYxHUgHIHFa0NCzJ/LhnE
 rXOQyM7K84WtMWQZmI8N0WErU0yxyf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-6jy5_rTQOO6C7JFTctGoAw-1; Tue, 23 Mar 2021 08:46:42 -0400
X-MC-Unique: 6jy5_rTQOO6C7JFTctGoAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9CE89CC02;
 Tue, 23 Mar 2021 12:46:40 +0000 (UTC)
Received: from work-vm (ovpn-115-35.ams2.redhat.com [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0241D1972B;
 Tue, 23 Mar 2021 12:46:39 +0000 (UTC)
Date: Tue, 23 Mar 2021 12:46:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michael Rolnik <mrolnik@gmail.com>
Subject: Re: [PATCH 1/1] Set TARGET_PAGE_BITS to be 10 instead of 8 bits
Message-ID: <YFnjLbU9+itpbvsf@work-vm>
References: <20210320220949.40965-1-mrolnik@gmail.com>
 <20210320220949.40965-2-mrolnik@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210320220949.40965-2-mrolnik@gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael Rolnik (mrolnik@gmail.com) wrote:
> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
> ---
>  target/avr/cpu-param.h | 8 +-------
>  target/avr/helper.c    | 2 --
>  2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/target/avr/cpu-param.h b/target/avr/cpu-param.h
> index 7ef4e7c679..9765a9d0db 100644
> --- a/target/avr/cpu-param.h
> +++ b/target/avr/cpu-param.h
> @@ -22,13 +22,7 @@
>  #define AVR_CPU_PARAM_H
>  
>  #define TARGET_LONG_BITS 32
> -/*
> - * TARGET_PAGE_BITS cannot be more than 8 bits because
> - * 1.  all IO registers occupy [0x0000 .. 0x00ff] address range, and they
> - *     should be implemented as a device and not memory
> - * 2.  SRAM starts at the address 0x0100

I don't know AVR; but that seems to say why you can't make it any larger
- how do you solve that?

Dave

> -#define TARGET_PAGE_BITS 8
> +#define TARGET_PAGE_BITS 10
>  #define TARGET_PHYS_ADDR_SPACE_BITS 24
>  #define TARGET_VIRT_ADDR_SPACE_BITS 24
>  #define NB_MMU_MODES 2
> diff --git a/target/avr/helper.c b/target/avr/helper.c
> index 35e1019594..da658afed3 100644
> --- a/target/avr/helper.c
> +++ b/target/avr/helper.c
> @@ -111,8 +111,6 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      MemTxAttrs attrs = {};
>      uint32_t paddr;
>  
> -    address &= TARGET_PAGE_MASK;
> -
>      if (mmu_idx == MMU_CODE_IDX) {
>          /* access to code in flash */
>          paddr = OFFSET_CODE + address;
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


