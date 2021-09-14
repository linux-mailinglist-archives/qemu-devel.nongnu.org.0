Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6333240B02A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:02:39 +0200 (CEST)
Received: from localhost ([::1]:40980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ91C-00066P-5C
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQ8q6-0000kr-2i
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:51:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQ8q4-0007E4-BI
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631627467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0csEx54J6IsMen8hTFETgEUM+kGSqRP1TOxNo/07yK8=;
 b=caBe0uXURKD896e5nhFXDYRspyYsHGWFm/opjW2BTqKxnXy27dZUA2VK8C7ueR2EMmwfMG
 TFxpTyu46OCpQCT6Z0Qk627ofGkQzyH13xkXb9t9uHgPulwVrB8s+FmpVe+U4/Ud3PSBxU
 lmcdL4c2iRCf3+jCMBmqUz8hij6wVeA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-kfEd7K9yNaWs-MiTnnZOWg-1; Tue, 14 Sep 2021 09:51:06 -0400
X-MC-Unique: kfEd7K9yNaWs-MiTnnZOWg-1
Received: by mail-wm1-f71.google.com with SMTP id
 n30-20020a05600c3b9e00b002fbbaada5d7so725462wms.7
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0csEx54J6IsMen8hTFETgEUM+kGSqRP1TOxNo/07yK8=;
 b=CmtTIgWNC2YmRsvWyW9UD12H59I8sUL0D3hBjvK6Yih7GDO5dMPsEgquAeW/g7KK0l
 FTObrGufRlAL7Z7b7PQr8/4oqGOHl8kdvBEf/FB0aw4AZYVUC+xrwev8D1m31dM1pkqk
 vM65DKutlcu2sg+Ld9v2PR1U5EHHQQorSKgh5HD4/p+r+5lOZK/ouCKN1bAC3zsHVG81
 XxCdJQKfptAxBHY3I+sbhlrKrDjsLu9wTFm42sUhnVzrEoDJ4rgf9ySKxvpibuLa7W2J
 UzZU91LA+EczduN/pWhb76gbYYc/BPr8wp8y7E3IDimXQLdxz2kUfRT+JHkn3ahaE1oC
 qzDA==
X-Gm-Message-State: AOAM530k7hU2qy4fj/zhhs1De/tj7myO8q8HmpVsR2bT/XzylNlYmp17
 E1sAxvYNzwStT5ZHkHRTN/049nVlo7M6Kckc2O5YLdSYRmiFF3NVfpV5UYzGPQL/MZaX+Qipta5
 kDDqNjgkh2mRkXzs=
X-Received: by 2002:a5d:45ce:: with SMTP id b14mr7550442wrs.283.1631627465564; 
 Tue, 14 Sep 2021 06:51:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwnqpjkWyQUjFuyR0K8Tfvn5BZJ5Tii+81yqfzEW0uAT1BXa/25hL9TB3qSiAHLDZRiVFSVg==
X-Received: by 2002:a5d:45ce:: with SMTP id b14mr7550425wrs.283.1631627465394; 
 Tue, 14 Sep 2021 06:51:05 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6041.dip0.t-ipconnect.de. [91.12.96.65])
 by smtp.gmail.com with ESMTPSA id
 l124sm1214550wml.8.2021.09.14.06.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 06:51:04 -0700 (PDT)
Subject: Re: [PATCH] virtio-balloon: Fix page-poison subsection name
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 mst@redhat.com
References: <20210914131716.102851-1-dgilbert@redhat.com>
 <32aacbf5-4693-9765-4d4d-410332669294@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <a156ff43-a26e-3165-be6f-6d786fa8e773@redhat.com>
Date: Tue, 14 Sep 2021 15:51:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <32aacbf5-4693-9765-4d4d-410332669294@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: stefanha@redhat.com, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.09.21 15:47, Philippe Mathieu-Daudé wrote:
> On 9/14/21 3:17 PM, Dr. David Alan Gilbert (git) wrote:
>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>
>> The subsection name for page-poison was typo'd as:
>>
>>    vitio-balloon-device/page-poison
>>
>> Note the missing 'r' in virtio.
>>
>> When we have a machine type that enables page poison, and the guest
>> enables it (which needs a new kernel), things fail rather unpredictably.
> 
> IIUC since v5.1 guests have 'page-poison'=true but once migrated
> they become 'page-poison'=unset=false?

We only migrate the subsection if the guest supports the feature (-> 
newer guest kernel).

If we migrate, it's a broken migration stream. If we don't migrate, 
everything is fine.

-- 
Thanks,

David / dhildenb


