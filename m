Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B0F3A60D1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 12:37:43 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjyQ-0000S4-3B
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 06:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lsjxU-000854-HV
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:36:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lsjxQ-0004QQ-9T
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623666998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AqYMXbTe5xXHPFA0Bn1Fqhs949Li7CWspYxHxkQVpIo=;
 b=OPaLqP/ai9ffOlJ5QTOkdNGKyzb8oQN4U7BNFi89oRvJB57DuOANCTBjwUreaHDKre5wm6
 aFo4bXhX/jsPSan0AVqBOSB6qYmDJaxlMzNwb1ChP5cj2V6FH864VEkHmg4zwj65jM92Pg
 3CWMM9Mfy5aI71wmUXySZ9ntG5iWmww=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-2mVE_FOaMwC88DuzBoJ6sg-1; Mon, 14 Jun 2021 06:36:37 -0400
X-MC-Unique: 2mVE_FOaMwC88DuzBoJ6sg-1
Received: by mail-ej1-f72.google.com with SMTP id
 w13-20020a170906384db02903d9ad6b26d8so2907863ejc.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 03:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AqYMXbTe5xXHPFA0Bn1Fqhs949Li7CWspYxHxkQVpIo=;
 b=TAZ/86KKWnZmuIPNAxPyo+y56R9mLxzBIrxAx4CRtnkxVMDMPEi5nVwQ+T/0+qUFfT
 pDjwf8qECC+m1RfEWvPAtBR38u6c7pGO2m7MI4cgVhGlRZv00HjmT8iw114eK2M5SB9p
 FJpAGfd8rRgOppbXKwEGvssoQKGvmOjCFoG9GXLSSfDGgwtfvF7WIXVsSuJgLQRpVvb2
 8Mdo/Fhb7HoHw9IdcFNli0FmJ2LmD2lQEtIbyk7tzR1LDnEvh4lwixWg176/BahFWI3f
 zxFl5SHRiL0CQPcxE9JntrHpCszCI++TYZKWtthEsEa5NGiMz++JvR/FBqcAYA5mg3R/
 Xf5w==
X-Gm-Message-State: AOAM5324143H6DQyQV2iEJwGNMVSEUZmL4ZnhJIuncuMhmn65L9Fvb9B
 MXaKU3pqo/xtKNlBOzBY/RbMmO1K59cyvyOEjU8Lxq9aqnUGyS7YaleTWbvmSTagVyF9sjYJaUX
 sp4HWwHDDh5h0mvWX/joYPVwQqXY4vnomO0CsbAUd1I0VzQqjb17m4JxN8AfMrQVKqQY=
X-Received: by 2002:aa7:d846:: with SMTP id f6mr16061268eds.341.1623666996077; 
 Mon, 14 Jun 2021 03:36:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWwyjclHyRTBTj+fNhRsoqseAgEoUsFLpxWcDZrs8kXERXXoPgSUqjo4ojj5ef0mbIf5wwTw==
X-Received: by 2002:aa7:d846:: with SMTP id f6mr16061236eds.341.1623666995770; 
 Mon, 14 Jun 2021 03:36:35 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 b10sm8737145edf.77.2021.06.14.03.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 03:36:35 -0700 (PDT)
Subject: Re: [PATCH v5 06/16] qemu-iotests: delay QMP socket timers
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210604091723.13419-1-eesposit@redhat.com>
 <20210604091723.13419-7-eesposit@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <879584c2-48cb-c81e-ef9c-141db1c5a67f@redhat.com>
Date: Mon, 14 Jun 2021 12:36:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604091723.13419-7-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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



On 04/06/2021 11:17, Emanuele Giuseppe Esposito wrote:
> Attaching gdbserver implies that the qmp socket
> should wait indefinitely for an answer from QEMU.
> 
> For Timeout class, create a @contextmanager that
> switches Timeout with NoTimeout (empty context manager)
> so that if --gdb is set, no timeout will be triggered.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/iotests.py | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index c86f239d81..d4bfd8f1d6 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -486,6 +486,13 @@ def __exit__(self, exc_type, value, traceback):
>       def timeout(self, signum, frame):
>           raise Exception(self.errmsg)
>   
> +@contextmanager
> +def NoTimeout():
> +    yield
> +
> +if qemu_gdb:
> +    Timeout = NoTimeout
> +

@Vladimir or anyone expert enough in python:
This fix above works, but I just noticed that makes pylint (test 297) 
fail. My bad, I should have tried it before.

The reason for that is
>> +    Timeout = NoTimeout

They obviously have different types.

> +iotests.py:507: error: Cannot assign to a type
> +iotests.py:507: error: Incompatible types in assignment (expression has type "Callable[[], _GeneratorContextManager[Any]]", variable has type "Type[Timeout]")
> +Found 2 errors in 1 file (checked 1 source file)

Any ideas on how to fix this? Otherwise I will get rid of it.

Thank you,
Emanuele

>   def file_pattern(name):
>       return "{0}-{1}".format(os.getpid(), name)
>   
> @@ -575,7 +582,7 @@ class VM(qtest.QEMUQtestMachine):
>   
>       def __init__(self, path_suffix=''):
>           name = "qemu%s-%d" % (path_suffix, os.getpid())
> -        timer = 15.0
> +        timer = 15.0 if not qemu_gdb else None
>           super().__init__(qemu_prog, qemu_opts, name=name,
>                            base_temp_dir=test_dir,
>                            socket_scm_helper=socket_scm_helper,
> 


