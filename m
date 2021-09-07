Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB86B402725
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 12:27:49 +0200 (CEST)
Received: from localhost ([::1]:32912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNYKS-0000xW-Ak
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 06:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNYGa-0006iq-B2
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:23:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNYGX-0003wq-1q
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631010224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1p4L92tlo5bFVVEyJL6ott4geS7Eh5OTcV1ke/PrfzU=;
 b=OfkLlxNiGysW/1ILBfPSDeIOXCd/SATB+yraZ81gJdubt6NMusxfHsQZp0TUReXcCmTeiE
 ++lZDWOonXavGfDNeEWAkWn/5xZwzLCCnlxzQWmWKDjxgM5mC9H026h+btoUDT/KeZ4MUb
 RAUU1QVjqypRn8E+h7Fz4K6a13Ld5Jc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-ZmZL4dEJPHqyqm-7wGS_WA-1; Tue, 07 Sep 2021 06:23:41 -0400
X-MC-Unique: ZmZL4dEJPHqyqm-7wGS_WA-1
Received: by mail-wr1-f70.google.com with SMTP id
 r11-20020a5d4e4b000000b001575c5ed4b4so1967025wrt.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 03:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1p4L92tlo5bFVVEyJL6ott4geS7Eh5OTcV1ke/PrfzU=;
 b=Oh6PLwS1lWnewntDDDeJvgnZ3Zd0HdXGKe4n5fvno9ALEMhuZRYBm0y9rBUvWZCMXS
 3cVEu5Tb5CXG9nFASoYi8oH/vpOWLuOxZpAWQvYuu7AMEjN86zTDnL49XmSegSbT3D03
 kCUovpQY/nKzZrl/PjS8RcToPM72/kyLDPoVDWGkyRt+DPcEKKALl03w4HLvsK9xVPRB
 VTvyCcwAPas+l/CxVaO7ImlkSfC8ZR5zkbfKkOqu/0Gs3LqETPQ3pdmvPWfxHw8/sxDR
 RUKinDaMOdGtRy+StDJuSfeTMRgFvuzDnhIjtJanTHf7Y8+6P6m/AWPRw+JzpJnsJDSj
 gDZg==
X-Gm-Message-State: AOAM533NqrG0eLtc25i77z+5fcZyLzN1fSW72jBWSGKtjb/+DVwQ2jBa
 r3HCxCB030PJGIEuAuBhyVNR/MEjfOrShl4Dl+n1Rzc1KD/6ByhIfcjDUDpz8zcrif5T/ms5q4Z
 80viVH6jSIsNsnBM=
X-Received: by 2002:a5d:40d1:: with SMTP id b17mr18071349wrq.47.1631010220203; 
 Tue, 07 Sep 2021 03:23:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsn0q09U3gTApCIZr6C0vpRd88iYV3FAXhkOW6H5GgrDH5JjScBc0B4i8cVoHMGKyC0kADFA==
X-Received: by 2002:a5d:40d1:: with SMTP id b17mr18071326wrq.47.1631010219963; 
 Tue, 07 Sep 2021 03:23:39 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z7sm2569636wre.72.2021.09.07.03.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 03:23:39 -0700 (PDT)
Subject: Re: [PATCH v4 4/5] mirror-top-perms: Fix AbnormalShutdown path
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
References: <20210902094017.32902-1-hreitz@redhat.com>
 <20210902094017.32902-5-hreitz@redhat.com>
 <ab23a119-1315-09b7-aeec-8d9039fdbd92@virtuozzo.com>
 <12a9bfd7-d302-f157-f88a-ff441470278e@redhat.com>
 <8c608d35-55e9-070e-7a69-ed661ea71d45@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4257de35-0365-6e00-fab4-32b118594978@redhat.com>
Date: Tue, 7 Sep 2021 12:23:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8c608d35-55e9-070e-7a69-ed661ea71d45@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 11:57 AM, Hanna Reitz wrote:
> On 02.09.21 12:15, Philippe Mathieu-Daudé wrote:
>> On 9/2/21 11:58 AM, Vladimir Sementsov-Ogievskiy wrote:
>>> 02.09.2021 12:40, Hanna Reitz wrote:
>>>> The AbnormalShutdown exception class is not in qemu.machine, but in
>>>> qemu.machine.machine.  (qemu.machine.AbnormalShutdown was enough for
>>>> Python to find it in order to run this test, but pylint complains about
>>>> it.)
>>>>
>>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>>> ---
>>>>    tests/qemu-iotests/tests/mirror-top-perms | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/qemu-iotests/tests/mirror-top-perms
>>>> b/tests/qemu-iotests/tests/mirror-top-perms
>>>> index 451a0666f8..2fc8dd66e0 100755
>>>> --- a/tests/qemu-iotests/tests/mirror-top-perms
>>>> +++ b/tests/qemu-iotests/tests/mirror-top-perms
>>>> @@ -47,7 +47,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
>>>>        def tearDown(self):
>>>>            try:
>>>>                self.vm.shutdown()
>>>> -        except qemu.machine.AbnormalShutdown:
>>>> +        except qemu.machine.machine.AbnormalShutdown:
>>>>                pass
>>>>              if self.vm_b is not None:
>>>>
>>> Hmm, interesting.. May be that bad that module has same name as
>>> subpackage?
>> Confusing indeed. Could this be improved?
> 
> I think if we want to improve something, it would be that we make the
> exception public in the qemu.machine namespace, like so:
> 
> diff --git a/python/qemu/machine/__init__.py
> b/python/qemu/machine/__init__.py
> index 9ccd58ef14..48bbb0530b 100644
> --- a/python/qemu/machine/__init__.py
> +++ b/python/qemu/machine/__init__.py
> @@ -25,7 +25,7 @@
>  # pylint: disable=import-error
>  # see: https://github.com/PyCQA/pylint/issues/3624
>  # see: https://github.com/PyCQA/pylint/issues/3651
> -from .machine import QEMUMachine
> +from .machine import AbnormalShutdown, QEMUMachine
>  from .qtest import QEMUQtestMachine, QEMUQtestProtocol
> 
> But, well.  I don’t mind a qemu.machine.machine too much, personally.

I'm not worried about you, but the newcomer willing to use this
interface ;) Note I'm not asking you to clean that neither, I
was just wondering why we have machine.machine.


