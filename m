Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F339B52D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 10:50:00 +0200 (CEST)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp5Wh-0007Vd-Al
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 04:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lp5VM-0006fT-1R
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 04:48:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lp5VJ-0007u3-Hx
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 04:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622796512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ODbRMyY9RCfQ1pNEZywo6krP50faX4utpZlNJnN9ac=;
 b=PDjmZqjHeLGYxjdj/JS4h3Vw5zEDAb6w36wu3L9s0Ce53xKsnzOs3HldtOUmBmVoynjveM
 /Zt5zYc+QeSrGnCRyipBO24ZvJ+cszV8ElqR//bZPyfGRDZFhQSn7mbEiv4sMs051XpfjZ
 sWfws0ihGwj8D4Xhm/8XLinlhZ8E7NU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588--X9oUytSMeGvgl9NlhqVcA-1; Fri, 04 Jun 2021 04:48:30 -0400
X-MC-Unique: -X9oUytSMeGvgl9NlhqVcA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g81-20020a1c9d540000b02901a3d4d3f7fcso1371982wme.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 01:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4ODbRMyY9RCfQ1pNEZywo6krP50faX4utpZlNJnN9ac=;
 b=Co0pWvo2f4WDw7AL7IqHh/RBHgn4r/IClsSQmgt84ptBLj+ZNppD1ue31p9AguQiyR
 iZfAEFLPlnC8ne51MwqbTFzpeF5iaggVQLDIV9Bu2GX/OaO2G9WQ5wluwwLWOSLOHHxi
 pnLonQIL3HmQ7ylz6EdCchocSdE8cvFSXsAthzejwOoS5nNnKwc1drvc+/8MWVMftnzl
 j32ToJ9Lv9F0GprOe988AiHIzxVVANXXvme6k5frHz7Z1xJi7txOxPSfzX2/7R7/0gyZ
 BJvlHKQa2n7ukPMYpsSUlJ8+IQzD+uJbU6wsQfIfe1bki1j3iSdjUFb73tho4nTsRdIL
 HXyw==
X-Gm-Message-State: AOAM532zVl9T4/nP2BjSDpDaSfzyY9l+suS7lCI5flo1BLgjIiZNMuJw
 Fw6p0atK3GR7E0L1uzqm0jwgf2wJPlthJM+GS63p75SJL1FPx2R7xbiLnKjCaZeTXw3zwUZT0GY
 8WJxe43mKkwAXFclW+4SLo8ulX9uA/COBMqNMjKXgqxBYp2vobwit3I6rhj+9Cnqbgjo=
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr2669586wrk.216.1622796509203; 
 Fri, 04 Jun 2021 01:48:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfm2cM9VjhUbzLj92lbT/EQI+g+egkk3nwSvzxuOyqFAohuuu8LToaqRIYrU20iDoNrnb2kA==
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr2669563wrk.216.1622796509000; 
 Fri, 04 Jun 2021 01:48:29 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 a77sm6386485wmd.14.2021.06.04.01.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 01:48:28 -0700 (PDT)
Subject: Re: [PATCH v4 01/15] python: qemu: add timer parameter for qmp.accept
 socket
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-2-eesposit@redhat.com>
 <dd207fcf-f31c-d580-4877-72f017846ae7@redhat.com>
 <5b53f903-1a11-7dec-fe4c-6dc16c066056@redhat.com>
 <e8bd693e-99af-a8db-b237-097f62b6415f@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <559a3f5b-94f0-63ff-275f-cf9307fdb5f5@redhat.com>
Date: Fri, 4 Jun 2021 10:48:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e8bd693e-99af-a8db-b237-097f62b6415f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 03/06/2021 21:02, John Snow wrote:
> On 6/3/21 4:06 AM, Emanuele Giuseppe Esposito wrote:
>>
>>
>> On 03/06/2021 01:23, John Snow wrote:
>>> On 5/20/21 3:52 AM, Emanuele Giuseppe Esposito wrote:
>>>> Alsp add a new _qmp_timer field to the QEMUMachine class.
>>>>
>>>> Let's change the default socket timeout to None, so that if
>>>> a subclass needs to add a timer, it can be done by modifying
>>>> this private field.
>>>>
>>>> At the same time, restore the timer to be 15 seconds in iotests.py, to
>>>> give an upper bound to qemu-iotests execution.
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>
>>> Hi Emanuele: I'm sorry, but with the recent Python PR this no longer 
>>> applies to origin/master -- the python files got shuffled around a 
>>> bit when I added the new CI tests.
>>>
>>> May I please ask you to rebase? You don't have to re-spin just yet, 
>>> just pointing me to the rebase would help me out.
>>
>> Hi John, no problem. I rebased here:
>> https://gitlab.com/eesposit/qemu/-/commits/qemu_iotests_io
>>
>> Let me know if I need to do anything else.
>> I will re-spin later today.
>>
>> Thank you,
>> Emanuele
>>
> 
> Hi Emanuele:
> 
> https://gitlab.com/jsnow/qemu/-/commits/review
> 
> I added in a pylint ignore for you and these patches are clean now.

Thank you! I will add it to my series.

Emanuele


