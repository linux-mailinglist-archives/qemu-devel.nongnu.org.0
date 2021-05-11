Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD99737A482
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:23:56 +0200 (CEST)
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPYR-00039L-Nm
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPRT-0003qh-Jp
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:16:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPRR-0004a7-W4
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620728201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gso3ajPZOVdZI/H8ZMPJVVyCvkk9YSfItKNHcsS+R6k=;
 b=W3Xx0sur3DgRDCn4L/xLc1C000In6mFze9HaFn1dw6SKWwE8rZXu9avw82dGkh5GH83Zqo
 5fL/nay9tqlLpkq9mJl1vDuRp9H0OvxRDKp3SaZh2p7FoHYNnN6637rAsWcMWvX7+vHUaY
 uj4CTtk9FNrmfc1YmQauGtCImssk9hI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-yQQex7GJNl-ESLNJ0FjdTQ-1; Tue, 11 May 2021 06:16:39 -0400
X-MC-Unique: yQQex7GJNl-ESLNJ0FjdTQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 l2-20020adf9f020000b029010d6bb7f1cbso8542723wrf.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Gso3ajPZOVdZI/H8ZMPJVVyCvkk9YSfItKNHcsS+R6k=;
 b=M4SGIwEyixnK9SSFNGmNxJ/f+0F09CoZRPBcgGJJqZCOY5F7BDE1ZpFo18qFbcHtOR
 vvhcxmBCzErVpg2sKJTDZ+YgUlslXRnr9sVVKd5NUxvB1wX2b7ojkBQWcBK2wX644x1R
 YdBUYx2u606YRUt+aF3TVxdhGZy/GbAhM5IuEesRC5JrIJ5anM3jAuyArWhhpng3Fd5L
 D1bqWMZ/2+BG45UV+9jDK5AksiowQZJ+omm/aiLV7e3R4KLDOLa7G/zsYVHp1YcFFmvh
 ei6v98gHR9pLyNrPGJUaH71HxnOh3YU8u54wTq1qph5qVpIZl1XTYLCPtwulpI8lhWY1
 OntA==
X-Gm-Message-State: AOAM530+Me2bP+d6bBz3cd4ku3OVZyi4HtgXAy7Pb/dKJiKZn4HkSX5/
 8TnQbUomqvtF7EBE/xrPuhCB9i0R6FnT9oFct58VDtJiK62V+zUPRcsr2JED/4uhXyUOEiYNarH
 Sn6zxfhcvGrJhxpY=
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr37773102wrp.242.1620728198405; 
 Tue, 11 May 2021 03:16:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn1bq2k4H5soWCb+DOZkJd1PUYjunhSLLxhDMfQBDDKOEkV1inmkdz4UVd3YTFLVUv/9LI/Q==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr37773084wrp.242.1620728198235; 
 Tue, 11 May 2021 03:16:38 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6329.dip0.t-ipconnect.de. [91.12.99.41])
 by smtp.gmail.com with ESMTPSA id
 q4sm26115102wrs.21.2021.05.11.03.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 03:16:38 -0700 (PDT)
Subject: Re: [PATCH 13/72] target/mips: Set set_default_nan_mode with
 set_snan_bit_is_one
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-14-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d1c83f24-e163-9e1b-abfd-fafedee49b86@redhat.com>
Date: Tue, 11 May 2021 12:16:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-14-richard.henderson@linaro.org>
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

On 08.05.21 03:47, Richard Henderson wrote:
> This behavior is currently hard-coded in parts_silence_nan,
> but setting this bit properly will allow this to be cleaned up.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/fpu_helper.h | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/target/mips/fpu_helper.h b/target/mips/fpu_helper.h
> index 1c2d6d35a7..ad1116e8c1 100644
> --- a/target/mips/fpu_helper.h
> +++ b/target/mips/fpu_helper.h
> @@ -27,8 +27,14 @@ static inline void restore_flush_mode(CPUMIPSState *env)
>   
>   static inline void restore_snan_bit_mode(CPUMIPSState *env)
>   {
> -    set_snan_bit_is_one((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) == 0,
> -                        &env->active_fpu.fp_status);
> +    bool nan2008 = env->active_fpu.fcr31 & (1 << FCR31_NAN2008);
> +
> +    /*
> +     * With nan2008, SNaNs are silenced in the usual way.
> +     * Before that, SNaNs are not silenced; default nans are produced.
> +     */
> +    set_snan_bit_is_one(!nan2008, &env->active_fpu.fp_status);
> +    set_default_nan_mode(!nan2008, &env->active_fpu.fp_status);
>   }
>   
>   static inline void restore_fp_status(CPUMIPSState *env)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


