Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7885688DC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 15:02:44 +0200 (CEST)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o94fy-0006At-5g
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 09:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o94cm-0005Mi-GO
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 08:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o94ck-0003VC-5v
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 08:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657112361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IuW+er9rfeFJZtLK3NpdGcIwv7h9pt2MptkXIBG4Bpg=;
 b=W4opyii2lbQhq6s1uUKWCAWB/4/Xe/4e4u3QjVDoX/bNVZy+DAH4ydWbfYEnQEaZ1F5JTu
 TazOIyaGAnm48SKMp+jJSmJwXrNXjKcSHD9LEa1sXu5zyQ/DV0xEw1hIYlqM0otIy/TOUO
 zjb+KDxpao4sklUHNYyZzkTRBzJ1mmY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-C4l33VhFP_K4Ak_MP9Dj1w-1; Wed, 06 Jul 2022 08:59:20 -0400
X-MC-Unique: C4l33VhFP_K4Ak_MP9Dj1w-1
Received: by mail-wr1-f69.google.com with SMTP id
 n5-20020adf8b05000000b00219ece7272bso2654587wra.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 05:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=IuW+er9rfeFJZtLK3NpdGcIwv7h9pt2MptkXIBG4Bpg=;
 b=0URJg21uOutTD1XPLcPRv0+ClHXrLs3+VyhIew//4jtW0O5qH9/y1ga/dlacyxgVOU
 N9M1fWIx1zY9MuQCm7zVO2qMbmkFWURgl3ktaEBOcSG10G18H6PkDj123wtFWkEIoCj2
 O9990q/iNgo2wRDVtExlZU1QvGqbxYMZypll8HPJuJ6pmfnbyiBH9BFD7lbtiKjZedFn
 scWdCN60nqPJncBcXFoGl8P9LOSpmQ1bT0uWud/rYJwy66CkpL5A20sT6LgKHlU9cHWx
 rHJOD0kzYUYjm7thrJd0/hi8bnmyZrcYzoHCnaXOIDVZABSo6UGxq+uGKRp6S0TVZBOo
 D1gA==
X-Gm-Message-State: AJIora/isaFZfzx0zTQ1LkKkEByzdcRsi5OaFU7FYWGzNhUrrTZtLZUJ
 4Dz75Ovoee4qsw2mp3Atbp7OJygnIZEXpkSZaZcZyvQbp+ZqJoifP0Dgw1ReKEf7+iKp3fSNppf
 5qWbq7uFNW3BLym0=
X-Received: by 2002:a1c:2902:0:b0:3a0:2a05:c639 with SMTP id
 p2-20020a1c2902000000b003a02a05c639mr43586519wmp.31.1657112359440; 
 Wed, 06 Jul 2022 05:59:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uNUYHwFiOFSUpzegbplXux7FmD9/Ip3lIEFtyspPE1amfreVarqYUTr2IfHdQ81INe85J4TA==
X-Received: by 2002:a1c:2902:0:b0:3a0:2a05:c639 with SMTP id
 p2-20020a1c2902000000b003a02a05c639mr43586482wmp.31.1657112359202; 
 Wed, 06 Jul 2022 05:59:19 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 n11-20020adfe78b000000b0021d7ea7013asm1844117wrm.54.2022.07.06.05.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 05:59:18 -0700 (PDT)
Message-ID: <1837e1d3-b22b-69e1-5315-504ac35d1f06@redhat.com>
Date: Wed, 6 Jul 2022 14:59:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 08/20] blockjob.h: introduce block_job _locked() APIs
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
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-9-eesposit@redhat.com>
 <6c02430a-a8d8-0be3-18b4-1709e601cbf9@yandex-team.ru>
 <95c3dae0-a8dd-1ec6-0ba1-5a4b1e92c1a3@redhat.com>
 <a48ea347-3a44-28c7-b154-ce3dadbae23c@yandex-team.ru>
 <233bbc9e-1eb2-4ab5-674d-83f234915a64@redhat.com>
In-Reply-To: <233bbc9e-1eb2-4ab5-674d-83f234915a64@redhat.com>
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



Am 06/07/2022 um 14:36 schrieb Emanuele Giuseppe Esposito:
> 
> 
> Am 06/07/2022 um 14:23 schrieb Vladimir Sementsov-Ogievskiy:
>> On 7/6/22 15:05, Emanuele Giuseppe Esposito wrote:
>>>
>>>
>>> Am 05/07/2022 um 17:01 schrieb Vladimir Sementsov-Ogievskiy:
>>>> On 6/29/22 17:15, Emanuele Giuseppe Esposito wrote:
>>>>> Just as done with job.h, create _locked() functions in blockjob.h
>>>>
>>>> We modify not only blockjob.h, I'd s/blockjob.h/blockjob/ in subject.
>>>>
>>>> Also, we start to introduce _locked block_job_* APIs.
>>>>
>>>> Does it mean that BlockJob and Job share the global mutex to protect
>>>> themselves? Than I think we should document in BlockJob struct what is
>>>> protected by job_mutex.
>>>
>>> There is nothing in the struct (apart from Job) that is protected by the
>>> job lock. I can add a comment "Protected by job mutex" on top of Job job
>>> field?
>>
>> Yes, I think that's worth doing.
>>
>> Other fields doesn't need the lock?
>>
> Well I didn't plan to actually look at it but now that you ask:
> 
> /** needs protection, so it can go under job lock */
> BlockDeviceIoStatus iostatus;
> 
> /** mostly under lock, not sure when it is called as notifier callback
> though. I think they are GLOBAL_STATE, what do you think?  */
> int64_t speed;
> 
> /** thread safe API */
> RateLimit limit;
> 
> /** I think it's also thread safe */
> Error *blocker;
> 
> /* always under job lock */
Actually that's wrong, they are just set once and never modified.

And GSList *nodes; is also always called under GS.

So there's only iostatus to protect and maybe speed.

Emanuele

> Notifier finalize_cancelled_notifier;
> Notifier finalize_completed_notifier;
> Notifier pending_notifier;
> Notifier ready_notifier;
> Notifier idle_notifier;
> 
> Not sure about blockjob->speed though.
> 
> Emanuele
> 


