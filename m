Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB76581564
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:35:23 +0200 (CEST)
Received: from localhost ([::1]:35230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGLec-0000Qu-2a
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oGLXO-0004IJ-28
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oGLXK-0004wH-9P
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658845669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfhXn28Q7GDHW12KRx4aZzHZnIBURAV05wQLM2or8vk=;
 b=I9EpaZZxhSNMySxbx42e9pilJGg69gNuCBJ7UWXF+EfbU7d5hD9Trf+V8UwPbtrJHbT9dk
 VGCYmyrx/woxDtPiGcAEKI1/MV8YTWCmTKEWJhYDQAWVuoFa/xdlhlp9FkAplCm6bqsGYU
 xtsWjl3Ky/GZGRzII6nm1d1fMeNqsdM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-9ic0uJ-lM9-0uq2e2oeZ7w-1; Tue, 26 Jul 2022 10:27:47 -0400
X-MC-Unique: 9ic0uJ-lM9-0uq2e2oeZ7w-1
Received: by mail-wr1-f70.google.com with SMTP id
 t12-20020adfba4c000000b0021e7440666bso1135915wrg.22
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 07:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wfhXn28Q7GDHW12KRx4aZzHZnIBURAV05wQLM2or8vk=;
 b=YFKP3DpEGBlg4KOJ9EInfLLslf0VSr09x8qd5Qgcnd3Qe6p9J1pXMA24u/fMehaz3r
 98EhnxGuW8jvBMf1y9kAT0tdsXYBBI1j3llcFhjEi8+0jSC3wswtBhWmi7vEADvH5cLF
 WTROMPalGWTl1yXGd4hVIVqyo/ZqgelRK14s+p26BJoAeH0T7ob1LMDg0vcvjx7k844n
 s/w65eLqx4xMAxXboWRv98wApiq5UJ7uvDL8SR01hv2tZDvxJ/9KQDcQS7srIo6CLKgy
 XDXujU0ZUoBxET7ZGQeaDr+FGotCajwSxIUwQVLgzxz56oN83CZd8BXHKz/99sNJOOu/
 EKMw==
X-Gm-Message-State: AJIora9Cabc7SzAGxJIohJ19qPrglmgpRXu33RokFoQVcgaBhb+sXJ5h
 DKOZiv3AqbBa6X0gXW1Ns/QZ5VR4jRzd10VtXsW+3QBiyBesHo69mHpjmdz5mtGCOIYwPGXMcQi
 lqDs7W0QyDVj0l3E=
X-Received: by 2002:a5d:6f05:0:b0:21e:80b8:a651 with SMTP id
 ay5-20020a5d6f05000000b0021e80b8a651mr8790031wrb.374.1658845666607; 
 Tue, 26 Jul 2022 07:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v8PbqrPHrtyK7oDWAYxFfPgHmMNZ2wssyKhDZ0N+JGF3IYbRWxIZwSxwj2qVKYblDaDew80Q==
X-Received: by 2002:a5d:6f05:0:b0:21e:80b8:a651 with SMTP id
 ay5-20020a5d6f05000000b0021e80b8a651mr8790008wrb.374.1658845666307; 
 Tue, 26 Jul 2022 07:27:46 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003a325bd8517sm21069864wmb.5.2022.07.26.07.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 07:27:45 -0700 (PDT)
Message-ID: <b6fe314b-7545-86b4-2610-d1541ec3e809@redhat.com>
Date: Tue, 26 Jul 2022 16:27:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 00/11] Refactor bdrv_try_set_aio_context using
 transactions
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220725122120.309236-1-eesposit@redhat.com>
 <7fd09a11-b47b-cd47-aa44-a7ec2ed6dc8b@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <7fd09a11-b47b-cd47-aa44-a7ec2ed6dc8b@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 26/07/2022 um 16:24 schrieb Vladimir Sementsov-Ogievskiy:
> On 7/25/22 15:21, Emanuele Giuseppe Esposito wrote:
>> The aim of this series is to reorganize bdrv_try_set_aio_context
>> and drop BDS ->set_aio_context and ->can_set_aio_ctx callbacks in
>> favour of a new one, ->change_aio_ctx.
>>
>> More informations in patch 3 (which is also RFC, due to the doubts
> 
> patch 2 now.
> 
>> I have with AioContext locks).
>>
> 
> Can't apply to master (neither patchew can:
> https://patchew.org/QEMU/20220725122120.309236-1-eesposit@redhat.com/ )
> Do you have a published branch somewhere to look at?
> 

You need to apply the latest job series first.
Anyways, the branch is here:
https://gitlab.com/eesposit/qemu/-/tree/dp_tryset_final

Emanuele


