Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F5391E33
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:34:49 +0200 (CEST)
Received: from localhost ([::1]:47800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxQe-00089d-9x
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1llxG2-0004cs-6V
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:23:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1llxFx-000540-FK
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622049823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gS7s63fCn5bQh5MEKTByMtNzmfI5vcXHgYn5aoKWtMc=;
 b=Yn+WPCCnLqgKQQF3Lgfj3lJGQ8fZHQV0/UhlcAtaGd8KUiGcBJoczZHLZSFwBqM53D+C++
 n6Hg2Ol2X2UVHE6CVw+3+RrkqRyQdc0Kw4jMCpIjhkFg+XaXo9XgLn4efoHKVNPGjCNqkv
 en8InO4YKMAaDT+CZsZ3EUhel9N59q0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-LNWJ7v7vPrCD1VmBSUt2qA-1; Wed, 26 May 2021 13:23:42 -0400
X-MC-Unique: LNWJ7v7vPrCD1VmBSUt2qA-1
Received: by mail-wr1-f69.google.com with SMTP id
 j33-20020adf91240000b029010e4009d2ffso647852wrj.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gS7s63fCn5bQh5MEKTByMtNzmfI5vcXHgYn5aoKWtMc=;
 b=Tr2la2InwVui1jRR4cO5w5zCUrSSrq8mC7Xvb1CuM/tMcvLz5D0IbuqIE8eDel1M7i
 tP1peAN+XherSeVqR712Ev6yqi3CUTxpYU4BqkNRcIjWkY0GsHp4wipXVrZDKs9rL4nw
 kk91trKALz6HaEmGfJMWqtu0pn8t6+wpPmRrEdwhru2Dx70vKeFiHQGozw3MmynfHzad
 RmNpZD/0MCSZH/Sjkg/jqOhv6jh6e62uLhglzdG6I7J3cTMad6t1OaM02DmySiVj0nzZ
 77at3y89Hg7rG8z46r2VTDQIFrGzghbzxrQNVSEnrirhvGiE0//ETDYjz+LKH2qyZ5Jf
 co3w==
X-Gm-Message-State: AOAM533yyhIwM2AgB2eGDKWdiL481Mvl8z55Mr//QB7DdNEzHm21bSot
 woYbhtF9U+I+9vJi039mkoXeUS9Y7mWA/CMw9dgRIRd5mIXH9hvJUGgTuhrRX1ZxN0NGmzk1ia9
 y1wNuLnTts9Ri7YM=
X-Received: by 2002:adf:e3c6:: with SMTP id k6mr34097655wrm.236.1622049821139; 
 Wed, 26 May 2021 10:23:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyym2pcuYrQQ0jsHfjzYEelnCQlG7eyGQekjeCpeSDxExOAzRNet/lyHRSTTFYiZVN5QT70rA==
X-Received: by 2002:adf:e3c6:: with SMTP id k6mr34097633wrm.236.1622049820918; 
 Wed, 26 May 2021 10:23:40 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 r7sm6972379wmq.3.2021.05.26.10.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 10:23:40 -0700 (PDT)
Subject: Re: [PATCH v4 04/15] qemu-iotests: add option to attach gdbserver
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-5-eesposit@redhat.com>
 <becc0bde-5de8-7cd3-0b5e-76bdb830af11@virtuozzo.com>
 <e0162706-db5f-0f1e-2c65-5291fca26eab@redhat.com>
 <4009d11e-c013-51ab-1fa9-62ed2157cb36@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <95056b8c-7414-3171-8b0f-31cdcf0f2bd1@redhat.com>
Date: Wed, 26 May 2021 19:23:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4009d11e-c013-51ab-1fa9-62ed2157cb36@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 26/05/2021 15:25, Vladimir Sementsov-Ogievskiy wrote:
> 26.05.2021 15:48, Paolo Bonzini wrote:
>> On 26/05/21 13:24, Vladimir Sementsov-Ogievskiy wrote:
>>>
>>>> Define -gdb flag and GDB_OPTIONS environment variable
>>>
>>> Let's use --option notation for new long options
>>
>> Why make a mix of two styles? -- suggests that single-character 
>> options like -d and -v can be combined, is that the case?
> 
> Yes.. I think think that --options (with -o short options) is more usual 
> and modern style.
> 
> We already have both --options and -options.. So, my idea when I was 
> rewriting ./check was that better to move to --options. I can send patch 
> to change all existing -options of check to be --options for full 
> consistency. It would be some pain for developers..

I am following the current convention. I put gdb on the same 
level/category of valgrind, and since the current option is -valgrind, I 
would like to stick to that. If you want to send a patch changing all 
-options in --options, feel free to do it in a separate series that 
changes also -gdb :)

Thank you,
Emanuele
> 
>>
>>>> if -gdb is not provided but $GDB_OPTIONS is set, ignore the
>>>> environment variable.
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>> ---
>>>>   tests/qemu-iotests/check      |  6 +++++-
>>>>   tests/qemu-iotests/iotests.py |  5 +++++
>>>>   tests/qemu-iotests/testenv.py | 19 ++++++++++++++++---
>>>>   3 files changed, 26 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
>>>> index d1c87ceaf1..b9820fdaaf 100755
>>>> --- a/tests/qemu-iotests/check
>>>> +++ b/tests/qemu-iotests/check
>>>> @@ -33,6 +33,9 @@ def make_argparser() -> argparse.ArgumentParser:
>>>>                      help='pretty print output for make check')
>>>>       p.add_argument('-d', dest='debug', action='store_true', 
>>>> help='debug')
>>>> +    p.add_argument('-gdb', action='store_true',
>>>> +                   help="start gdbserver with $GDB_OPTIONS options \
>>>> +                        ('localhost:12345' if $GDB_OPTIONS is empty)")
>>>
>>> Hmm.. Why not just make --gdb a string option, that defaults to 
>>> GDB_OPTIONS? This way it will more similar with other options.
>>
>> I think then something like "./check -gdb 030" would not work, right?
>>
> 
> Hmm, yes, that's not very convenient. OK then, let's keep bool.
> 
> 


