Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D760E3FEBF4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:17:00 +0200 (CEST)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjmF-0001XI-GY
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLjko-0000lG-UN
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:15:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLjkk-0003l7-OL
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630577725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yWdV0plLO1YZjtoutIF8NJosUU62bDCi+AWXM1wHR0=;
 b=bIiP7Os5CZH//tXV8OSkRRB8VUHyCOgvxCQEEBDe8z+xYHUdznTFBKOcTJs3U3jgcdrInr
 folwzWsNy4xe7mxsE14ZACXPzZ7n3mSWvkaaVPevb/E4Sa0bd4iDxZ1PyPJnQrMnAqNnQr
 w/Q1uJDGr8OMMsZHGZ4E3JKMLfuzhXE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-cq8_nwXvMvKRStD3Ri7MBg-1; Thu, 02 Sep 2021 06:15:24 -0400
X-MC-Unique: cq8_nwXvMvKRStD3Ri7MBg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so506216wmr.9
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 03:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7yWdV0plLO1YZjtoutIF8NJosUU62bDCi+AWXM1wHR0=;
 b=g6T+QSg1IB4jrqKg/y9y2axs9WvOSdccVuym5bk2PnT2blT1EuC3K3waJXttYFkeRn
 /4hf+QiHI85YvepNHxlRKWDhUKaA6sP4/Y40u4xV6C8bdzqvy4/XaJWg5bbHlPmxsmpo
 +MrFpquP4dUP2fL5IjUTIg1CPTX5LH3GR0iUpw12bGAxoPXWjUor7m1jYkaJ3a5q9QbY
 2fT71tGJ9D+cVj9O5r+58lL3fkFl1uYNTS+2evmb8kYIBaCOt/akV9jzhkL2ByI3Sncr
 efrrlODpFlhdbydRXqyaeDlBKCIQ25BdAEGyw84GsqVRS40VqoUMS033pT56WTy796iS
 5bJg==
X-Gm-Message-State: AOAM530UIO/jsfPMNyTVG7wzgDZVchUT6HBZtF0BMOaO//Gkyuy/QxEp
 mxNpbY3cr2Pl2TiZS5V1Be+utPzxKzcU0D/oAEM/qlQPsTOQAd1wjARPIepSji+tWDR3t+FtT18
 hW4ci7HXMkzkns9E=
X-Received: by 2002:adf:a2c4:: with SMTP id t4mr2773718wra.258.1630577723094; 
 Thu, 02 Sep 2021 03:15:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc8J4YcLsSWsPc5+lA8VmCGxZ6LQX090cLFU/82RgtjKyLElxtHy2uzOgj4uQTQgMi2aBVVA==
X-Received: by 2002:adf:a2c4:: with SMTP id t4mr2773681wra.258.1630577722777; 
 Thu, 02 Sep 2021 03:15:22 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o21sm1383684wms.32.2021.09.02.03.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 03:15:22 -0700 (PDT)
Subject: Re: [PATCH v4 4/5] mirror-top-perms: Fix AbnormalShutdown path
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
References: <20210902094017.32902-1-hreitz@redhat.com>
 <20210902094017.32902-5-hreitz@redhat.com>
 <ab23a119-1315-09b7-aeec-8d9039fdbd92@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <12a9bfd7-d302-f157-f88a-ff441470278e@redhat.com>
Date: Thu, 2 Sep 2021 12:15:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ab23a119-1315-09b7-aeec-8d9039fdbd92@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/2/21 11:58 AM, Vladimir Sementsov-Ogievskiy wrote:
> 02.09.2021 12:40, Hanna Reitz wrote:
>> The AbnormalShutdown exception class is not in qemu.machine, but in
>> qemu.machine.machine.  (qemu.machine.AbnormalShutdown was enough for
>> Python to find it in order to run this test, but pylint complains about
>> it.)
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/tests/mirror-top-perms | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/tests/mirror-top-perms
>> b/tests/qemu-iotests/tests/mirror-top-perms
>> index 451a0666f8..2fc8dd66e0 100755
>> --- a/tests/qemu-iotests/tests/mirror-top-perms
>> +++ b/tests/qemu-iotests/tests/mirror-top-perms
>> @@ -47,7 +47,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
>>       def tearDown(self):
>>           try:
>>               self.vm.shutdown()
>> -        except qemu.machine.AbnormalShutdown:
>> +        except qemu.machine.machine.AbnormalShutdown:
>>               pass
>>             if self.vm_b is not None:
>>
> 
> Hmm, interesting.. May be that bad that module has same name as subpackage?

Confusing indeed. Could this be improved?


