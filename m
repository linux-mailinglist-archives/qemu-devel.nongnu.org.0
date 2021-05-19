Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9099388953
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 10:24:53 +0200 (CEST)
Received: from localhost ([::1]:40324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljHVc-0005QF-Qp
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 04:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljHUZ-0004jj-ED
 for qemu-devel@nongnu.org; Wed, 19 May 2021 04:23:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljHUW-0005Kn-Ii
 for qemu-devel@nongnu.org; Wed, 19 May 2021 04:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621412623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cm5G/LkWelG9aK6m1j2SCUnYu51kF06ySyNpHMfyskk=;
 b=Ss1CAPOs3rsetJ5hDL2ATJ2JiGTSEmBWWHch2COzKBgtT6qXcQIQPPs/gNoYkXAsqc9DD1
 h1fwH6kU23TN+O1hrz+Wx/in/HYc2pawBSYH22YuAHTWLDtMPUVYINf7oZLsptb/z7s08y
 rp0pOvwm1X80OCMiHBEugQaurRWN7Fc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-EjuhTqouNB2W-Mvoyjc1UQ-1; Wed, 19 May 2021 04:23:41 -0400
X-MC-Unique: EjuhTqouNB2W-Mvoyjc1UQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 007AE1923793
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 08:23:19 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2303351C35;
 Wed, 19 May 2021 08:23:17 +0000 (UTC)
Subject: Re: [PATCH v5 1/6] hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO
 -> FDC
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
References: <20210518193239.1725624-1-philmd@redhat.com>
 <20210518193239.1725624-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <977f921f-7dfe-707b-51d4-85e6c7aba164@redhat.com>
Date: Wed, 19 May 2021 10:23:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210518193239.1725624-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/2021 21.32, Philippe Mathieu-Daudé wrote:
> isa_superio_realize() calls isa_fdc_init_drives(), which is defined
> in hw/block/fdc.c, so ISA_SUPERIO needs to select the FDC symbol.

If I get that right, not all superio chipsets provide a floppy drive 
(there's this "k->floppy.is_enabled" check in there) ... but for boards that 
don't need the FDC, this would currently require a stub for that function - 
so unless someone adds such a stub, you're right, this currently requires 
the FDC code, thus:

Reviewed-by: Thomas Huth <thuth@redhat.com>

> Reported-by: John Snow <jsnow@redhat.com>
> Fixes: c0ff3795143 ("Introduce a CONFIG_ISA_SUPERIO switch for isa-superio.c")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/isa/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index 55e0003ce40..7216f66a54a 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -17,6 +17,7 @@ config ISA_SUPERIO
>       bool
>       select ISA_BUS
>       select PCKBD
> +    select FDC
>   
>   config PC87312
>       bool
> 


