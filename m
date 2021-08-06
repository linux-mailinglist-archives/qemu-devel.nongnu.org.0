Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6243F3E22DB
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 07:22:37 +0200 (CEST)
Received: from localhost ([::1]:42724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBsJY-0007gM-0G
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 01:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBsIl-0006yb-Qk
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 01:21:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBsIj-00048H-1n
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 01:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628227304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AspCUOK+OEWIcWlvtDl590loozePaVPAf0ShCbJ3DzU=;
 b=RIf5G9oinJd8BpRKdTKM/HTFVQ23UPx03hgBrtqdcOX7ol7b8LlpDNHlgiFe1vW4V9ILus
 3ZUL3SOllL/bdkzZo/R9WMtqvjxbbZHb4P/EH8lwPIE7IQOTC/vA99hQ05eKkZHE7hmgKJ
 w7mZBHruzn8IjDmebT1OdHjlRR8Rkso=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-7L9NGnfdM_Ou0CokskmfHw-1; Fri, 06 Aug 2021 01:21:43 -0400
X-MC-Unique: 7L9NGnfdM_Ou0CokskmfHw-1
Received: by mail-wr1-f70.google.com with SMTP id
 d7-20020adffd870000b02901544ea2018fso2753086wrr.10
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 22:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AspCUOK+OEWIcWlvtDl590loozePaVPAf0ShCbJ3DzU=;
 b=nmFCftrlfdzj3e/Lsu8jCBu7q0VD/pVjubqr2VZf3AfUdI7JCCAenWoMTyrwGO8IP8
 +DwcaTmS5Maho74Zob1bUBHuQfJ/wPY/xAhfxUoQtgsDfJAxMiYCvUft8H/Bsy5iY+4P
 /ngEGLbvliOLqiFpS1403EpdIyM8Utc8Fh6C818iYU7mEKzBRcdArRtjdlkzcRi7SAW8
 GiSSYhecYkkmWB6kaZC5CJCD3VQRAUorCf8dRU2LHUVvV0WqKgxcqSe3gj9TGTEEjKZF
 cx/HD7Q6SIS3UDe9OYDgG+i+h+Ui2W/T/wG+5YofNP5WIMClnS7gD5ktKwdoqA/iLglP
 w9fg==
X-Gm-Message-State: AOAM532RGcYqQcszQcpWFcqcWC4MYXHEi+VbKrxVwdD672a36JItv0P5
 W1ICvg8NpQHByDCQ6/SGOMkYG8uYbEZE0eaKeKxe4mPUMP5OpRzhIIad7KGNxHoGcKH1+PyIWj1
 eaM++np3/dUMDbiI=
X-Received: by 2002:adf:eec9:: with SMTP id a9mr8338184wrp.226.1628227301960; 
 Thu, 05 Aug 2021 22:21:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5HZomKAcEK3ZnLc76WKVTg7YuI769pIPVzkApwgxhccG+uPB7k3IS4IR7tc7JWXdxGpX9BA==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr8338161wrp.226.1628227301654; 
 Thu, 05 Aug 2021 22:21:41 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id g198sm13621349wme.0.2021.08.05.22.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 22:21:41 -0700 (PDT)
Subject: Re: [PATCH v1] s390x/tcg: fix and optimize SPX (SET PREFIX)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805125938.74034-1-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <95ad0032-c1ab-370e-3838-8bd33fd585c0@redhat.com>
Date: Fri, 6 Aug 2021 07:21:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805125938.74034-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2021 14.59, David Hildenbrand wrote:
> We not only invalidate the translation of the range 0x0-0x2000, we also
> invalidate the translation of the new prefix range and the translation
> of the old prefix range -- because real2abs would return different
> results for all of these ranges when changing the prefix location.
> 
> This fixes the kvm-unit-tests "edat" test that just hangs before this
> patch because we end up clearing the new prefix area instead of the old
> prefix area.
> 
> While at it, let's not do anything in case the prefix doesn't change.
> 
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/tcg/misc_helper.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
> index 33e6999e15..aab9c47747 100644
> --- a/target/s390x/tcg/misc_helper.c
> +++ b/target/s390x/tcg/misc_helper.c
> @@ -151,13 +151,26 @@ void HELPER(diag)(CPUS390XState *env, uint32_t r1, uint32_t r3, uint32_t num)
>   /* Set Prefix */
>   void HELPER(spx)(CPUS390XState *env, uint64_t a1)
>   {
> +    const uint32_t prefix = a1 & 0x7fffe000;
> +    const uint32_t old_prefix = env->psa;
>       CPUState *cs = env_cpu(env);
> -    uint32_t prefix = a1 & 0x7fffe000;
> +
> +    if (prefix == old_prefix) {
> +        return;
> +    }
>   
>       env->psa = prefix;
>       HELPER_LOG("prefix: %#x\n", prefix);
>       tlb_flush_page(cs, 0);
>       tlb_flush_page(cs, TARGET_PAGE_SIZE);
> +    if (prefix != 0) {
> +        tlb_flush_page(cs, prefix);
> +        tlb_flush_page(cs, prefix + TARGET_PAGE_SIZE);
> +    }
> +    if (old_prefix != 0) {
> +        tlb_flush_page(cs, old_prefix);
> +        tlb_flush_page(cs, old_prefix + TARGET_PAGE_SIZE);
> +    }
>   }

Sounds reasonable.

Reviewed-by: Thomas Huth <thuth@redhat.com>


