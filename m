Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C893E4EEDF1
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:17:30 +0200 (CEST)
Received: from localhost ([::1]:36872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naH9d-0006zx-Lz
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:17:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naH6L-0004ZG-Md
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:14:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naH6I-0005WP-5R
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648818841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Eo+y65QqUTkyi6YFqFJJhcdVfTjk8avtL6Kmt6XkiA=;
 b=CYxV7fYhYYQJjN+lsg0CiJ6lwpCNwZ6ATS0221EXgAX2OX1Idde0jnGznVa5XZuz+C1L0G
 PXbapMoNluCReyraoTsT29yMyaJnT5lf5f3fDQctgiKiSxiOohScyPESXDypy0H1gvAoJL
 mG7c1cxKpnsEPfcrsUg5N9lPWN5rfrQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-lW4xaZDfM3GTFw6e1bgdzQ-1; Fri, 01 Apr 2022 09:13:59 -0400
X-MC-Unique: lW4xaZDfM3GTFw6e1bgdzQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 gt41-20020a1709072da900b006e490a92df4so1575381ejc.4
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Eo+y65QqUTkyi6YFqFJJhcdVfTjk8avtL6Kmt6XkiA=;
 b=uuK/iy6JOYa/vchfvqrHxXGp6M/LlEf3Wwu3ynXRFgKByeMd6k08K8PwnRG9g52uCc
 fS22nmTVu5RbJHPyRS2zaC3+MoRJfCXdR8ZlwzQoHGbeCnOu+EsT2zS1InfZJA9FFvPw
 nKdXXCUI2THndYosVhZ3AXsgEAtw32rL21N94wqd9RKqGCiK1p9eXyvhMrgwVoBm6KTS
 by/gk6CZZ/i0K5nfP0DCOGAFt0Ov3mDh+Yz1SEqgCdt2AcbKr1/SSPjJcYIpE8sCh5e0
 vVGJI6J3cRQ3R4YoQuaMb66RwJD1d5ddNhl4JjDqNbDf5AhkYDSRYzgQ6M9p9BCrk8qB
 Yu7g==
X-Gm-Message-State: AOAM530OloQymHrvj6rKgxcKnL1Cd/iwGMuWYQ77hat4Eyx56wcT4+1T
 MJASRQ+XD0K4v+w2mOWJOl5922Xwi/tjQIkEX7Tm+eVyR7btwxr7JsBK0GKHDpl29rJNckTOXvf
 CREdDFCZdgnfa8mk=
X-Received: by 2002:a05:6402:4402:b0:418:ff4c:f102 with SMTP id
 y2-20020a056402440200b00418ff4cf102mr21155945eda.365.1648818838012; 
 Fri, 01 Apr 2022 06:13:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOiQHnbNj25Sqt715DLmBxy2xaJgZ+g9LB+EjzJ0/7/8yA2fYFy+0JJrcPdLvmDUPezN+B+A==
X-Received: by 2002:a05:6402:4402:b0:418:ff4c:f102 with SMTP id
 y2-20020a056402440200b00418ff4cf102mr21155918eda.365.1648818837745; 
 Fri, 01 Apr 2022 06:13:57 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a50e08f000000b004134a121ed2sm1208318edl.82.2022.04.01.06.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:13:57 -0700 (PDT)
Message-ID: <a6360f9e-008c-210f-0037-26054d99d44f@redhat.com>
Date: Fri, 1 Apr 2022 15:13:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/7] util: add qemu-co-timeout
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-5-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220401091920.287612-5-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
> Add new API, to make a time limited call of the coroutine.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   include/qemu/coroutine.h | 13 ++++++
>   util/meson.build         |  1 +
>   util/qemu-co-timeout.c   | 89 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 103 insertions(+)
>   create mode 100644 util/qemu-co-timeout.c

I don’t really understand what this does.  Intuitively, I would have 
assumed this makes the first yield of the respective coroutine not 
return when the timeout has elapsed, and instead, we switch back to 
qemu_co_timeout(), which returns to its callers.

But it looks like when this yield happens and we switch back to 
qemu_co_timeout(), the coroutine actually isn’t cancelled, and will just 
continue running, actually.  Is that right?  On first look, this looks 
like it’ll be quite difficult to think about what happens when this is 
used, because the coroutine in question is no longer run in sequence 
with its caller, but actually might run in parallel (even though it’s 
still a coroutine, so it’ll remain cooperative multitasking).


