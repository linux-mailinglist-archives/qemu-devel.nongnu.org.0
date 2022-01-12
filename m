Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA44C48C7D5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:07:56 +0100 (CET)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gAF-0001cO-8u
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7g0a-0001dI-UL
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7g0Y-00007G-Qz
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642003074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3OwpPfBs2+u5dAY7/L+Xfx7I/GwjD4fRpolHJEy0T90=;
 b=WWEmGSuN8qt+STSZ9pOAzFn3cdOKIlYm5hhrGIQQrZTcgNORzrab7cIE9FhAwttHVejv5U
 dlsU6pFaN0UTntXaaMBICdxtvBimBv+zV9a1n7KEfr7LCFw5bvYz1ldCyv5WhV0zQEIxac
 H7uZp1p4TUCrnzeOZcqgVub7PX4cRGg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-o6EntU0tMe27OLUTyiOuOQ-1; Wed, 12 Jan 2022 10:57:53 -0500
X-MC-Unique: o6EntU0tMe27OLUTyiOuOQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 t1-20020a056402524100b003f8500f6e35so2667241edd.8
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 07:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3OwpPfBs2+u5dAY7/L+Xfx7I/GwjD4fRpolHJEy0T90=;
 b=OBsciL8DFpz65zePZWUWJRDxfszB+LUVvWlb58HVuTBnRZNfJQKm63XAsXaS9htEbK
 iWmUmVqr1mw3yHyl1Pour1RXpzTswiGo1Owg+3FzNgJcBCqP6gbz19yqWV4FlYhsxOZc
 9Aro2mB773C0ha8k7Dau8e0cdOCUkGuz/Uhrc1EV2SBeK7z5KuWPzWJMfrX0FrPO0yJD
 x4MX9tBch0d7Oo9NNB9CTXl4crruL+WpDh7t7ujg6knCOQBPuun8FQRd9NZmhYRDZBJw
 XEUawPTeopw80sf6SzuzwBTvtZkS+gzMfGpggE6HjY+gVDNzFo+2+BA7Robc5pQ1rsaB
 Cqfw==
X-Gm-Message-State: AOAM531TTkoRssWUX7I1+S26K2EbKc8uzHjlVgKBq7qmD7xJTV9YUGJj
 aDO5yMYzbimhvIUmsUpcCOWinCeKxEZfGQAKs7NnFduXj6hJiis5VbgKB5q+rpSAkjHHFRTNtZ2
 N+uIrLaDqxdHqiuU=
X-Received: by 2002:a17:906:f1ce:: with SMTP id
 gx14mr292895ejb.766.1642003072085; 
 Wed, 12 Jan 2022 07:57:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMpZhpqyqkPTpS2QHztKarNKv+Qm80xqEKatY4MNa7CYwNajLl78wzDZtURpiJVAD6WFBuzQ==
X-Received: by 2002:a17:906:f1ce:: with SMTP id
 gx14mr292880ejb.766.1642003071871; 
 Wed, 12 Jan 2022 07:57:51 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id hc19sm36909ejc.81.2022.01.12.07.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 07:57:51 -0800 (PST)
Message-ID: <185a3384-f04c-3fd5-517a-55a1c2b7944d@redhat.com>
Date: Wed, 12 Jan 2022 16:57:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 2/5] target/s390x: Fix SRDA CC calculation
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220112131751.226011-1-iii@linux.ibm.com>
 <20220112131751.226011-3-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220112131751.226011-3-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.01.22 14:17, Ilya Leoshkevich wrote:
> SRDA uses r1_D32 for binding the first operand and s64 for setting CC.
> cout_s64() relies on o->out being the shift result, however,
> wout_r1_D32() clobbers it.
> 
> Fix by using a temporary.
> 
> Fixes: a79ba3398a0a ("target-s390: Convert SHIFT DOUBLE")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/tcg/translate.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index f180853e7a..68ca7e476a 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -5420,9 +5420,10 @@ static void wout_r1_P32(DisasContext *s, DisasOps *o)
>  static void wout_r1_D32(DisasContext *s, DisasOps *o)
>  {
>      int r1 = get_field(s, r1);
> +    TCGv_i64 t = tcg_temp_new_i64();
>      store_reg32_i64(r1 + 1, o->out);
> -    tcg_gen_shri_i64(o->out, o->out, 32);
> -    store_reg32_i64(r1, o->out);
> +    tcg_gen_shri_i64(t, o->out, 32);
> +    store_reg32_i64(r1, t);

I think you're missing a tcg_temp_free_i64().

-- 
Thanks,

David / dhildenb


