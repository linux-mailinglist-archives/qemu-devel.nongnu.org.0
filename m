Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8B55E6841
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:17:46 +0200 (CEST)
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOtV-0007VF-Sk
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1obNMo-0008CU-FA
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:39:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1obNMk-0001J6-4Z
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663857585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=smWHZjVlWdGXXeBR4VvDXAxQdjfcfAZxbxQ8iRxRJiA=;
 b=VwZUrhazwOIZq4uIBNvnNQzM/HXd8H+tDPp2sTrexM74F6x3BG3lGrLjvtf4FJBagiB/s/
 ys4skzT+WPtZ5QQu5alCBrHWWXr0anLJpGzt6FhjlbaJFFe6TDW6Lqs4Yt7V3/EVKge7uT
 tZW160NmPqOdQVkMOCGXh1Dwqhyrz54=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-AbyD-K8UOT6I_7LgpQszvw-1; Thu, 22 Sep 2022 10:39:43 -0400
X-MC-Unique: AbyD-K8UOT6I_7LgpQszvw-1
Received: by mail-qv1-f70.google.com with SMTP id
 nn9-20020a056214358900b004ac7136c9a3so6561370qvb.16
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=smWHZjVlWdGXXeBR4VvDXAxQdjfcfAZxbxQ8iRxRJiA=;
 b=UMq03th4HKb0j7lkfDDBnp+p3bZLxiaRpXlbNjhvvmm1MnQAMcX1j87EtlUJ/roiqk
 lxay6iZmFW4QWbjce+CwZJn9kM1LQ+ZPwipKlg5mWAC7i6e/JKCE3KIa81jWwG7t/v8Z
 KPRfy5mnvQsBHJovuzdSb0FtWbHyWj/lD5yMwO5V6B0I0InzOyoU21cZhcppB78PEyxh
 9J0JR/EYjpMQ/J0iJ1iyxldy5Y2xLoiqvh4DtQRV++yRHi4FMHbs6pzLCuilSll3GO/G
 dxnNrPLk5ZF9QbIydjvBQ2ZvxBsx0AmZgbogbYbC8LVr+FrgHS+p3ZqgiOvUzilpJ06v
 PHkA==
X-Gm-Message-State: ACrzQf1YjvymPMNhWNzv9bjZt8Gd0F0c4+63q6KsRyBu40G+TlLRwVqt
 v/A1uFxJ0qTU1Fr0pgT+w8hheGG48ZfVhYwV222PsNt6gsdAvZs0DkfYcfdCXoEVa5I05fTV+H7
 LzPurd45IfyPfBuU=
X-Received: by 2002:a05:620a:752:b0:6cd:d01f:9ae8 with SMTP id
 i18-20020a05620a075200b006cdd01f9ae8mr2290301qki.647.1663857583427; 
 Thu, 22 Sep 2022 07:39:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ruRzL1ergR5xrZ27vB6cDsEWvnSc4tOQZGsqlFI73ypjdFUjUNQ/ZA5UMCzNeDPDNToaimg==
X-Received: by 2002:a05:620a:752:b0:6cd:d01f:9ae8 with SMTP id
 i18-20020a05620a075200b006cdd01f9ae8mr2290286qki.647.1663857583242; 
 Thu, 22 Sep 2022 07:39:43 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a05620a444d00b006cbd92ca141sm4138289qkp.133.2022.09.22.07.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 07:39:42 -0700 (PDT)
Message-ID: <e196dcab-4fac-dba4-6870-e56030549c55@redhat.com>
Date: Thu, 22 Sep 2022 16:39:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11 21/21] job: remove unused functions
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
 <20220826132104.3678958-22-eesposit@redhat.com>
 <6da86669-f177-7d34-ba8e-5291327b2723@yandex-team.ru>
 <a10720c9-a7d2-bae2-2967-9abe00b06343@redhat.com>
In-Reply-To: <a10720c9-a7d2-bae2-2967-9abe00b06343@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


> 
>>> @@ -725,9 +703,6 @@ void job_cancel_sync_all(void);
>>>    * Returns the return value from the job.
>>>    * Called with job_lock *not* held.
>>
>> in comment: with lock held.
>>
> 
> No idea what you mean here.

Ok you were referring at the function below.
Agree, changed.

> 
> Thank you,
> Emanuele
> 


