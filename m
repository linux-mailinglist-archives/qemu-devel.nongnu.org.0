Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C95EFDD8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 21:21:39 +0200 (CEST)
Received: from localhost ([::1]:46618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odz6F-0005mh-Hq
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 15:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1odz26-0002HR-1w
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 15:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1odz21-0006ZQ-5i
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 15:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664479014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kU2rD5nS6myoYoaYf1Npo3rZffBXeAh6IQzrtj2xA1o=;
 b=LDZ34mgSlFb+NvtcQtOxnY3lTXpBwPYG0lajEY0qgWXr0J5nFQJAHeuSwwer2hHWri4yrE
 jm+SaLGWA1IZLCB9eNMSAbNDrFT7DdgxSO++rWFGpXLITxUM+FnH24+dq3PbR9XRuHrkYm
 HPGjuBH8EgOZP1482uhVh7jtUHvrK/I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-211-gF4I2656Mi2c79FMvgr9vQ-1; Thu, 29 Sep 2022 15:16:52 -0400
X-MC-Unique: gF4I2656Mi2c79FMvgr9vQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c2-20020a1c3502000000b003b535aacc0bso3359735wma.2
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 12:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kU2rD5nS6myoYoaYf1Npo3rZffBXeAh6IQzrtj2xA1o=;
 b=s+vHhCs0GAtP1AtLcwxfKzEOpegTmhBcHikT7YUr4s+p2DauoAUddmpGX94vvbBVQt
 S3AORr9VsiiRgQYZHrUtLYPxNIbkm0PG/8PWGq7t0Gxq8OC354ShI6/udRF+0VwhbFxS
 zeNENj0ObY+Y9+M3vcdlpbIvr8bTcpDljbZMM/egaVWfB6oiHywdF0g400rHXNS99aKb
 L1OTOUBDkjckAYwAxlNPLNfosW8VUvMlQUXCGpYsw3k3zm5at/UCB/vuiEj2Gvb8iKG6
 LuH3Jbx/mNqKmT4qRl2HoSEFBvdiA2mWYRny4HgZtLr1+hisTGqJ5O+z4M+WZgNJj3l4
 7kgw==
X-Gm-Message-State: ACrzQf02UjhTHhOEjtZRd/CozLGh/mSXF/w0xfUGW3Q5mRRgaP+Rk2Py
 ronKnkfoyCNlQJv36eYTdpP/NujSfajOMA0EN/Rmngz7I2e70mePD0eUIAq1RhFMLLYd8nL/IYA
 szcrqYi696vqM6p8=
X-Received: by 2002:a05:600c:4e52:b0:3b4:a828:1d84 with SMTP id
 e18-20020a05600c4e5200b003b4a8281d84mr11525994wmq.143.1664479011748; 
 Thu, 29 Sep 2022 12:16:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6EUrU6vPDoT+JOaA8mXEsvSYYyj4q5BsUL0pLkC6ypcXEddR0lIhMQzZRA4yI536oUr2TL5w==
X-Received: by 2002:a05:600c:4e52:b0:3b4:a828:1d84 with SMTP id
 e18-20020a05600c4e5200b003b4a8281d84mr11525980wmq.143.1664479011424; 
 Thu, 29 Sep 2022 12:16:51 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 t1-20020a0560001a4100b0022cd539ce5esm166490wry.50.2022.09.29.12.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 12:16:50 -0700 (PDT)
Date: Thu, 29 Sep 2022 20:16:48 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] RISC-V: Add support for Ztso
Message-ID: <YzXvIKVeFcHQ3ZQI@work-vm>
References: <20220902034412.8918-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902034412.8918-1-palmer@rivosinc.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Palmer Dabbelt (palmer@rivosinc.com) wrote:
> Ztso, the RISC-V extension that provides the TSO memory model, was
> recently frozen.  This provides support for Ztso on targets that are
> themselves TSO.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> ---
> 

> diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
> index 00fcbe297d..2a43d54fcd 100644
> --- a/tcg/i386/tcg-target.h
> +++ b/tcg/i386/tcg-target.h
> @@ -236,6 +236,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
>  #include "tcg/tcg-mo.h"
>  
>  #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
> +#define TCG_TARGET_SUPPORTS_MCTCG_RVTSO 1

Is x86's brand of memory ordering strong enough for Ztso?
I thought x86 had an optimisation where it was allowed to store forward
within the current CPU causing stores not to be quite strictly ordered.

Dave

>  #define TCG_TARGET_HAS_MEMORY_BSWAP  have_movbe
>  
> diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
> index 23e2063667..f423c124a0 100644
> --- a/tcg/s390x/tcg-target.h
> +++ b/tcg/s390x/tcg-target.h
> @@ -171,6 +171,7 @@ extern uint64_t s390_facilities[3];
>  #define TCG_TARGET_HAS_MEMORY_BSWAP   1
>  
>  #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
> +#define TCG_TARGET_SUPPORTS_MCTCG_RVTSO 1
>  
>  static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
>                                              uintptr_t jmp_rw, uintptr_t addr)
> -- 
> 2.34.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


