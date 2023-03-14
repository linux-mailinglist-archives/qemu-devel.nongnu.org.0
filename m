Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42E76B8B05
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:14:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbxuN-0002th-30; Tue, 14 Mar 2023 02:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbxuK-0002sj-HB
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:13:12 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbxuI-0006WQ-Rt
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:13:12 -0400
Received: by mail-wr1-x431.google.com with SMTP id m2so469728wrh.6
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 23:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678774389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DUGWd2Fn/6JnOvamELR/2rfGI/Q0AO+PqIEnSloS4VU=;
 b=mR64jmsT9BCooYXoZNzxJQVAh4Cop2oNiL9DmJGqcQzftL30I0DWIW8F2AdJNQd+tJ
 8AEigZ9iDWqLB6SyPiPwR/l5VRsiifEMAFwuHJ2qvFOrdnatj6c774bnjzhAkum/h3ka
 4VmdYAUdGHU2D+JN2Cy1nluDEXn4L+L7mM3nsF91eG36svsKnp72yZNXXvBrCjfxfTuu
 eEPl694Xa9RaWy5NPetkBwW96OIDkdD3gd7O9dMi2qc+wYbWAMoTcBvfZffHhS+aCQbi
 SuJEyQScPBhy4umE17Rk/ISAGQMnh4GY4v+DEXiL7yFR6HooZEKFLb3mAwcbmGVtV1AC
 q6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678774389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DUGWd2Fn/6JnOvamELR/2rfGI/Q0AO+PqIEnSloS4VU=;
 b=AatajqmneoosGty+7cFzBx7orUgcsKxWPRQqBo1IYC+araTlShfsYf1JxlA+cxrrn7
 jGWrjUMogVujDSFaMPDadgxAV//7vtk68gAVzRs/wAr6UuNFQBhbnBbm4tS07EO3Mt0J
 S+b+P39PWgKEc33Q+jJCXd0qiOfF2bvLmtXH2UIfeWFwbkxcm0LjP+AVutcw7mxsB29H
 W6B0rJYR8iduLr+FNAQUkSWAovqs0xtw6J6DvA5hvsG6QdxPxms9MEDSh89RPe/4zgtp
 gnlDzp47XA7Lyd0n+EpmpYyHBNmBZQn6DajKnHLGztqlSIjR1ZAlhPAmZbLTWNT99hCG
 N/JA==
X-Gm-Message-State: AO0yUKWeuZ5ozFNcJno1qK9p4hSgftLPzUD9M2CKxeYO2/lMpg26GUpq
 YduYh4+ESmLNEyJ3/W7CKEY1dA==
X-Google-Smtp-Source: AK7set8cUlyR+Uy9g/Yq1SFhwW7a5U1WcEf6D/hDWBtoi35EvP1mRvBw/vWSYVMrX8uCDgu65H7hzQ==
X-Received: by 2002:a5d:4846:0:b0:2cf:d25a:635b with SMTP id
 n6-20020a5d4846000000b002cfd25a635bmr3967527wrs.62.1678774389028; 
 Mon, 13 Mar 2023 23:13:09 -0700 (PDT)
Received: from [192.168.150.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 t4-20020a0560001a4400b002be5bdbe40csm1184546wry.27.2023.03.13.23.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 23:13:08 -0700 (PDT)
Message-ID: <28a9d97a-b252-a33f-1ac0-cd36264b29ab@linaro.org>
Date: Tue, 14 Mar 2023 07:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/6] bswap: Add the ability to store to an unaligned 24
 bit field
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>
Cc: linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Ira Weiny <ira.weiny@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Michael Roth <michael.roth@amd.com>, Dave Jiang <dave.jiang@intel.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mike Maslenkin <mike.maslenkin@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230303150908.27889-1-Jonathan.Cameron@huawei.com>
 <20230303150908.27889-4-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303150908.27889-4-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/3/23 16:09, Jonathan Cameron wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> CXL has 24 bit unaligned fields which need to be stored to.  CXL is
> specified as little endian.
> 
> Define st24_le_p() and the supporting functions to store such a field
> from a 32 bit host native value.
> 
> The use of b, w, l, q as the size specifier is limiting.  So "24" was
> used for the size part of the function name.
> 
> Reviewed-by: Fan Ni <fan.ni@samsung.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> v8:
>    - Picked up tag from Fan Ni.
> ---
>   include/qemu/bswap.h | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index 15a78c0db5..ee71cbeaaa 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -8,11 +8,23 @@
>   #undef  bswap64
>   #define bswap64(_x) __builtin_bswap64(_x)
>   
> +static inline uint32_t bswap24(uint32_t x)
> +{

Could it be safer to add:

        assert(x & 0xff000000U == 0);

...

> +    return (((x & 0x000000ffU) << 16) |
> +            ((x & 0x0000ff00U) <<  0) |
> +            ((x & 0x00ff0000U) >> 16));
> +}
> +
>   static inline void bswap16s(uint16_t *s)
>   {
>       *s = __builtin_bswap16(*s);
>   }
>   
> +static inline void bswap24s(uint32_t *s)
> +{
> +    *s = bswap24(*s);

... and here use:

        *s = bswap24(*s & 0x00ffffffU);

?

> +}
> +
>   static inline void bswap32s(uint32_t *s)
>   {
>       *s = __builtin_bswap32(*s);
> @@ -176,6 +188,7 @@ CPU_CONVERT(le, 64, uint64_t)
>    * size is:
>    *   b: 8 bits
>    *   w: 16 bits
> + *   24: 24 bits

Following the pattern, shouldn't this be 's' for sēsquiword?

Regardless you need to update the doc in docs/devel/loads-stores.rst.

>    *   l: 32 bits
>    *   q: 64 bits
>    *
> @@ -248,6 +261,11 @@ static inline void stw_he_p(void *ptr, uint16_t v)
>       __builtin_memcpy(ptr, &v, sizeof(v));
>   }
>   
> +static inline void st24_he_p(void *ptr, uint32_t v)
> +{
> +    __builtin_memcpy(ptr, &v, 3);
> +}
> +
>   static inline int ldl_he_p(const void *ptr)
>   {
>       int32_t r;
> @@ -297,6 +315,11 @@ static inline void stw_le_p(void *ptr, uint16_t v)
>       stw_he_p(ptr, le_bswap(v, 16));
>   }
>   
> +static inline void st24_le_p(void *ptr, uint32_t v)
> +{
> +    st24_he_p(ptr, le_bswap(v, 24));
> +}

