Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAE436E5C7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:18:21 +0200 (CEST)
Received: from localhost ([::1]:34598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc0wG-0007tj-BK
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0sf-0004To-KV
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:14:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0sb-0004PH-JD
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:14:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Aj6t3WYmV3fhBTBc6Rr6FQSggRqfIfEALz6GflvInU=;
 b=fCVz1JiOa5ln71l7nNgYGqgsIVe0Jb13JksjlPUhlh192mPdRNzd6AfPxTk26lAP7fXNWK
 Y6O4AIWXIfsecF7TneV75IA78mgCTfVpYe+yRKhXOLuv8hmMv4cdF5ItQNZD8++QhE+/y0
 qHqeD7hGoMozTYVajeTqpbpxq0ckhuY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-M2DTiNALPJCQag16CL5hSA-1; Thu, 29 Apr 2021 03:14:29 -0400
X-MC-Unique: M2DTiNALPJCQag16CL5hSA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z3-20020a05640240c3b029037fb0c2bd3bso28478460edb.23
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6Aj6t3WYmV3fhBTBc6Rr6FQSggRqfIfEALz6GflvInU=;
 b=GS/d46nYf2oIUEADkE61do1gs5F8IJpmr1DPmI4tP/bjy81H21pSLm0Q3vRsUHWftF
 rmtfMDh23qPM+sdgTTq/t74TICs03xUPBDMsIiK+XXHsQg7eafN3x9CeJtwYO9/B4lbV
 qQK75hyrcu9UjNGPk1iF6ElzKSyOx+zwr2+ynuTNNbLwvv2V901CjVNUoRcSYCugnaeZ
 HihzsXGt0nvAthS0zsTuAUoSuyrXRV/+cP0kgILPGBn6ncly1QcTfDlXIzXf82gNuREF
 1XcoPvWftPzMKoV+VjtRmeuww+QJzpwFtNaiM7qLcEx4ByVfpWcjkUL5QEE/G3PUs+zd
 VLTg==
X-Gm-Message-State: AOAM530RXb6KpLaz75hBaFSySRjNg8Y0t5gxWnd1ZFoFvbb6UBr1XOXg
 zd2xWwDfgafAExF3ERXALEdXC34WSFZm1MgtsRtjOCGqJ1WffwcO4sEtx3y7jEfbpIEOKJEd12S
 FhE49CyGmaKE7EMc=
X-Received: by 2002:a17:906:90d4:: with SMTP id
 v20mr33620829ejw.275.1619680467918; 
 Thu, 29 Apr 2021 00:14:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw09o/++1jZK5Z/IrxUltcrciIG+YCFBnLYuvsAvSLCwcoY5HHNZIxqpCp6qhq+qglrLUkARw==
X-Received: by 2002:a17:906:90d4:: with SMTP id
 v20mr33620810ejw.275.1619680467681; 
 Thu, 29 Apr 2021 00:14:27 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 o6sm1617551edw.24.2021.04.29.00.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:14:27 -0700 (PDT)
Subject: Re: [PATCH v2 07/15] linux-user/s390x: Use tswap_sigset in
 setup_rt_frame
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-8-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <00f9d811-a97e-15c6-30ac-34756bfc10b6@redhat.com>
Date: Thu, 29 Apr 2021 09:14:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-8-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index f8515dd332..4dde55d4d5 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -182,7 +182,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>                       target_siginfo_t *info,
>                       target_sigset_t *set, CPUS390XState *env)
>   {
> -    int i;
>       rt_sigframe *frame;
>       abi_ulong frame_addr;
>   
> @@ -199,10 +198,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       __put_user((abi_ulong)0, (abi_ulong *)&frame->uc.tuc_link);
>       target_save_altstack(&frame->uc.tuc_stack, env);
>       save_sigregs(env, &frame->uc.tuc_mcontext);
> -    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
> -        __put_user((abi_ulong)set->sig[i],
> -                   (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
> -    }
> +    tswap_sigset(&frame->uc.tuc_sigmask, set);
>   
>       /* Set up to return from userspace.  If provided, use a stub
>          already in userspace.  */
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


