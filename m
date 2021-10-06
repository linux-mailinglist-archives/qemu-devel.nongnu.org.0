Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1A0423AAC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 11:38:00 +0200 (CEST)
Received: from localhost ([::1]:57652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY3N8-0003rU-QU
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 05:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mY3Lx-0002uD-7U
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mY3Lu-0003UC-CR
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633513001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1R1nJvufsof7zdaEeFr2p5SFaBOHrjcVPBszTibwRCM=;
 b=BwQPrSKcFnAEOI87gf14h3GWSn9tWrtZpnWZPp5u5HTu2ID1vOoaqTa0XwbMhJUxXLofW1
 bG4hYcFVnGZCVQJS5oIpfRGEzgMsLkCqORwhBRwE1H23raY+S1BY5fQ+qY2KGL8taxad1o
 APofXVCNizTEImmwbsPy/ujUJD1Je8U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-coE12_FrNiW1Gg5S5hAvFw-1; Wed, 06 Oct 2021 05:36:40 -0400
X-MC-Unique: coE12_FrNiW1Gg5S5hAvFw-1
Received: by mail-ed1-f71.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so2073405edi.12
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 02:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1R1nJvufsof7zdaEeFr2p5SFaBOHrjcVPBszTibwRCM=;
 b=RMYG0/+fnNq8LP39TTqxSoSu46Xt+F6ROIAe2eiyKNBqNsv8xETEoqnGGElOWktTEW
 YmbsVdVNYo0ZnO6v1122UV899pbnz5xqvFVGg6T4o7aA6n1sx/PeJM6OaWt7bJ9wIFui
 WtTLjKvrg0Gr+qhoVSxr0MS4T629r0QCEpRDdSRFtGgPtJuziIVvI9IgrDzKx9RmuTZW
 YHY7BcszXKzvG1KLUQuCR/UDWehbZJh1+gTsq1FwdiQWOc7oC3pQd0OCG0eHPhbUpoaM
 3lM4qU5qBoi/9TxRZoP8M4Y8fZoLd8vTVDXCojUkP7EITSXlRYG9hDhgX773pCfe3ypR
 20Ag==
X-Gm-Message-State: AOAM531H+NVnahWXXr0vjCF/giMHgvJkmQgjVqgbWBRskDytEueMQIg/
 cazQlCoRaMzUSdsDvg7HjFWwljroJ5zAtG0M8jQiWFlJZZSl2Awxmk2+08rMPzsiCP7Jx8z883L
 42hPumMEqoPJF0b8A/Ax2y/rOTwzazr2Xq5IXkK8lDhhmEdr4xli83mz8iLCFo62f1jw=
X-Received: by 2002:a05:6402:11d4:: with SMTP id
 j20mr1392059edw.267.1633512998844; 
 Wed, 06 Oct 2021 02:36:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHBcmWgbA1HZscQTqN8n46YAsQqjLwWGWwUzfM0+B2HnVgVPIJPAkhsUE93/LGkFgnw/Pb4w==
X-Received: by 2002:a05:6402:11d4:: with SMTP id
 j20mr1392014edw.267.1633512998566; 
 Wed, 06 Oct 2021 02:36:38 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 c6sm2027553ejb.41.2021.10.06.02.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 02:36:38 -0700 (PDT)
Subject: Re: [RFC PATCH v2 03/25] block/block-backend.c: assertions for
 block-backend
To: Eric Blake <eblake@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-4-eesposit@redhat.com>
 <20211005162915.mywhslrram67sxfo@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <7394017f-a0af-797a-d84c-44427b9cf1ba@redhat.com>
Date: Wed, 6 Oct 2021 11:36:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211005162915.mywhslrram67sxfo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 05/10/2021 18:29, Eric Blake wrote:
> On Tue, Oct 05, 2021 at 10:31:53AM -0400, Emanuele Giuseppe Esposito wrote:
>> All the global state (GS) API functions will check that
>> qemu_in_main_thread() returns true. If not, it means
>> that the safety of BQL cannot be guaranteed, and
>> they need to be moved to I/O.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/block-backend.c  | 89 +++++++++++++++++++++++++++++++++++++++++-
>>   softmmu/qdev-monitor.c |  2 +
>>   2 files changed, 90 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/block-backend.c b/block/block-backend.c
>> index d31ae16b99..9cd3b27b53 100644
>> --- a/block/block-backend.c
>> +++ b/block/block-backend.c
>> @@ -227,6 +227,7 @@ static void blk_root_activate(BdrvChild *child, Error **errp)
>>   
>>   void blk_set_force_allow_inactivate(BlockBackend *blk)
>>   {
>> +    g_assert(qemu_in_main_thread());
> 
> Why g_assert()?
> 
>> @@ -661,6 +676,7 @@ bool monitor_add_blk(BlockBackend *blk, const char *name, Error **errp)
>>   {
>>       assert(!blk->name);
>>       assert(name && name[0]);
>> +    g_assert(qemu_in_main_thread());
> 
> especially why mixed spellings?
> 
> Per osdep.h, we don't support builds with NDEBUG or G_DISABLE_ASSERT
> defined to their non-default values, so behavior isn't really
> different, but consistency says we use 'assert' more frequently than
> 'g_assert'.
> 

You are right, I did not put that much attention to this.
Will change it in assert().

Thank you,
Emanuele


