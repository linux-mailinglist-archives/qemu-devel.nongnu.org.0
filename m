Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38413804F8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 10:17:54 +0200 (CEST)
Received: from localhost ([::1]:45712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhT18-0006Xc-0a
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 04:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lhSzm-0004d4-BQ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 04:16:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lhSzj-00030c-IR
 for qemu-devel@nongnu.org; Fri, 14 May 2021 04:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620980186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zr3Iiaf+0OveUmQLuc86NWVWvL7dPfwzBazdCqAqgPU=;
 b=b6o22bh3yWzFmFP2dFdxNqerMMNYlmCetcTfgg5ytZHQduGdAm+12hmzcpsKaF1OVAsdmB
 srpMvbMRKo1GeyOtFog+dx5m/wdGEcs+eIgosElCjQHmVrLd88/bmE0++eWLXKxsSP1cqM
 /mthXWpOAlM4oTP3yoX9uea2pUCHS3o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-20f3pydAOGWF7HOI3y64aw-1; Fri, 14 May 2021 04:16:25 -0400
X-MC-Unique: 20f3pydAOGWF7HOI3y64aw-1
Received: by mail-ed1-f69.google.com with SMTP id
 q18-20020a50cc920000b029038cf491864cso656517edi.14
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 01:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zr3Iiaf+0OveUmQLuc86NWVWvL7dPfwzBazdCqAqgPU=;
 b=kTdJvEXU8HzSpB9Wpc+cBKHpPr7KfrB1/3KCnBIj6tu6gAQt4eo9fKvmX0p5q/qoZS
 vykSwod6fiZntKhjgivoN20Y4w6CCzANXYsb+coWjIr4PdnCzKvp4XSJh7COuzufkB0Z
 DhC/ecZ0kD80rqYlirOjUB5AEQzUbjPDvgf5ExHDIe3KX4U8ywmptXWaAq3V6Jzcz4w3
 +8oMEk66muOi2uCN+N2eNq+iq2d84p/wsHaNns9i5arAJBQHRx//KgbUFCsXsjKTGT9b
 /IC+U84BxiG2DgaZrVgIAKKHqK408LwzBJGum+vrLSFbmRUUhFYB3BCPW6J7KOFyPyWI
 +lsw==
X-Gm-Message-State: AOAM531cjEFkVjPf0cLekNrIXojprfAn6CZh0P0hH2MUtuXiMDydhToz
 zn3lJdyhhKHi9+RKRE5RixznGFD378w13ZqIbL0qTtKI+BlQT0C4A/oVkuUtf6o1uGTuVQR83Wz
 3x3nReiJv45Pvz/sd25o27wWNoFm97N5dPHUmVZfxrgZz9ES7O6Vr04CfRTwXTLvcj5c=
X-Received: by 2002:a17:906:3ce9:: with SMTP id
 d9mr47327256ejh.172.1620980183914; 
 Fri, 14 May 2021 01:16:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynB21oXshPcgblWlefNV8MeCzIHFwoBKkak1zg+rzHmcR7mZxBa9HaZWVF3HyyvHWItRttug==
X-Received: by 2002:a17:906:3ce9:: with SMTP id
 d9mr47327210ejh.172.1620980183559; 
 Fri, 14 May 2021 01:16:23 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 ne17sm3100540ejc.56.2021.05.14.01.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 01:16:23 -0700 (PDT)
Subject: Re: [PATCH v3 01/15] python: qemu: add timer parameter for qmp.accept
 socket
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-2-eesposit@redhat.com>
 <3a6bacd3-1d40-2fc5-9268-5f2d7fae4cf1@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <1039ba42-e830-36d7-5729-957cee73a008@redhat.com>
Date: Fri, 14 May 2021 10:16:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3a6bacd3-1d40-2fc5-9268-5f2d7fae4cf1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 13/05/2021 19:54, John Snow wrote:
> On 4/14/21 1:03 PM, Emanuele Giuseppe Esposito wrote:
>> Add a new _qmp_timer field to the QEMUMachine class.
>> The default timer is 15 sec, as per the default in the
>> qmp accept() function.
> 
> Fine enough for now.
> 
> What's the exact need for this change, exactly? Is it just to prevent 
> any unbounded blocking waits? I assume this came up in development or 
> you'd not have added it.

The default was already 15 sec, but since we now want to make the wait 
unbounded if we use gdbserver or valgrind and we do it by always passing 
the _qmp_timer to the .accept function, we need to set a default value.
Yes, it came up while testing with gdb.

> 
> Reviewed-by: John Snow <jsnow@redhat.com>
> 
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   python/qemu/machine.py | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>> index 6e44bda337..12752142c9 100644
>> --- a/python/qemu/machine.py
>> +++ b/python/qemu/machine.py
>> @@ -110,6 +110,7 @@ def __init__(self,
>>           self._binary = binary
>>           self._args = list(args)
>>           self._wrapper = wrapper
>> +        self._qmp_timer = 15.0
>>           self._name = name or "qemu-%d" % os.getpid()
>>           self._test_dir = test_dir
>> @@ -323,7 +324,7 @@ def _pre_launch(self) -> None:
>>       def _post_launch(self) -> None:
>>           if self._qmp_connection:
>> -            self._qmp.accept()
>> +            self._qmp.accept(self._qmp_timer)
>>       def _post_shutdown(self) -> None:
>>           """
>>
> 


