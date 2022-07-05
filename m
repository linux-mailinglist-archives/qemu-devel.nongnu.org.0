Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30DE5664F9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:25:52 +0200 (CEST)
Received: from localhost ([::1]:58606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dsV-0007B0-JN
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o8dfO-0000lf-NO
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:12:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o8dfM-0000kJ-Th
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657008736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/AaEtXdUhFQWLbSAY34Yg78OUJJP2hc6M572X9MpL24=;
 b=VQ51snkjo63idPin+6yBxZsF5aU5lefcm4F4zNU3Y9Vgv91uC/EuFGZ0y1OWfNh0B/DybE
 A2y07wHYpUSHK5xhjNFRx0h7nXCoa1i18HpF9Jkn6iiX6C4G39pMfq+DXhczGusvW/QFI3
 nI1dkqCdzRuV5eFTvQ8D2xP46JPKWDM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-FHLmiH7KMGiwzJXrmaC_zg-1; Tue, 05 Jul 2022 04:12:13 -0400
X-MC-Unique: FHLmiH7KMGiwzJXrmaC_zg-1
Received: by mail-wm1-f69.google.com with SMTP id
 6-20020a1c0206000000b003a02cd754d1so4944491wmc.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/AaEtXdUhFQWLbSAY34Yg78OUJJP2hc6M572X9MpL24=;
 b=M18/t6cDWxqDMRzi5dRJDpIOSxdODwGXRSZgrb0QGEFEuyEqyWJ25N9gJiyd1h0WJQ
 UF3fkOKAh1N8vlGYc0NddRtPs0EA73h5BCPUnnUHfzFmKQdE0JmuNPBkog7acjGG7aWR
 QDtssjYUowlY2WcrEbh9MYtucNB7wEtOZMwAGNCNIfqqPTO36Ri5A/m6I6QA5Ezo1ZS/
 xyITqCe9VkEC/OyiZMBLpRI4pmHTNsD+n66dnr+CgxN+aFk+8Iwacp69lAnYt3HjM2Nu
 wVmnaTX+Oe46gQsXRY8+gVlK0PYJ+hJARXi7I2xnsLUtUZNWtEZtH8BJyZ1/FsU35wgA
 vGfg==
X-Gm-Message-State: AJIora9VvjmamjRVWtJPPNaNU3wTFocYWSdvWYbZFIMXg1jENjzuZCoT
 mKhi+QK1/Qp06lPyFJUyrqNfGomcz/y4BHZuw1t9BTTs7Ax1z6REx/JYwv5dIHFGudhb/KrmKQ5
 aSik68bbnMhEa2D8=
X-Received: by 2002:a05:6000:1cf:b0:21d:656c:dd9f with SMTP id
 t15-20020a05600001cf00b0021d656cdd9fmr12001340wrx.15.1657008732291; 
 Tue, 05 Jul 2022 01:12:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v6WZ/9nQHkI2aqJjqm9tAdVKRktL+RNH/jzL4+OcG1b3S6GrFNESYXYuk31wJa29aEv8RgdQ==
X-Received: by 2002:a05:6000:1cf:b0:21d:656c:dd9f with SMTP id
 t15-20020a05600001cf00b0021d656cdd9fmr12001311wrx.15.1657008732066; 
 Tue, 05 Jul 2022 01:12:12 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05600c12c600b0039c811077d3sm21343827wmd.22.2022.07.05.01.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:12:11 -0700 (PDT)
Message-ID: <d5910e65-68e0-225c-c704-94a8f20fa9c6@redhat.com>
Date: Tue, 5 Jul 2022 10:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 08/20] blockjob.h: introduce block_job _locked() APIs
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-9-eesposit@redhat.com>
 <YsPvLS+c3SNPO7Qw@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YsPvLS+c3SNPO7Qw@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



Am 05/07/2022 um 09:58 schrieb Stefan Hajnoczi:
> On Wed, Jun 29, 2022 at 10:15:26AM -0400, Emanuele Giuseppe Esposito wrote:
>> +BlockJob *block_job_next(BlockJob *bjob)
>>  {
>> -    Job *job = job_get(id);
>> +    JOB_LOCK_GUARD();
>> +    return block_job_next_locked(bjob);
>> +}
> 
> This seems unsafe for the same reason as job_ref(). How can the caller
> be sure bjob is still valid if it doesn't hold the mutex and has no
> reference to it?
> 
> Maybe the assumption is that the next()/get()/unref() APIs are
> GLOBAL_STATE_CODE(), so there can be no race between them?
> 

Same answer as job_ref. Unfortunately if we want to keep this logic in
this serie that's the price to pay (even though it's just till patch 13).
No assumption I would say.

Emanuele


