Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D58347765C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 16:49:40 +0100 (CET)
Received: from localhost ([::1]:33968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxt0l-00038S-6X
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 10:49:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1mxszC-0002R2-6e
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 10:48:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1mxsz8-0002k5-QB
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 10:48:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639669677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJ1ANcC9uyJQtdMMQJFo+2m8sWMbfcZHbl0+4w2Liik=;
 b=KZ4QaY+PyBVv7ZSZ6apkqmzh3XyB7K2xBRRRzLNOOKdBXp7tei8RzrXRbKIxaCL7JE/60r
 CQgSsSOIgzpzkzlHQukT8kkeZFiIxXAQpdJW5BK3bOCxOHcyriS/syHvueK/R5zi/nj16j
 JyjO1hR+TwH8AZrTxdnksN2rr7aN4R8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-6c57eWd4NzmYMj-L_57-ow-1; Thu, 16 Dec 2021 10:47:56 -0500
X-MC-Unique: 6c57eWd4NzmYMj-L_57-ow-1
Received: by mail-qt1-f197.google.com with SMTP id
 h8-20020a05622a170800b002acc8656e05so33948504qtk.7
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 07:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GJ1ANcC9uyJQtdMMQJFo+2m8sWMbfcZHbl0+4w2Liik=;
 b=7UGWvAue1auX4OveL73+0JTAaa8y6423CiNBetmWv5W0mABwSUmVeG71wrTbxnzHgD
 GNVD8vCq6LxujsNN5CWStQM8qgMJHvqELgAe79TH2im4JueQrkzKB+XSpeADWk3yH0/d
 fMs8INR07s+CzG7N/LKjkLVPUOwnZXgosy5lLYdJFjPT9T47YoIDWbEkgaaiZTDJTZGY
 yS9sTWsdKctvM1VYNzDaZTwJL6/oE4tp7HkVnmedpzFmDrCxNupCPyEi91MPGaI0sZe4
 lXlryNIbMVFo8yVdcj5Kply6pEXv1dCkVkOLa8Z5wBYJvDAA2c5f07iBxbWRBAZMGO6e
 Hh1A==
X-Gm-Message-State: AOAM532FuJs5Cs69j1Xpl89ZwQFHMiO8bKKhIj8CdP/Zv4qL5WK/X+58
 WyorHM2Pe0E5/Ls/vlITouWJvw/BeDhSJHfI/Uxq4FrJWZWGNcKqVZGoyORf46rERwaNP+BnK1r
 /adU+olyn1r+PsoE=
X-Received: by 2002:a05:620a:2a14:: with SMTP id
 o20mr12236447qkp.508.1639669675807; 
 Thu, 16 Dec 2021 07:47:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyv2zssszXvwWx12L1cT3/8w/ucz9nLgsYh1O/fUxl6g/VEFxMmTvt0+rawcf3VYDN9N6VhDQ==
X-Received: by 2002:a05:620a:2a14:: with SMTP id
 o20mr12236434qkp.508.1639669675586; 
 Thu, 16 Dec 2021 07:47:55 -0800 (PST)
Received: from [10.0.0.96] ([24.225.241.171])
 by smtp.gmail.com with ESMTPSA id r26sm4197910qtm.67.2021.12.16.07.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 07:47:54 -0800 (PST)
Message-ID: <d8f0ab15-de92-4286-485f-dff907ac0762@redhat.com>
Date: Thu, 16 Dec 2021 10:51:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] e1000: fix tx re-entrancy problem
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@redhat.com>
References: <20211021161047.578751-1-jmaloy@redhat.com>
 <61ba1305-321a-1de2-a399-e7b608e4dad4@redhat.com>
From: Jon Maloy <jmaloy@redhat.com>
In-Reply-To: <61ba1305-321a-1de2-a399-e7b608e4dad4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jmaloy@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jmaloy@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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



On 12/16/21 04:36, Philippe Mathieu-Daudé wrote:
> Hi Jon,
>
> On 10/21/21 18:10, Jon Maloy wrote:
>> The fact that the MMIO handler is not re-entrant causes an infinite
>> loop under certain conditions:
>>
>> Guest write to TDT ->  Loopback -> RX (DMA to TDT) -> TX
>>
>> We now eliminate the effect of this problem locally in e1000, by adding
>> a boolean in struct E1000State indicating when the TX side is busy. This
>> will cause any entering new call to return early instead of interfering
>> with the ongoing work, and eliminates any risk of looping.
>>
>> This is intended to address CVE-2021-20257.
>>
>> Signed-off-by: Jon Maloy <jmaloy@redhat.com>
>> ---
>>   hw/net/e1000.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
> I can not find the reproducer in the repository, have you sent one?
>
No, I did not add it to the repo.
It was referenced from the tracker BZ, but I was unable to get access 
back then.
It ended up with that I had it sent by mail to me directly.

What is your question? Is it that it should be in the repo, or that you 
cannot find it?

///jon


