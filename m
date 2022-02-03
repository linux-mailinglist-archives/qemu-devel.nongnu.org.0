Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848AB4A834D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 12:48:07 +0100 (CET)
Received: from localhost ([::1]:54414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFaas-0003h3-2o
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 06:48:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFaUR-0002KD-I6
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:41:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFaUP-0002wo-Uu
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:41:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643888485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wXeVgfSMt/T9o0IRbAsjb8VR3VdMNzhR9Z/lrxZsbOM=;
 b=e69fQH9NtYWQ/o5pOlx0qC0vZD1uKhJ0d7e1opxu9hwFTlHHHhJpGyKq08C8P5WfqhffRO
 HszFKc3GGg+bVPrsu55vvq21irEno5NLaKouhE5d5BU+bFZ8Pql/KjjiTDf+CDhFr77dyC
 +7e8WJt9MFPDD48oSr2N2mxO0Xu7jcU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-d9UaWl4ZMMGWw4brMcMCTw-1; Thu, 03 Feb 2022 06:41:19 -0500
X-MC-Unique: d9UaWl4ZMMGWw4brMcMCTw-1
Received: by mail-qk1-f198.google.com with SMTP id
 z1-20020ae9f441000000b00507a22b2d00so1876016qkl.8
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 03:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wXeVgfSMt/T9o0IRbAsjb8VR3VdMNzhR9Z/lrxZsbOM=;
 b=ZC/1SyazWaKy6iKzatQw4M4jtadVJjWWYNfhRXCRVPuPZ+QazMifEx8+I1RGwAnyxS
 C3N5fGXJw9vkdjgb7tbsY9ClLAj0u8xZEjOW7wxSKfITlHoIjgpRy/ruTnWNCBdUP6aW
 Y5hx6FOSxtxBPobzhlJUcpTVWXwAzWVrlIFYx8S6SNPMMznkJxThOF+etmts4CONgzvo
 AoirxWW0RO8KNMMIBPHnKwTyOw+uJr5mUMMFWEzd0KtSZLX+D8gYUUCMzDKL6eDXFqL1
 F0/JQ5H6H2Jub+3+S3fVhQWCPYLRF7OrZdyhABxHY9oqUOR8QNKw1hiSUUOZYR8BHG53
 LN+A==
X-Gm-Message-State: AOAM530R2DsVrZxBbMUUIBgfelT0+aFcYr6pIiArSwN3UmxUe7AyFkuC
 MjyS+MlqA1+mzhuu17qOg7A9yk4nuun+l9QyhqPPHuhF1wSdFtL+orsl5tGHFCXvKXYAJhWBTOB
 MexCatMa7cAdGFwc=
X-Received: by 2002:a05:622a:1805:: with SMTP id
 t5mr26362717qtc.293.1643888478602; 
 Thu, 03 Feb 2022 03:41:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy67nShur/ZW39JjLNuZJD/GineWZJzgB5O9LbTn37GnvafyZvxY82cCmW6lRUY2pAf7fTOag==
X-Received: by 2002:a05:622a:1805:: with SMTP id
 t5mr26362701qtc.293.1643888478385; 
 Thu, 03 Feb 2022 03:41:18 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id ay18sm5585893qkb.8.2022.02.03.03.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 03:41:17 -0800 (PST)
Message-ID: <a8c8bb77-0c6d-8240-1847-6c8ce561c0d7@redhat.com>
Date: Thu, 3 Feb 2022 12:41:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 05/12] test-bdrv-drain.c: adapt test to the coming subtree
 drains
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-6-eesposit@redhat.com>
 <53900301-5b8c-a724-4e48-ba3fa003cc1e@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <53900301-5b8c-a724-4e48-ba3fa003cc1e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19/01/2022 10:18, Paolo Bonzini wrote:
> On 1/18/22 17:27, Emanuele Giuseppe Esposito wrote:
>> - First of all, inconsistency between block_job_create under
>> aiocontext lock that internally calls blk_insert_bs and therefore
>> bdrv_replace_child_noperm, and blk_insert_bs that is called two lines
>> above in the same test without aiocontext. There seems to be no
>> reason on why we need the lock there, so move the aiocontext lock further
>> down.
>>
>> - test_detach_indirect: here it is simply a matter of wrong callbacks
>> used. In the original test, there was only a subtree drain, so
>> overriding .drained_begin was not a problem. Now that we want to have
>> additional subtree drains, we risk to call the test callback
>> to early, or multiple times. We do not want that, so override
>> the callback only when we actually want to use it.
> 
> The language here is a bit overcomplicated.  Don't think that you're
> writing Italian, instead use simple sentences.
> 
> First, the test is inconsistent about taking the AioContext lock when
> calling bdrv_replace_child_noperm.  bdrv_replace_child_noperm is reached
> in two places: from blk_insert_bs directly, and via block_job_create.
> Only the second does it with the AioContext lock taken, and there seems
> to be no reason why the lock is needed.  Move aio_context_acquire
> further down.  [Any reason why you don't move it even further down, to
> cover only job_start?]

The lock is left just to cover block_job_add_bdrv, since it internally
releases and then acquires the lock.
Fixing that is a future TODO.

job_start did not and does not need the AioContext lock :)

> 
> Second, test_detach_indirect is only interested in observing the first
> call to .drained_begin.  In the original test, there was only a single
> subtree drain; however, with additional drains introduced in
> bdrv_replace_child_noperm, the test callback would be called too early
> and/or multiple times.  Override the callback only when we actually want
> to use it, and put back the original after it's been invoked.
> 
> This could also be split in two commits.
> 

Will update the commit message, thank you!

Emanuele


