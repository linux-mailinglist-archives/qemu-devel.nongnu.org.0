Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6519C358503
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:43:24 +0200 (CEST)
Received: from localhost ([::1]:33168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUwN-0007Kw-76
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUUuh-0006TP-A4
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:41:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUUuc-0004q1-PO
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617889293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=03mOUcnTRU+wYTHRFlDT+x9kimlNwDwXtSJ+gO97Tts=;
 b=Asd3oDK0hAG9S5Ooc6jxjYuGKTBa/CnNc0wMpQ3xaja+wojT68GGX4TsWmud8zueQsRGtF
 nqbQdistULuwZ99AjP1tPuksQpfqbI3lHqo2AN46kJoVTQBcKguZfyd2uJUmMyJGSUagYu
 brgAvkH4SZ6en+yA49Vq+A5B4+Q9sSM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-MBrugL4gNiiiKt60sb281Q-1; Thu, 08 Apr 2021 09:41:32 -0400
X-MC-Unique: MBrugL4gNiiiKt60sb281Q-1
Received: by mail-wr1-f71.google.com with SMTP id y14so998387wro.23
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 06:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=03mOUcnTRU+wYTHRFlDT+x9kimlNwDwXtSJ+gO97Tts=;
 b=aOmtbIVmcuJFhfNInrvXnGADpF6sBwPndGHO5TEavGMWaDTFCN1T+ZNP/aX+0FIKtj
 uHEct6UDmhCM4d1vMgYSjfnFcwZAMI6o1W+e7glvaPWn1+0RBTz/n1kX33/yl2RDs+4H
 z2sTuwuZglUOXGtBrLNYNf/YDXylHX2LtRRAMVt+w8qWt9vw2zE68ORzZ/U8iEdPadu2
 YuYMFsb+qtLSc5X1IR54CUWXQdGljN8kDVto//Vxf7jLo4xSwhdi9xH75Bm/hx/bvKFI
 sPMl7XTvXZdviLw6Czn1Ai8xMJT3LGRYKq3+PlW9GF2R5fYU0msQV/8syWX3i3s2lkfX
 hRRg==
X-Gm-Message-State: AOAM531xHdYe9LcpnYf0P+jrt0wJqpWFh5MLsgfqdau0lEvkicGuGqgN
 0yWx8r/tyhzPZkEZmYvTJhKk4DebNX4lg5n8rXQprZHv/5e6HoHHjTv3+aQPs58+ncAL7K3I1I4
 5uUG4u+JyaLirUdc=
X-Received: by 2002:a5d:6cc3:: with SMTP id c3mr11097609wrc.179.1617889290549; 
 Thu, 08 Apr 2021 06:41:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCxdxBE6GJnuwiHJqxzX4Da1nPBy9ycK+yuFIN4nKxW5sBvN1Jzcpr2v1exUsABXHpXbVZ6w==
X-Received: by 2002:a5d:6cc3:: with SMTP id c3mr11097586wrc.179.1617889290383; 
 Thu, 08 Apr 2021 06:41:30 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.120])
 by smtp.gmail.com with ESMTPSA id c2sm13918956wmr.22.2021.04.08.06.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 06:41:29 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/11] qemu_iotests: improve debugging options
To: Markus Armbruster <armbru@redhat.com>
References: <20210407135021.48330-1-eesposit@redhat.com>
 <87wntdchbw.fsf@dusky.pond.sub.org>
 <d580fb77-7e50-7af6-ad03-c28c94cd36f1@redhat.com>
 <875z0xar1p.fsf@dusky.pond.sub.org>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <35d75df0-38e8-975e-d056-54b3ab6f4054@redhat.com>
Date: Thu, 8 Apr 2021 15:41:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <875z0xar1p.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/04/2021 14:39, Markus Armbruster wrote:
> Emanuele Giuseppe Esposito <eesposit@redhat.com> writes:
> 
>> On 08/04/2021 10:26, Markus Armbruster wrote:
>>> Emanuele Giuseppe Esposito <eesposit@redhat.com> writes:
>>>
>>>> This series adds the option to attach gdbserver and valgrind
>>>> to the QEMU binary running in qemu_iotests.
>>>> It also allows to redirect QEMU binaries output of the python tests
>>>> to the stdout, instead of a log file.
>>>>
>>>> Patches 1-6 introduce the -gdb option to both python and bash tests,
>>>> 7-10 extend the already existing -valgrind flag to work also on
>>>> python tests, and patch 11 introduces -p to enable logging to stdout.
>>>>
>>>> In particular, patches 1,2,4,8 focus on extending the QMP socket timers
>>>> when using gdb/valgrind, otherwise the python tests will fail due to
>>>> delays in the QMP responses.
>>>>
>>>> This series is tested on the previous serie
>>>> "qemu-iotests: quality of life improvements"
>>>> but independent from it, so it can be applied separately.
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>
>>> How discoverable are these goodies for developers with only superficial
>>> knowledge of iotests?
>>>
>>
>> Not really sure what you mean, but
>>
>> ./check --help now shows:
>>
>>> -p         enable prints
>>> -gdb       start gdbserver with $GDB_QEMU options. Default is localhost:12345
>>
>> Which I guess should be clear enough? Btw two-three weeks ago I didn't
>> know anything about these tests either.
>>
>> I agree I can make -p more clear, saying "enable qemu binary prints to
>> stdout", and move -valgrind to the "optional arguments" instead of
>> "bash-only"
> 
> Yes, please (this is not a demand).
> 
> docs/devel/testing.rst section "QEMU iotests" is the place to explain
> things in more detail than --help, if that's useful.  Right now it
> simply points to check -h.
> 

Ok, I will add a new section in testing.rst explaining the new flags.

Thank you,
Emanuele


