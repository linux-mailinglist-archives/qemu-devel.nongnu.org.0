Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE795E67DA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:58:30 +0200 (CEST)
Received: from localhost ([::1]:48784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOar-0006qV-7n
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1obNPc-0004FF-7n
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1obNPa-0002OQ-Eu
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663857765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msMorpptz4qZT7pdE1+bckyKJ8p2BxSc30ox9FzkU18=;
 b=In3f69qmC3/0n0CvMK7zK1ajHLQOUNWjrnsSXFN/H4H6ySAI7ltcuKVFxQWvO/3U70zvMO
 FRZ4rBbIPOGxZQqzM9qmBxnMHKfaJpYtJU7NULr2OcjDYP2viAgdzAe+49KII/jR3ipp+E
 LnXrC3VsumZ9O2lxKStMp0PF662kVQc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-RFLCBRM4OKqHYoI-Ii6naA-1; Thu, 22 Sep 2022 10:42:44 -0400
X-MC-Unique: RFLCBRM4OKqHYoI-Ii6naA-1
Received: by mail-qt1-f198.google.com with SMTP id
 fx6-20020a05622a4ac600b0035a70ba1cbcso6630378qtb.21
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=msMorpptz4qZT7pdE1+bckyKJ8p2BxSc30ox9FzkU18=;
 b=IyfGQpk9UvrFKpc6F2gdLeqZShYWUgmJfQCn+Prrn+Mx3ZUWcAkyevtMeLiHfVCeh7
 +C5yOyI+rbn1Q8rFLjJtdw1etbdPGijm4LxzUE1mzf+DpIaRcznjZ/z2faMofqgl3Ern
 lhIt4y79/LCkCnw+DasAydCAP/D3IKydyoz0VPhINBDYyXv/wxIjq2Dp0SUejysjQJx7
 KGMM7fSAHhS70kTs+QFRwJiKLXWt05YzQH8a6Esp0kSVHKVOUmroY5TKt3Y5oL4nZaXO
 WWhwolZaCOYKwfsLf8M5GEAtggpxQTw7JrLN73kdDHrZCTHdF/ly4oMARixB/xXLwf9G
 d2VA==
X-Gm-Message-State: ACrzQf1+HZCh8FjCWcjfC1g4HZD+r1hhCixgquwVh+uSbve3hyFdrYbt
 Zl5JJSDvgv/3kvBR5XdSbye+VIb4ddzQhiTALfbHQ8HSXGODA/84Q3kjvBPGrJwNy/JS5NEhd5z
 XLiP0AfiWWuNa1NY=
X-Received: by 2002:a05:622a:5a9b:b0:35b:b219:99d7 with SMTP id
 fz27-20020a05622a5a9b00b0035bb21999d7mr3041381qtb.510.1663857763861; 
 Thu, 22 Sep 2022 07:42:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM40bu9uWbRqs4Oxo7kdZ5m8riXxvHbeXMMfnWRegpe7bO2UuSXkFjvH17XH45uwC0YT+A+pVw==
X-Received: by 2002:a05:622a:5a9b:b0:35b:b219:99d7 with SMTP id
 fz27-20020a05622a5a9b00b0035bb21999d7mr3041363qtb.510.1663857763675; 
 Thu, 22 Sep 2022 07:42:43 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 r1-20020ae9d601000000b006cbbc3daaacsm3927926qkk.113.2022.09.22.07.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 07:42:43 -0700 (PDT)
Message-ID: <0f0009a2-52d2-f779-61c0-6c7a4ab9a023@redhat.com>
Date: Thu, 22 Sep 2022 16:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11 18/21] job.c: enable job lock/unlock and remove
 Aiocontext locks
Content-Language: en-US
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220826132104.3678958-1-eesposit@redhat.com>
 <20220826132104.3678958-19-eesposit@redhat.com>
 <09759123-8ed4-9c6e-2086-7f65af921a13@yandex-team.ru>
 <508253cf-3134-06ba-b5e6-9f2e594cc9ed@redhat.com>
In-Reply-To: <508253cf-3134-06ba-b5e6-9f2e594cc9ed@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18/09/2022 um 19:12 schrieb Emanuele Giuseppe Esposito:
>> In replication_stop, we call job_cancel_sync() inside
>> aio_context_acquire - aio_context_release section. Should it be fixed?

> I don't think it breaks anything. The question is: what is the
> aiocontext there protecting? Do we need it? I have no idea.

Ok Paolo reminded me that job_cancel_sync() calls
AIO_WAIT_WHILE_UNLOCKED. This means that it indeed needs to be wrapped
in an aiocontext release() + acquire() block.

>> Another question, sometimes you move job_start out of
>> aio-context-acquire critical section, sometimes not. As I understand,
>> it's of for job_start to be called both with acquired aio-context or not
>> acquired?
>>
> Same as above, job_start does not need the aiocontext to be taken
> (otherwise job_lock would be useless).

I still think here it does not matter if the aiocontext is taken or not.

> Thank you,
> Emanuele


