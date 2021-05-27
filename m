Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A194C392C60
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 13:11:34 +0200 (CEST)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmDvI-0002SX-39
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 07:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lmDqG-0000hl-Q8
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:06:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lmDqC-0003OH-AN
 for qemu-devel@nongnu.org; Thu, 27 May 2021 07:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622113572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E6qsCHyl6BHipQnOzZpz1WvU+DBNAnvtBoXmZykjAKg=;
 b=Wl22MX2oy190YjmQOzf8qYeIvGC4EUVo7PM/Cn/DuvHn0TVf+K6WfIPCOQz5WpPBitic6m
 aAOlVKrZZj/gKEcop+YtXqoc4xL/Y5Jw/UOq5MZu/imT1/h3Qsgodf1zXAbehRr+dFXGxg
 6cLP2LXN05Wa3MtZt8L+1DBmlAAKTcY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-NvPpI0y2OwOqcRnVDL3VhA-1; Thu, 27 May 2021 07:06:09 -0400
X-MC-Unique: NvPpI0y2OwOqcRnVDL3VhA-1
Received: by mail-ed1-f69.google.com with SMTP id
 cy15-20020a0564021c8fb029038d26976787so159126edb.0
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 04:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E6qsCHyl6BHipQnOzZpz1WvU+DBNAnvtBoXmZykjAKg=;
 b=X5lJ5cPkB2tI44Qb79qDyEn9aqj+ugWqMLtJPfQDJ/QLtQEKw1mF190JdmXO6rckkG
 iU9MNUY35TdE4JH138FtwM9JYepfs/HU9WHFhaAg4thH3iQ3k70hPWd8fkoJeXjoWJoG
 iWOzxiwqygADhE2adLNBusJar5HF2TobQ97VRCMl9l/BEAaxBS5QcHvvSWkIOu0o04Va
 cMw/OCN2C7OQbFqU8l+/CZTLd4Vg7Kq4+e4BnXoVtwTvalW4vsHhnPQBPYAdioFcSP+i
 AtAIykHktcU0K1XRCbhOUn8aXVzfwfU8PS5Ct8Mtfd6RPliEDwdSFb78SNietdcnMko3
 1GHg==
X-Gm-Message-State: AOAM533FzwyBL3ci7P/UZUEmogMGF4RHghLta3v/cvYNQWVLW0lGe8Fi
 p4vUWbB7kr1HYLQIhp8XZTGF7bB6ij82cMVWG+VqV74N3HeLLQG9PxHhaqVIFyWoW65uApcytYw
 6pm8DM3MCm03i0UA=
X-Received: by 2002:aa7:c488:: with SMTP id m8mr3401240edq.193.1622113568748; 
 Thu, 27 May 2021 04:06:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNFBude2DGCSQHMPnl5qw3bO1qzaEi46PovPevckOhKpxN5q4rKl3QtUeNk3cIdVXziMenog==
X-Received: by 2002:aa7:c488:: with SMTP id m8mr3401199edq.193.1622113568418; 
 Thu, 27 May 2021 04:06:08 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 dk21sm816725ejb.54.2021.05.27.04.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 04:06:07 -0700 (PDT)
Subject: Re: [PATCH v4 04/15] qemu-iotests: add option to attach gdbserver
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-5-eesposit@redhat.com>
 <59cfe4bf-6d2a-6a4d-a93c-b02e4af6c8b1@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <89984f1a-9816-fe96-7363-32cd13f94114@redhat.com>
Date: Thu, 27 May 2021 13:06:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <59cfe4bf-6d2a-6a4d-a93c-b02e4af6c8b1@virtuozzo.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 26/05/2021 21:15, Vladimir Sementsov-Ogievskiy wrote:
> 20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
>> Define -gdb flag and GDB_OPTIONS environment variable
>> to python tests to attach a gdbserver to each qemu instance.
>> This patch only adds and parses this flag, it does not yet add
>> the implementation for it.
>>
>> if -gdb is not provided but $GDB_OPTIONS is set, ignore the
>> environment variable.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   tests/qemu-iotests/check      |  6 +++++-
>>   tests/qemu-iotests/iotests.py |  5 +++++
>>   tests/qemu-iotests/testenv.py | 19 ++++++++++++++++---
>>   3 files changed, 26 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
>> index d1c87ceaf1..b9820fdaaf 100755
>> --- a/tests/qemu-iotests/check
>> +++ b/tests/qemu-iotests/check
>> @@ -33,6 +33,9 @@ def make_argparser() -> argparse.ArgumentParser:
>>                      help='pretty print output for make check')
>>       p.add_argument('-d', dest='debug', action='store_true', 
>> help='debug')
>> +    p.add_argument('-gdb', action='store_true',
>> +                   help="start gdbserver with $GDB_OPTIONS options \
>> +                        ('localhost:12345' if $GDB_OPTIONS is empty)")
>>       p.add_argument('-misalign', action='store_true',
>>                      help='misalign memory allocations')
>>       p.add_argument('--color', choices=['on', 'off', 'auto'],
>> @@ -112,7 +115,8 @@ if __name__ == '__main__':
>>       env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
>>                     aiomode=args.aiomode, cachemode=args.cachemode,
>>                     imgopts=args.imgopts, misalign=args.misalign,
>> -                  debug=args.debug, valgrind=args.valgrind)
>> +                  debug=args.debug, valgrind=args.valgrind,
>> +                  gdb=args.gdb)
>>       testfinder = TestFinder(test_dir=env.source_iotests)
>> diff --git a/tests/qemu-iotests/iotests.py 
>> b/tests/qemu-iotests/iotests.py
>> index 5d78de0f0b..d667fde6f8 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -75,6 +75,11 @@
>>   qemu_prog = os.environ.get('QEMU_PROG', 'qemu')
>>   qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
>> +gdb_qemu_env = os.environ.get('GDB_OPTIONS')
> 
> should we specify a default? otherwise get() should raise an exception 
> when GDB_OPTIONS is not set..
> 
> or you need os.getenv, which will return None if variable is absent.

No, os.environ.get does not raise any exception. I tested it myself, plus:
https://stackoverflow.com/questions/16924471/difference-between-os-getenv-and-os-environ-get

> 
>> +qemu_gdb = []
>> +if gdb_qemu_env:
>> +    qemu_gdb = ['gdbserver'] + gdb_qemu_env.strip().split(' ')
>> +
>>   imgfmt = os.environ.get('IMGFMT', 'raw')
>>   imgproto = os.environ.get('IMGPROTO', 'file')
>>   output_dir = os.environ.get('OUTPUT_DIR', '.')
>> diff --git a/tests/qemu-iotests/testenv.py 
>> b/tests/qemu-iotests/testenv.py
>> index 6d27712617..49ddd586ef 100644
>> --- a/tests/qemu-iotests/testenv.py
>> +++ b/tests/qemu-iotests/testenv.py
>> @@ -27,6 +27,7 @@
>>   import glob
>>   from typing import Dict, Any, Optional, ContextManager
>> +DEF_GDB_OPTIONS = 'localhost:12345'
>>   def isxfile(path: str) -> bool:
>>       return os.path.isfile(path) and os.access(path, os.X_OK)
>> @@ -72,7 +73,8 @@ class TestEnv(ContextManager['TestEnv']):
>>                        'QEMU_NBD_OPTIONS', 'IMGOPTS', 'IMGFMT', 
>> 'IMGPROTO',
>>                        'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
>>                        'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 
>> 'IMGOPTSSYNTAX',
>> -                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 
>> 'MALLOC_PERTURB_']
>> +                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 
>> 'MALLOC_PERTURB_',
>> +                     'GDB_OPTIONS']
>>       def get_env(self) -> Dict[str, str]:
>>           env = {}
>> @@ -163,7 +165,8 @@ def __init__(self, imgfmt: str, imgproto: str, 
>> aiomode: str,
>>                    imgopts: Optional[str] = None,
>>                    misalign: bool = False,
>>                    debug: bool = False,
>> -                 valgrind: bool = False) -> None:
>> +                 valgrind: bool = False,
>> +                 gdb: bool = False) -> None:
>>           self.imgfmt = imgfmt
>>           self.imgproto = imgproto
>>           self.aiomode = aiomode
>> @@ -171,6 +174,14 @@ def __init__(self, imgfmt: str, imgproto: str, 
>> aiomode: str,
>>           self.misalign = misalign
>>           self.debug = debug
>> +        if gdb:
>> +            self.gdb_options = os.environ.get('GDB_OPTIONS', 
>> DEF_GDB_OPTIONS)
> 
> everywhere in the file os.getenv is used, let's be consistent on it.
> 
>> +            if not self.gdb_options:
>> +                # cover the case 'export GDB_OPTIONS='
>> +                self.gdb_options = DEF_GDB_OPTIONS
> 
> Hmm, a bit strange to handle 'export X=' only for this new variable, we 
> don't have such logic for other variables.. I'm not against still, if 
> you need it.
> 
>> +        elif 'GDB_OPTIONS' in os.environ:
>> +            del os.environ['GDB_OPTIONS']
> 
> Don't need to remove variable from envirton, it has no effect. The task 
> of TestEnv class is to prepare environment in its attributes, listed in 
> env_variables. Then prepared attributes are available through get_env(). 
> So if you don't want to provide GDB_OPTIONS, it's enough to not 
> initialize self.gdb_options. So, just drop "elif:" branch.

You forget that there are bash tests :)
Think about the following case:

# export GDB_OPTIONS="localhost:1236"

# ./check -qcow2 007 # a script test

The output will contain:
GDB_OPTIONS   --
VALGRIND_QEMU --
PRINT_QEMU_OUTPUT --

BUT in common.rc we will have:
	GDB=""
         if [ ! -z ${GDB_OPTIONS} ]; then # <---- still set!
             GDB="gdbserver ${GDB_OPTIONS}"
         fi

so gsdbserver will be set anyways, and the test will block waiting for a 
gdb connection.

Therefore we need that elif.

> 
>> +
>>           if valgrind:
>>               self.valgrind_qemu = 'y'
>> @@ -269,7 +280,9 @@ def print_env(self) -> None:
>>   PLATFORM      -- {platform}
>>   TEST_DIR      -- {TEST_DIR}
>>   SOCK_DIR      -- {SOCK_DIR}
>> -SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
>> +SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
>> +GDB_OPTIONS   -- {GDB_OPTIONS}
> 
> Not sure we need to see this additional line every time.. Maybe, show it 
> only when gdb is set?

I think it can be helpful to remind the users what is not set and what 
is available to them (yes, one can also do ./check --help or read the 
docs but this is something even the laziest cannot unsee).

Thank you,
Emanuele
> 
>> +"""
>>           args = collections.defaultdict(str, self.get_env())
>>
> 
> 


