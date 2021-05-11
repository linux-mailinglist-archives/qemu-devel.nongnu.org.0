Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3601A37A402
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:49:02 +0200 (CEST)
Received: from localhost ([::1]:39264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgP0e-0008Mr-Ui
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgOyA-0004vg-Oc
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgOy6-00035N-OP
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620726382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cz5THyDQ0smFQvL6XorwFezVVGONvh3xw2NqRoONSpM=;
 b=BJmRS2F5/pI2Hm0F4oi3C8ajnmcZ/5oX0eyHLqFmiVECfKgLVeaNfUzF4NXpUGs6+N9ZUD
 SAneLE/BlCqSzOtC8bC6AslFY6qH/9iLGAXU2XVSXDaW6Qgr439ow7jcRwF6sla9WMsumz
 X+oImflIFEv3bzZqjyU9We1EcJ4gIeQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-T6DHBrVRNManfdXVShh7Vw-1; Tue, 11 May 2021 05:46:18 -0400
X-MC-Unique: T6DHBrVRNManfdXVShh7Vw-1
Received: by mail-wm1-f71.google.com with SMTP id
 y193-20020a1c32ca0000b029014cbf30c3f2so835213wmy.1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 02:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cz5THyDQ0smFQvL6XorwFezVVGONvh3xw2NqRoONSpM=;
 b=PGV0oKhR9cdsjgcBz33+gIIJT8DSxQGEfLUvX+GFZtgRqaBFkTpCZJG1x/vDut7mSV
 95tBRk2K+7xz2cZ47Ec+QR333J34qgTlozwZab75ewqLdNH5PhbHUH9x/1Hyi62UFFkb
 UL8bM97jb9XKL7tWTFp9x7W5s49Pp+STUcQVRzs0Lo6O9A9eWUyC2tK/zTU30U/0Jl0+
 G1lPtZef5r1Eq6U7GtcyrljWfNrogP5aA7i+4jfcaja60tZyEEHUSeSXXYtlpI28pbhg
 Mb4nA1fTVvBY3omhJ0121sHtUXLHl7F8L+2OfLNv9o594dIhFzGfWdAQq3VRvMI7OD4L
 +f6A==
X-Gm-Message-State: AOAM533W6el9WGTn1mJ2NYz04hOtaEDubidZSEUf+9jyuIowbianfwrO
 jxdIZyqfwdR3Cvp3UVjLvj2dbMdavrD809Ox8KmKhTRJU88yTNj/QUKo9M/bhXYns7Czlj+aijv
 pSSGrbkBLFIk9v34=
X-Received: by 2002:a1c:4e11:: with SMTP id g17mr4423284wmh.185.1620726377037; 
 Tue, 11 May 2021 02:46:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd3pK8DpyFdYDY2RiyhKwKhIFF+3nC7deT3tvbF6fv2eedzYDXQ6jPDZZt6NXbx2HKR5xAuw==
X-Received: by 2002:a1c:4e11:: with SMTP id g17mr4423262wmh.185.1620726376749; 
 Tue, 11 May 2021 02:46:16 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6329.dip0.t-ipconnect.de. [91.12.99.41])
 by smtp.gmail.com with ESMTPSA id
 a9sm23269020wmj.1.2021.05.11.02.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 02:46:16 -0700 (PDT)
Subject: Re: [PATCH 04/72] accel/tcg: Use add/sub overflow routines in
 tcg-runtime-gvec.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-5-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <4e43bc8b-beb0-340d-4edd-7a23920cd9ae@redhat.com>
Date: Tue, 11 May 2021 11:46:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-5-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.05.21 03:46, Richard Henderson wrote:
> Obvious uses of the new functions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/tcg-runtime-gvec.c | 36 ++++++++++++++++--------------------
>   1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/accel/tcg/tcg-runtime-gvec.c b/accel/tcg/tcg-runtime-gvec.c
> index 521da4a813..ac7d28c251 100644
> --- a/accel/tcg/tcg-runtime-gvec.c
> +++ b/accel/tcg/tcg-runtime-gvec.c
> @@ -1073,9 +1073,8 @@ void HELPER(gvec_ssadd32)(void *d, void *a, void *b, uint32_t desc)
>       for (i = 0; i < oprsz; i += sizeof(int32_t)) {
>           int32_t ai = *(int32_t *)(a + i);
>           int32_t bi = *(int32_t *)(b + i);
> -        int32_t di = ai + bi;
> -        if (((di ^ ai) &~ (ai ^ bi)) < 0) {
> -            /* Signed overflow.  */
> +        int32_t di;
> +        if (sadd32_overflow(ai, bi, &di)) {
>               di = (di < 0 ? INT32_MAX : INT32_MIN);
>           }
>           *(int32_t *)(d + i) = di;
> @@ -1091,9 +1090,8 @@ void HELPER(gvec_ssadd64)(void *d, void *a, void *b, uint32_t desc)
>       for (i = 0; i < oprsz; i += sizeof(int64_t)) {
>           int64_t ai = *(int64_t *)(a + i);
>           int64_t bi = *(int64_t *)(b + i);
> -        int64_t di = ai + bi;
> -        if (((di ^ ai) &~ (ai ^ bi)) < 0) {
> -            /* Signed overflow.  */
> +        int64_t di;
> +        if (sadd64_overflow(ai, bi, &di)) {
>               di = (di < 0 ? INT64_MAX : INT64_MIN);
>           }
>           *(int64_t *)(d + i) = di;
> @@ -1143,9 +1141,8 @@ void HELPER(gvec_sssub32)(void *d, void *a, void *b, uint32_t desc)
>       for (i = 0; i < oprsz; i += sizeof(int32_t)) {
>           int32_t ai = *(int32_t *)(a + i);
>           int32_t bi = *(int32_t *)(b + i);
> -        int32_t di = ai - bi;
> -        if (((di ^ ai) & (ai ^ bi)) < 0) {
> -            /* Signed overflow.  */
> +        int32_t di;
> +        if (ssub32_overflow(ai, bi, &di)) {
>               di = (di < 0 ? INT32_MAX : INT32_MIN);
>           }
>           *(int32_t *)(d + i) = di;
> @@ -1161,9 +1158,8 @@ void HELPER(gvec_sssub64)(void *d, void *a, void *b, uint32_t desc)
>       for (i = 0; i < oprsz; i += sizeof(int64_t)) {
>           int64_t ai = *(int64_t *)(a + i);
>           int64_t bi = *(int64_t *)(b + i);
> -        int64_t di = ai - bi;
> -        if (((di ^ ai) & (ai ^ bi)) < 0) {
> -            /* Signed overflow.  */
> +        int64_t di;
> +        if (ssub64_overflow(ai, bi, &di)) {
>               di = (di < 0 ? INT64_MAX : INT64_MIN);
>           }
>           *(int64_t *)(d + i) = di;
> @@ -1209,8 +1205,8 @@ void HELPER(gvec_usadd32)(void *d, void *a, void *b, uint32_t desc)
>       for (i = 0; i < oprsz; i += sizeof(uint32_t)) {
>           uint32_t ai = *(uint32_t *)(a + i);
>           uint32_t bi = *(uint32_t *)(b + i);
> -        uint32_t di = ai + bi;
> -        if (di < ai) {
> +        uint32_t di;
> +        if (uadd32_overflow(ai, bi, &di)) {
>               di = UINT32_MAX;
>           }
>           *(uint32_t *)(d + i) = di;
> @@ -1226,8 +1222,8 @@ void HELPER(gvec_usadd64)(void *d, void *a, void *b, uint32_t desc)
>       for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
>           uint64_t ai = *(uint64_t *)(a + i);
>           uint64_t bi = *(uint64_t *)(b + i);
> -        uint64_t di = ai + bi;
> -        if (di < ai) {
> +        uint64_t di;
> +        if (uadd64_overflow(ai, bi, &di)) {
>               di = UINT64_MAX;
>           }
>           *(uint64_t *)(d + i) = di;
> @@ -1273,8 +1269,8 @@ void HELPER(gvec_ussub32)(void *d, void *a, void *b, uint32_t desc)
>       for (i = 0; i < oprsz; i += sizeof(uint32_t)) {
>           uint32_t ai = *(uint32_t *)(a + i);
>           uint32_t bi = *(uint32_t *)(b + i);
> -        uint32_t di = ai - bi;
> -        if (ai < bi) {
> +        uint32_t di;
> +        if (usub32_overflow(ai, bi, &di)) {
>               di = 0;
>           }
>           *(uint32_t *)(d + i) = di;
> @@ -1290,8 +1286,8 @@ void HELPER(gvec_ussub64)(void *d, void *a, void *b, uint32_t desc)
>       for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
>           uint64_t ai = *(uint64_t *)(a + i);
>           uint64_t bi = *(uint64_t *)(b + i);
> -        uint64_t di = ai - bi;
> -        if (ai < bi) {
> +        uint64_t di;
> +        if (usub64_overflow(ai, bi, &di)) {
>               di = 0;
>           }
>           *(uint64_t *)(d + i) = di;
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


