Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774E53A7891
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:54:52 +0200 (CEST)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3uN-0007ay-Fj
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lt3s8-0004ov-Ot
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:52:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lt3s3-0001ZM-4s
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623743546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQs4jqRlzltihfHOLe/6nnsv6u4spbKY6IXGlPDXUNI=;
 b=FCFu2snRJrjtwx0ta33gpB/ZkD3sGI/6KmACyE+Nl5MoEVHidSQi86JF2CmgfVuxFKoI2K
 sAwXBmhF4wMuHenvWjD0jNEbEOnQh7Q8BhENkloU6LOvcN7PIEuIo9egn2EmzIz/FlYmnL
 42QcU5p0F30RZdWKYKTdFTNQ3UZaiaE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-PfJQrJioMWm5mhequH49zg-1; Tue, 15 Jun 2021 03:52:25 -0400
X-MC-Unique: PfJQrJioMWm5mhequH49zg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so1149661wmh.9
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gQs4jqRlzltihfHOLe/6nnsv6u4spbKY6IXGlPDXUNI=;
 b=MuwxJ1CrdBkoa2d7Q53SzMYR6yPsChXTq52o5J8K4mWlFqyDwhgDuyzdkEfkRLFehA
 LQZbihOyzTL3wbtNHm4EucQy4/wJ4lwecZxWyfWgwDCETAC9Xaxc0Qp4uVgr5cs8dyNb
 wJwwmktiPZun/lV181urst0pB5ocjyFZzbNsye0b7LIXKgPYPpWYcAW1qwTTwrBJs5Tz
 FvZRRxe52zI0FlPDgin8o7BdkdMhzfe2aZfvVREwHBS7qz4rOm4y5uC+0FfbU4GBUFoe
 4w0IJinYMpFaXjeGiKwsnz9alXJ0lTopfyLYzSc5B/AMvxiYDE9Tz1pxnfvcxxxQNBJG
 5tKA==
X-Gm-Message-State: AOAM531kWb0FjaW3Bdk3EQIOUWAFA2mNiDKThhQoydIue+YEgptrZOuc
 WO20Aq7vpHRApC2+gRoiujT3d1SG+4p0s3ktPewu1odTYZjNhOiFgQnlS4LQd0qoit9uyHiFDo2
 n3c8ThgDyV6kCgiU=
X-Received: by 2002:a5d:6dae:: with SMTP id u14mr23944636wrs.148.1623743544331; 
 Tue, 15 Jun 2021 00:52:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvTpRPUA6IVGLb5gF1tsvA4fyd1r26FFbyCRL0M410ueB2Fv011octaE2/p9yzqQ5PvilOKQ==
X-Received: by 2002:a5d:6dae:: with SMTP id u14mr23944624wrs.148.1623743544192; 
 Tue, 15 Jun 2021 00:52:24 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6136.dip0.t-ipconnect.de. [91.12.97.54])
 by smtp.gmail.com with ESMTPSA id
 n10sm17054654wri.77.2021.06.15.00.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 00:52:23 -0700 (PDT)
Subject: Re: [PATCH 4/5] target/s390x: Use s390_cpu_{set_psw, get_psw_mask} in
 gdbstub
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
 <20210615030744.1252385-5-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <ba49dbd9-c41d-0e9f-d3d3-c2134ed87622@redhat.com>
Date: Tue, 15 Jun 2021 09:52:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615030744.1252385-5-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.06.21 05:07, Richard Henderson wrote:
> No change in behaviour, as gdbstub was correctly written to
> install and extract the cc value.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/gdbstub.c | 15 ++-------------
>   1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
> index d6fce5ff1e..5b4e38a13b 100644
> --- a/target/s390x/gdbstub.c
> +++ b/target/s390x/gdbstub.c
> @@ -31,18 +31,10 @@ int s390_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>   {
>       S390CPU *cpu = S390_CPU(cs);
>       CPUS390XState *env = &cpu->env;
> -    uint64_t val;
> -    int cc_op;
>   
>       switch (n) {
>       case S390_PSWM_REGNUM:
> -        if (tcg_enabled()) {
> -            cc_op = calc_cc(env, env->cc_op, env->cc_src, env->cc_dst,
> -                            env->cc_vr);
> -            val = deposit64(env->psw.mask, 44, 2, cc_op);
> -            return gdb_get_regl(mem_buf, val);
> -        }
> -        return gdb_get_regl(mem_buf, env->psw.mask);
> +        return gdb_get_regl(mem_buf, s390_cpu_get_psw_mask(env));
>       case S390_PSWA_REGNUM:
>           return gdb_get_regl(mem_buf, env->psw.addr);
>       case S390_R0_REGNUM ... S390_R15_REGNUM:
> @@ -59,10 +51,7 @@ int s390_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>   
>       switch (n) {
>       case S390_PSWM_REGNUM:
> -        env->psw.mask = tmpl;
> -        if (tcg_enabled()) {
> -            env->cc_op = extract64(tmpl, 44, 2);
> -        }
> +        s390_cpu_set_psw(env, tmpl, env->psw.addr);
>           break;
>       case S390_PSWA_REGNUM:
>           env->psw.addr = tmpl;
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


