Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6BA4776D3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:07:02 +0100 (CET)
Received: from localhost ([::1]:50000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtHa-0006Pb-3X
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:07:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxtGC-0004p0-M4
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:05:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxtGA-0007A9-8i
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:05:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639670732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXcUz2GFf7eDMWuCGJtshTGMOPThsXqrOJBIwAxq0Uc=;
 b=i5/ytCPPpdVTip8HvKHakKyAZsf3SVO3+aOF5Nq1rO7qVrOIKTnCCvq9dxMCWQrKjKWekQ
 oC66lwP/vXGvMEyKMA7ZMaXu7lGJ0EgbsxyL8KASPNyGnBSBXHGaaoMmtOng3foDu3evSj
 OVfazZWC37ZklT0E52CpMV4fbNsKoZg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-UEKi3tPoPJqQAMucjCkodg-1; Thu, 16 Dec 2021 11:05:28 -0500
X-MC-Unique: UEKi3tPoPJqQAMucjCkodg-1
Received: by mail-ed1-f69.google.com with SMTP id
 z18-20020a05640240d200b003f8024280adso1905885edb.15
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TXcUz2GFf7eDMWuCGJtshTGMOPThsXqrOJBIwAxq0Uc=;
 b=QRaPnuMpSlantNZQWTo1Bvw1xBXQPR77UuHjcm7YdnkNFcE+MxZdJDDWDlxl3bfjbE
 8Z+MY+HYxFMaqAdTqYdKWDr6246zavVt324WGLpbPo032WlMIQbk4SAbctlitLrgOI+I
 7S4W80vRUb2/Q7AzGMK3t+882680sFNQsSKAtgl3EDd+Ghq9VXpKCr7E2mkrE+SRvVC9
 zl9qr0ZbEM550t8eS4uDxmt1ZZyizgAWgXR/pHaVi91/O5mTsLh6qzWBAZem9va5FI/r
 tb2t8TyGAhbx+eX6NlErOHvoOdCQqJA6P5TwgYtqAuVQanzDrJPNIiW6d0/IvI22p+UP
 H6Mw==
X-Gm-Message-State: AOAM5330B+SnEinRkmMf9DRGbKVQgQ5BiyuHgNZiaJ9S4q5pnk/KbVjF
 0xnBGfkdgMRRHT/3IBcauyk/9boP1avWa+ork9zzo/S0/tuOUXLzwslLEVZxEqZ14PTT0PT56JY
 ykd0VxZdnDjuHrpM=
X-Received: by 2002:a05:6402:2814:: with SMTP id
 h20mr20970098ede.288.1639670726865; 
 Thu, 16 Dec 2021 08:05:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxk7isudFZwLw85LK2LP4IxDNqVauCVlA+lL1x0nmvGmZuCVKbEpti1iM9Yh73+k5pg0Mvl9g==
X-Received: by 2002:a05:6402:2814:: with SMTP id
 h20mr20970059ede.288.1639670726458; 
 Thu, 16 Dec 2021 08:05:26 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id do16sm1960970ejc.190.2021.12.16.08.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 08:05:25 -0800 (PST)
Message-ID: <937d15e5-4ba5-af84-f3bf-a4aa828f9d82@redhat.com>
Date: Thu, 16 Dec 2021 17:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 10/31] block.c: modify .attach and .detach callbacks of
 child_of_bds
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-11-eesposit@redhat.com>
 <f996c8cc-c025-f8a5-c89d-cd8b8a94e7c5@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <f996c8cc-c025-f8a5-c89d-cd8b8a94e7c5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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



On 16/12/2021 15:57, Hanna Reitz wrote:
> On 24.11.21 07:43, Emanuele Giuseppe Esposito wrote:
>> According to the assertions put in the previous patch, we should
>> first drain and then modify the ->children list. In this way
>> we prevent other iothreads to read the list while it is being
>> updated.
>>
>> In this case, moving the drain won't cause any harm, because
>> child is a parameter of the drain function so it will still be
>> included in the operation, despite not being in the list.
> 
> Sounds good.

Uhm.. I don't think this is useful at all. I was thinking to drop this 
patch in v6.

My plans on subtree drains, ->children and ->parent lists are explained 
in "Removal of Aiocontext lock and usage of subtree drains in aborted 
transactions"

https://patchew.org/QEMU/20211213104014.69858-1-eesposit@redhat.com/

And as I say there, commit d736f119da makes sure that it is safe to 
modify the graph even side a bdrv_subtree_drained_begin/end() section.
So this should be unnecessary.

Thank you,
Emanuele
> 
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 522a273140..5516c84ec4 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -1416,6 +1416,7 @@ static void bdrv_child_cb_attach(BdrvChild *child)
>>   {
>>       BlockDriverState *bs = child->opaque;
>> +    bdrv_apply_subtree_drain(child, bs);
>>       assert_bdrv_graph_writable(bs);
>>       QLIST_INSERT_HEAD(&bs->children, child, next);
>> @@ -1423,7 +1424,6 @@ static void bdrv_child_cb_attach(BdrvChild *child)
>>           bdrv_backing_attach(child);
>>       }
>> -    bdrv_apply_subtree_drain(child, bs);
> 
> I think we should also remove the empty line above.
> 
> Hanna
> 
>>   }
>>   static void bdrv_child_cb_detach(BdrvChild *child)
>> @@ -1434,10 +1434,9 @@ static void bdrv_child_cb_detach(BdrvChild *child)
>>           bdrv_backing_detach(child);
>>       }
>> -    bdrv_unapply_subtree_drain(child, bs);
>> -
>>       assert_bdrv_graph_writable(bs);
>>       QLIST_REMOVE(child, next);
>> +    bdrv_unapply_subtree_drain(child, bs);
>>   }
>>   static int bdrv_child_cb_update_filename(BdrvChild *c, 
>> BlockDriverState *base,
> 


