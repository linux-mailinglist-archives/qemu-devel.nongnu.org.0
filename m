Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9A35664EB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:22:05 +0200 (CEST)
Received: from localhost ([::1]:50972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8doq-0001ZB-DT
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o8db1-0001rx-SI
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o8db0-00008F-94
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657008465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVVOJu77iTKaQsjh1si8MGhHVaB10APAIJXcXHcK8Yw=;
 b=UMRt+2ap8qqnle64A0IPcUSkG6d1pRrXjrjBonhAigQg93k4DkPJPBnZZdKyaIRRhR+yuF
 46VvJPQow+USUKitX/ZTEOzr+Gj94iLNtKmsq4LgwJfSOfzq+Ue89TjlyUU7eIsFM15v8v
 RJGi7c1Qg1iVRiukmsTX546nArqKYrY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-03HEuz2MMXiIX38vVwa-Kw-1; Tue, 05 Jul 2022 04:07:43 -0400
X-MC-Unique: 03HEuz2MMXiIX38vVwa-Kw-1
Received: by mail-wr1-f71.google.com with SMTP id
 s1-20020a5d69c1000000b0021b9f3abfebso1700470wrw.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AVVOJu77iTKaQsjh1si8MGhHVaB10APAIJXcXHcK8Yw=;
 b=Ml5/ZS1GrgTrT+6ZCPeMU87X7fJdHdcpWWjiihHlC1pAXNlori050ocKyaUvCVUSNG
 7iOlJM89NNZQIu98JTSlj1OhEIGWVm8n9bZbwFXPWze5QrZKALEOgKKcZX6KY6I8RmKN
 zL9Ru1sHwydFRaYDQ+xTIqvz5ILDIU9T5SDNw3dgxVuXUMXlF33sbxhnay064fbyU41G
 L4nWBqcBYd34+A7k1xTIVVjMgB650kZVJ4HLczr9zKawH2vzKnN0QV6CoL8xgL5uOm9M
 BOkZZE2Xv16rrVUZUjyi9FSGM1D6CIT3HQognMYJ4DkXLxTp3ZzKRINugeMSMeg1JHiN
 Avqw==
X-Gm-Message-State: AJIora8GU0TvohavAGPTQksaW49ef1y2vK1EQ6M3Akk83LQ437RaICP+
 CTQM6i/hqmCfXnVCh9cfA//7YpmzkDqrmc+jwteNnZPMPdCJ/D2vWT5WoX5ttblXYzDf1Y/efRT
 iAAao1TOyz7ICgzo=
X-Received: by 2002:a05:6000:904:b0:21a:3dca:4297 with SMTP id
 bz4-20020a056000090400b0021a3dca4297mr30716009wrb.487.1657008462422; 
 Tue, 05 Jul 2022 01:07:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tSHBOWgz3K+VXI44eVFWLOFBT10UCOjAorCVoBrr8xeWpCx3jqR+mlVDZqM3bfQkNAPe2Usw==
X-Received: by 2002:a05:6000:904:b0:21a:3dca:4297 with SMTP id
 bz4-20020a056000090400b0021a3dca4297mr30715989wrb.487.1657008462224; 
 Tue, 05 Jul 2022 01:07:42 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 d10-20020adff2ca000000b0021a38089e99sm32156827wrp.57.2022.07.05.01.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:07:41 -0700 (PDT)
Message-ID: <0c4ff18c-f12f-6955-09b8-8acd3126492e@redhat.com>
Date: Tue, 5 Jul 2022 10:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 05/20] job.c: add job_lock/unlock while keeping job.h
 intact
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
 <20220629141538.3400679-6-eesposit@redhat.com>
 <YsPqxG4//mc5DBn4@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YsPqxG4//mc5DBn4@stefanha-x1.localdomain>
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



Am 05/07/2022 um 09:39 schrieb Stefan Hajnoczi:
> On Wed, Jun 29, 2022 at 10:15:23AM -0400, Emanuele Giuseppe Esposito wrote:
>> +void job_ref(Job *job)
>> +{
>> +    JOB_LOCK_GUARD();
>> +    job_ref_locked(job);
>> +}
> 
> You don't need to fix this, but just a note:
> 
> This API seems dangerous. If we don't hold the lock, how can we be sure
> job won't be unreferenced before we call job_ref()? We would need to be
> sure there exists another reference that won't be released until
> job_ref() returns...
> 

I guess that's a drawback of using this new serie organization :)

This function is just a temporary placeholder to avoid having _locked
functions being called without the lock held (see previous serie
suggestions from Vladimir and Kevin).

Emanuele


