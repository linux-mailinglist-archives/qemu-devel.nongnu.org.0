Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A86733386C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:13:26 +0100 (CET)
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJuuD-000254-44
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:13:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJusw-0001Yy-JE
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:12:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJusu-0004vu-Uq
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615367523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAIYZmGYEA7VU/6nIfeB/4iXMgX6ydfL2uswa5VNA0o=;
 b=jBS8per+Kd2wKW1JLoiq7WipwpW231bxQ9RoWUgabztJ236yLv14Z1aHkth6W504tnguqC
 0MPCowRtqnLABjRNfZ1Ys7Dvw0nR3sjhycNe/8OMh/XD6mwH2lwKXX6/s/sAZ149RpRjDL
 eHCoS0oFkq3ZEfMORPmPS7aWAHXiM4I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-EBBIlj71PP2iRC_hePMUOg-1; Wed, 10 Mar 2021 04:12:02 -0500
X-MC-Unique: EBBIlj71PP2iRC_hePMUOg-1
Received: by mail-wr1-f69.google.com with SMTP id g2so7691972wrx.20
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 01:12:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KAIYZmGYEA7VU/6nIfeB/4iXMgX6ydfL2uswa5VNA0o=;
 b=io6K+PaIWUwTwFl8wqnRuA0iNMgFcfZfGt9excWo9qXIptLDIDu7ptTF4sJ53An+CR
 mlCRmnzN/RUWRD1sdHxeo7+4hCKfrdF11Y4Pu94AQ7kTmxQcNuXG6UwS06PEoGLtSA9i
 DrPGvzSBgadGsCevD/Fqa+oLhoPxhEd+BJoOWMi1WHCKTXU3lTqPaWxe/5NLGGHrg+7N
 04nzFDaF4S+dH2cyshwBO7Xyzq0p3iTfbE318W1RFWrkt/Pytmqx/UZ2ozhEqoNGgKOo
 bzvTG+ZCd2FEpX2UQPe5KIFDQG3vyYnOM5lQMTLxBEHoUl/fJx0/Bmx1AdCSsRF77Omr
 kDYw==
X-Gm-Message-State: AOAM5328rD4ItKHaTc740RVyAQBbZqxW2LPVcBe+BYt6HOK9MJxYSTm5
 0H1OCG5asRX+VKxM8+B/FFGEt6dc4e6e9o+zGT/3jD3w6KI3ZS6uFydTD7TNCVSfztkKGP0TB/t
 xgB3xo+jHV0JtLnU=
X-Received: by 2002:adf:ee8f:: with SMTP id b15mr2394925wro.314.1615367520785; 
 Wed, 10 Mar 2021 01:12:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymQS9s8YrRLkA2BfQD3jZTNBAjjQbL0eZ3Cc9V8fY85ZYCsrq3p6s4/bL4UsYeIY9ZzILhpA==
X-Received: by 2002:adf:ee8f:: with SMTP id b15mr2394907wro.314.1615367520585; 
 Wed, 10 Mar 2021 01:12:00 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z7sm28733447wrt.70.2021.03.10.01.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 01:11:59 -0800 (PST)
Subject: Re: [PATCH] tests: Move unit tests into a separate directory
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210310063314.1049838-1-thuth@redhat.com>
 <d684cc63-d60d-b346-3a78-edc94a0dade9@redhat.com>
 <e1c41053-9809-7c6e-6ebd-a0b6f6db9486@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <942499e4-0a67-ff9a-08e8-ac7d3cbc3c21@redhat.com>
Date: Wed, 10 Mar 2021 10:11:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e1c41053-9809-7c6e-6ebd-a0b6f6db9486@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/21 10:08, Thomas Huth wrote:
>>
>> Looks good, I would have moved benchmarks as well but anyway it can be 
>> done separately.
> 
> My plan is to move them into a separate directory (tests/bench/) since 
> this is a separate test suite.

That makes sense indeed.

> By the way, "make check-speed" is not working for me anymore (but "make 
> bench" is working fine) ... and I haven't found out yet what's wrong ... 
> is it working for you?

No; "make bench" and "make bench-speed" work though.

Paolo


