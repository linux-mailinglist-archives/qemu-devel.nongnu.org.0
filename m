Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6224EBD23
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:03:14 +0200 (CEST)
Received: from localhost ([::1]:57900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUET-0004aT-DQ
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:03:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nZU3o-0002e2-5j
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nZU3m-00054d-H0
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648630329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqUgTj6a9x+2VDenVXuHhIItJHNIrDeALu5VxWmhDsE=;
 b=AeFIcMiKkBGNdauhW27tv68+bF8qAHCs1SSGcAZp9OviVQ+i+a4HgJWAZ700GSLCrPTrVQ
 QG7PhH6myKuQX/c4mYbJB5P0aYX6Ev+1SO2/SBCCGAUq6DMzSdiJdiV4f9+Stw8Vmev1qz
 umu8jZWWmvcnuFwqjQpKJEpVpQyQT6w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-TC9U12Z9MmG6zdWZEAj6KA-1; Wed, 30 Mar 2022 04:52:07 -0400
X-MC-Unique: TC9U12Z9MmG6zdWZEAj6KA-1
Received: by mail-wm1-f69.google.com with SMTP id
 t124-20020a1c4682000000b0038c8e8f8212so7618722wma.2
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 01:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=gqUgTj6a9x+2VDenVXuHhIItJHNIrDeALu5VxWmhDsE=;
 b=oWtnZss1G+jpYvy1mEhbLuLKxJEwjpBuyrQdngOmel2GyqSN5WC7cP7Rq6Fv5sLQwQ
 hWKV/f3QI3VXUdUcW68ypw5b8x8KNNhFB3i8pH2CSlb5zVxVdYTRIE59QzOM2UrSuKA/
 4XjpLSUZT5Pbseyh2kAKNuTgsbzLwnoC3nrkxcCjLA3R5Kj0Si4ZKw3XwSde2H1fbovd
 G1EgyEbMbcyuc5th5mVmS0jMj3mNVecoPc3UFPwe8fzcMhWqyB50Asr1w0cthD9JRChC
 eenBQVd8Ql+Rc0CQLyE2jSzQ/bHv8JHVyy0kA2ewOWFhEDMiQ+cOxLWzFPTVWcJUQVBc
 2+EA==
X-Gm-Message-State: AOAM531G87SXX4mcmwts8uihuytF/fn8XEdHlH0kVVfxRzkL1enWTB+3
 99CkupbJuvxnUn9msoMWevCXEWQDeWoQBfZxT2dYmJBC+1sBZa7gUmmaTTHCQcLVX7zgYsa8URH
 fz2yVkF3L3arzZEk=
X-Received: by 2002:a5d:6d05:0:b0:205:8631:cfae with SMTP id
 e5-20020a5d6d05000000b002058631cfaemr34926031wrq.612.1648630326460; 
 Wed, 30 Mar 2022 01:52:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw067qxxH5OM1I9fcxKlVq0ryTUgS0mDk4UOTDHuL+ymvmTVdzjnkNY9jMaSYQRqL2WCcznBw==
X-Received: by 2002:a5d:6d05:0:b0:205:8631:cfae with SMTP id
 e5-20020a5d6d05000000b002058631cfaemr34926016wrq.612.1648630326207; 
 Wed, 30 Mar 2022 01:52:06 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2200:178b:7244:2a1f:b5d8?
 (p200300cbc7052200178b72442a1fb5d8.dip0.t-ipconnect.de.
 [2003:cb:c705:2200:178b:7244:2a1f:b5d8])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c12c800b0038cc2b67c97sm4082299wmd.19.2022.03.30.01.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 01:52:05 -0700 (PDT)
Message-ID: <2b82de5e-a259-576c-5ea5-eb5c10e6bbeb@redhat.com>
Date: Wed, 30 Mar 2022 10:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220323162621.139313-1-thuth@redhat.com>
 <20220323162621.139313-2-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 1/2] target/s390x: Fix determination of overflow condition
 code after addition
In-Reply-To: <20220323162621.139313-2-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Bruno Haible <bruno@clisp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.03.22 17:26, Thomas Huth wrote:
> This program currently prints different results when run with TCG instead
> of running on real s390x hardware:
> 
>  #include <stdio.h>
> 
>  int overflow_32 (int x, int y)
>  {
>    int sum;
>    return ! __builtin_add_overflow (x, y, &sum);
>  }
> 
>  int overflow_64 (long long x, long long y)
>  {
>    long sum;
>    return ! __builtin_add_overflow (x, y, &sum);
>  }
> 
>  int a1 = -2147483648;
>  int b1 = -2147483648;
>  long long a2 = -9223372036854775808L;
>  long long b2 = -9223372036854775808L;
> 
>  int main ()
>  {
>    {
>      int a = a1;
>      int b = b1;
>      printf ("a = 0x%x, b = 0x%x\n", a, b);
>      printf ("no_overflow = %d\n", overflow_32 (a, b));
>    }
>    {
>      long long a = a2;
>      long long b = b2;
>      printf ("a = 0x%llx, b = 0x%llx\n", a, b);
>      printf ("no_overflow = %d\n", overflow_64 (a, b));
>    }
>  }
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/616
> Suggested-by: Bruno Haible <bruno@clisp.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/s390x/tcg/cc_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
> index 8d04097f78..e11cdb745d 100644
> --- a/target/s390x/tcg/cc_helper.c
> +++ b/target/s390x/tcg/cc_helper.c
> @@ -136,7 +136,7 @@ static uint32_t cc_calc_subu(uint64_t borrow_out, uint64_t result)
>  
>  static uint32_t cc_calc_add_64(int64_t a1, int64_t a2, int64_t ar)
>  {
> -    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar > 0)) {
> +    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar >= 0)) {


Intuitively, I'd have checked for any overflow/underflow by comparing
with one of the input variables:

a) Both numbers are positive

Adding to positive numbers has to result in something that's bigger than
the input parameters.

"a1 > 0 && a2 > 0 && ar < a1"

b) Both numbers are negative

Adding to negative numbers has to result in something that's smaller
than the input parameters.

"a1 < 0 && a2 < 0 && ar > a1"


-- 
Thanks,

David / dhildenb


