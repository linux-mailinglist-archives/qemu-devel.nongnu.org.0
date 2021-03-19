Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FCD341BB6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:46:08 +0100 (CET)
Received: from localhost ([::1]:45652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDZv-0006yE-6Q
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNDJH-0001aO-TT; Fri, 19 Mar 2021 07:28:55 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:44387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNDJG-0003Tj-45; Fri, 19 Mar 2021 07:28:55 -0400
Received: from [192.168.100.1] ([82.142.20.38]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MVv8f-1lDhIQ0dBV-00RrHT; Fri, 19 Mar 2021 12:28:47 +0100
Subject: Re: [PATCH 4/4] iotests: iothreads need ioeventfd
To: Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210318223907.1344870-1-laurent@vivier.eu>
 <20210318223907.1344870-5-laurent@vivier.eu>
 <4c03ef1c-d39f-dd53-c13a-7620b7899e35@redhat.com>
 <20210319122735.0daed44b.cohuck@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b8dfeb2f-d019-9b74-a485-dba63ff7c3a5@vivier.eu>
Date: Fri, 19 Mar 2021 12:28:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319122735.0daed44b.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5RoCj8503BDMgT5ESa0E9sB9tzr0mC1laGMQv5eVDjkv4eK5lIk
 FwQfo/9Tduj8aH/gVNo5Ek9ZsXWVC1lejMcog4WRpSD1lZv7dX5l6FBLkhGKHS6cN9UwoBV
 g3Hg1ZB7j8pl9dWTUzu5gDlk+DVfc7SHRJfQPkDaza5o6GJxkA/KxWD8JHxIBL3K3XvH9ue
 vy1Q4Jyz7RUPCIKe13RBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S2mfklVHjZc=:awJpihKR2JJZnhNOUUP0OY
 IU382nVGw0ANk/8z0ZEyk2IxZe5CsiB1qseOstBInCBQyWfwZRERde56+doYamUell+vi3IZ1
 vqe75E4HYfwho4qRHwVEM1kHiobvE96vHA4YlF0dDwXg6apsq6KF3y3g3A6r3CO5h0GwYFyKw
 Yf95aErbZT0/Mil8CFHepypc3iXASO8caB9GL+AlgCPvspl75hcSeKDyGI1QkELFodWIYdn/7
 Q6m+fMacHIsTDjZvsSyVf0oZfreRsllHdFXFwVRrmoNQCWPGZgjlspDNe2oV+xdKdIDt4LWyh
 QTYQ8z1HF9NVQjcUxvYXIWhMBfu6p1exNrEOzOaGCONCGSV8urCIjEDH3NUcpmBU/SB+HWmo1
 qJaY1iqdlWKNBJUo3e1jo7sCGxEaTwMxJULv1+fEpD15v+rYdXGaJF1WhVVUZ6fqUlUwkCr4H
 +gTOkdF58Q==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-s390x@nongnu.org, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/03/2021 à 12:27, Cornelia Huck a écrit :
> On Fri, 19 Mar 2021 12:06:43 +0100
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> On 18/03/21 23:39, Laurent Vivier wrote:
>>> And ioeventfd are only available with virtio-scsi-pci, so don't use the alias
>>> and add a rule to require virtio-scsi-pci for the tests that use iothreads.
>>>
>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>> ---
>>>   tests/qemu-iotests/127        | 4 ++--
>>>   tests/qemu-iotests/256        | 2 ++
>>>   tests/qemu-iotests/iotests.py | 5 +++++
>>>   3 files changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
>>> index 98e8e82a8210..a3693533685a 100755
>>> --- a/tests/qemu-iotests/127
>>> +++ b/tests/qemu-iotests/127
>>> @@ -44,7 +44,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
>>>   _supported_fmt qcow2
>>>   _supported_proto file fuse
>>>   
>>> -_require_devices virtio-scsi scsi-hd
>>> +_require_devices virtio-scsi-pci scsi-hd  
>>
>> Maybe
>>
>> _require_devices scsi-hd
>> _require_devices virtio-scsi-pci || _require_devices virtio-scsi ccw
>>
>> ?
>>
>> Paolo
>>
> 
> Yes, ioeventfds are also available for ccw; I'd expect only mmio to be
> the problem here.
> 

OK, thanks.

I update my patch with the changes from Paolo.

Laurent

