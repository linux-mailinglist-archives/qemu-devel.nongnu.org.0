Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9DE40A926
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 10:28:01 +0200 (CEST)
Received: from localhost ([::1]:42258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ3nL-0006gj-JP
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 04:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ3mI-0005vg-6O
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ3mE-0002YR-UR
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631608009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7bf/wVHuBfI30b2A40FQVhlpU/rYqO2Vjevqnp4rV8A=;
 b=GjD2WXBteLw9m3ozhGqZF4a7dVT0xKHG0Ij5NNWeLu30ljs4D+tV/ZbiX2tU+ydtqDlAUJ
 awHOePYI1ZwTCP/6PFpU6eim9xGvx/S6uBV87WW3tLS6aZlSzHOJ2b/C+Ci0Kx7MOHiFjG
 rZRwTtyirMv26hQFdrfjeFXTyJ9F5c0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-O1D5ixNBM9m4Mks5nLI4qg-1; Tue, 14 Sep 2021 04:26:48 -0400
X-MC-Unique: O1D5ixNBM9m4Mks5nLI4qg-1
Received: by mail-wr1-f71.google.com with SMTP id
 g1-20020a5d64e1000000b0015e0b21ef04so1751845wri.17
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 01:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7bf/wVHuBfI30b2A40FQVhlpU/rYqO2Vjevqnp4rV8A=;
 b=6Lm6GDj8cEuv05deBGXJ0usN+BM+CJL9y9nLeGkZ9rOIfFNRzSVQuDz5d9FQrii5MG
 FKXgD7OdIERVg9OzUXQfNfETfN4BBl3vbVJm4JNeus+jge0awY6PqRVuhyVVve/pupxd
 hOvLiKrfEX9jixbleSrcyT6Lhittry+ZX40hAbkqTyyR33Jz5TKn5Fa50o0qbKMYq5fR
 VNbRr2rALIFE1H7T7xB3QtryoP5cxcrfqRuwAR5u+gz+TemkVMoouE8vjTnk9EQjaLJa
 Max9hl8NwQ+MFriHTn6xXZpZmj8f+vBQjZQlec+JcOt6F02ya1lkRlGHniVX/MhZQfmH
 7vDA==
X-Gm-Message-State: AOAM531IAb6MW0ilMoS9LWbtwqs9meHpOVJE7oFzqGLdt16zMLDuxwVI
 9X7/FLfu03kHZuya3NCzxv/VH+PJ5wt0HRxMTNMLPzQ31Wrclb78U/VSAH0Adb/k0D5QthxMaVP
 TVytgtgNo+kRq8Fc=
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr767170wmq.43.1631608007411; 
 Tue, 14 Sep 2021 01:26:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu94KC+riaLm9/8OLU+Zd3S1m3VrLHimYbs46Ys4Qpab6zv12TllXtYcTtSCF2Xg9dHSlbTw==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr767144wmq.43.1631608007190; 
 Tue, 14 Sep 2021 01:26:47 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id w14sm1011688wro.8.2021.09.14.01.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 01:26:46 -0700 (PDT)
Subject: Re: [qemu-web RFC PATCH] Add Sponsors page
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210913182512.1021618-1-philmd@redhat.com>
 <d57973da-49ac-f231-1652-cf78769e884a@redhat.com>
 <YUBbXjND2sZlXY7Z@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b71c0bc6-ee96-d8ae-b470-ae886d4863d8@redhat.com>
Date: Tue, 14 Sep 2021 10:26:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUBbXjND2sZlXY7Z@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 10:20 AM, Daniel P. Berrangé wrote:
> On Tue, Sep 14, 2021 at 07:41:47AM +0200, Thomas Huth wrote:
>> On 13/09/2021 20.25, Philippe Mathieu-Daudé wrote:
>>> Add a page listing QEMU sponsors and displaying their logos.
>>>
>>> Logo sources:
>>> - https://www.rackspace.com/es/newsroom/media-kit
>>> - https://developer.arm.com/solutions/infrastructure/works-on-arm
>>> - https://gitlab.com/fosshost/assets/logo
>>> - https://www.linkedin.com/company/cip-united
>>>
>>> Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> There are probably more, but I'm not aware of them.
>>>
>>> Maybe we should list past sponsors, precising a year range?
>>
>> I think we might have a hard time to compile a complete list, so I'd rather
>> not start that job.
>>
>>> ---
>>>   _includes/nav.html      |   1 +
>>>   sponsors.md             |  22 ++++++++++++++++++++++
>>>   sponsors/cipunited.jpg  | Bin 0 -> 10607 bytes
>>>   sponsors/fosshost.png   | Bin 0 -> 18251 bytes
>>>   sponsors/rackspace.png  | Bin 0 -> 7363 bytes
>>>   sponsors/worksonarm.png | Bin 0 -> 9965 bytes
>>>   6 files changed, 23 insertions(+)
>>>   create mode 100644 sponsors.md
>>>   create mode 100644 sponsors/cipunited.jpg
>>>   create mode 100644 sponsors/fosshost.png
>>>   create mode 100644 sponsors/rackspace.png
>>>   create mode 100644 sponsors/worksonarm.png
>>>
>>> diff --git a/_includes/nav.html b/_includes/nav.html
>>> index 73b39b3..49ad4cd 100644
>>> --- a/_includes/nav.html
>>> +++ b/_includes/nav.html
>>> @@ -8,6 +8,7 @@
>>>   			</li><li {% if current[1] == 'contribute' %}class='current'{% endif %}><a href="{{ relative_root }}/contribute">Contribute</a>
>>>   			</li><li {% if current[1] == 'documentation' %}class='current'{% endif %}><a href="{{ relative_root }}/documentation">Docs</a>
>>>   			</li><li><a href="https://wiki.qemu.org">Wiki</a>
>>> +			</li><li {% if current[1] == 'sponsors' %}class='current'{% endif %}><a href="{{ relative_root }}/sponsors">Sponsors</a>
>>
>> Not sure whether we need that link on every page (i.e. in the navigation
>> menu)? Maybe it's enough to put the link somewhere on the home page?
> 
> Yes, we definitely don't want this in the top navbar as it is irrelevant
> information to essentially every single visitor. We're only adding this
> because one of the sponsors asked for it.
> 
> I'd say it can be linked in the footer, adjacent to the link to
> the SFC.
> 
> Or maybe we just replace the SFC link with a link "About QEMU" and
> on that page document that we're a member of the SFC and also
> document official sponsors, and any other companies whose services
> we rely on unofficially (eg the gitlab point below).
> 
>>>   			</li><li {% if current[1] == 'blog' %}class='current'{% endif %}><a href="{{ relative_root }}/blog">Blog</a></li>
>>>   		</ul>
>>>   	</nav>
>>> diff --git a/sponsors.md b/sponsors.md
>>> new file mode 100644
>>> index 0000000..da1bf19
>>> --- /dev/null
>>> +++ b/sponsors.md
>>> @@ -0,0 +1,22 @@
>>> +---
>>> +title: QEMU sponsors
>>> +permalink: /sponsors/
>>> +---
>>> +
>>> +QEMU has sponsors!
>>> +
>>> +The website is hosted by [Rackspace Technology](https://www.rackspace.com/).
>>> +
>>> +For continuous integration and testing, hardware is provided by:
>>> +- Arm and Equinix Metal via the [Works on Arm program](https://www.worksonarm.com/)
>>> +- [Fosshost](https://fosshost.org/)
>>> +- [CIP United](https://www.cipunited.com/)
>>> +
>>> +
>>> +![Rackspace Technology](rackspace.png)
>>> +
>>> +![Works on Arm](worksonarm.png)
>>> +
>>> +![Fosshost](fosshost.png)
>>> +
>>> +![CIP United](cipunited.jpg)
>>
>> Some remarks:
>>
>> 1) Could you please use the original URLs as source for the pictures instead
>> of copying them over into our website? Some folks don't like it when their
>> images are copied...
> 
> More importantly than that, do the trademark terms for each company
> here permit us to actually use their logo on our website ?

Hmm I'll simply list the company names to start.
I assume Fosshost is OK because they asked us to put it.


