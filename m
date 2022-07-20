Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4928F57B85F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 16:25:39 +0200 (CEST)
Received: from localhost ([::1]:51476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEAdt-0005s4-Vt
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 10:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oEAbV-0003YC-HA
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 10:23:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oEAbS-0003KJ-B4
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 10:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658326985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ew5C/qdxDwneMOtVPsp3yTt+/55R1G9YgreilQyKmdM=;
 b=OuY9c6CJq3QK7mJmglGbF2ojMjr6ZeP9kb/FL7bT1+Gd1jfvNIRfH9sAqaKY0h/CvJZl9z
 3D2YjFYTw/iUhMv8T3kpBFG1MDaiLzro4l+GqmjdAoelYcduVjePpu7ejzno60QE8VbJk2
 hxrQbqVceLcpbJJ8c9T9Rs4TkjgJBTY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-CyWtlsHAPuykbG_1Z2Um-A-1; Wed, 20 Jul 2022 10:22:57 -0400
X-MC-Unique: CyWtlsHAPuykbG_1Z2Um-A-1
Received: by mail-qt1-f197.google.com with SMTP id
 bq10-20020a05622a1c0a00b0031ef98498a4so3800005qtb.19
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 07:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ew5C/qdxDwneMOtVPsp3yTt+/55R1G9YgreilQyKmdM=;
 b=lVX4C5nhuBaUgM1S1SITX3KJSbb3QmRyGvXmBDJj10X8u6RVBhuJYjx6zzqfg9jPWM
 82LiyXH2OeXJQBvjNUSB794fb8ym3Goa7HOpzIHT1RA5K/9hD65lAgIXicNDwpPJp5Go
 uEZwtK4lsLBI9d9tLa9EhEoZTFI66tYkm/oi/6C3dPV0OqydkAJq0wLFcy/2tQJFKL8D
 vw4ytwmsr2lRGMRHeZNxNHBDGHnaQ72dtpbJf9kMbfnMlfcEbXkdzOOnlZ7in7h+NQq9
 EncmyxRY2NEXaxssWbR1SmctfACHfB8xyP5OJSnX3umvcqgw6d3eqvbcuL4wrvmlDYt7
 vXTQ==
X-Gm-Message-State: AJIora+qj6eK19E9wUe9ECK9ac6xi7FWUZKuCa9tqWo7YppQAG3Ve5EY
 3OdB87ZBVHMjIYS9j2evBjOA17dqe95NfWbkY65VLnsPwSxk3PwRFk9iD0ysqnRoAVnSGaabKIJ
 k1jL2ea6cmzRcUI8=
X-Received: by 2002:ad4:5aa4:0:b0:473:d8ac:7c7 with SMTP id
 u4-20020ad45aa4000000b00473d8ac07c7mr12267203qvg.117.1658326976916; 
 Wed, 20 Jul 2022 07:22:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sQ6+aY93X+yvs2HDRKRE4DFBv+Kw91AaW8RkcxD9pqRmrJQNCdM/EBvrH+fFHti/xUbhFCfQ==
X-Received: by 2002:ad4:5aa4:0:b0:473:d8ac:7c7 with SMTP id
 u4-20020ad45aa4000000b00473d8ac07c7mr12267181qvg.117.1658326976666; 
 Wed, 20 Jul 2022 07:22:56 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a05620a29c900b006b5e3ca6400sm9937386qkp.103.2022.07.20.07.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 07:22:56 -0700 (PDT)
Message-ID: <be1b6c1a-4a39-77cc-19fb-9def24387a88@redhat.com>
Date: Wed, 20 Jul 2022 16:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 09/21] jobs: use job locks also in the unit tests
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
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-10-eesposit@redhat.com>
 <b86ef36a-a82c-591e-54fe-481690a5987f@yandex-team.ru>
 <8726804c-5dbc-bc27-3922-a00ae676941d@redhat.com>
 <1a2e7a92-9943-01a0-168c-73928d7833e8@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <1a2e7a92-9943-01a0-168c-73928d7833e8@yandex-team.ru>
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



Am 20/07/2022 um 15:06 schrieb Vladimir Sementsov-Ogievskiy:
> On 7/19/22 15:00, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 11/07/2022 um 15:08 schrieb Vladimir Sementsov-Ogievskiy:
>>>
>>> That made me ask:
>>>
>>> 1. Are all tests always run in main loop? If yes, why to protect status
>>> reading in test_complete_in_standby() ?
>>>
>>> 2. Maybe, we don't need to protect anything here? Why to protect other
>>> things if we run everything in main loop?
>>
>> I think it's still good example and practice to protect a function if it
>> needs to be protected and its name ends with _locked. It would just
>> confuse the reader if we don't protect it.
>>
> 
> Agree. But still, I think we should be consistent in such decisions. If
> you don't want to protect job->status in tests, then you shouldn't
> protect it in test_complete_in_standby() as well, just to not confuse
> someone who read the code.
> 
> 
Ok, I will protect job->status in those tests too.

Emanuele


