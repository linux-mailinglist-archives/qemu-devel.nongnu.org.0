Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0521E595E46
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 16:25:38 +0200 (CEST)
Received: from localhost ([::1]:33568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNxVg-0000Ao-Hx
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 10:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNxU9-0007Eo-DS
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 10:24:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNxU7-0004NI-4k
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 10:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660659838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2fJuuQOq/sf5nUx6soaBJzFz32B//HlfF5rWO0PA80=;
 b=hGEGtLdSFZH7EBbHc8nd+eoL0vTOeulsOP54cgDvootWl9HK7xyxWCNMfuIhjz2SowHbQV
 udz0XmRKCDBphbsJKGYeFQ7lrhlnIocSPhEOcRFSOGILEzMI3TNrZZLy01ZnaHp6cLgnH6
 pOOL4LrYRZQ7yHAxnwnPdHeXCj+Qnbs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-TY-8VsZWONqdoZfcs7YQfA-1; Tue, 16 Aug 2022 10:23:57 -0400
X-MC-Unique: TY-8VsZWONqdoZfcs7YQfA-1
Received: by mail-wm1-f71.google.com with SMTP id
 i132-20020a1c3b8a000000b003a537064611so4985691wma.4
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 07:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Z2fJuuQOq/sf5nUx6soaBJzFz32B//HlfF5rWO0PA80=;
 b=MpkHdfGJzBqhkhClLiBw1eWCNE1uorkg99Z00YgDBmu1r+ME1j1DhMxDcWsvU4iw4U
 uCI1VnEjtVZwQXMqh+qO/kAeflH+GpH+ArooKI0YhxyGCi2vn3Gq177R8c8oBZQ1HGDs
 IRVRkY+2qBn3/q0Jek0NUwOnnR2yxHmcwVq5JvUMYhQxrwnWmhUYEhM2w/bIbRzxBt77
 v6v8aWldehe8Mgg+LIgDLlysC2//ZfFPqajrOOTa6IUo3e4ucdFy7Pm5Sf6xOSH7dmRp
 ZVCL4hoocmtvmRh2JlhWskf8xioKPfXXEBA6/vCEikrIw4NYd34JZHXG4P7JCA/5N4tK
 9JSQ==
X-Gm-Message-State: ACgBeo2tw16vcLxkh4YBHQrTHup/sgHWfoxQDc7nAGYOkX5lyAYkgJkb
 XoNkO8y3ZgdWGst3HxbGguMFP2iKZ1lRpAeAoiJXCFA6r1215ovN9oXAeOvpAXSv2sODgu5HVnD
 svHM+EUia2n4Aa00=
X-Received: by 2002:adf:f5cc:0:b0:221:7e3f:41eb with SMTP id
 k12-20020adff5cc000000b002217e3f41ebmr11581434wrp.551.1660659835938; 
 Tue, 16 Aug 2022 07:23:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4zH8P+r2T1aUaa8MghyKA+gNsWHxnlAPZsyYOu4VzlzbzQix6aLLFiwU7Wcg1kDx0ynVpB4Q==
X-Received: by 2002:adf:f5cc:0:b0:221:7e3f:41eb with SMTP id
 k12-20020adff5cc000000b002217e3f41ebmr11581408wrp.551.1660659835647; 
 Tue, 16 Aug 2022 07:23:55 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a1c6a04000000b003a54f1d007csm12844482wmc.10.2022.08.16.07.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 07:23:55 -0700 (PDT)
Message-ID: <0633bb24-97b7-c99d-4dd4-e92c3f76df73@redhat.com>
Date: Tue, 16 Aug 2022 16:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 10/21] block/mirror.c: use of job helpers in drivers
 to avoid TOC/TOU
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-11-eesposit@redhat.com> <Yuv1R+l8Ug+ghePC@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yuv1R+l8Ug+ghePC@redhat.com>
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



Am 04/08/2022 um 18:35 schrieb Kevin Wolf:
> Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
>> Once job lock is used and aiocontext is removed, mirror has
>> to perform job operations under the same critical section,
>> using the helpers prepared in previous commit.
>>
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are *nop*.
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> Can you explain in the commit message what the TOC/TOU case is that this
> patch is addressing? It's not obvious to me why you picked exactly these
> places to add locking.

Well after thinking about it, mentioning TOC/TOU doesn't really make
sense here. I'll remove the "to avoid TOC/TOU" in the title.

> 
>> diff --git a/block/mirror.c b/block/mirror.c
>> index d8ecb9efa2..b38676e19d 100644
>> --- a/block/mirror.c
>> +++ b/block/mirror.c
>> @@ -654,9 +654,13 @@ static int mirror_exit_common(Job *job)
>>      BlockDriverState *target_bs;
>>      BlockDriverState *mirror_top_bs;
>>      Error *local_err = NULL;
>> -    bool abort = job->ret < 0;
>> +    bool abort;
>>      int ret = 0;
>>  
>> +    WITH_JOB_LOCK_GUARD() {
>> +        abort = job->ret < 0;
>> +    }
> 
> This is the most mysterious hunk to me. The only thing that should
> modify job->ret is the caller of this function anyway, but let's assume
> for a moment that another thread could write to it.
> 
> Then why is it only important that we hold the lock when we're reading
> the value, but not any more when we are actually using it? And what is
> the TOC/TOU that this fixes?

No TOC/TOU, no sense for this fix too. I'll remove this hunk too.

Emanuele
> 
> Kevin
> 


