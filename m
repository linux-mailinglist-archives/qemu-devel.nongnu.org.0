Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E274277A3
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 07:42:13 +0200 (CEST)
Received: from localhost ([::1]:36472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZ57c-0003Nw-Ir
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 01:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mZ565-0002c9-KZ
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 01:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mZ560-00044S-PK
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 01:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633758029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ps5L5EeO0yOE4J8hFAWWhCkUJqYqpRsvFxluqiQZ0mM=;
 b=h8M7ok8mrlFFUWc61616MIGy7qwQ79+nsWDXSjwHp3RuG3bXQerp61ZZNe3rw2FUB+onyf
 ZX1jrq/4BZ2zujAanc4A6r6AZHHSig84iEahqcFxAOgqJmQmAWOfVYBbI1eFSqthtONXSy
 a1cL0t+Jve2uLGbLlC4Ilp2MJj2FvrU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-iewfLvaePiq5VZnrMQXfsA-1; Sat, 09 Oct 2021 01:40:27 -0400
X-MC-Unique: iewfLvaePiq5VZnrMQXfsA-1
Received: by mail-ed1-f71.google.com with SMTP id
 v9-20020a50d849000000b003db459aa3f5so8514131edj.15
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 22:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ps5L5EeO0yOE4J8hFAWWhCkUJqYqpRsvFxluqiQZ0mM=;
 b=OFhBOQAo/oyMvEjDXQo7WDmQrWvYNQ8Dk2vKyiOriJRvdFyakRi/QiGbMFBzlgYgp2
 gKZZu7N3GVhMOD3ijUPUAA9htcS80Lb8Tb2sD2IwiDwOIaE9T0KAZwDiAjXn/lasKjqr
 IMqUORaYbkCwis44tl61cjs6ZsWZJWLihrocKDMW6s4tGadInlUSnJVg/JRoGM8VKGnE
 QUC2OOOJ/sdjIifmHyV2qOvw9SY1+yihHkdtgq2+mkQnlEsJCc8zmtNhGFbMwh7T7Nin
 ChY92XqI1CCZXDE7XBIUkVQgED2XBsH5vU3r68e9tLu8F50cPiQey8DaxUgdCW8GbKjc
 1AQg==
X-Gm-Message-State: AOAM533sgr4rLiuhLc6iVoX6CLgzhJtlyiHg6PGUIA4jAMRqqMTP5jEc
 mxALzsQpsCaPhlQEWdro36Th47oz8J6qf52MPggnl01bSzht1Po6GPGuqLdWy11CtRStHEnPFUi
 R2nMalV7FsTTHlNc=
X-Received: by 2002:a17:906:1359:: with SMTP id
 x25mr9757040ejb.145.1633758026731; 
 Fri, 08 Oct 2021 22:40:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUtXazEbrAtQCHpCfZa6DMdOXWalbYXA2a+kkWlTXjGtvojR8mSUUJ99rgkDXrKNX5LNVGGg==
X-Received: by 2002:a17:906:1359:: with SMTP id
 x25mr9757005ejb.145.1633758026387; 
 Fri, 08 Oct 2021 22:40:26 -0700 (PDT)
Received: from thuth.remote.csb (tmo-097-184.customers.d1-online.com.
 [80.187.97.184])
 by smtp.gmail.com with ESMTPSA id d14sm481687ejd.92.2021.10.08.22.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 22:40:25 -0700 (PDT)
Subject: Re: [RFC PATCH v1 1/2] s390x: sigp: Force Set Architecture to return
 Invalid Parameter
To: Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20211008203811.1980478-1-farman@linux.ibm.com>
 <20211008203811.1980478-2-farman@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6bb65a7b-6a03-e2cd-74a6-4fc2b759e5a1@redhat.com>
Date: Sat, 9 Oct 2021 07:40:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008203811.1980478-2-farman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/10/2021 22.38, Eric Farman wrote:
> According to the Principles of Operation, the SIGP Set Architecture
> order will return Incorrect State if some CPUs are not stopped, but
> only if the CZAM facility is not present. If it is, the order will
> return Invalid Parameter because the architecture mode cannot be
> changed.
> 
> Since CZAM always exists when S390_FEAT_ZARCH exists, which in turn
> exists for every defined CPU model, we can simplify this code.
> 
> Fixes: 075e52b81664 ("s390x/cpumodel: we are always in zarchitecture mode")
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   target/s390x/sigp.c | 18 +-----------------
>   1 file changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
> index d57427ced8..51c727834c 100644
> --- a/target/s390x/sigp.c
> +++ b/target/s390x/sigp.c
> @@ -428,26 +428,10 @@ static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu, uint8_t order,
>   static int sigp_set_architecture(S390CPU *cpu, uint32_t param,
>                                    uint64_t *status_reg)
>   {
> -    CPUState *cur_cs;
> -    S390CPU *cur_cpu;
> -    bool all_stopped = true;
> -
> -    CPU_FOREACH(cur_cs) {
> -        cur_cpu = S390_CPU(cur_cs);
> -
> -        if (cur_cpu == cpu) {
> -            continue;
> -        }
> -        if (s390_cpu_get_state(cur_cpu) != S390_CPU_STATE_STOPPED) {
> -            all_stopped = false;
> -        }
> -    }
> -
>       *status_reg &= 0xffffffff00000000ULL;
>   
>       /* Reject set arch order, with czam we're always in z/Arch mode. */
> -    *status_reg |= (all_stopped ? SIGP_STAT_INVALID_PARAMETER :
> -                    SIGP_STAT_INCORRECT_STATE);
> +    *status_reg |= SIGP_STAT_INVALID_PARAMETER;
>       return SIGP_CC_STATUS_STORED;
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>

By the way, I think we could now also get rid of SIGP_MODE_ESA_S390, 
SIGP_MODE_Z_ARCH_TRANS_ALL_PSW and SIGP_MODE_Z_ARCH_TRANS_CUR_PSW now (in a 
separate patch)...


