Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B547C37384E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:04:13 +0200 (CEST)
Received: from localhost ([::1]:40800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEO4-0004Gv-Q0
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1leEIv-0000ZH-4j
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1leEIs-0001M2-O8
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:58:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620208730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIOzy/2UmIvQ8qhHqLlwrru+PEkB5tz7J0finRKWyWQ=;
 b=XuEW7lNzbkK2WlOL+GD1EEKj7YBk9wh3blzKBOuDFSkgjS4BBbyASBiX2bXbPhcCnwnMdw
 louCSFXc+Ul6pqIIqsul6+3cQg6eGbedVsvGuMwqqjJaavQYWgrIj1JWNqDxI1A+h6g7tJ
 DL1XJiW6xqAuKHW9W8N4Uks3KYhmUJU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-WAe6FV58OCKyOyON7LPZ7w-1; Wed, 05 May 2021 05:58:48 -0400
X-MC-Unique: WAe6FV58OCKyOyON7LPZ7w-1
Received: by mail-wr1-f69.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso484385wrf.11
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QIOzy/2UmIvQ8qhHqLlwrru+PEkB5tz7J0finRKWyWQ=;
 b=L1f+ELI5LwyKQAWTxf7Tsm6066urrlGtzNMcHm7DnbJSEyAQCPVff9elJlNds8zB6T
 kckIlqBbcfYBPqlgY5f4WIsa0maqru2igqYO1+7lms0bSXYaZbpcCG/8WOETUppSM2GB
 8Up2UWxTxLyJW6nsnbLbj4hwN7NS0IEuyGOcemImV7NIqtV7mt/1lzNXTpaN0xZ/4XxP
 Hz3MhJpsKQzloMEAdh50dXxD8Bv/pWUdAKVGdI64hcT+9GdnUq5Xo/rPVKFWbeLa510B
 z8h/T2P4ff1UgpdhID0RzAvArMUstUBj3Dfpkyn5pC/S1Wx1DLuuLPkG4DvwYfT4Fg+a
 j1KQ==
X-Gm-Message-State: AOAM533CQS0saEPvyFxggBKailw80cXhCEscFdxqCMaDOhDelZ4wSJ/Y
 WQoeJ1qUcVnbyz+60MFAQ8BstaJ+HSiiLIOhagv4tZBc59OPRMSJILuUdUG0Hjb9dUyHqqkdPId
 ZhsrzMBc0/kBsP/k=
X-Received: by 2002:a7b:c090:: with SMTP id r16mr9257085wmh.112.1620208727495; 
 Wed, 05 May 2021 02:58:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ4LH18vbEKAMeutA8HbeAT1HQMkGyQppx66twZc8g3dyQoXfl5KPecFkdMfoDC3zuEhc7iQ==
X-Received: by 2002:a7b:c090:: with SMTP id r16mr9257073wmh.112.1620208727336; 
 Wed, 05 May 2021 02:58:47 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e3e.dip0.t-ipconnect.de. [217.87.94.62])
 by smtp.gmail.com with ESMTPSA id f7sm19520890wrg.34.2021.05.05.02.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 02:58:46 -0700 (PDT)
Subject: Re: Switching to the GitLab bug tracker
To: Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <a6d77040-1dba-90c7-5ebe-5778177e686e@redhat.com>
 <YJEJNBJOqry5sHiy@stefanha-x1.localdomain>
 <2953611e-8780-f2a8-6394-0a5099042eb1@redhat.com>
 <20210505095530.lvpuyunqzv422app@steredhat>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f7d8205b-ad22-877f-78ad-486beb56d4fc@redhat.com>
Date: Wed, 5 May 2021 11:58:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505095530.lvpuyunqzv422app@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/05/2021 11.55, Stefano Garzarella wrote:
> On Tue, May 04, 2021 at 12:20:03PM +0200, Philippe Mathieu-Daudé wrote:
>> On 5/4/21 10:43 AM, Stefan Hajnoczi wrote:
>>> On Mon, May 03, 2021 at 01:16:51PM +0200, Thomas Huth wrote:
>>>> As you might have already noticed by some other mails on the qemu-devel
>>>> mailing list, we are in progress of switching our bug tracking tool from
>>>> Launchpad to Gitlab. The new tracker can now be found here:
>>>>
>>>>  https://gitlab.com/qemu-project/qemu/-/issues
>>>
>>> Thank you for doing this, Thomas!
>>>
>>>> 1) We likely won't have the possibility anymore to automatically send 
>>>> e-mail
>>>> notifications for new bugs to the qemu-devel mailing list. If you want to
>>>> get informed about new bugs, please use the notification mechanism from
>>>> Gitlab instead. That means, log into your gitlab account, browse to
>>>>
>>>>  https://gitlab.com/qemu-project/qemu
>>>>
>>>> and click on the bell icon at the top of the page to manage your
>>>> notifications, e.g. enable notifications for "New issues" there.
>>>
>>> All maintainers and most regular contributors should follow the issue
>>> tracker so that QEMU developers are aware of new issues. Please do this!
>>>
>>> An alternative mechanism is the RSS/Atom feed available by clicking the
>>> "Subscribe to RSS feed" button left of the "New issue" button here:
>>>
>>>   https://gitlab.com/qemu-project/qemu/-/issues
>>
>> You can also subscribe to labels of interest [*] going to
>> https://gitlab.com/qemu-project/qemu/-/labels
>>
>> For example in my case I subscribed to receive notifications
>> only from these labels:
>>
>> - kind:Bug
>> - Storage
>> - pflash
>> - Fuzzer
>> - workflow:Merged
> 
> Cool feature, I also subscribed to some labels.
> 
> I was trying to assign a label, for example "Storage" to this issue:
> https://gitlab.com/qemu-project/qemu/-/issues/96
> 
> but I can't, should I have some special permission/role?

Yes, you need to be at least a "Reporter" in the members list of a project 
to be able to add labels. You can ask one of the owners (see 
https://gitlab.com/qemu-project/qemu/-/project_members) to add you as a 
reporter.

  Thomas


