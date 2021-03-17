Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E3633F281
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:24:02 +0100 (CET)
Received: from localhost ([::1]:47804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMX5d-0005tO-3a
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMX4b-0005NS-29
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:22:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMX4T-0007Ei-3F
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615990968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AcWSTZWAD2pHb4x/WQXk3Kz72u+GFNZ25WgIfMDo4ow=;
 b=dcO17I4K6XrzP9q5Ym8JcMN/3VpoEiisdewdSW/ZxOEUhqDm49jyLrB7DSFkMGUZye04Zx
 GDg4Rse8hukq2zn7AiFGPpG540IUEKcH1eOb06EiuUnsZYVHDEQLZCZ2dGQSMK3tL2DbrG
 UaOajTlFOi3jod0F+HVxftricc9IcDU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-t9IDeqlmOk-fFelXkurwWQ-1; Wed, 17 Mar 2021 10:22:44 -0400
X-MC-Unique: t9IDeqlmOk-fFelXkurwWQ-1
Received: by mail-wm1-f72.google.com with SMTP id z26so10791785wml.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 07:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AcWSTZWAD2pHb4x/WQXk3Kz72u+GFNZ25WgIfMDo4ow=;
 b=mIcnlj2C1ClRP50mj0sHJG1pdJuU3D+dUG0bJS58fGIdeP96jsA3x8HCN34A9OZWay
 XrGD5uOx4kBVPSLFh27uOJfIPJureAycv6sofnwYxgxHWjLeZYUeRhmnIgU0lFwYrGPR
 GjiuXlKBKnC2CQVL1qVxpQ5YbnQgIWjFUCAh2vL+IZHJTo4OS4LTL5tMqSFISwNFRTzB
 XDRZH1ZB3jIhi5sROBbXj63LLk+WJ46iI9a2f3yLDZR2YhrBt8utasXxjuJ3xmJlMVrH
 svdH3GidG8iRqzzWckH+nkIqNbfW7J1e7P3ln0wHXKM57qnwGIDY6g0zZWBk1Pmg/PvN
 mZFw==
X-Gm-Message-State: AOAM532BRv4s3EJRsVLJEHQZHcEjJSEafBm3Qyb5ggv46dcdFDBmZYqd
 B/tVTpZtmvFyuNoRyfJaUaVbSpqXRslLvcM4Wt5PiS2LUehomeez1kI0r4IPXPa+wZ4IMD6IMLn
 BY4WpyROXINr8e1Y=
X-Received: by 2002:adf:f509:: with SMTP id q9mr4728388wro.342.1615990963378; 
 Wed, 17 Mar 2021 07:22:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEu21k6SYsEtKFhBSVgbzCgA7nJxHrbuva7w6Tnpd0lDDjSi+yhmm5JA2upsupygedMF/alQ==
X-Received: by 2002:adf:f509:: with SMTP id q9mr4728379wro.342.1615990963256; 
 Wed, 17 Mar 2021 07:22:43 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 21sm2734255wme.6.2021.03.17.07.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 07:22:42 -0700 (PDT)
Subject: Re: [PULL 00/11] pflash patches for 2021-03-16
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210315233527.2988483-1-philmd@redhat.com>
 <CAFEAcA-p+=NGEyydhboCON+qoNcRYFp86N+7KYyDA3cMZJwsFA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e258527c-527d-60b8-06b5-364b8fe1e38a@redhat.com>
Date: Wed, 17 Mar 2021 15:22:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-p+=NGEyydhboCON+qoNcRYFp86N+7KYyDA3cMZJwsFA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 2:37 PM, Peter Maydell wrote:
> On Mon, 15 Mar 2021 at 23:37, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> The following changes since commit 2615a5e433aeb812c300d3a48e1a88e1303e2339:
>>
>>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-03-15 19:23:00 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/philmd/qemu.git tags/pflash-20210316
>>
>> for you to fetch changes up to 3b6a1da064ac6ce5256f1f6f16870ea79c2422d0:
>>
>>   hw/block/pflash_cfi: Replace DPRINTF with trace events (2021-03-16 00:28:33 +0100)
>>
>> ----------------------------------------------------------------
>> Parallel NOR Flash patches queue
>>
>> - Code movement to ease maintainability
>> - Tracing improvements
>> ----------------------------------------------------------------
> 
> Fails to build on 32-bit and OSX due to format string issues:
> 
> In file included from trace/trace-hw_block.c:5:
> /Users/pm215/src/qemu-for-merges/hw/block/trace-events:36:38: error:
> format specifies type 'unsigned long' but the argument has type
> 'uint64_t' (aka 'unsigned long long') [-Werror,-Wformat]
>                      , name, offset, len);
>                                      ^~~
> /Users/pm215/src/qemu-for-merges/hw/block/trace-events:33:121: error:
> format specifies type 'unsigned long' but the argument has type
> 'uint64_t' (aka 'unsigned long long') [-Werror,-Wformat]
>             qemu_log("pflash_write_block_erase " "%s: block erase
> offset:0x%" PRIx64 " bytes:0x%lx" "\n", name, offset, len);
> 
>                         ~~~                      ^~~
> 
>                         %llx

Oops. I lost access to Gitlab [*] so couldn't run the test suite.
I tried to run all of them manually but forgot the win32 cross
compilation job which usually show these problems.

[*] Which made me realize we put all your eggs in one basket.


