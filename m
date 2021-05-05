Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B05373B27
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 14:26:53 +0200 (CEST)
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGc8-00032I-3z
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 08:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leGa5-0002Pa-My
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:24:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leGa0-0001u7-IO
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620217479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAGotTP2yaSDIKGjFD5Y3TXPla74hEFq+GRSvZf+QlQ=;
 b=LBYyH/kREqvDZ8E9mcQbQr4iwXvJdPHoSpjK0UXxLVbUPcEpQ9shAPkZi2/cRSINfzzdVD
 UmXzi9lMfe9n3LXPkwHd/LgCk+RY4p3nUf8XB2zW6xpXXIM7u8cToRSwYKCABOpVgVRGM7
 UO/T21ndmzUyD3zIuy8PHWMIWdFqQD8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-25AjrMHePqitcePN-g-hDA-1; Wed, 05 May 2021 08:24:37 -0400
X-MC-Unique: 25AjrMHePqitcePN-g-hDA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j128-20020a1c55860000b02901384b712094so1547775wmb.2
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CAGotTP2yaSDIKGjFD5Y3TXPla74hEFq+GRSvZf+QlQ=;
 b=azFP2+Q4Bfg0R/dnKIMGEMAB8MQiQktC+Il7yapS338G1jJU5B5eDVNTdXBzGk18dI
 2Gv6adwqnYoP0eejeKibv2YJCHtqIWJCzwopm+9i1WH8g7hjFgf/wbviY8qdO8CJLbwo
 YLacKT3Sxpxb1vKdKtjz+KsllJznTXuGYuqkZRaMzbV2YxfhV1UkQWlM9fWALVVSrLv9
 QRKCB2njYzcm9br7QRbRQ3FqfbIwKGlFHOsmn3E2QvXS3MUQDER/aGDGXO/qZlJlxuzE
 UIttyw+rVZqCZHbnmI8FbJx+ReqWciRVrM0X8KBbM4GzPDBa7/NO6Ay1QIg2Ots4wfqN
 GF+Q==
X-Gm-Message-State: AOAM533g1cWX7mnaRXaJypPU3ZGEX6ENpe+cTcmrFKxrCNuIpeM08juK
 grM00aU/y336P1tBf5hG0CpUj27nvFW8jZ8BgBX4u+3/xgguTpjHTQ4tPvGLd0d0gnc5X6Q16Oy
 85NL/+EnhQVvWhQA=
X-Received: by 2002:a5d:49c2:: with SMTP id t2mr37588203wrs.64.1620217476577; 
 Wed, 05 May 2021 05:24:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXWdFoJ7S4DD9bmAzeXxobHa7QWQistD/ZPejCXmRZEv+JyNXTG7HNseC7XCBp1beWWTks3A==
X-Received: by 2002:a5d:49c2:: with SMTP id t2mr37588177wrs.64.1620217476379; 
 Wed, 05 May 2021 05:24:36 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id p10sm18910239wrr.58.2021.05.05.05.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 05:24:35 -0700 (PDT)
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de> <875z21aghn.fsf@linaro.org>
 <50c3c1e6-cc62-ee50-874b-72615d7bfac7@suse.de> <87o8dpo4ww.fsf@linaro.org>
 <03b6b51e-71d7-a2c9-4d3d-db1ac77a1484@redhat.com>
Message-ID: <7fd6ae36-6e12-676e-0484-43c1f9d04c6a@redhat.com>
Date: Wed, 5 May 2021 14:24:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <03b6b51e-71d7-a2c9-4d3d-db1ac77a1484@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 2:15 PM, Philippe Mathieu-Daudé wrote:
> On 5/5/21 12:04 PM, Alex Bennée wrote:
>> Claudio Fontana <cfontana@suse.de> writes:
>>> On 3/8/21 3:02 PM, Alex Bennée wrote:
>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>
>>>>> Hi,
>>>>>
>>>>> anything else for me to do here?
>>>>
>>>> It looks to me that this series is looking pretty good. Every patch has
>>>> at least one review so I think it's just waiting on the maintainers to
>>>> pick it up.
>>>>
>>>> Paolo/Richard - are you intending to take the series as is or are you
>>>> waiting for something else? I'd like to see the patch delta reduced for
>>>> the ARM cleanup work which is still ongoing.
>>>
>>> I am a bit at a loss here, as this has been reviewed for a while, but nothing is happening.
>>> Rebasing is starting to become more and more draining;

> I didn't noticed the following patch had its content changed:
> Revert "target/arm: Restrict v8M IDAU to TCG"
> So now this is not a full revert, only the TYPE_IDAU_INTERFACE
> type is moved back.

Correcting myself. This is a plain revert, and I disagree with it
because if TCG is not available, TCG-specific devices/machines
shouldn't be loaded into QEMU. Cortex-M and v8M IDAU *are* TCG
specific and no such object should be built/registered, so the
interface shouldn't be there neither.

Below is a possible way to get there. Reverting the commit and
build Cortex-M devices in a non-TCG build is a kludge / shortcut
which allows Claudio to remove a big chunk of non-TCG code, so
is probably acceptable, and we can keep cleaning later.

> More generally I think more code should be automatically stripped
> out by Kconfig instead. In [1,2] I suggested to tie accel-specific
> Kconfig selectors:
> 
>   config ARM_V7R
>     bool
>     depends on TCG && ARM
> 
>   config ARM_V7M
>     bool
>     depends on TCG && ARM
>     select PTIMER
> 
>   config XLNX_ZYNQMP_ARM
>     bool
>     default y if TCG && AARCH64
> 
> But this can certainly be done on top of Claudio's work.
> 
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg777710.html
> [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg777719.html
> 


