Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA5955D2EA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:11:33 +0200 (CEST)
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6B08-0003AG-PO
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6Axg-0001Hf-CT
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:09:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6Axe-0007gi-Hj
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656421737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMl+uYPWovyYc2xyuGWLUlnc5dAati6Ek/oeJ0RzPZg=;
 b=dQCyF5HBfsWsU3ZwXaCmTHB4bvsXol71GKEweWHQ627Yf8RB2Cwhd5dkl7906+06pQp0vT
 h9Z7Dqdb1N+IClvLwU+NmAT6Xh/orP+gZYQuM9mXD28Ia2jH1kt7W1AhiXHvgi3kVgGr2e
 a7vZbHwQRlpHd9RFU/aJFo0q8CIcbFU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-uESIMgYdPHy0PIz3hfNTkA-1; Tue, 28 Jun 2022 09:08:56 -0400
X-MC-Unique: uESIMgYdPHy0PIz3hfNTkA-1
Received: by mail-wr1-f69.google.com with SMTP id
 o1-20020adfba01000000b0021b90bd28d2so1790090wrg.14
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 06:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CMl+uYPWovyYc2xyuGWLUlnc5dAati6Ek/oeJ0RzPZg=;
 b=HkWxxk5b8NVHOQDlz/0hsQTI+aAGZyZEm7rEbwYoy/WwGbRphl4cItNlLpD46R4zZi
 omWd2V1eMLOBHdacIL64zoxkUGGg6R1SlhDMcH3R8KV4oy5Kxu+VVO8axmItv5QO58IB
 /hQ6wG44PW9ms7uzjJDxQgXCAJPOIV4enD2/yeZ/DTy8JItqmoLY8way2SxLZI+tMayp
 p3ut7ojPpuAcMvqzi39TNLhMp3V4kb5tBAkeyl7FL4x41xxneq6K57sJ3vQY6CAh6Qjr
 TGrz3xCpdpUkKP+ZBUzKxs/efqTOdaL6WHyxOJ3LKpjsrl0fYDlohXdDCK7mheUWWtJF
 NJ5A==
X-Gm-Message-State: AJIora/KBfMcjNNgQRBdOA/qp0yLJrKCBQY8m2c360m+ampXHW2AzYQx
 BcEFmmcWabmt0iCIpVycAUe8ZIJGdvoYsQvaY9gCp7/bqMk7Jo5axnCXifEO1zXKnMlrAt6xssj
 ZHNH7oREKJaPO5Ls=
X-Received: by 2002:a05:600c:2055:b0:3a0:4605:df1a with SMTP id
 p21-20020a05600c205500b003a04605df1amr17369222wmg.75.1656421735126; 
 Tue, 28 Jun 2022 06:08:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u3+7pI/+PC+DSGK0ZFnkOQp94guWYv7faZzX0qzZZyXw0a6KXQcK5+gd+8Xxhl0y2uHkBFpw==
X-Received: by 2002:a05:600c:2055:b0:3a0:4605:df1a with SMTP id
 p21-20020a05600c205500b003a04605df1amr17369178wmg.75.1656421734872; 
 Tue, 28 Jun 2022 06:08:54 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adff0cb000000b0021b92171d28sm16846973wro.54.2022.06.28.06.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 06:08:54 -0700 (PDT)
Message-ID: <22f84042-c972-9791-9f07-30d8eb82a16e@redhat.com>
Date: Tue, 28 Jun 2022 15:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 01/18] job.c: make job_mutex and job_lock/unlock()
 public
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220616131835.2004262-1-eesposit@redhat.com>
 <20220616131835.2004262-2-eesposit@redhat.com>
 <5284a1ef-6b46-3fc0-12ce-f7fab820e47a@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <5284a1ef-6b46-3fc0-12ce-f7fab820e47a@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



Am 24/06/2022 um 20:22 schrieb Vladimir Sementsov-Ogievskiy:
> I've already acked this (honestly, because Stefan do), but still, want
> to clarify:
> 
> On 6/16/22 16:18, Emanuele Giuseppe Esposito wrote:
>> job mutex will be used to protect the job struct elements and list,
>> replacing AioContext locks.
>>
>> Right now use a shared lock for all jobs, in order to keep things
>> simple. Once the AioContext lock is gone, we can introduce per-job
>> locks.
>>
>> To simplify the switch from aiocontext to job lock, introduce
>> *nop*  lock/unlock functions and macros.
>> We want to always call job_lock/unlock outside the AioContext locks,
>> and not vice-versa, otherwise we might get a deadlock.
> 
> Could you describe here, why we get a deadlock?
> 
> As I understand, we'll deadlock if two code paths exist simultaneously:
> 
> 1. we take job mutex under aiocontext lock
> 2. we take aiocontex lock under job mutex
> 
> If these paths exists, it's possible that one thread goes through [1]
> and another through [2]. If thread [1] holds job-mutex and want to take
> aiocontext-lock, and in the same time thread [2] holds aiocontext-lock
> and want to take job-mutext, that's a dead-lock.
> 
> If you say, that we must avoid [1], do you have in mind that we have [2]
> somewhere? If so, this should be mentioned here
> 
> If not, could we just make a normal mutex, not a noop?

Of course we have [2] somewhere, otherwise I wouldn't even think about
creating a noop function. This idea came up in v1-v2.

Regarding the specific case, I don't remember. But there are tons of
functions that are acquiring the AioContext lock and then calling job_*
API, such as job_cancel_sync in blockdev.c.

I might use job_cancel_sync as example and write it in the commit
message though.

Thank you,
Emanuele
>> This is not
>> straightforward to do, and that's why we start with nop functions.
>> Once everything is protected by job_lock/unlock, we can change the nop
>> into
>> an actual mutex and remove the aiocontext lock.
>>
>> Since job_mutex is already being used, add static
>> real_job_{lock/unlock} for the existing usage.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi<stefanha@redhat.com>
> 
> 


