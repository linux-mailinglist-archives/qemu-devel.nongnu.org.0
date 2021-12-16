Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D590477BBB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 19:49:19 +0100 (CET)
Received: from localhost ([::1]:51358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxvob-0001UJ-DS
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 13:49:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxvjU-00084e-DQ
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:44:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxvjR-0000VR-GT
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:43:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639680236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KNuPWoNSic8pIyrc/8cKhR4gAwA0XDocScOaJbxoLl0=;
 b=ArHIGpVzYKj16refv2iUIrMz8yD7xRCP/9bWk/yeFiblEKnHNlsnUKJErczODNWNxEwH9k
 kp1OIl6qVk+Z9MvQiBWm+4n0VvrSpKRwbLBn8U6E5Q8XTPVAaf4MixlMMDRgYWSWqh8bS9
 7mTxayMKT5eWH1I5GLebd5uedSpJKuE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-uWuN_BHCOOuGAba5lbw9OA-1; Thu, 16 Dec 2021 13:43:50 -0500
X-MC-Unique: uWuN_BHCOOuGAba5lbw9OA-1
Received: by mail-wr1-f70.google.com with SMTP id
 o4-20020adfca04000000b0018f07ad171aso7228025wrh.20
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 10:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KNuPWoNSic8pIyrc/8cKhR4gAwA0XDocScOaJbxoLl0=;
 b=UIvZYcJyEDQZUZXR7mwkeCvkUYK1N3ZDGDxb/w4fCMtjmDVL4oXeAPk5l6XeruGO/9
 yR22BfEU282r2v6+pjvqW5DUpNKEPC+C/iRbqtgXbJrRAqmQEpMH5/2uCY0TnfpRUWxR
 cghxk57ooxLpuAIZ26gTLkG6kq2vYD+evuwF3vCdZCuNNd3JbZML1h7paFLstVHPiwq1
 hyK6sRfYrTuj9FxAtkhQbQOZNg1sp7yjkfx+O155RqRidC8huv0cMdFl/iNOo1+cnIrF
 fS2pz/0yTeVG/9ELNQ9fEVyuj0kU08vGeUUK963WiZBU/JwJzS3T7+hqXY3n8D0lNCwo
 +Pew==
X-Gm-Message-State: AOAM530TgRxWrnrlukU5dKP/wSwj3V9FI9S7tBv5nEH7qNZqZB5eSHq4
 jHMmC5idi0fAbUW4Zcvl7bFpoQSeVqa1/Q/87u+OgH1DX06byJNP1c2GSWHBFLAZ/j7vvufA7PJ
 hSHpTceYkgNrkd28=
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr9891266wri.241.1639680228874; 
 Thu, 16 Dec 2021 10:43:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPF6XGqDL4cH/HukhbINf8LZT/vvsYGP/YrUD3q4iHWwWiy76wYe5Aq0xQAX8dsTTjbgijKg==
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr9891240wri.241.1639680228666; 
 Thu, 16 Dec 2021 10:43:48 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id k33sm2301675wms.21.2021.12.16.10.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:43:48 -0800 (PST)
Message-ID: <8ca6c67b-4826-19eb-76b4-5870b20dcc93@redhat.com>
Date: Thu, 16 Dec 2021 19:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 22/31] block_int-common.h: assertion in the callers of
 BlockDriver function pointers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-23-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211124064418.3120601-23-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.11.21 07:44, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block.c        | 18 ++++++++++++++++++
>   block/create.c | 10 ++++++++++
>   2 files changed, 28 insertions(+)

[...]

> diff --git a/block/create.c b/block/create.c
> index 89812669df..0167118579 100644
> --- a/block/create.c
> +++ b/block/create.c
> @@ -42,6 +42,16 @@ static int coroutine_fn blockdev_create_run(Job *job, Error **errp)
>       BlockdevCreateJob *s = container_of(job, BlockdevCreateJob, common);
>       int ret;
>   
> +    /*
> +     * Currently there is nothing preventing this
> +     * function from being called in an iothread context.
> +     * However, since it will crash anyways because of the
> +     * aiocontext lock not taken, we might as well make it
> +     * crash with a more meaningful error, by checking that
> +     * we are in the main loop
> +     */
> +    assert(qemu_in_main_thread());

Mostly agreed.  This function is always run in the main loop right now, 
so this assertion will never fail.

But that’s the “mostly”: Adding this assertion won’t give a more 
meaningful error, because the problem still remains that block drivers 
do not error out when encountering (or correctly handle) BDSs in 
non-main contexts, and so it remains a “qemu_mutex_unlock_impl: 
Operation not permitted”.

Not trying to say that that’s your problem.  It’s pre-existing, and this 
assertion is good.  Just wanting to clarify something about the comment 
that seemed unclear to me (in that I found it implied that the 
qemu_mutex_unlock_impl error would be replaced by this assertion failing).

Hanna

> +
>       job_progress_set_remaining(&s->common, 1);
>       ret = s->drv->bdrv_co_create(s->opts, errp);
>       job_progress_update(&s->common, 1);


