Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC2842652D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 09:22:36 +0200 (CEST)
Received: from localhost ([::1]:42398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYkDD-000065-JE
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 03:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYk9v-000693-Ni
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 03:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYk9p-000724-7w
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 03:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633677543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/T+pm5Iz7mkJlzU/8mCW3jcpJxQOoDC9bvPadONQIc=;
 b=g9v4BHXLSjRRsczb736IT9N1kdsLykAr8pi60PoJg1az5z0VN81SrVnt6EWTBXuICgHjwv
 lgXmmm8z/YMOdqwzZe5giRYhGYKpszgzRArBy6ZxsdYrW+3/UH0OTuEqZZ9a1QAVletkrt
 LetZVb68SqznxdH7ZW6d/GZr1MEuLbY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-YpX4zRUYOl6Fo9ObZFlrMQ-1; Fri, 08 Oct 2021 03:19:02 -0400
X-MC-Unique: YpX4zRUYOl6Fo9ObZFlrMQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 z6-20020a50cd06000000b003d2c2e38f1fso8354243edi.1
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 00:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D/T+pm5Iz7mkJlzU/8mCW3jcpJxQOoDC9bvPadONQIc=;
 b=MnnOIgMsSiWLQ8+8uBELkUselwQgZGjQ3m/uwRw903mhTy5GxcAnPw734vxBRxpIIh
 5EB7zd0G1QC8C5+dcZ8s/4qJXKJzQtfZQ4GkNF3hviF6y5LeZHB6x63JXCUQwSvwQZas
 7xzoEYrAUYsWHAcizEcN6rc5XMuuN5TLEiex6zQKhKybqHREiPh9AZNoj6OWRouKM4Bp
 jQy6cbX1B6oS8yD+x/yJclvsUOf7DeD5nYA44os/fP0HHXwjF7SOEzmIQju53AflqirI
 7/dq5e5Dc/DntAv7hmLSFc5s+d6ND6kv6PkiqBWjTrNrrLYNRaRoHP6z7a2CGPf+yFrI
 e+4Q==
X-Gm-Message-State: AOAM533JrE76lUBpM6jltBgCJL6xvbzbO2bx2MuGyTrNoJ4EqSM6wfQc
 xJy56UGNgTEn0lC3G6yqAFIq6sXvYpclanpBfnnrRCgNGRSfJmVWm9wU4KigGlvo6RTEPxWqsT9
 S1baTrrctzvArrNfz3npMZlA66/898bnnt6N/94dBnvHNpaaQLi/E11BAnZ0BUX0ODp0=
X-Received: by 2002:a17:906:4895:: with SMTP id
 v21mr2213611ejq.299.1633677540824; 
 Fri, 08 Oct 2021 00:19:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdqUb6UWgwnGnfslph1wUjE1c3PT37PJZJpl+bw6C0H64hhxraDqgjE++Q52hFOVed0TzhVw==
X-Received: by 2002:a17:906:4895:: with SMTP id
 v21mr2213561ejq.299.1633677540444; 
 Fri, 08 Oct 2021 00:19:00 -0700 (PDT)
Received: from localhost.localdomain ([213.55.224.75])
 by smtp.gmail.com with ESMTPSA id b2sm590775ejz.119.2021.10.08.00.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 00:18:58 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/25] include/block/transactions: global state API
 + assertions
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-18-eesposit@redhat.com>
 <YV8IeFCtejooaE9l@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <790d60d4-04dd-3eac-b81c-ebe22f9ce37c@redhat.com>
Date: Fri, 8 Oct 2021 09:18:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YV8IeFCtejooaE9l@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/10/2021 16:47, Stefan Hajnoczi wrote:
> On Tue, Oct 05, 2021 at 10:32:07AM -0400, Emanuele Giuseppe Esposito wrote:
>> transactions run always under the BQL lock, so they are all
>> in the global state API.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   include/qemu/transactions.h | 24 ++++++++++++++++++++++++
>>   util/transactions.c         |  4 ++++
>>   2 files changed, 28 insertions(+)
> 
> Hmm...not sure about this. Maybe Vladimir can share his thoughts.
> 
> This seems like a library that can be used in various situations. It has
> no connection to the BQL. There's no need to declare it GS or I/O
> because it's just a utility just like QEMUIOVector, etc.
> 

Ok, I can remove this patch for next version, and then we can discuss 
whether to add it or not.

Thank you,
Emanuele


