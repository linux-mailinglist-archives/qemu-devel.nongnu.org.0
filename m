Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07D8401968
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:04:36 +0200 (CEST)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNBUR-0003ii-Mk
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBRU-0001kN-8n
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:01:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBRS-0003WY-9m
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630922489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KeZrRAPpSMsCLrjtyJJ9R3wN5pP+Lit5M3+xg4289c=;
 b=JBCS+vr8YSB63rgAERDRFkK/Twb/edzMnxkv5dcsl73OOFfJzip/d7cc1MP71oBdqv0t0d
 ltMz9eAzCQWFbG5/I2VBKmr7j48fkORoJ83IKcWesl+sRO6SpLV7OZuMwucq4eeRsoFioA
 PeP0Cbe/t1H5bkHqayIi/l+oBcebLOo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-CVFOwewJMSy9Zqq8y5bEoQ-1; Mon, 06 Sep 2021 06:01:28 -0400
X-MC-Unique: CVFOwewJMSy9Zqq8y5bEoQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so3696395wmj.8
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 03:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1KeZrRAPpSMsCLrjtyJJ9R3wN5pP+Lit5M3+xg4289c=;
 b=SaeE3sG550yWWKnozY/1ulKs+DmeAW0c+qEP3bMWAzlYJCFPIS587HxzhPZrrqOr0X
 5N7y5RNMOO8BwuEm+B3f4D+rtbCJ77+HGZT8YHdeIJ7w0gqbPEmCmRO6AMWkqKHWzL70
 t8AQAntawEAK7WFozuoN+b0ClIcCsKnFzrZD6/cx4mUjVKEgJ3zDqL1XNyUeJ+dYunC4
 kA/IXhjLQp/+wIh+alVsNgOUaInhdDSA7iComQGinlERNk88AIhPZyu4CwPwvGe/E2jr
 oDfbMN8+9EuhNSWcp+873JJq19HrBn2pC+cPA7/AoDAv8dW49EaKn5mgaAzL5LsaklXJ
 TABw==
X-Gm-Message-State: AOAM532Qyfurql3qVogYgQpGj2RoQAUFXg6EmLaHJr67RyQ5V1WR+Lo1
 hRlstoGyZrVCOacFfYeRlh76kFl/GBkzFirSMRC9/hVSlOYMg4VmOM0qQQX1fnCevpNHUVxMlYl
 ppti6jY/5IzuX8KQ=
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr12235457wrq.212.1630922487148; 
 Mon, 06 Sep 2021 03:01:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH5G6XtHCx84Wdffn1zwWZ+APndZNxC6uFOJe8BPCq7S8Zkg7N7eh9qjGT8+VQbHVlCuV1UQ==
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr12235437wrq.212.1630922486962; 
 Mon, 06 Sep 2021 03:01:26 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831a0.dip0.t-ipconnect.de.
 [217.232.49.160])
 by smtp.gmail.com with ESMTPSA id f17sm8605356wrt.63.2021.09.06.03.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 03:01:26 -0700 (PDT)
Subject: Re: [PATCH v3 03/13] s390x/tcg: convert real to absolute address for
 RRBE, SSKE and ISKE
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210903155514.44772-1-david@redhat.com>
 <20210903155514.44772-4-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7a919115-7e00-525d-6e55-57576e6d5cf5@redhat.com>
Date: Mon, 6 Sep 2021 12:01:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210903155514.44772-4-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 17.55, David Hildenbrand wrote:
> For RRBE, SSKE, and ISKE, we're dealing with real addresses, so we have to
> convert to an absolute address first.
> 
> In the future, when adding EDAT1 support, we'll have to pay attention to
> SSKE handling, as we'll be dealing with absolute addresses when the
> multiple-block control is one.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/tcg/mem_helper.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index 3c0820dd74..dd506d8d17 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -2177,6 +2177,7 @@ uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
>       uint64_t addr = wrap_address(env, r2);
>       uint8_t key;
>   
> +    addr = mmu_real2abs(env, addr);
>       if (addr > ms->ram_size) {
>           return 0;
>       }
> @@ -2201,6 +2202,7 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
>       uint64_t addr = wrap_address(env, r2);
>       uint8_t key;
>   
> +    addr = mmu_real2abs(env, addr);
>       if (addr > ms->ram_size) {
>           return;
>       }
> @@ -2228,6 +2230,7 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
>       static S390SKeysClass *skeyclass;
>       uint8_t re, key;
>   
> +    addr = mmu_real2abs(env, addr);
>       if (addr > ms->ram_size) {
>           return 0;
>       }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


