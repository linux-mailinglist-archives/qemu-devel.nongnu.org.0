Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60141347B19
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:47:14 +0100 (CET)
Received: from localhost ([::1]:35574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4mv-0000mK-BL
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP4b1-0002gL-Dy
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:34:55 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:35595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP4ay-00014C-LR
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:34:55 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so23212338oto.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qUIEoIuFdq0tz4loQchcNi+0aFSgRKRyqkP8xds7CLc=;
 b=KJlFHeotpZlLb23cXY1tr6+4m/OUy/Inuf0FbtSHNAzRqblNC+WDdnwkH1g+EYTgb1
 xoxyf2v44mC42Bj5J6bFvRqsdvRcxOUr6QOIPo6QYnlx8S03aJlv891qe4rs9U3av5cU
 PgjlZ6jIb703AbRor0bFBQPedcKlVuCg/BI++KFb5Vlo26MM2nMu3WUHMIJqDsr7VjnO
 TpQ7CzGlaRqzSmrq7EeLLAJzWAm+Q9NAVpaAMcX0EtsZ20aO2qqOsZm2IzT9Uc3z4VnQ
 s9ZlxtyKt+9lCuFkEvXxI1ryr8suF8T83JWYvDERn080HtSE+rnl9frxkT8NIJgiai1q
 y5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qUIEoIuFdq0tz4loQchcNi+0aFSgRKRyqkP8xds7CLc=;
 b=lhIMvl3U9iYTbxUYlKO2XHg7JeXdrv24W5GFaKx3pymFTqtwEzx0Jwnw1hTh/VLfqX
 mZGxnOMetxknF14/9l/9/hYV48TS+g5D0fpPUv/SqAZXc9Kgx0x4ntAPbp5doLsGRO3Y
 5Jq9IzUAMYav7+kYtgKMciWGv++Ev0qQucV14MSc+fmJ+kHpDrO0NnstOfFemxgVXdkb
 BRuvDRYhcfwkvb4PlC2+r+L6FxpFfxxfLlxq3e+M/PJD6F8GV+5HWYjkvB/9u07u9FMX
 /hfbik2Y9Fcu3iWG6VlIAt9EFO/iaiper3xA1e8BAX23jciAd3S+AY9CBUgAexRViNWe
 ylCA==
X-Gm-Message-State: AOAM532YJ/f9g/Kw0H/vz4C8A6xb9H5LMfu6qBUykDdgRVZiymnGHh5F
 jQ9/iM0UEtUjhansX91CExAxDQ==
X-Google-Smtp-Source: ABdhPJyn64w55K3OWoywyd5d8u57dkgpPrkCU1uTJm8689C0QF99FgZQS9E3rDXNr+rzWACScDoHWg==
X-Received: by 2002:a05:6830:1658:: with SMTP id
 h24mr3308360otr.263.1616596491501; 
 Wed, 24 Mar 2021 07:34:51 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id h12sm578290ote.75.2021.03.24.07.34.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 07:34:50 -0700 (PDT)
Subject: Re: [PATCH 1/1] linux-user/s390x: Apply h2g to address of sigreturn
 stub
To: Andreas Krebbel <krebbel@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>
References: <20210324085129.29684-1-krebbel@linux.ibm.com>
 <5070a253-cd95-59b0-dbdb-2eb549e9f61c@redhat.com>
 <b48b73ee-b27b-1e3d-3387-ce818e7b0c15@vivier.eu>
 <3d64f14f-58a4-7cc3-a069-f7ed1172d038@linux.ibm.com>
 <dfdad0d0-4b1c-d2e8-04c5-e6a2dbebe5b2@vivier.eu>
 <4fadf180-24d5-01f2-8345-14d52f098db4@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17bfd572-623d-6bc4-fd9f-4c9b7d372156@linaro.org>
Date: Wed, 24 Mar 2021 08:34:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4fadf180-24d5-01f2-8345-14d52f098db4@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:14 AM, Andreas Krebbel wrote:
> The part I actually needed to fix was in setup_rt_frame and there the fix is correct I think since
> here we do use 'frame' which is the host address.
> 
> While doing that change I also stumbled upon the other location in setup_frame. There it is using
> frame_addr for doing the same thing. There as you say adding h2g is wrong.
> 
> Here just the change which I think is needed:
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index ecfa2a14a9..7fba1c7999 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -213,7 +213,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       if (ka->sa_flags & TARGET_SA_RESTORER) {
>           env->regs[14] = (unsigned long) ka->sa_restorer | PSW_ADDR_AMODE;
>       } else {
> -        env->regs[14] = (unsigned long) frame->retcode | PSW_ADDR_AMODE;
> +        env->regs[14] = (unsigned long) h2g(frame->retcode) | PSW_ADDR_AMODE;

Correct, though I think the formulation using frame_addr is more obvious.

Unrelated, but all the uses of "unsigned long" are wrong -- they should be 
target_ulong.


r~

