Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469E8577DF7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 10:51:04 +0200 (CEST)
Received: from localhost ([::1]:37674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDMT1-00041p-28
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 04:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDMNr-0000tH-4f
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:45:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDMNl-0001Ri-AV
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658133935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ktFVjM0Vz4hQxiJMenJAQoKIzhAGd891WuuyQCxpx0U=;
 b=TVeLX47YCH3kA7j3V3NYAI4Hl5XOkrurYcqsIrYTI7NTmwiGlTLNGo10bVp9508M+9vBT7
 aHKclsNsKRv8r5joahHVN0Z7pVZMR7SGZex8HTYjMolrKdqA4nx1c1VweTKgWr6D7PAclw
 /L4/zEj3hZmDpd8d8/O20Dcvb/A+M6M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-rRVcl499OFaVsVJnr2SNoA-1; Mon, 18 Jul 2022 04:45:34 -0400
X-MC-Unique: rRVcl499OFaVsVJnr2SNoA-1
Received: by mail-qk1-f200.google.com with SMTP id
 l15-20020a05620a28cf00b006b46997c070so9045728qkp.20
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 01:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ktFVjM0Vz4hQxiJMenJAQoKIzhAGd891WuuyQCxpx0U=;
 b=W5Jq4pBc9IIakSsd7wGWG20utG1XJ0ujr6ejarD6CK8Luyg6ufcpbT7kUCyRqd3t3x
 L7/VrJn1d+1yjdSneLS9sXhJb/NoEZgTY3C12xtyQKcrqUTraTEORBO2vBYLwcIB3QZI
 ZVHfKXoqPciEazlHQZ/wmNB1CQ2fSm3MwUHZb3/GRZrgi3bv1PAglNNj8GS+8+UXe2Tm
 5kK2jx+n6t4/0BueDPORmLSANx1wj1Stx33bKgxcWs/GDQJquRmuoq6xRzNhv5A8VvOb
 zoHILey36AVMNNu5MXkoE4U+7QZE+h56d9c1ed17sL7z7l6mLCFnRndhhoHSagRdP36g
 xgJA==
X-Gm-Message-State: AJIora+0+0rJd/eZFrnYOn99mn8kqS6o1/PHrh3M0hzLcsFNQRcMAWWP
 9FevCM32B/IWQPSsADS8RlQxhAOe62tZ/Q+Ay4OJje619W9ZFKiTTV4TP5mhH3yOA3v5nv8ZE7c
 5uIwHc+7tFt7SE4w=
X-Received: by 2002:a05:622a:1a9e:b0:31e:ed37:3ebb with SMTP id
 s30-20020a05622a1a9e00b0031eed373ebbmr3423571qtc.401.1658133934217; 
 Mon, 18 Jul 2022 01:45:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vzKLkUmttbXXsMH3KudHGuGmCo5yVWbXT/Gb/RTwRRWWaKJ6UPFJBIDmdxeNgtjWIV2q1pkg==
X-Received: by 2002:a05:622a:1a9e:b0:31e:ed37:3ebb with SMTP id
 s30-20020a05622a1a9e00b0031eed373ebbmr3423562qtc.401.1658133934013; 
 Mon, 18 Jul 2022 01:45:34 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 az44-20020a05620a172c00b006af4a816963sm11724719qkb.133.2022.07.18.01.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 01:45:33 -0700 (PDT)
Message-ID: <a08308ac-28a1-969b-c07f-d828d41521a1@redhat.com>
Date: Mon, 18 Jul 2022 10:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 8/8] block: remove all unused ->can_set_aio_ctx and
 ->set_aio_ctx callbacks
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-9-eesposit@redhat.com>
 <61e119d7-9b70-8e72-4ebb-52aed545888a@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <61e119d7-9b70-8e72-4ebb-52aed545888a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 15/07/2022 um 16:34 schrieb Hanna Reitz:
> On 12.07.22 23:19, Emanuele Giuseppe Esposito wrote:
>> Together with all _can_set_ and _set_ APIs, as they are not needed
>> anymore.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block.c                            | 196 -----------------------------
>>   block/block-backend.c              |  33 -----
>>   blockjob.c                         |  35 ------
>>   include/block/block-global-state.h |   9 --
>>   include/block/block_int-common.h   |   4 -
>>   5 files changed, 277 deletions(-)
> 
> Looks good!  I’d just like a follow-up commit that also drops
> bdrv_try_set_aio_context(), so it’s all gone (I think that’s the final
> remnant?).
> 

It's the same for me, I thought renaming bdrv_try_set_aio_context was a
little bit unnecessary. You want to rename it to something else, or
directly call bdrv_child_try_change_aio_context?

I agree with the rest of comments in this series :)

Emanuele


