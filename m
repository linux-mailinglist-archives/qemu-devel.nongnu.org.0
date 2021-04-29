Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC44536E5D9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:23:55 +0200 (CEST)
Received: from localhost ([::1]:49940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc11e-00061x-Ux
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0zQ-0003g1-M4
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:21:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0zL-0008Vf-8a
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfgMDkhTWuzas+j1yeUrL+XAQljnPB+t29BQBNf3LZE=;
 b=SrH7bVc9r35/oU9Naj962bfcfCQVdWSzyntpvpgTC3i/nj8B106xPbkM2H4Xl1IBLGgb9p
 mhvatylhJ8mtxEAz9jIMfWgQqjrAM+ZfBOjBjgsXADYcshld2DFV5cfRJ/o3U5R6u6WnUr
 m4b+F0bi/Cdv5IoZEtpqFvgUSLxoJRU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-udnRpCzLOoqqg1_DVByyFg-1; Thu, 29 Apr 2021 03:21:28 -0400
X-MC-Unique: udnRpCzLOoqqg1_DVByyFg-1
Received: by mail-wm1-f69.google.com with SMTP id
 u8-20020a1cdd080000b02901466dad19e5so174207wmg.9
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HfgMDkhTWuzas+j1yeUrL+XAQljnPB+t29BQBNf3LZE=;
 b=dyzTgJV6Lu3f5b5sX3Yx7ZbLoF+rXOAct1sgX5gzoFGe7uzv2LRpMkWf6jGgATormT
 TrvExIx13/dbvtW55z63SPspPxNhbuxBnP1Yr4SmRmeyUdI/HHh1tINiDLxv5HQhdLgv
 A06SRWrhdOs3CGjogg2VJf8Lnbtgh20m4sBwlw3C44+QvwiH+1Z2YxylMe47M6Z8b8mo
 AYlmFkDq7dOoRAdGeIeImey2L/HfoWQgbJ7LIDdzEREIBc20XSFoklIc8GH/z/eF0pcx
 7GCK+XyNgXHsWU3nw8m1Qj/JEMUN8CdHCO7Z62yYBaAUzUNBRlClto9binZYyCABXqEB
 CycQ==
X-Gm-Message-State: AOAM533yaJxnCM2RFuqtBWbS6wS0yjsmeSh0KsbDTWTi6CJ8023IASC9
 WBkc1Ni/SkSISX46+c684xg62lF6Sw7NU3qD/Vr22WUtkuWprCixcwbOgxhZLKZbO28Xpv5AKUI
 JGiu35bULqNtNQcs=
X-Received: by 2002:adf:dc4f:: with SMTP id m15mr41591199wrj.420.1619680887538; 
 Thu, 29 Apr 2021 00:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVFjr6AGBKzxDdLndCXVu9iWCsYyMuSye/6tM8gcAD4INyHx4GsjERKSXXH2A8jMqqyxVRgQ==
X-Received: by 2002:adf:dc4f:: with SMTP id m15mr41591173wrj.420.1619680887285; 
 Thu, 29 Apr 2021 00:21:27 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 o1sm3639297wrw.95.2021.04.29.00.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:21:27 -0700 (PDT)
Subject: Re: [PATCH v2 12/15] linux-user/s390x: Fix frame_addr corruption in
 setup_frame
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-13-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <9baa20b6-55e1-3e5e-e8c5-3f5e7261e296@redhat.com>
Date: Thu, 29 Apr 2021 09:21:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-13-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.04.21 21:34, Richard Henderson wrote:
> The original value of frame_addr is still required for
> its use in the call to unlock_user_struct below.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index bc41b01c5d..81ba59b46a 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -168,7 +168,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>       env->psw.addr = ka->_sa_handler;
>   
>       env->regs[2] = sig;
> -    env->regs[3] = frame_addr += offsetof(typeof(*frame), sc);
> +    env->regs[3] = frame_addr + offsetof(typeof(*frame), sc);
>   
>       /*
>        * We forgot to include these in the sigcontext.
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


