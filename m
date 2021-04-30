Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA34370349
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:57:06 +0200 (CEST)
Received: from localhost ([::1]:54716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcb8C-00064r-It
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lcaIY-0004K6-5w
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 17:03:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lcaIT-0000uQ-Ly
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 17:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619816616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8l7iV3c0Zq7yDNJbijJhSCv2L6sEi5uB+a9ZQyVb2I=;
 b=N7z+WUPkwVcSoP2TrAML2WNDIvUsAZRdOXa7pvsUeSMQt+eowz3jPSBx2vOI9J45mGXqwN
 uU4CoZhLdff4dB8OFyjoZzN2AsMdU0Dn3GeRmSt9eCo8nj264RWov8gdZKXc73j1fYUEoy
 N4F9Mmw12HenhuZStvWvoodP8S5ILM4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-Eg6nmTzwOxmSNK7psXB0Xw-1; Fri, 30 Apr 2021 17:03:34 -0400
X-MC-Unique: Eg6nmTzwOxmSNK7psXB0Xw-1
Received: by mail-ej1-f72.google.com with SMTP id
 k9-20020a17090646c9b029039d323bd239so2361913ejs.16
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 14:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P8l7iV3c0Zq7yDNJbijJhSCv2L6sEi5uB+a9ZQyVb2I=;
 b=eoQsBybq9XHEyXGZ7j41Jwt+ufpgZv7bvEd36d986kX3QtuLYWchGNWP7Nn7U7fv9u
 wKu6XG8zAKKtZKqwIHvo33569j5YWlrSAnqH/EoPhwXENoH/7I9etIieS1u6XEKsomrW
 VU2fz4MMLE2uPm2ubCSJIV3PSfD0g5WwY+hON6Zu6v0ESFt21NXG/ygBG+TAclschKz8
 cqjtygiSDYnmGh7im8RxmxBxJCXhJya1jGHEYhZ4+Xz3hkTEpxpWnHQ/5n90nKhls4ED
 2rSeveLGOZA/3dRDbMFI1kYdIvDAFydg8rX7nolBLVXfLCLKPtM9Ianq0Nk8Jseo5DXk
 W3Pw==
X-Gm-Message-State: AOAM532Y7gOnD8acomXZh6Urzmg8HtQzO7Rr4zlxo4ios7AYsupUhA0x
 J6VX3+RoHDezzumU2sUQJ3b6KfD0GYz96Ah2hA5VnwTJpOS3qYh7xitQezA8OwgqhQiK2oyWRS7
 P0ywAcPmQcVdilN7AkO+JIC1zS9pvP2AtfgKWW8xOxLCaf0yiB72yRUD0znLQWyuNbfQ=
X-Received: by 2002:aa7:dc15:: with SMTP id b21mr8403071edu.350.1619816612725; 
 Fri, 30 Apr 2021 14:03:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysW1X1tqKqu3LbXgZccdWU1gyKjNcggvR7arqObUhAZ+e2QMCd+7+s1veUN9igpO9Hjj5EVw==
X-Received: by 2002:aa7:dc15:: with SMTP id b21mr8403036edu.350.1619816612410; 
 Fri, 30 Apr 2021 14:03:32 -0700 (PDT)
Received: from localhost.localdomain (mob-194-230-155-107.cgn.sunrise.net.
 [194.230.155.107])
 by smtp.gmail.com with ESMTPSA id a24sm649344edr.74.2021.04.30.14.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 14:03:31 -0700 (PDT)
Subject: Re: [PATCH v3 04/15] qemu-iotests: add option to attach gdbserver
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-5-eesposit@redhat.com>
 <e06a8560-641b-bf10-230c-fa99a21998c8@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <4189f418-ef3f-bb94-585a-5efc95ef1257@redhat.com>
Date: Fri, 30 Apr 2021 23:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e06a8560-641b-bf10-230c-fa99a21998c8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 30/04/2021 13:38, Max Reitz wrote:
> On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
>> Add -gdb flag and GDB_QEMU environmental variable
>> to python tests to attach a gdbserver to each qemu instance.
> 
> Well, this patch doesn’t do this, but OK.

Maybe "define" rather than "add"? In the sense of defining the "-gdb" 
option, which is what it actually does.

> 
> Out of interest: Why gdbserver and not “just” gdb?  On Fedora, those are 
> separate packages, so I don’t have gdbserver installed, that’s why I’m 
> asking.

As far as I have tried, using only gdb with ./check is very hard to use, 
because the stdout is filtered out by the script.
So invoking gdb attaches it to QEMU, but it is not possible to start 
execution (run command) or interact with it, because of the python 
script filtering. This leaves the test hanging.

gdbserver is just something that a gdb client can attach to (for 
example, in another console or even in another host) for example with 
the command
# gdb -iex "target remote localhost:12345" . This provides a nice and 
separate gdb monitor to the client.

Emanuele
> 
> (I’ve also never used gdbserver before.  From what I can tell, it’s 
> basically just a limited version of gdb so it only serves as a server.)
> 
>> if -gdb is not provided but $GDB_QEMU is set, ignore the
>> environmental variable.
> 
> s/environmental/environment/
> 
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   tests/qemu-iotests/check      |  6 +++++-
>>   tests/qemu-iotests/iotests.py |  4 ++++
>>   tests/qemu-iotests/testenv.py | 15 ++++++++++++---
>>   3 files changed, 21 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
>> index d1c87ceaf1..6186495eee 100755
>> --- a/tests/qemu-iotests/check
>> +++ b/tests/qemu-iotests/check
>> @@ -33,6 +33,9 @@ def make_argparser() -> argparse.ArgumentParser:
>>                      help='pretty print output for make check')
>>       p.add_argument('-d', dest='debug', action='store_true', 
>> help='debug')
>> +    p.add_argument('-gdb', action='store_true',
>> +                   help="start gdbserver with $GDB_QEMU options. \
>> +                         Default is localhost:12345")
> 
> That makes it sound like this were the default for the `-gdb` option. 
> Since `-gdb` is just a switch, it doesn’t have a default (apart from 
> being off by default).
> 
> So I’d rephrase this at least to “The default options are 
> 'localhost:12345'”.  Or maybe “start gdbserver with $GDB_QEMU options 
> ('localhost:12345' if $GDB_QEMU is empty)”.
> 
> Also, $GDB_QEMU as a name is a bit strange, because it does not specify 
> which gdb to use; it just gives the options to use for gdb. 
> $GDB_QEMU_OPTIONS would be more in line with the naming of the rest of 
> the environment variables (or just $GDB_OPTIONS).
> 
> Max
> 
>>       p.add_argument('-misalign', action='store_true',
>>                      help='misalign memory allocations')
>>       p.add_argument('--color', choices=['on', 'off', 'auto'],
> 


