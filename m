Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894E73B2C4B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:17:57 +0200 (CEST)
Received: from localhost ([::1]:52924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMQm-0007Sg-6s
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwMPn-0006dx-6A
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:16:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwMPg-0004PY-Cw
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624529807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HiCVKzCcBDjOLkMu6FL1mgjyw/iMGpkMa4AQWV7/xCk=;
 b=SIjqufzLWD2fhPMeh4VvyBaVLICpwwJ8duq+OY4xO3C7ENwAFMeHR1ulv28FdE/ZpQWQ5A
 UxP1vT9g5LdaFdENfTdKD8hqtj8VvAftGkHD3N0ITo6AyVf5XxWLoHmWjwGokaZ0F5Hsdq
 G6QpBE7qcvUp5YlK+yT/bAfW56DOIhw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-1OavR3hhMIS0FcpBJSOGgw-1; Thu, 24 Jun 2021 06:16:46 -0400
X-MC-Unique: 1OavR3hhMIS0FcpBJSOGgw-1
Received: by mail-ej1-f72.google.com with SMTP id
 z6-20020a17090665c6b02903700252d1ccso1822110ejn.10
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 03:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HiCVKzCcBDjOLkMu6FL1mgjyw/iMGpkMa4AQWV7/xCk=;
 b=We3wbT4Rq1ZOycAI9zIDgVfhB40O/5OiXMKKs8qwn06Lc+soxvz+qralFrAQ/GHbT5
 dm318rGKtbJ1Nahb9bk8a9Cb7BqksbVragQZRTiYcCvigbJvowEPBsZ0RRprV2b8xFvR
 6/gGF5A3p33Cruuez46CA/eIHPwWz4NWEgpxkRslJ5o/BcpvN8OuN+7Ll3FnS2uuwhUx
 HPyMEApRcMvn3Gl1gmaJC49qr38g+5SKnMFARtzQX1nWZ3dX51D874FXuZzmiHyqZ9Gg
 V4dEQuDAeyW4CWigrVkOkXmueA0+8TR2b59BAEn1S8YUZpfOid6g1bJkou4tQ2+6LfYw
 EJ8A==
X-Gm-Message-State: AOAM533JsWgme6hbAQ8V03yuSRljmswCjsJkdaF2/CL111U5okCNGEJr
 UhiXA3ZSymWdaa6uR+VTsTFgjt7oWIpNcQJ0gExV8XR6KTQyIbBS/I27uKCrZ1UlUGUxVNMHelm
 C8yFa06JbLiusJOQ=
X-Received: by 2002:a17:906:528b:: with SMTP id
 c11mr4601408ejm.156.1624529804869; 
 Thu, 24 Jun 2021 03:16:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnWrym/EqEw5YZ0CBNz49K6QlT9KNGnv4qD5MZLnPtIAu54vfxZGy4aM4hB9f83xB+XurK6w==
X-Received: by 2002:a17:906:528b:: with SMTP id
 c11mr4601373ejm.156.1624529804549; 
 Thu, 24 Jun 2021 03:16:44 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 j1sm1604831edl.80.2021.06.24.03.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 03:16:44 -0700 (PDT)
Subject: Re: [PATCH v2 3/6] block: Clarify that @bytes is no limit on *pnum
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210623150143.188184-1-mreitz@redhat.com>
 <20210623150143.188184-4-mreitz@redhat.com>
 <adfe02d6-4b40-86f1-fa6b-55cf00405036@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <3c4ae0ed-a7d7-b6c3-1785-f6e4a9efec7e@redhat.com>
Date: Thu, 24 Jun 2021 12:16:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <adfe02d6-4b40-86f1-fa6b-55cf00405036@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.06.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
> 23.06.2021 18:01, Max Reitz wrote:
>> .bdrv_co_block_status() implementations are free to return a *pnum that
>> exceeds @bytes, because bdrv_co_block_status() in block/io.c will clamp
>> *pnum as necessary.
>>
>> On the other hand, if drivers' implementations return values for *pnum
>> that are as large as possible, our recently introduced block-status
>> cache will become more effective.
>>
>> So, make a note in block_int.h that @bytes is no upper limit for *pnum.
>>
>> Suggested-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   include/block/block_int.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/include/block/block_int.h b/include/block/block_int.h
>> index fcb599dd1c..f85b96ed99 100644
>> --- a/include/block/block_int.h
>> +++ b/include/block/block_int.h
>> @@ -347,6 +347,11 @@ struct BlockDriver {
>>        * clamped to bdrv_getlength() and aligned to request_alignment,
>>        * as well as non-NULL pnum, map, and file; in turn, the driver
>>        * must return an error or set pnum to an aligned non-zero value.
>> +     *
>> +     * Note that @bytes is just a hint on how big of a region the
>> +     * caller wants to inspect.  It is not a limit on *pnum.
>> +     * Implementations are free to return larger values of *pnum if
>> +     * doing so does not incur a performance penalty.
>
> Worth mention that the cache will benefit of it?

Oh, right, absolutely.  Like so:

"block/io.c's bdrv_co_block_status() will clamp *pnum before returning 
it to its caller, but it itself can still make use of the unclamped 
*pnum value.  Specifically, the block-status cache for protocol nodes 
will benefit from storing as large a region as possible."

?

Max


