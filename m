Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A8341F58
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:28:58 +0100 (CET)
Received: from localhost ([::1]:49878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNG7V-0007Zr-3k
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNG6B-0006h0-Tu; Fri, 19 Mar 2021 10:27:35 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:52469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNG68-00067i-Lc; Fri, 19 Mar 2021 10:27:35 -0400
Received: from [192.168.100.1] ([82.142.20.38]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MWz4j-1lCYqd0Bsv-00XM9m; Fri, 19 Mar 2021 15:27:26 +0100
Subject: Re: [PATCH v2 6/6] iotests: iothreads need ioeventfd
To: Cornelia Huck <cohuck@redhat.com>
References: <20210319132537.2046339-1-laurent@vivier.eu>
 <20210319132537.2046339-7-laurent@vivier.eu>
 <95209fe1-9b85-0eec-ace2-b3eff20ee88e@redhat.com>
 <b5e6476f-ae52-056b-8ac8-8a3d17118ca3@vivier.eu>
 <20210319152314.7151c275.cohuck@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f1e1c1ac-d688-74dc-fff4-e6b0bad78cf3@vivier.eu>
Date: Fri, 19 Mar 2021 15:27:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319152314.7151c275.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pGKSwh0VfNfG6DVbFLMSvU2mL/oDBU+UAzs4MH7t3OS00ooWjzy
 4C1zEcAfg0brdguZ7NO6jC77uHhBAaqrw+kHYc/JmjMOTT0krpgzhx9cVkp+6oW4kPzdFqO
 1hmLo5VhNzm6U2OWQi/vDbdqGUegKCHgfKLx1MbcjaShf5sorEwR/T2+1mSNgOag6ASWzoZ
 QRb+UqlrA0zj7apFHs+Hg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rQzDQ3HUEbg=:KTTodWEWxDCGKpM13fJyIS
 MfXvSH4CGZDOqotysCo7VjvA+zmUa1R41tIIQ2zwSrEDvJIkjMP8GkSrux4sxbn1o/XIg4dF5
 qONU/6ztJUbyRqLVC/4xHlMyyLsiyGYbjMU49AtMaqWdJIN2NWRyRauI6pd4+kkevmQRml86B
 mCBCMU51+7rGT6XiAWhSDnu9P99phMMWUq3DKW6b0WZ4mOmLakqOoyQRIieVOVF8nQtjcdKtw
 16hSxHDJX+SKKf14WmcvQCIq4S+WvWhxz+gWXDCnJ4vpRZOf+wZe1Pmq3ZHfs1EuwjKWpcYbV
 RPgGWNQLas5cRkASHh7Vn2A8aoboWXZv1nFJ/JAvvJv/OPUWqNguV788+A/THXI2y+FA40aU/
 nwBIWRZarNJu3+umXauVqBLYz3qGvw0NG/jeQ22M5kgD9mB3V/LIP4+2RV8zfAsAa48ac6OLf
 7jt3Zoztiw==
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
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/03/2021 à 15:23, Cornelia Huck a écrit :
> On Fri, 19 Mar 2021 14:51:59 +0100
> Laurent Vivier <laurent@vivier.eu> wrote:
> 
>> Le 19/03/2021 à 14:36, Philippe Mathieu-Daudé a écrit :
>>> On 3/19/21 2:25 PM, Laurent Vivier wrote:  
>>>> And ioeventfd are only available with virtio-scsi-pci or virtio-scsi-ccw,
>>>> use the alias but add a rule to require virtio-scsi-pci or virtio-scsi-ccw
>>>> for the tests that use iothreads.
>>>>
>>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>>> ---
>>>>  tests/qemu-iotests/127        | 3 ++-
>>>>  tests/qemu-iotests/256        | 6 ++++--
>>>>  tests/qemu-iotests/iotests.py | 5 +++++
>>>>  3 files changed, 11 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
>>>> index 98e8e82a8210..abe24861100d 100755
>>>> --- a/tests/qemu-iotests/127
>>>> +++ b/tests/qemu-iotests/127
>>>> @@ -44,7 +44,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
>>>>  _supported_fmt qcow2
>>>>  _supported_proto file fuse
>>>>  
>>>> -_require_devices virtio-scsi scsi-hd
>>>> +_require_devices scsi-hd
>>>> +_require_devices virtio-scsi-pci || _require_devices virtio-scsi-ccw  
>>
>> Re-reading the code, I think this cannot work because we have an "exit" if the test fails.
> 
> We could try to make _require_devices accept alternatives, but that is
> probably overkill...
> 
>>
>> The test is executed anyway because s390x provides virtio-scsi-ccw and virtio-scsi-pci.
> 
> ...because of this.
> 
> Maybe just add a comment that we require pci or ccw because iothreads
> depend on ioventfd, but checking for pci is enough, as we have pci when
> we have ccw?
> 

Well... bash is fun:

_require_one_device_of()
{
    available=$($QEMU -M none -device help | \
                grep ^name | sed -e 's/^name "//' -e 's/".*$//')
    for device
    do
        if echo "$available" | grep -q "$device" ; then
            return
        fi
    done
    _notrun "$* not available"
}

and:

_require_one_device_of virtio-scsi-pci virtio-scsi-ccw

Thanks,
Laurent

