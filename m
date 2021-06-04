Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52D439B740
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 12:41:08 +0200 (CEST)
Received: from localhost ([::1]:34144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp7GF-0000FS-Q3
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 06:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lp7D4-00025l-5D
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lp7D1-0006Qm-GS
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622803066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dypuefBbt/YyEp23ALgHeKz1FyRjSBNQZLsACBKpfoI=;
 b=JuEHHL4XjCM7+p0J1uXQuRH3cAynN1yvkkwBHeZaq+3HcdOOgW+RqDexmM0v1v6PC+0eR+
 PL2yY4HXT4ChrYNiwpKSUeLrpTwp44WZle6zbcqTfjX+0vjkKzf9gvgOXiQRBP1IINlk2U
 QmaIb6TiP+qJ183hwYBd8r4kiRxnrN4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-rQ8BaLSON8C1gyIP51t5NQ-1; Fri, 04 Jun 2021 06:37:45 -0400
X-MC-Unique: rQ8BaLSON8C1gyIP51t5NQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 f1-20020a1709064941b02903f6b5ef17bfso3217628ejt.20
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 03:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dypuefBbt/YyEp23ALgHeKz1FyRjSBNQZLsACBKpfoI=;
 b=Esz4VOpHCaM84R4Pn4yDiK+ZLSmTx2ottwbmuwCPAqLCrV9ZkTkXjMBPEvCrciYMXh
 SKKe587gLZwtGmEn8eDphzuOEIvc8HX18W8a8hjqCJNGyppvZfHhQdmsxKWo+VFNwPej
 ncFDo+7Fet/R3fEuEkB8N63+WLyFi8ZL2qu4SI+x4vSMmovOXtQdxY24k6CAZGwx9f5j
 uZeVfefbYJRHFdtYVZ2jm+PDbupPiC2vXfT85ztqclSSgkvv6OxpUnxC8Q+Vqm2oHfZ2
 dh23mGqqZUIVtKYkU4tKwkets1NLsbBLQreF+Xk6uQaeWLx1z447MskU4TdH33VLI+Bp
 nwIQ==
X-Gm-Message-State: AOAM532tXyuYmLL7BGS4k1xxOW/TcVzVrRAZYlxEwyvLxnKBsNAb68ok
 7LZUb5q4Ep2nnU7iRj73aS1TN05eNkjSLhrw3R+2ga9z+yqCTZlvOmELavjKTny20r5TdrZizDA
 xGlrc/9aX2Ayc0iE=
X-Received: by 2002:a17:906:3f86:: with SMTP id
 b6mr3524358ejj.530.1622803063396; 
 Fri, 04 Jun 2021 03:37:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxndC5jGzaTEv1tAYLs11B6H7QmvuOezWYQl5h8AFu/uaeo5jUpxtmYf9r9F5BO7Eig9OAyA==
X-Received: by 2002:a17:906:3f86:: with SMTP id
 b6mr3524344ejj.530.1622803063203; 
 Fri, 04 Jun 2021 03:37:43 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id bh2sm2583747ejb.80.2021.06.04.03.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 03:37:42 -0700 (PDT)
Subject: Re: Switching to the GitLab bug tracker
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <a6d77040-1dba-90c7-5ebe-5778177e686e@redhat.com>
 <YJEJNBJOqry5sHiy@stefanha-x1.localdomain>
 <2953611e-8780-f2a8-6394-0a5099042eb1@redhat.com>
 <20210505095530.lvpuyunqzv422app@steredhat> <YJJsSsj4Cg9DFrZU@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3590cc95-e7fc-0ccb-7a78-badcee1d8d9a@redhat.com>
Date: Fri, 4 Jun 2021 12:37:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJJsSsj4Cg9DFrZU@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On 5/5/21 11:58 AM, Daniel P. Berrangé wrote:
> On Wed, May 05, 2021 at 11:55:30AM +0200, Stefano Garzarella wrote:
>> On Tue, May 04, 2021 at 12:20:03PM +0200, Philippe Mathieu-Daudé wrote:
>>> On 5/4/21 10:43 AM, Stefan Hajnoczi wrote:
>>>> On Mon, May 03, 2021 at 01:16:51PM +0200, Thomas Huth wrote:
>>>>> As you might have already noticed by some other mails on the qemu-devel
>>>>> mailing list, we are in progress of switching our bug tracking tool from
>>>>> Launchpad to Gitlab. The new tracker can now be found here:
>>>>>
>>>>>  https://gitlab.com/qemu-project/qemu/-/issues
>>>>
>>>> Thank you for doing this, Thomas!
>>>>
>>>>> 1) We likely won't have the possibility anymore to automatically send e-mail
>>>>> notifications for new bugs to the qemu-devel mailing list. If you want to
>>>>> get informed about new bugs, please use the notification mechanism from
>>>>> Gitlab instead. That means, log into your gitlab account, browse to
>>>>>
>>>>>  https://gitlab.com/qemu-project/qemu
>>>>>
>>>>> and click on the bell icon at the top of the page to manage your
>>>>> notifications, e.g. enable notifications for "New issues" there.
>>>>
>>>> All maintainers and most regular contributors should follow the issue
>>>> tracker so that QEMU developers are aware of new issues. Please do this!
>>>>
>>>> An alternative mechanism is the RSS/Atom feed available by clicking the
>>>> "Subscribe to RSS feed" button left of the "New issue" button here:
>>>>
>>>>   https://gitlab.com/qemu-project/qemu/-/issues
>>>
>>> You can also subscribe to labels of interest [*] going to
>>> https://gitlab.com/qemu-project/qemu/-/labels
>>>
>>> For example in my case I subscribed to receive notifications
>>> only from these labels:
>>>
>>> - kind:Bug
>>> - Storage
>>> - pflash
>>> - Fuzzer
>>> - workflow:Merged

There are 3 issues related to virtio / vhost not
triaged during the last 3 weeks:

virtio:
https://gitlab.com/qemu-project/qemu/-/issues/248
https://gitlab.com/qemu-project/qemu/-/issues/270

vhost:
https://gitlab.com/qemu-project/qemu/-/issues/277

Would it help your workflow if we add VirtIO and vhost
labels on GitLab?

Regards,

Phil.

>>
>> Cool feature, I also subscribed to some labels.
>>
>> I was trying to assign a label, for example "Storage" to this issue:
>> https://gitlab.com/qemu-project/qemu/-/issues/96
>>
>> but I can't, should I have some special permission/role?
> 
> Yes, anyone who is a QEMU maintainer needs to be added to gitlab
> project with "Reporter" role to be able to do bug janitoring.
> 
> 
> Regards,
> Daniel
> 


