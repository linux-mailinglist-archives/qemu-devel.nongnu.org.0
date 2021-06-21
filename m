Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67003AE4C7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:29:37 +0200 (CEST)
Received: from localhost ([::1]:50464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFJI-0001vy-US
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvFI7-0000Qt-90
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvFI4-0007ko-Oj
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624264100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+pjEI9oWBjggg1vOoxCpJSegklvGvNbPRhtl2fxxqg=;
 b=Tqzk4dZ+M6H0qUzPr+uAeZN9uRHzS8HVhnpTsSwGGSNZYz6XHoForUkp0bC/IoljODuTj4
 lFai89OzcrI0cXlCowaWaWW73cGMt61UwGXvepq3E8XysA2mSgzqX9KH7AtCVh9pmAWzjg
 gzBB2fvY935YnWaAJ+SxWMQ2yEPBNEA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-xM-sATkBNA69YeRoTZyiZA-1; Mon, 21 Jun 2021 04:28:19 -0400
X-MC-Unique: xM-sATkBNA69YeRoTZyiZA-1
Received: by mail-ed1-f72.google.com with SMTP id
 ee28-20020a056402291cb0290394a9a0bfaeso1932209edb.6
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 01:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4+pjEI9oWBjggg1vOoxCpJSegklvGvNbPRhtl2fxxqg=;
 b=iX1rDiK26ftlHYeJOVSPpxs0lupgEVouEy9Arqw/zDn4G9PkGOX5/wiQXBSdF2LRh5
 PdurBwQThz5zvAaleuwD5uHHTmUCvYy0x7854CX2anVrcZpIdYU31Ii2P6Sh6yY0tPq+
 RySeBsYUnsgcvuLfmzDZhS92fcbclsfpaZYQridKGjxf203iBUX/Can+753etpZs3nda
 KaUFCt2NZyb2auBrmsmtAcgskud2mfscwE7sse0H4OuGf1Nzhbx08FOXdYq+i5VgcJYq
 qpzHCbSQqCgKvl3kZ3I0kO+22ch4D5eMtH9Zn6FexcCHweF9tYt8RRPJsItB47kt1QIs
 fdhg==
X-Gm-Message-State: AOAM533dtkZtMyLO4bYOCOcRyBCHIVPeuggicmk9CQ9cBPskn/YA1JLq
 l3h0fKgUDSTl1lMRPRzGVohl9dDwWcdg5WzhSj0ekUnMHrUXzXlD8N11ROIK2T8FEFviAsKdMeu
 lpTKJw5E6jYXSTWileYWIZMk8og1uQtf1rNRzoZWAYv9Io/aW7sOvQQa9tKOl2J6kKvA=
X-Received: by 2002:a17:906:f256:: with SMTP id
 gy22mr9960816ejb.103.1624264097757; 
 Mon, 21 Jun 2021 01:28:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrx09CQhw95r7ShIZvDpfOahu4Q2qIkRN3Bdg3srKaLXHXfpKxhIHMKGsEXlnehBhe1lP6aw==
X-Received: by 2002:a17:906:f256:: with SMTP id
 gy22mr9960798ejb.103.1624264097522; 
 Mon, 21 Jun 2021 01:28:17 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 b19sm1632505edd.10.2021.06.21.01.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 01:28:17 -0700 (PDT)
Subject: Re: [PATCH v4 3/6] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-4-eesposit@redhat.com>
 <47ed70d3-dfac-089e-3da0-e50455c4d0bb@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <c9e6c5f5-b66a-be7f-5dbb-2be3202dcd06@redhat.com>
Date: Mon, 21 Jun 2021 10:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <47ed70d3-dfac-089e-3da0-e50455c4d0bb@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19/06/2021 20:53, Vladimir Sementsov-Ogievskiy wrote:
> 14.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>> @@ -52,29 +52,35 @@ typedef struct BlockCopyCallState {
>>       /* Coroutine where async block-copy is running */
>>       Coroutine *co;
>> -    /* To reference all call states from BlockCopyState */
>> -    QLIST_ENTRY(BlockCopyCallState) list;
>> -
>>       /* State */
>> -    int ret;
>>       bool finished;
>> -    QemuCoSleep sleep;
>> -    bool cancelled;
>> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
>> +
>> +    /* To reference all call states from BlockCopyState */
>> +    QLIST_ENTRY(BlockCopyCallState) list;
>>       /* OUT parameters */
>> +    bool cancelled;
>>       bool error_is_read;
>> +    int ret;
> 
> Hmm, about that. Is @ret an "OUT parameter"? Yes it is.
> 
> But someone may think, that out parameters doesn't need locking like 
> "State" parameters (otherwise, what is the difference for the person who 
> read these comments?). But that is wrong. And ret is modified under 
> mutex for reason.

In patch 5 I added a comment above @ret and @error_is_read:
/* Fields protected by lock in BlockCopyState */

I can add your explanation too.

> 
> Actually, the full description of "ret" field usage may look as follows:
> 
> Set concurrently by tasks under mutex. Only set once by first failed 
> task (and untouched if no task failed).
> After finish (if call_state->finished is true) not modified anymore and 
> may be read safely without mutex.
> 
> So, before finished, ret is a kind of "State" too: it is both read and 
> written by tasks.
> 
> This shows to me that dividing fields into "IN", "State" and "OUT", 
> doesn't really help here. In this series we use different policies of 
> concurrent access to fields: some are accessed only under mutex, other 
> has more complex usage scenario (like this @ret), some needs atomic access.
> 
Yes but I think especially the IN vs State division helps a lot to 
understand what needs a lock and what doesn't.

Emanuele


