Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2C55FB378
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:33:57 +0200 (CEST)
Received: from localhost ([::1]:40268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiFOO-0001Tz-1h
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oiEP4-0007pE-37
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 08:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oiEP0-0000fK-Mx
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 08:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665491427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cr6LDgqW3JShwJYqgvPbg87KZhBrEwNzaTDa/q6GxUk=;
 b=Qxj15ClI6FsmKuh47uLQo7xBPdKYW3WMC3gAzXdzRHqnQxEkYdm0BYQkOW3ThTQIIHMnEK
 BuSe7oOOMBG0ICY7258l/NdEJ3PlkXoBl4nvKg4Kqe2H7LUYVTiou1Yxl1GCFhrTuczm+E
 j9gYX/cajgXiSfeyK90B/T5o4NxvcJM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-kT3fLO2pOe-4LJsuv9IYuw-1; Tue, 11 Oct 2022 08:30:26 -0400
X-MC-Unique: kT3fLO2pOe-4LJsuv9IYuw-1
Received: by mail-wm1-f72.google.com with SMTP id
 b7-20020a05600c4e0700b003bde2d860d1so8377455wmq.8
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 05:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cr6LDgqW3JShwJYqgvPbg87KZhBrEwNzaTDa/q6GxUk=;
 b=fXorW2XyS7F4cj/zv+V8RjJhZsj9IUziO9944pQQ5aCshFdJaaI/8fNiuZZqbpff1S
 nDVlEfXTZ5BEz4AoYpMcxc8c0o71Mf5Ls09peuQhAuHd50VE7CkmQ9oYGrHT+e27iEE1
 y90uKrMAWufEGmdMtjNB5fNaK0u5VAbWDjFN+LUTEnB4VP9HlGzY6pTsOj1zR9WVx8OD
 jfeDsO4vYmECZRZEGioS1wDg4+Z4G6y5y/SN779Xaz9ShdE5sZXPADRrca5FG2vfmXIi
 gTPbWIVGkH2tdORK/Q+GTeXzcApm1SyoNw8dZMx0fmz03dYrc3oTyeapZkSIqCWoaSrH
 yDkQ==
X-Gm-Message-State: ACrzQf0c0wf/qRAnKPfONln108VsNhMiyAV33Qq1uWWSdnAELcogVYHc
 9KwTuWtX7TAPJVVN/4+hlxVLVjq4LXFq/n6xVS2uuLi18rbtxuOY3rEaYefjJhGAV7hiytuHoID
 o6VxKOPJRS466JNk=
X-Received: by 2002:adf:f6cf:0:b0:22e:5e26:e139 with SMTP id
 y15-20020adff6cf000000b0022e5e26e139mr14326701wrp.479.1665491425457; 
 Tue, 11 Oct 2022 05:30:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6V2Wej6ciJsxIUemPlSbgcyT3XX64quY5RJAtx8x/h8rtGhTQqfDef8kBG7kP6ZlL/awZVZw==
X-Received: by 2002:adf:f6cf:0:b0:22e:5e26:e139 with SMTP id
 y15-20020adff6cf000000b0022e5e26e139mr14326678wrp.479.1665491425168; 
 Tue, 11 Oct 2022 05:30:25 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:6900:f110:6527:aa46:a922?
 (p200300cbc7096900f1106527aa46a922.dip0.t-ipconnect.de.
 [2003:cb:c709:6900:f110:6527:aa46:a922])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003c6c2ff7f25sm2253265wmq.15.2022.10.11.05.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 05:30:24 -0700 (PDT)
Message-ID: <d7873010-8d15-360a-39c5-d94acad5d4bc@redhat.com>
Date: Tue, 11 Oct 2022 14:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221011101401.81849-1-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] target/s390x: Fix emulation of the VISTR instruction
In-Reply-To: <20221011101401.81849-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11.10.22 12:14, Thomas Huth wrote:
> The element size is encoded in the M3 field, not in the M4
> field. Let's also add a TCG test that shows the failing
> behavior without this fix.
> 

I'd suggest moving the test to a separate patch and adding a Fixes: tag 
to the fix.

Should be

Fixes: be6324c6b734 ("s390x/tcg: Implement VECTOR ISOLATE STRING")

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1248
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/tcg/s390x/vf.c                | 50 +++++++++++++++++++++++++++++
>   target/s390x/tcg/translate_vx.c.inc |  2 +-
>   tests/tcg/s390x/Makefile.target     |  6 ++++
>   3 files changed, 57 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/s390x/vf.c
> 
> diff --git a/tests/tcg/s390x/vf.c b/tests/tcg/s390x/vf.c
> new file mode 100644
> index 0000000000..fdc424ce7c
> --- /dev/null
> +++ b/tests/tcg/s390x/vf.c

In general, we use "vx" when talking about vector extension. Maybe name 
this vx.c

...

> @@ -0,0 +1,50 @@
> +/*
> + * vf: vector facility tests

And adjust it here as well.

> + */
> +#include <stdint.h>
> +#include <stdio.h>
> +#include "vx.h"
> +
> +static inline void vistr(S390Vector *v1, S390Vector *v2,
> +                         const uint8_t m3, const uint8_t m5)
> +{
> +    asm volatile("vistr %[v1], %[v2], %[m3], %[m5]\n"
> +                : [v1] "=v" (v1->v)
> +                : [v2]  "v" (v2->v)
> +                , [m3]  "i" (m3)
> +                , [m5]  "i" (m5)
> +                : "cc");
> +}
> +
> +static int test_vistr(void)
> +{
> +    S390Vector vd = {};
> +    S390Vector vs16 = {
> +        .h[0] = 0x1234, .h[1] = 0x0056, .h[2] = 0x7800, .h[3] = 0x0000,
> +        .h[4] = 0x0078, .h[5] = 0x0000, .h[6] = 0x6543, .h[7] = 0x2100
> +    };
> +    S390Vector vs32 = {
> +        .w[0] = 0x12340000, .w[1] = 0x78654300,
> +        .w[2] = 0x0, .w[3] = 0x12,
> +    };
> +
> +    vistr(&vd, &vs16, 1, 0);
> +    if (vd.h[0] != 0x1234 || vd.h[1] != 0x0056 || vd.h[2] != 0x7800 ||
> +        vd.h[3] || vd.h[4] || vd.h[5] || vd.h[6] || vd.h[7]) {
> +        puts("ERROR: vitrh failed!");
> +        return 1;
> +    }
> +
> +    vistr(&vd, &vs32, 2, 0);
> +    if (vd.w[0] != 0x12340000 || vd.w[1] != 0x78654300 || vd.w[2] || vd.w[3]) {
> +        puts("ERROR: vitrf failed!");
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +    return test_vistr();
> +}
> diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
> index 3526ba3e3b..b69c1a111c 100644
> --- a/target/s390x/tcg/translate_vx.c.inc
> +++ b/target/s390x/tcg/translate_vx.c.inc
> @@ -2723,7 +2723,7 @@ static DisasJumpType op_vfene(DisasContext *s, DisasOps *o)
>   
>   static DisasJumpType op_vistr(DisasContext *s, DisasOps *o)
>   {
> -    const uint8_t es = get_field(s, m4);
> +    const uint8_t es = get_field(s, m3);
>       const uint8_t m5 = get_field(s, m5);
>       static gen_helper_gvec_2 * const g[3] = {
>           gen_helper_gvec_vistr8,

Apart from that, LGTM.

-- 
Thanks,

David / dhildenb


