Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D17E606579
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:12:50 +0200 (CEST)
Received: from localhost ([::1]:39712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYA3-0000d8-RR
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:12:48 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olY54-0000Kl-D6
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1olVVq-0005u9-A6
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:23:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1olVVo-0000gf-T7
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666272184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ASUmpLM3jgu5OQOZhM6aU0CYEg1vmgE9xAzmUp8UdMo=;
 b=AWD0Cs91ddILKNhV6w7lCyO88V5poFdAR0LVhEtwLw8kvsdgMa717s74oN4H55qNqTEj3q
 TpsWkW27PEqV8BMPv0N5TurmGDenebvGKN1Jdc1dYPHzliEctn2fcKv4ePvjERDxpJQZTf
 hnlX0oDXoGsKmxa3ND2xGyz4In6epBM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-78-0xYZnn32O9G-zq-aEbf9wg-1; Thu, 20 Oct 2022 09:23:02 -0400
X-MC-Unique: 0xYZnn32O9G-zq-aEbf9wg-1
Received: by mail-wr1-f71.google.com with SMTP id
 k30-20020adfb35e000000b0022e04708c18so6780256wrd.22
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 06:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ASUmpLM3jgu5OQOZhM6aU0CYEg1vmgE9xAzmUp8UdMo=;
 b=QYm77ejivw6Lsr60L3G0d26DDB5VR+TIsfsji+TA5zOHCOT3QTqXeIrhY+A7Ibnkro
 K8SMmx4fnqlFGS0vmhHbRYbQL7qO2ypK9n+aiHCxFvyq1xE6vXug3UeTNt5woAusAoxv
 1FH3EcUNz6BwzA6fBKGDyz+OHhiwpyg9+IzUbCwzUNIjyOBpek0KZpjJyW3zRMva1znq
 56NN7vZsQkrzwDhLM8bthS6QlotDUlFuxWri/5v+uwcrRpeDJnWCDRD3ROESUrSJKSgF
 eJV65mokoajBLjwNOjhX9VUNdCHD688qoLdzkYwFw1UZ6pLq0YIV+FVELGHakHfVNtTj
 3hIw==
X-Gm-Message-State: ACrzQf1eDjN3A5jhPTgyXsUtLRQlqsI74OPF001iklnX7LDJP3ZJIvZf
 aNrl2NOQzCOy8hgoWlGefP0kHF3/T9FIjnUmiARUMQED42NMiZGGP2wAUX1jNvDcHK50GFwmmWv
 ONqz+kZEbKY647NU=
X-Received: by 2002:a05:600c:34d2:b0:3b4:a617:f3b9 with SMTP id
 d18-20020a05600c34d200b003b4a617f3b9mr9092946wmq.204.1666272181730; 
 Thu, 20 Oct 2022 06:23:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7UWf8XJyv6eomO6v12lWQTk/4XkOy5YdPSul++c1cEY9CtXWSu+YGuU+mmB3hIVIo968a5Qw==
X-Received: by 2002:a05:600c:34d2:b0:3b4:a617:f3b9 with SMTP id
 d18-20020a05600c34d200b003b4a617f3b9mr9092921wmq.204.1666272181390; 
 Thu, 20 Oct 2022 06:23:01 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:b100:1443:78d5:341f:c97a?
 (p200300cbc708b100144378d5341fc97a.dip0.t-ipconnect.de.
 [2003:cb:c708:b100:1443:78d5:341f:c97a])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a1c4c13000000b003c6f426467fsm2706147wmf.40.2022.10.20.06.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 06:23:00 -0700 (PDT)
Message-ID: <ffac2522-eae4-dd8b-c707-362b078e3a17@redhat.com>
Date: Thu, 20 Oct 2022 15:22:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 24/26] target/s390x: don't probe next pc for EXecuted
 insns
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-25-alex.bennee@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221020115209.1761864-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> We have finished the TB anyway so we can shortcut the other tests by
> checking dc->ex_value first.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index f4de8efe3a..95279e5dc3 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -6624,9 +6624,9 @@ static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>   
>       dc->base.is_jmp = translate_one(env, dc);
>       if (dc->base.is_jmp == DISAS_NEXT) {
> -        if (!is_same_page(dcbase, dc->base.pc_next) ||
> -            !is_same_page(dcbase, get_next_pc(env, dc, dc->base.pc_next)) ||
> -            dc->ex_value) {
> +        if (dc->ex_value ||
> +            !is_same_page(dcbase, dc->base.pc_next) ||
> +            !is_same_page(dcbase, get_next_pc(env, dc, dc->base.pc_next))) {
>               dc->base.is_jmp = DISAS_TOO_MANY;
>           }
>       }

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


