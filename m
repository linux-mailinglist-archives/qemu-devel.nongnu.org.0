Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4C74855E9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:34:11 +0100 (CET)
Received: from localhost ([::1]:54978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n58Ig-0004IO-2K
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:34:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1n58Gz-0002ps-2M
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:32:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1n58Gk-0003uc-H2
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 10:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641396724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8QlZq90kt3W2tOghX3fLouV0GSp/oYdhW9GTJqi2lk=;
 b=aEmj4Jb5smJ0zi3AsGI1iUZwQbjgYbVuA/5zRHcZ8G/1+BKxOCDf4w+EK7JFwibL0PHqOy
 1BXD/Uzmy69kPOaQeCAa+3W/bnYX12JYJUK8LHDd/mB0Af5rf7MFx7RvMEAHsCj1GP9Zv8
 GRC3azaD5PiiYUWaHLCXYMSe+taxz+I=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-C9NKK-q3MZSZZDuwal_Bpg-1; Wed, 05 Jan 2022 10:32:01 -0500
X-MC-Unique: C9NKK-q3MZSZZDuwal_Bpg-1
Received: by mail-qt1-f197.google.com with SMTP id
 h13-20020ac87d4d000000b002af9c496444so30981648qtb.22
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 07:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P8QlZq90kt3W2tOghX3fLouV0GSp/oYdhW9GTJqi2lk=;
 b=fDP72Au0/AW6cPBanyyskCZQzHndUJDis0COfcW6XK3qFXnEq3ngJ/UvTkjEuvBUtm
 dpSchk7r0EsYw2C9xiX7ZouGG49WfQONW+pGuncJxmos7kgDfzDP7MyAVOtma1rnCZ8n
 uHaR1mAplsuJhGFOfBRXkuYST/8vhjsGQ7Z4Ou68ozDwuX+r7Wkipxfdj1Xk01HZzaUq
 uJaVxx4UzFAVZgT0Wm6jDgY2Nyt3v+Sr/sOo/FDtxLDplLYwOXemRXABH8s0SJLInhF+
 jRx84FT7PSsLK4mHoo+iOLKnbbQ/LfUaywRc8ZnkI+s2op73fO3qWjJgjjGHAZCi8RxK
 8BqA==
X-Gm-Message-State: AOAM532eNd/ajoyi+n7AFBH3K+en9WTUIf7xnzqQ0r8mubtcjQ9aKXUN
 vvLenR+IWDKhijXidQOWIqDvYnTKx1UQDrMLhBEup06bq+yoRx1jlT15b+z+gClxidII/qLr2zm
 8r9hQLv1A9oPxYPU=
X-Received: by 2002:a05:6214:d03:: with SMTP id
 3mr37658779qvh.75.1641396720750; 
 Wed, 05 Jan 2022 07:32:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbwjdZR6pogDND2HD9/lNy/+SmFHAEj1uYHqhOdDVdVNg+F+NixUqAZ/ZfAO1GJUYJKbfz6g==
X-Received: by 2002:a05:6214:d03:: with SMTP id
 3mr37658754qvh.75.1641396720516; 
 Wed, 05 Jan 2022 07:32:00 -0800 (PST)
Received: from [192.168.100.42] ([82.142.12.178])
 by smtp.gmail.com with ESMTPSA id f12sm34743232qtj.93.2022.01.05.07.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 07:32:00 -0800 (PST)
Message-ID: <1ae9bb74-11d5-1f7f-7305-cca3c19573bf@redhat.com>
Date: Wed, 5 Jan 2022 16:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/1] softmmu: fix device deletion events with -device JSON
 syntax
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220105123847.4047954-1-berrange@redhat.com>
 <20220105123847.4047954-2-berrange@redhat.com>
 <a2a94c4c-190f-9be6-eadf-bd1404a2e272@redhat.com>
 <YdWxZ0DYZT0zDuWP@redhat.com>
 <ef04e0ee-4349-a9cb-a3e7-2abfcc7aaedc@redhat.com>
 <YdW2qk19K5N7gr9W@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <YdW2qk19K5N7gr9W@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2022 16:18, Daniel P. Berrangé wrote:
> On Wed, Jan 05, 2022 at 04:00:54PM +0100, Laurent Vivier wrote:
>> On 05/01/2022 15:55, Daniel P. Berrangé wrote:
>>> On Wed, Jan 05, 2022 at 03:49:12PM +0100, Laurent Vivier wrote:
>>>> On 05/01/2022 13:38, Daniel P. Berrangé wrote:
>>>>> The -device JSON syntax impl leaks a reference on the created
>>>>> DeviceState instance. As a result when you hot-unplug the
>>>>> device, the device_finalize method won't be called and thus
>>>>> it will fail to emit the required DEVICE_DELETED event.
>>>>>
>>>>> A 'json-cli' feature was previously added against the
>>>>> 'device_add' QMP command QAPI schema to indicated to mgmt
>>>>> apps that -device supported JSON syntax. Given the hotplug
>>>>> bug that feature flag is no unusable for its purpose, so
>>>>
>>>> Not sure to understand: do you mean "now unusable"?
>>>
>>> An application wants to known whether QEMU can support JSON
>>> syntax with -device. If they look for the 'json-cli' feature
>>> as a witness, they'll end up using JSON with QEMU 6.2 which
>>> is giving them broken hotplug. This is unusable for any
>>> non-trivial use cases. So we need a new witness to indicate
>>> whether JSON is viable with -device, that only the newly
>>> fixed QEMU will report.
>>
>> I understand that, my problem was with your sentence:
>>
>> "Given the hotplug bug that feature flag is no unusable for its purpose"
> 
> What's the problem with that ? It is reasonabled to say a -device impl
> which is broken for hotplug is not usable for non-toy use cases.

The problem for me is the double negation: "no" and "unusable"

Thanks,
Laurent


