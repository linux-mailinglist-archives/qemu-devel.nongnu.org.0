Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179C56185C1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:06:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdfR-0006DC-2V; Thu, 03 Nov 2022 13:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdfN-000678-8X
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdfK-0008GD-Jd
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667495166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1k1P+X3sNc06hFzMvOTcR9IOqBxZojobzPDrwapuNA0=;
 b=hRcARFIVjivt2TKpYwbVFA+D7C3/9h4kAW/WDu7C/cO5ezanC5HT9McG2UfNONhh1u9TqF
 0/7aAi+mIkrF5g/n4C0tIoFZ7rsg0geLmVntqS10UIBbi/hY2noD/0J42gsirx/qnOjfwg
 do7S7D5CBtohUluKl5Hs9yiXbYW67WA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-220-YtaFvduIPr2fLp4MYE5naA-1; Thu, 03 Nov 2022 13:06:00 -0400
X-MC-Unique: YtaFvduIPr2fLp4MYE5naA-1
Received: by mail-ej1-f70.google.com with SMTP id
 qw17-20020a1709066a1100b0078e25b6a52fso1666318ejc.3
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 10:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1k1P+X3sNc06hFzMvOTcR9IOqBxZojobzPDrwapuNA0=;
 b=peqTwHNfJPD/YKTf9QM79dlkhXMhc46+zAW9PvUdlpwzFHbIPmywdnO91GtQViK9Yr
 jZk2D9BuYtArIFAkD53KXP4bUkz0ZUpGDFyIlRhECQZU2APMEorKjs99vHowOW406HNg
 26UaEhWzajyucCzxH62T44qyDAm2kZvDfF3yiSFhHH8toOXpVRpYDaWhYD2Utbb4ygRV
 owOm9+d+u3elJbV8QSRNz1X+ZgqDm3l7zP+7zM0uPl00DrUJ0/0ZT4WPIMCnnB8hW/2v
 dAvKZ2zXKAvl2OWVYcwcyWUtEj32nGJQAsfeGbcaLYQJPxwnv1nFV4pkwwj7EZYGT6hl
 YSEg==
X-Gm-Message-State: ACrzQf3y5yaZGsUMeHjZIvsUXiP1xhOLmekzS4Dk6e4RT+0ll3zngHLJ
 3rJz3RuWJaZ21AYE8hjAZSP0IPYC1q7rH2BlfgRmcpH4XbO6iurkOUSxB+OexAY6ozuVXJgD1+6
 FKkZyMNFNXK4a9QQ=
X-Received: by 2002:a17:907:6ea9:b0:794:8b93:2e44 with SMTP id
 sh41-20020a1709076ea900b007948b932e44mr30677577ejc.407.1667495158999; 
 Thu, 03 Nov 2022 10:05:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6yW0OKqw6CkxYPnlF4fQPBR63LXzRCtdmwCmft2vdcD4XYIkMhcS8RWNhKmlydFIb8KK90IQ==
X-Received: by 2002:a17:907:6ea9:b0:794:8b93:2e44 with SMTP id
 sh41-20020a1709076ea900b007948b932e44mr30677561ejc.407.1667495158796; 
 Thu, 03 Nov 2022 10:05:58 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 sd10-20020a170906ce2a00b007abafe43c3bsm710754ejb.86.2022.11.03.10.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 10:05:58 -0700 (PDT)
Message-ID: <df6ad52a-e8b6-4aad-760e-49623e0844ee@redhat.com>
Date: Thu, 3 Nov 2022 18:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 8/9] block: bdrv_create is never called in non-coroutine
 context
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221103134206.4041928-1-eesposit@redhat.com>
 <20221103134206.4041928-9-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221103134206.4041928-9-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/22 14:42, Emanuele Giuseppe Esposito wrote:
> Delete the if case and make sure it won't be called again
> in coroutines.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c | 37 ++++++++++++++++---------------------
>   1 file changed, 16 insertions(+), 21 deletions(-)
> 
> diff --git a/block.c b/block.c
> index e5e70acf15..1ee76a8694 100644
> --- a/block.c
> +++ b/block.c
> @@ -557,30 +557,25 @@ static void coroutine_fn bdrv_create_co_entry(void *opaque)
>   int bdrv_create(BlockDriver *drv, const char* filename,
>                   QemuOpts *opts, Error **errp)
>   {
> +    Coroutine *co;
> +    CreateCo cco = {
> +        .drv = drv,
> +        .filename = g_strdup(filename),
> +        .opts = opts,
> +        .ret = NOT_DONE,
> +        .err = NULL,
> +    };
>       GLOBAL_STATE_CODE();
> +    assert(!qemu_in_coroutine());
>   
> -    if (qemu_in_coroutine()) {
> -        /* Fast-path if already in coroutine context */
> -        return bdrv_co_create(drv, filename, opts, errp);
> -    } else {
> -        Coroutine *co;
> -        CreateCo cco = {
> -            .drv = drv,
> -            .filename = g_strdup(filename),
> -            .opts = opts,
> -            .ret = NOT_DONE,
> -            .err = NULL,
> -        };
> -
> -        co = qemu_coroutine_create(bdrv_create_co_entry, &cco);
> -        qemu_coroutine_enter(co);
> -        while (cco.ret == NOT_DONE) {
> -            aio_poll(qemu_get_aio_context(), true);
> -        }
> -        error_propagate(errp, cco.err);
> -        g_free(cco.filename);
> -        return cco.ret;
> +    co = qemu_coroutine_create(bdrv_create_co_entry, &cco);
> +    qemu_coroutine_enter(co);
> +    while (cco.ret == NOT_DONE) {
> +        aio_poll(qemu_get_aio_context(), true);
>       }
> +    error_propagate(errp, cco.err);
> +    g_free(cco.filename);
> +    return cco.ret;
>   }
>   
>   /**

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


