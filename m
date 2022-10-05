Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EA45F5C6F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 00:10:41 +0200 (CEST)
Received: from localhost ([::1]:35520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogCb8-0002Eg-Sz
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 18:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogCYE-0008At-W8
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 18:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogCYB-0004mq-72
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 18:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665007654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkaoS9daA1Nn5cKJPrS8LnZu5b+i3yej7ENpvo98fQI=;
 b=QPQ+kxUSlcmeB35ch0B3S21Jd8T3HMWXmypeIcSbFcxGaZ58N3MgXp25bnyYg79tyti6Zn
 Hf2cy9WdEag2kXkXnhv/k14fAA8Qx/9nNM0ZLJZLoCIXn0MN14iJtZDBnDMRtKNHCFBnG6
 mfmpCL90jzAktiTkyeTLON2wbpm5XAc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-226-au29CdwvPbKNRPukZFbjfw-1; Wed, 05 Oct 2022 18:07:33 -0400
X-MC-Unique: au29CdwvPbKNRPukZFbjfw-1
Received: by mail-qk1-f200.google.com with SMTP id
 d18-20020a05620a241200b006ce80a4d74aso15196275qkn.6
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 15:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=GkaoS9daA1Nn5cKJPrS8LnZu5b+i3yej7ENpvo98fQI=;
 b=P5K+JxbVQSMF/NMKQCQrJjOYl59JDVsKUzaS7Hdfay6xyic9Zdg9siylbNkv+3Vf0q
 ec7fcxvtzD0p1VtwKdGVOn8GNpgRNSunqorKzy4wkZLTn4FMC3kGSYmkB7ifgh1valWu
 9lbut3sh9r4+FfPupg7zflbUXHQltNBShG7LfARTqU3WyXt0fiIwoPEkD2RmAEe0/sw9
 Nd1iG3Ucz35VVHWb5F8KfhzgkhCo8DWfExWpBNF6kN9XkfijkVSYmkHHn0UWPIf8ciFb
 i1SzWZtdTidetsHdZ3YGLCQL3aHN0VW+dQxiWkfBE2qNL+61dz5sIrjb641cAeDctvTW
 YmKw==
X-Gm-Message-State: ACrzQf2yxe7iNKGID76sXHHzyA3/2Sw58Eytl+6AhuqrgbiPSitdFlFD
 f50u/9YLJ5j3obw/lF2CcrrT7T23BDkLWgOrg9WJG6doyYn6OGNjcweyH4RJ/+/Db6wpfFnyxqe
 avpRhQA55TA7ULmQ=
X-Received: by 2002:a05:620a:488c:b0:6e4:eb0a:4a2f with SMTP id
 ea12-20020a05620a488c00b006e4eb0a4a2fmr852983qkb.228.1665007652556; 
 Wed, 05 Oct 2022 15:07:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7F/0SN1g99JEyYOzZSB+scCfYNVJOAL5tU/XKt3bSmUKzn8V697ZntIO9USfAST/DOPLHEjA==
X-Received: by 2002:a05:620a:488c:b0:6e4:eb0a:4a2f with SMTP id
 ea12-20020a05620a488c00b006e4eb0a4a2fmr852965qkb.228.1665007652272; 
 Wed, 05 Oct 2022 15:07:32 -0700 (PDT)
Received: from [172.20.5.108] (rrcs-66-57-248-11.midsouth.biz.rr.com.
 [66.57.248.11]) by smtp.googlemail.com with ESMTPSA id
 x6-20020a37ae06000000b006b9c9b7db8bsm17202363qke.82.2022.10.05.15.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 15:07:31 -0700 (PDT)
Message-ID: <118f5553-ec48-53e4-cebe-21ebc3e9b5d6@redhat.com>
Date: Thu, 6 Oct 2022 00:07:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] coroutine: Drop coroutine_fn annotation from
 qemu_coroutine_self()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20221005175209.975797-1-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221005175209.975797-1-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.435, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/22 19:52, Alberto Faria wrote:
> qemu_coroutine_self() can be called from outside coroutine context,
> returning the leader coroutine, and several such invocations currently
> exist (mostly in qcow2 tracing calls).
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   include/qemu/coroutine.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index c61dd2d3f7..c77ccd80f5 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -122,7 +122,7 @@ AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co);
>   /**
>    * Get the currently executing coroutine
>    */
> -Coroutine *coroutine_fn qemu_coroutine_self(void);
> +Coroutine *qemu_coroutine_self(void);
>   
>   /**
>    * Return whether or not currently inside a coroutine

The alternative would be to have two versions, one that is coroutine_fn 
and one that isn't, but this is certainly okay too!

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


