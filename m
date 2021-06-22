Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB19C3B026A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 13:08:25 +0200 (CEST)
Received: from localhost ([::1]:47856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lveGX-0002Gk-24
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 07:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lveCy-0008BP-7a
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:04:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lveCv-0002ap-Rl
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624359880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ET2k+rRIHWSb2EbzFkqbXbj9NWpqsOIkjL0HUdQU9E=;
 b=Ha3gRcx74RS16jfyzidU2qb6UIw6vMbkKeft3rXT36A9APPzm3uWEeOnWP6zk4aFAJRrsR
 Q2wj8AFHPC7oeA2v/shYFPCT7KBVqTNQMxb5S+Ru/2suYwLKa2gXFwPk6/KYz4CgwYqWyO
 h0NHjDq25rr3TyxUuwxPhE7li9OLslY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-mb2-IQIjNBqIz62s94hHqg-1; Tue, 22 Jun 2021 07:04:39 -0400
X-MC-Unique: mb2-IQIjNBqIz62s94hHqg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y18-20020a0564022712b029038ffac1995eso9342385edd.12
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8ET2k+rRIHWSb2EbzFkqbXbj9NWpqsOIkjL0HUdQU9E=;
 b=jaZ8SwYmzVEuN/5ZQeqDzXKNbQ2UYQEHhhz6P13aBdIdV2fWS5iX2DGREc6Y02IJHF
 wFgJtxnc4ofOq3V29OwWZh8ulRu5gyAavaS15dXjRRjHvVWDpDq+DgZuZd3bG+mZHEwN
 j6CVlT5DwmMRxZ03JjhJwSFzjy2bjQrbIK4BGhUCZOyDsyQx+Dde6QASJUDfmXBB10jG
 tx+yuF5FiEXnldyXj1iD2PXo9Ig+/1ckp1t1BK7TQxPbKO5Dy7u53wCe2imNHUGIyUTb
 XG9BuSxK8Ub3g2y8IFbIv7hbvPUMxEMqrdCt1EM+5QWoWUt8wTih2+gNpvVP6rLZ8aWz
 3qog==
X-Gm-Message-State: AOAM531xkfyghWwp9+msB/cHlEPPgb6ZA6f9PwJ3flKrxBS9OUN8YMwp
 8nvDyRL+mqPFdLBx42gHq4ztQj6jzcfb157UdaH7JVn53nktM8aPcdPvdzCOg/OKqmCw62ZVt9V
 94ruOCLifrbJpoAy8Fl12/s5fymlJB9sv4HxdwQKQ23Gu8YO9s6BOyex57mvlto7r56o=
X-Received: by 2002:a17:907:1185:: with SMTP id
 uz5mr3333175ejb.26.1624359878113; 
 Tue, 22 Jun 2021 04:04:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVh2QxqZMVITo7Rg5pP98+I+jSRTfoUVf8I/iIAG+GsHJQwy7hD1ds7oNaLyhYbWV9Tqxmmw==
X-Received: by 2002:a17:907:1185:: with SMTP id
 uz5mr3333135ejb.26.1624359877874; 
 Tue, 22 Jun 2021 04:04:37 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 dd15sm4996668edb.45.2021.06.22.04.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 04:04:37 -0700 (PDT)
Subject: Re: [PATCH v6 06/16] qemu-iotests: delay QMP socket timers
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210621103337.36637-1-eesposit@redhat.com>
 <20210621103337.36637-7-eesposit@redhat.com>
 <4179a6d2-3fc8-aae1-4747-b4ae541a8819@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <ddfbc161-92c3-2f58-1ab7-9951d291a2b7@redhat.com>
Date: Tue, 22 Jun 2021 13:04:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <4179a6d2-3fc8-aae1-4747-b4ae541a8819@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 22/06/2021 12:50, Vladimir Sementsov-Ogievskiy wrote:
> 21.06.2021 13:33, Emanuele Giuseppe Esposito wrote:
>> Attaching gdbserver implies that the qmp socket
>> should wait indefinitely for an answer from QEMU.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Please, let this patch go without my r-b. I don't like it, I explained 
> my thoughts, and you even used my suggested way in previous version.
> 
> What I don't like: good component - Timeout class, which is currently 
> independent of outer code and can be simply moved to another module 
> becomes dependent on global variable, which doesn't relate to the class 
> itself. Neither I like logic of the dependency which just make the whole 
> class do nothing by skipping any action internally. So, IMHO Timeout 
> class becomes worse.
> 
> I'm not a maintainer here anyway, so my r-b isn't necessary :)

Oh okay. Sorry I understood from previous versions that you liked it 
even without your suggested change. Apologies.

Emanuele
> 
>> ---
>>   tests/qemu-iotests/iotests.py | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/iotests.py 
>> b/tests/qemu-iotests/iotests.py
>> index c86f239d81..e176a84620 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -477,10 +477,14 @@ def __init__(self, seconds, errmsg="Timeout"):
>>           self.seconds = seconds
>>           self.errmsg = errmsg
>>       def __enter__(self):
>> +        if qemu_gdb:
>> +            return self
>>           signal.signal(signal.SIGALRM, self.timeout)
>>           signal.setitimer(signal.ITIMER_REAL, self.seconds)
>>           return self
>>       def __exit__(self, exc_type, value, traceback):
>> +        if qemu_gdb:
>> +            return False
>>           signal.setitimer(signal.ITIMER_REAL, 0)
>>           return False
>>       def timeout(self, signum, frame):
>> @@ -575,7 +579,7 @@ class VM(qtest.QEMUQtestMachine):
>>       def __init__(self, path_suffix=''):
>>           name = "qemu%s-%d" % (path_suffix, os.getpid())
>> -        timer = 15.0
>> +        timer = 15.0 if not qemu_gdb else None
>>           super().__init__(qemu_prog, qemu_opts, name=name,
>>                            base_temp_dir=test_dir,
>>                            socket_scm_helper=socket_scm_helper,
>>
> 
> 


