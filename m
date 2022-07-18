Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAF75785D2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:51:47 +0200 (CEST)
Received: from localhost ([::1]:41230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDS66-0004L2-UN
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDRun-0003HO-EE
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDRuS-00016l-Kc
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658155179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jnaaxMaODPA8CfD8sN8iNxdg0QPoV6/Q3JmLbhhJKY=;
 b=Mz/RpB4PFFPheZSs5vp0abZPSxllYPYBEOiAhYsfwaK8j+Wv0P2BjSP2Og9qgGDHjDo2bY
 YaV3INrwJDW0BhuvdHi0KqydPXEBsdF2yojLj/yUQnC1SrlH6Dqh5yW6jzCnRc0e4hi35c
 SoXSSwTLQkX0LYlWpQKpMoB9qZ5nS5U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-g4LcYshZN4-TsIP48K8lfg-1; Mon, 18 Jul 2022 10:39:38 -0400
X-MC-Unique: g4LcYshZN4-TsIP48K8lfg-1
Received: by mail-wm1-f70.google.com with SMTP id
 z11-20020a05600c0a0b00b003a043991610so4307042wmp.8
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 07:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=9jnaaxMaODPA8CfD8sN8iNxdg0QPoV6/Q3JmLbhhJKY=;
 b=1zbmssGxLl3vfN6eACFT4LWZoNU7I6F+hN7X52I++IJnOXiqYjl8jK/7Wr11nZ9rCv
 G34sUO/YV6wF3AK9BT94SS0v+G/lVOSh8atJQgy1yqk+GIHWYBUi+j6umXk/Qbh8ExEO
 wKcKqZa2XE357hBzD/iyOTlu5rUILd9uzjXrF+nk6fJVN2m8Vca6CeFdYfNRkWxLT1KN
 an2k+qz7ZuW0NP+Hexz+S5Fr486w0EALZNeu7Wg0Luyx8VbirQ87cfXQDTMX/dnauwkp
 U7R1iycmOoXWFoGm3vFk6EhmUYVMityuQ8mlx76FXMA94FOpw3RiA/ceZnBZ2ZBoDbTd
 2zmQ==
X-Gm-Message-State: AJIora8/RvMSUrFwzEeQ3eZirT11P1qC1JoUNMBUYmis8Zux7jSIKjDN
 m9TTWeQ0tGrFszAAZnuA40WFVJvPiad5fgWgkwkEh2WkXnt5zINnZrhirDIHjZFHp8CqnHs3DMd
 c1zO0Cp8AWdJCOIM=
X-Received: by 2002:a5d:59a8:0:b0:21d:8a9d:732b with SMTP id
 p8-20020a5d59a8000000b0021d8a9d732bmr22200808wrr.28.1658155177126; 
 Mon, 18 Jul 2022 07:39:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sqMSLAW5KJdltUbNPQXgV32MgtH9/cDvE/6LP314l9KcYzweQ0FjKwY9zV9cfYs2U7PwxA6Q==
X-Received: by 2002:a5d:59a8:0:b0:21d:8a9d:732b with SMTP id
 p8-20020a5d59a8000000b0021d8a9d732bmr22200781wrr.28.1658155176858; 
 Mon, 18 Jul 2022 07:39:36 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 r124-20020a1c4482000000b003a2e2a2e294sm16125730wma.18.2022.07.18.07.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 07:39:36 -0700 (PDT)
Message-ID: <f6158574-bb2b-9fac-b322-f48597075eb9@redhat.com>
Date: Mon, 18 Jul 2022 16:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 8/8] block: remove all unused ->can_set_aio_ctx and
 ->set_aio_ctx callbacks
Content-Language: en-US
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-9-eesposit@redhat.com>
 <61e119d7-9b70-8e72-4ebb-52aed545888a@redhat.com>
 <a08308ac-28a1-969b-c07f-d828d41521a1@redhat.com>
In-Reply-To: <a08308ac-28a1-969b-c07f-d828d41521a1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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



Am 18/07/2022 um 10:45 schrieb Emanuele Giuseppe Esposito:
> 
> 
> Am 15/07/2022 um 16:34 schrieb Hanna Reitz:
>> On 12.07.22 23:19, Emanuele Giuseppe Esposito wrote:
>>> Together with all _can_set_ and _set_ APIs, as they are not needed
>>> anymore.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   block.c                            | 196 -----------------------------
>>>   block/block-backend.c              |  33 -----
>>>   blockjob.c                         |  35 ------
>>>   include/block/block-global-state.h |   9 --
>>>   include/block/block_int-common.h   |   4 -
>>>   5 files changed, 277 deletions(-)
>>
>> Looks good!  I’d just like a follow-up commit that also drops
>> bdrv_try_set_aio_context(), so it’s all gone (I think that’s the final
>> remnant?).
>>
> 
> It's the same for me, I thought renaming bdrv_try_set_aio_context was a
> little bit unnecessary. You want to rename it to something else, or
> directly call bdrv_child_try_change_aio_context?

Wait we have 2 functions that need to be renamed:

- bdrv_child_try_change_aio_context, called only once in block-backend
because we need the ignore_child parameter.
- bdrv_try_set_aio_context, public, called everywhere, wraps
bdrv_child_try_change_aio_context setting ignore_child=NULL.

Name suggestions?


> 
> I agree with the rest of comments in this series :)
> 
> Emanuele
> 


