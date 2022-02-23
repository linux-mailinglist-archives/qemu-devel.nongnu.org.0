Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2353E4C1024
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:19:35 +0100 (CET)
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMok6-0002Kz-EJ
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:19:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMoAO-0004xX-9g
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:42:36 -0500
Received: from [2a00:1450:4864:20::632] (port=38803
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMoAM-0007ep-4y
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:42:35 -0500
Received: by mail-ej1-x632.google.com with SMTP id r13so28064612ejd.5
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BnEM0OKY57nCjm+a2WF6SfInsuS82SA4NLH3u/TKzVk=;
 b=YZZyPmxFdtHXixRRGoR/a45WUVjSoTUhBFM1OUAC5XlMc2tpIUQE4TS8bVPiiuEp6I
 M9y2vyAcUmPPBnwaKolymVcT2OFIO81tFXAVILemZeT5fdTMi27gzeBEuHYb0gJNTO6e
 OY8py/KYbuJgH7BlrcAdOY2NMpawcOAwxDTNcCfyQ9KMHYqJEs86IBQxL+OzTwgGol1M
 0Hex0fm5uKvGFFX9qQzL4kn+3Z3K/TAyCLME3w2M/lAHAP+ab0JQ6LuFTg17viEGcFtu
 Y5iUPUOXAr9kUSkFHX8rLoJA8G4SAul4pX9iMoK0tmWonKd0R/za16g9Z1d80cqeGLU7
 8xiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BnEM0OKY57nCjm+a2WF6SfInsuS82SA4NLH3u/TKzVk=;
 b=g7xb2yOjm1Nis+lyJU9kCMYHHji/lEiRzTw2oWjiD+dfYFYp1M2jydoE7YthYKnYTc
 ASlMvTSrpM8sR9w9WVSRFOf3nb12KhuXTD78qotrMtptVN7kyb+TSMerus+5uR4Yls8U
 SbDM17sHuK3rpTKfYmCeukHDMfqCyvVS8i35UX89qriv101ZhH3vIRJyOwRDr6oBGl2h
 4rL4kmGPOQ0JGQjKkVkKKGYVRU7y5yqfFSvI+qn9pgBaKZBJ0ipZeFvzr1QmbLp281gi
 cN1ZrLd81oaBBb46QCZ5fGqlEmObzvPJHTvIR7NHGepP5NTcruRhRzIqERdaUwRK+kgg
 XEWQ==
X-Gm-Message-State: AOAM532hZhCCrExu8JtmEpFVDycZ0oaLIZy7efFpXYCEKqNHp8l5sYS2
 JyvHkBG/7swGckTSd68/Va0=
X-Google-Smtp-Source: ABdhPJzqXxSSqIQSmgdUGgPaJftiDd9t8LRBvZMYMSi2fdRbPxepwQTYnZFOCw6got/cQDxHbn5NQA==
X-Received: by 2002:a17:906:d7aa:b0:6cf:1fb3:2986 with SMTP id
 pk10-20020a170906d7aa00b006cf1fb32986mr22723378ejb.594.1645609352698; 
 Wed, 23 Feb 2022 01:42:32 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id m12sm8168297edl.74.2022.02.23.01.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 01:42:32 -0800 (PST)
Message-ID: <56a79999-afea-763c-46d1-633299b1f562@redhat.com>
Date: Wed, 23 Feb 2022 10:42:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC 1/2] sem-posix: remove the posix semaphore support
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Longpeng(Mike)" <longpeng2@huawei.com>
References: <20220221095617.1974-1-longpeng2@huawei.com>
 <20220221095617.1974-2-longpeng2@huawei.com> <YhNzd6bGT2ejTRLx@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YhNzd6bGT2ejTRLx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: arei.gonglei@huawei.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/22 12:11, Daniel P. Berrangé wrote:
> As a point of history, the original  code only used sem_t. The pthreads
> based fallback was introduced by Paolo in
> 
>    commit c166cb72f1676855816340666c3b618beef4b976
>    Author: Paolo Bonzini <pbonzini@redhat.com>
>    Date:   Fri Nov 2 15:43:21 2012 +0100
> 
>      semaphore: implement fallback counting semaphores with mutex+condvar
>      
>      OpenBSD and Darwin do not have sem_timedwait.  Implement a fallback
>      for them.
>      
>      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>      Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
> 
> I'm going to assume this fallback impl is less efficient than the
> native sem_t impl as the reason for leaving the original impl, or
> maybe Paolo just want to risk accidental bugs by removing the
> existing usage ?

Yes, it is a bit less efficient.  But really there aren't any places 
where semaphores vs. mutex+condvar will make a difference.  The original 
reason to use semaphores was that Windows had a hand-written condition 
variable implementation that didn't support cond_timedwait.

Paolo

