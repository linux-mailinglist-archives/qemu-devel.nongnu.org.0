Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD01606443
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:23:17 +0200 (CEST)
Received: from localhost ([::1]:48776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXO7-0004TE-0A
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:23:15 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXND-0004cU-GI
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1olVVS-0005hC-6V
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:22:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1olVVE-0000bP-L4
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666272144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EE1R1Gue30XLQBcmJlqBXvvEWwSJJpfRO7AtVB6H8l0=;
 b=Hv+vgNh+MyOnv4gBdD1ifkeq7ZrCv/IawdEbIdlpTqjadGkwVdyEHktBLk/KaO0jLdamtt
 AldrGWvmm7rwQ3EB3VVA0lhfWluJUWkxU1dIqVOvNR641VKCsSd1dIRWzVDTWN0H8h7+vE
 mfpTC7LOtXEV34cnZKTg6VppxWYEKbk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-137-YloGD_M5NAO9X67QwI6_zw-1; Thu, 20 Oct 2022 09:22:23 -0400
X-MC-Unique: YloGD_M5NAO9X67QwI6_zw-1
Received: by mail-wm1-f72.google.com with SMTP id
 n19-20020a7bcbd3000000b003c4a72334e7so865999wmi.8
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 06:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EE1R1Gue30XLQBcmJlqBXvvEWwSJJpfRO7AtVB6H8l0=;
 b=sDo69tZ9HtsTD+VVJ08figHbzEQc7WtKqpPCQf/ynn5kER6C7aG26kGApv5njSdfSl
 b1L20KH1oaLycg+KW6IPsWxDSDoR0N9cKSsocYH+Nm/Xy5FshC3jMxCOx5aJqDu+98km
 aA+FINvmIwhCwUZLjC03jDCDLlyeFjnm2WdhA13gHnyGue07iF6UbtonpzEA0xILs+i7
 Q9JkrS8veMXhGorRrZeh75vFMtLuD6iqQUyvAlhQfX145YYQdJBmBUPDRave7WrjzoTw
 QutP3zGRcQ4mEuUaGOV2CabMUB3izixIM0UrB4Z/7i2LkaDUGg3t5tqvLf48DmlPYE9d
 URuQ==
X-Gm-Message-State: ACrzQf2w9w9y0zlDIR7YllkbZMLHCdd4BP8ID5/Yj58CxDsZ7Lm7COBI
 rrzxRY+ziNO2mejkt6AAbtjAFE29bn6Qr0o3twk1YhBAGu73NRay2u8rIFcnnXJluiiBv1VTYst
 Wuxx5YZWUoQoS/SM=
X-Received: by 2002:a5d:6e82:0:b0:22f:a27c:c964 with SMTP id
 k2-20020a5d6e82000000b0022fa27cc964mr8779938wrz.699.1666272142255; 
 Thu, 20 Oct 2022 06:22:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6rEol33BSGKlsHv+GiNj2yPczLr/ZqC76x2WP0yNKMFw2WpsWrWkrNxzNPKXiGTEe8yOpx6g==
X-Received: by 2002:a5d:6e82:0:b0:22f:a27c:c964 with SMTP id
 k2-20020a5d6e82000000b0022fa27cc964mr8779917wrz.699.1666272141940; 
 Thu, 20 Oct 2022 06:22:21 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:b100:1443:78d5:341f:c97a?
 (p200300cbc708b100144378d5341fc97a.dip0.t-ipconnect.de.
 [2003:cb:c708:b100:1443:78d5:341f:c97a])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c310700b003b47b80cec3sm3068851wmo.42.2022.10.20.06.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 06:22:21 -0700 (PDT)
Message-ID: <fe175208-66ec-b26c-1d36-d4c072cbf96e@redhat.com>
Date: Thu, 20 Oct 2022 15:22:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 23/26] target/s390x: don't use ld_code2 to probe next pc
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-24-alex.bennee@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221020115209.1761864-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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

On 20.10.22 13:52, Alex Bennée wrote:
> This isn't an translator picking up an instruction so we shouldn't use
> the translator_lduw function which has side effects for plugins.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 1d2dddab1c..f4de8efe3a 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -6612,7 +6612,7 @@ static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>   static target_ulong get_next_pc(CPUS390XState *env, DisasContext *s,
>                                   uint64_t pc)
>   {
> -    uint64_t insn = ld_code2(env, s, pc);
> +    uint64_t insn = cpu_lduw_code(env, pc);
>   
>       return pc + get_ilen((insn >> 8) & 0xff);
>   }

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


